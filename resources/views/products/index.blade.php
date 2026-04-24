@extends('layouts.app')
@section('title', 'Produk')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Produk Sparepart</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Kelola semua produk sparepart motor</div>
    </div>
    @can('products.create')
    <a href="{{ route('products.create') }}" class="btn btn-primary">
        <i class="fa fa-plus me-2"></i>Tambah Produk
    </a>
    @endcan
</div>

{{-- Filter --}}
<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2 align-items-end">
            <div class="col-md-4">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-search text-muted"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="Cari nama produk atau SKU..." value="{{ request('search') }}">
                </div>
            </div>
            <div class="col-md-3">
                <select name="category_id" class="form-select">
                    <option value="">Semua Kategori</option>
                    @foreach($categories as $cat)
                        @if(!$cat->parent_id)
                            <option value="{{ $cat->id }}" @selected(request('category_id') == $cat->id)>{{ $cat->name }}</option>
                            @foreach($categories->where('parent_id', $cat->id) as $child)
                                <option value="{{ $child->id }}" @selected(request('category_id') == $child->id)>&nbsp;&nbsp;↳ {{ $child->name }}</option>
                            @endforeach
                        @endif
                    @endforeach
                </select>
            </div>
            <div class="col-md-2">
                <div class="form-check mt-1">
                    <input class="form-check-input" type="checkbox" name="low_stock" value="1" id="ls" @checked(request('low_stock'))>
                    <label class="form-check-label" for="ls" style="font-size:.8rem">Stok Menipis</label>
                </div>
            </div>
            <div class="col-md-3 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search me-1"></i>Filter</button>
                <a href="{{ route('products.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

{{-- Table --}}
<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead>
                <tr>
                    <th>Produk</th>
                    <th>Kategori</th>
                    <th>Harga Jual</th>
                    <th>Stok</th>
                    <th>Rak</th>
                    <th>Status</th>
                    <th style="width:100px"></th>
                </tr>
            </thead>
            <tbody>
            @forelse($products as $product)
                @php $stock = $product->totalStock(); @endphp
                <tr>
                    <td>
                        <div class="d-flex align-items-center gap-3">
                            <div style="width:36px;height:36px;border-radius:.5rem;background:#f1f5f9;display:flex;align-items:center;justify-content:center;flex-shrink:0">
                                @if($product->image)
                                    <img src="{{ Storage::url($product->image) }}" style="width:36px;height:36px;object-fit:cover;border-radius:.5rem">
                                @else
                                    <i class="fa fa-box text-muted" style="font-size:.8rem"></i>
                                @endif
                            </div>
                            <div>
                                <div class="fw-semibold" style="font-size:.83rem">{{ $product->name }}</div>
                                <div class="text-muted font-monospace" style="font-size:.7rem">{{ $product->sku }}</div>
                            </div>
                        </div>
                    </td>
                    <td><span class="badge badge-soft-purple">{{ $product->category->name ?? '—' }}</span></td>
                    <td class="fw-semibold" style="color:#10b981">Rp {{ number_format($product->sell_price, 0, ',', '.') }}</td>
                    <td>
                        <span class="badge {{ $stock <= 0 ? 'badge-soft-danger' : ($stock <= $product->min_stock ? 'badge-soft-warning' : 'badge-soft-success') }}">
                            {{ $stock }} {{ strtoupper($product->unit) }}
                        </span>
                    </td>
                    <td class="text-muted" style="font-size:.78rem">{{ $product->shelf_code ?: '—' }}</td>
                    <td>
                        <span class="badge {{ $product->is_active ? 'badge-soft-success' : 'badge-soft-gray' }}">
                            {{ $product->is_active ? 'Aktif' : 'Nonaktif' }}
                        </span>
                    </td>
                    <td>
                        <div class="d-flex gap-1">
                            <a href="{{ route('products.show', $product) }}" class="btn btn-sm btn-icon" style="background:#f1f5f9;border:none;color:#64748b" title="Detail"><i class="fa fa-eye"></i></a>
                            @can('products.edit')
                            <a href="{{ route('products.edit', $product) }}" class="btn btn-sm btn-icon" style="background:#fef3c7;border:none;color:#d97706" title="Edit"><i class="fa fa-pen"></i></a>
                            @endcan
                            @can('products.delete')
                            <form method="POST" action="{{ route('products.destroy', $product) }}" onsubmit="return confirm('Hapus produk \"{{ addslashes($product->name) }}\"?\n\nTindakan ini tidak dapat dibatalkan!')">
                                @csrf @method('DELETE')
                                <button class="btn btn-sm btn-icon" style="background:#fee2e2;border:none;color:#dc2626" title="Hapus"><i class="fa fa-trash"></i></button>
                            </form>
                            @endcan
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7" class="text-center py-5 text-muted">
                        <i class="fa fa-box fa-3x d-block mb-3 opacity-20"></i>
                        Tidak ada produk ditemukan
                    </td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
    @if($products->hasPages())
    <div class="card-body border-top py-3 d-flex justify-content-between align-items-center">
        <div class="text-muted" style="font-size:.78rem">Menampilkan {{ $products->firstItem() }}–{{ $products->lastItem() }} dari {{ $products->total() }} produk</div>
        {{ $products->links() }}
    </div>
    @endif
</div>
@endsection
