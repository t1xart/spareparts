@extends('layouts.app')
@section('title', $product->name)
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Detail Produk</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">{{ $product->sku }}</div>
    </div>
    <div class="d-flex gap-2">
        @can('products.edit')
        <a href="{{ route('products.edit', $product) }}" class="btn btn-primary"><i class="fa fa-pen me-2"></i>Edit</a>
        @endcan
        <a href="{{ route('products.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-2"></i>Kembali</a>
    </div>
</div>

<div class="row g-3">
    {{-- LEFT --}}
    <div class="col-lg-8">
        {{-- Hero Card --}}
        <div class="card mb-3 animate-in">
            <div class="card-body">
                <div class="d-flex gap-4">
                    <div style="width:100px;height:100px;border-radius:.75rem;background:#f1f5f9;display:flex;align-items:center;justify-content:center;flex-shrink:0;overflow:hidden">
                        @if($product->images->isNotEmpty())
                            <img src="{{ Storage::url($product->images->first()->image_path) }}" style="width:100px;height:100px;object-fit:cover">
                        @else
                            <i class="fa fa-box fa-2x text-muted opacity-30"></i>
                        @endif
                    </div>
                    <div class="flex-grow-1">
                        <h5 class="fw-bold mb-1">{{ $product->name }}</h5>
                        <div class="d-flex flex-wrap gap-2 mb-2">
                            <span class="badge badge-soft-purple">{{ $product->category->name ?? '—' }}</span>
                            <span class="badge badge-soft-gray">{{ strtoupper($product->unit) }}</span>
                            <span class="badge {{ $product->is_active ? 'badge-soft-success' : 'badge-soft-gray' }}">{{ $product->is_active ? 'Aktif' : 'Nonaktif' }}</span>
                            @if($product->warranty_days > 0)
                            <span class="badge badge-soft-info"><i class="fa fa-shield-alt me-1"></i>Garansi {{ $product->warranty_days }} hari</span>
                            @endif
                        </div>
                        <p class="text-muted mb-0" style="font-size:.82rem">{{ $product->description ?: 'Tidak ada deskripsi.' }}</p>
                    </div>
                </div>

                {{-- Image Gallery --}}
                @if($product->images->count() > 1)
                <div class="d-flex gap-2 mt-3 pt-3 border-top overflow-auto">
                    @foreach($product->images as $img)
                    <img src="{{ Storage::url($img->image_path) }}" style="width:60px;height:60px;object-fit:cover;border-radius:.5rem;flex-shrink:0;cursor:pointer;border:2px solid {{ $img->is_primary ? '#6366f1' : 'transparent' }}">
                    @endforeach
                </div>
                @endif
            </div>
        </div>

        {{-- Compatibility --}}
        <div class="card mb-3 animate-in">
            <div class="card-header">
                <div class="icon-badge" style="background:#dbeafe;color:#2563eb"><i class="fa fa-motorcycle"></i></div>
                Kompatibilitas Kendaraan
            </div>
            <div class="card-body">
                @forelse($product->compatibilities->groupBy('brand.name') as $brand => $types)
                    <div class="mb-2 d-flex align-items-start gap-2">
                        <span class="fw-semibold" style="font-size:.78rem;color:#6366f1;min-width:80px">{{ $brand }}</span>
                        <div class="d-flex flex-wrap gap-1">
                            @foreach($types as $t)
                            <span class="badge badge-soft-gray">{{ $t->name }}</span>
                            @endforeach
                        </div>
                    </div>
                @empty
                    <div class="text-muted" style="font-size:.82rem"><i class="fa fa-info-circle me-1"></i>Belum ada data kompatibilitas.</div>
                @endforelse
            </div>
        </div>

        {{-- Stock per Warehouse --}}
        <div class="card animate-in">
            <div class="card-header">
                <div class="icon-badge" style="background:#d1fae5;color:#059669"><i class="fa fa-warehouse"></i></div>
                Stok per Gudang
            </div>
            <div class="card-body p-0">
                <table class="table mb-0">
                    <thead><tr><th>Gudang</th><th>Cabang</th><th>Stok</th><th>Status</th></tr></thead>
                    <tbody>
                    @forelse($product->stockRecords as $rec)
                        <tr>
                            <td class="fw-semibold">{{ $rec->warehouse->name ?? '—' }}</td>
                            <td class="text-muted">{{ $rec->warehouse->branch->name ?? '—' }}</td>
                            <td><span class="fw-bold" style="font-size:.95rem">{{ $rec->quantity }}</span></td>
                            <td>
                                @if($rec->quantity <= 0)
                                    <span class="badge badge-soft-danger">Habis</span>
                                @elseif($rec->quantity <= $product->min_stock)
                                    <span class="badge badge-soft-warning">Menipis</span>
                                @else
                                    <span class="badge badge-soft-success">Aman</span>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="4" class="text-center text-muted py-3">Belum ada data stok</td></tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {{-- RIGHT --}}
    <div class="col-lg-4">
        {{-- Barcode --}}
        <div class="card mb-3 animate-in">
            <div class="card-header">
                <div class="icon-badge" style="background:#f1f5f9;color:#64748b"><i class="fa fa-barcode"></i></div>
                Barcode SKU
            </div>
            <div class="card-body text-center py-3">
                <img src="{{ route('products.barcode', $product) }}" alt="{{ $product->sku }}" style="max-height:55px;max-width:100%">
                <div class="font-monospace mt-2" style="font-size:.75rem;color:#64748b;letter-spacing:.05em">{{ $product->sku }}</div>
            </div>
        </div>

        {{-- Pricing --}}
        <div class="card mb-3 animate-in">
            <div class="card-header">
                <div class="icon-badge" style="background:#d1fae5;color:#059669"><i class="fa fa-tag"></i></div>
                Harga & Info
            </div>
            <div class="card-body p-0">
                <div class="p-3 border-bottom d-flex justify-content-between align-items-center">
                    <span class="text-muted" style="font-size:.8rem">Harga Beli</span>
                    <span class="fw-semibold">Rp {{ number_format($product->buy_price, 0, ',', '.') }}</span>
                </div>
                <div class="p-3 border-bottom d-flex justify-content-between align-items-center">
                    <span class="text-muted" style="font-size:.8rem">Harga Jual</span>
                    <span class="fw-semibold" style="color:#10b981">Rp {{ number_format($product->sell_price, 0, ',', '.') }}</span>
                </div>
                <div class="p-3 border-bottom d-flex justify-content-between align-items-center" style="background:#f8fafc">
                    <span class="text-muted" style="font-size:.8rem">Margin</span>
                    <span class="fw-bold" style="color:#6366f1">Rp {{ number_format($product->sell_price - $product->buy_price, 0, ',', '.') }}</span>
                </div>
                <div class="p-3 border-bottom d-flex justify-content-between"><span class="text-muted" style="font-size:.8rem">Stok Min</span><span>{{ $product->min_stock }}</span></div>
                <div class="p-3 border-bottom d-flex justify-content-between"><span class="text-muted" style="font-size:.8rem">Kode Rak</span><span>{{ $product->shelf_code ?: '—' }}</span></div>
                <div class="p-3 d-flex justify-content-between"><span class="text-muted" style="font-size:.8rem">Berat</span><span>{{ $product->weight ? $product->weight . ' gram' : '—' }}</span></div>
            </div>
        </div>

        {{-- Total Stock --}}
        <div class="card animate-in">
            <div class="card-body text-center py-4">
                <div style="font-size:.75rem;color:#64748b;font-weight:600;text-transform:uppercase;letter-spacing:.05em;margin-bottom:.5rem">Total Stok</div>
                @php $totalStock = $product->totalStock(); @endphp
                <div style="font-size:3rem;font-weight:800;line-height:1;color:{{ $product->isLowStock() ? '#ef4444' : '#10b981' }}">{{ $totalStock }}</div>
                <div class="text-muted mt-1" style="font-size:.78rem">{{ strtoupper($product->unit) }}</div>
                @if($product->isLowStock())
                    <div class="mt-3 p-2 rounded" style="background:#fee2e2;color:#991b1b;font-size:.75rem">
                        <i class="fa fa-triangle-exclamation me-1"></i>Stok di bawah minimum!
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
