<?php

namespace App\Http\Controllers;

use App\Models\{Product, Category, VehicleType, ProductImage};
use App\Http\Requests\ProductRequest;
use App\Services\SkuService;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->authorizeResource(Product::class, 'product');
    }

    public function index(Request $request)
    {
        $products = Product::with(['category', 'stockRecords'])
            ->when($request->search, fn($q) => $q->where('name', 'like', "%{$request->search}%")->orWhere('sku', 'like', "%{$request->search}%"))
            ->when($request->category_id, fn($q) => $q->where('category_id', $request->category_id))
            ->when($request->low_stock, fn($q) => $q->whereHas('stockRecords', fn($s) => $s->whereColumn('quantity', '<=', 'products.min_stock')))
            ->latest()->paginate(20)->withQueryString();

        $categories = Category::whereNull('parent_id')->with('children')->get();
        return view('products.index', compact('products', 'categories'));
    }

    public function create()
    {
        $categories = Category::all();
        $vehicleTypes = VehicleType::with('brand')->where('is_active', true)->get()->groupBy('brand.name');
        return view('products.create', compact('categories', 'vehicleTypes'));
    }

    public function store(ProductRequest $request)
    {
        try {
            DB::transaction(function () use ($request) {
                $data = Arr::except($request->validated(), ['compatibility', 'images']);
                $data['sku'] = SkuService::generate($request->category_id);
                $data['slug'] = Str::slug($data['name']);
                $data['is_active'] = $request->boolean('is_active');

                $product = Product::create($data);

                if ($request->hasFile('images')) {
                    foreach ($request->file('images') as $i => $file) {
                        $path = $file->store('products', 'public');
                        ProductImage::create(['product_id' => $product->id, 'image_path' => $path, 'is_primary' => $i === 0, 'sort_order' => $i]);
                    }
                }

                if ($request->compatibility) {
                    $product->compatibilities()->sync($request->compatibility);
                }
            });

            return redirect()->route('products.index')->with('success', 'Produk berhasil ditambahkan.');
        } catch (\Exception $e) {
            \Log::error('Product creation failed', ['error' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
            return redirect()->back()->withInput()->withErrors(['general' => 'Terjadi kesalahan saat menambahkan produk: ' . $e->getMessage()]);
        }
    }

    public function show(Product $product)
    {
        $product->load(['category', 'images', 'compatibilities.brand', 'stockRecords.warehouse']);
        return view('products.show', compact('product'));
    }

    public function edit(Product $product)
    {
        $categories = Category::all();
        $vehicleTypes = VehicleType::with('brand')->where('is_active', true)->get()->groupBy('brand.name');
        $selected = $product->compatibilities->pluck('id')->toArray();
        return view('products.edit', compact('product', 'categories', 'vehicleTypes', 'selected'));
    }

    public function update(ProductRequest $request, Product $product)
    {
        try {
        DB::transaction(function () use ($request, $product) {
            $data = Arr::except($request->validated(), ['compatibility', 'images']);
            $slug = Str::slug($data['name']);
            // Ensure slug is unique, ignoring current product
            $exists = Product::where('slug', $slug)->where('id', '!=', $product->id)->exists();
            $data['slug'] = $exists ? $slug . '-' . $product->id : $slug;
            $data['is_active'] = $request->boolean('is_active');
            $product->update($data);

            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $i => $file) {
                    $path = $file->store('products', 'public');
                    ProductImage::create(['product_id' => $product->id, 'image_path' => $path, 'is_primary' => false, 'sort_order' => $product->images()->count() + $i]);
                }
            }

            if ($request->has('compatibility')) {
                $product->compatibilities()->sync($request->compatibility ?? []);
            }
        });

        return redirect()->route('products.show', $product)->with('success', 'Produk berhasil diperbarui.');
        } catch (\Exception $e) {
            \Log::error('Product update failed', ['error' => $e->getMessage()]);
            return redirect()->back()->withInput()->withErrors(['general' => 'Gagal menyimpan: ' . $e->getMessage()]);
        }
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('products.index')->with('success', 'Produk dihapus.');
    }

    public function destroyImage(ProductImage $image)
    {
        Storage::disk('public')->delete($image->image_path);
        $image->delete();
        return back()->with('success', 'Foto dihapus.');
    }
}
