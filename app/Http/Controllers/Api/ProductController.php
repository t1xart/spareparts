<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Http\Requests\ProductRequest;
use App\Models\{Product, ProductImage};
use App\Services\SkuService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::with(['category', 'stockRecords', 'primaryImage'])
            ->when($request->search, fn($q) => $q->where('name', 'like', "%{$request->search}%")->orWhere('sku', 'like', "%{$request->search}%"))
            ->when($request->category_id, fn($q) => $q->where('category_id', $request->category_id))
            ->when($request->low_stock, fn($q) => $q->whereHas('stockRecords', fn($s) => $s->whereColumn('quantity', '<=', 'products.min_stock')))
            ->when($request->is_active !== null, fn($q) => $q->where('is_active', $request->boolean('is_active')))
            ->latest()->paginate($request->per_page ?? 20);

        return ProductResource::collection($products);
    }

    public function store(ProductRequest $request)
    {
        $product = DB::transaction(function () use ($request) {
            $data        = $request->validated();
            $data['sku'] = SkuService::generate($request->category_id);
            $product     = Product::create($data);

            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $i => $file) {
                    $path = $file->store('products', 'public');
                    ProductImage::create(['product_id' => $product->id, 'image_path' => $path, 'is_primary' => $i === 0, 'sort_order' => $i]);
                }
            }
            if ($request->compatibility) {
                $product->compatibilities()->sync($request->compatibility);
            }
            return $product->load(['category', 'images', 'compatibilities.brand', 'stockRecords']);
        });

        return new ProductResource($product);
    }

    public function show(Product $product)
    {
        return new ProductResource($product->load(['category', 'images', 'compatibilities.brand', 'stockRecords.warehouse']));
    }

    public function update(ProductRequest $request, Product $product)
    {
        DB::transaction(function () use ($request, $product) {
            $product->update($request->validated());
            if ($request->has('compatibility')) {
                $product->compatibilities()->sync($request->compatibility ?? []);
            }
        });

        return new ProductResource($product->fresh(['category', 'images', 'stockRecords']));
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json(['message' => 'Produk dihapus.']);
    }
}
