<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SupplierResource;
use App\Models\Supplier;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    public function index(Request $request)
    {
        $suppliers = Supplier::when($request->search, fn($q) => $q->where('name', 'like', "%{$request->search}%")->orWhere('code', 'like', "%{$request->search}%"))
            ->when($request->is_active !== null, fn($q) => $q->where('is_active', $request->boolean('is_active')))
            ->paginate($request->per_page ?? 20);

        return SupplierResource::collection($suppliers);
    }

    public function show(Supplier $supplier)
    {
        return new SupplierResource($supplier);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255', 'contact_person' => 'nullable|string',
            'phone' => 'nullable|string', 'email' => 'nullable|email',
            'address' => 'nullable|string', 'city' => 'nullable|string', 'province' => 'nullable|string',
            'bank_name' => 'nullable|string', 'bank_account' => 'nullable|string',
        ]);
        $data['code'] = Supplier::generateCode($request->name);
        return new SupplierResource(Supplier::create($data));
    }

    public function update(Request $request, Supplier $supplier)
    {
        $supplier->update($request->validate([
            'name' => 'sometimes|string|max:255', 'contact_person' => 'nullable|string',
            'phone' => 'nullable|string', 'email' => 'nullable|email',
            'rating' => 'nullable|integer|min:0|max:5', 'is_active' => 'boolean',
        ]));
        return new SupplierResource($supplier->fresh());
    }
}
