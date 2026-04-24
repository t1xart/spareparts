@extends('layouts.app')
@section('title', 'Laporan Stok')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Laporan Stok</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Kondisi stok semua produk</div>
    </div>
    @can('reports.export')
    <a href="{{ route('reports.stock.excel') }}" class="btn btn-sm" style="background:#d1fae5;border:none;color:#059669">
        <i class="fa fa-file-excel me-1"></i>Export Excel
    </a>
    @endcan
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2">
            <div class="col-md-4">
                <div class="form-check mt-1">
                    <input class="form-check-input" type="checkbox" name="low_stock" value="1" id="ls" @checked(request('low_stock'))>
                    <label class="form-check-label" for="ls" style="font-size:.82rem">Tampilkan hanya stok menipis</label>
                </div>
            </div>
            <div class="col-md-2 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search"></i></button>
                <a href="{{ route('reports.stock') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>Produk</th><th>Kategori</th><th>Total Stok</th><th>Min</th><th>Harga Beli</th><th>Harga Jual</th><th>Status</th></tr></thead>
            <tbody>
            @forelse($products as $product)
                @php $stock = $product->totalStock(); @endphp
                <tr>
                    <td>
                        <div class="fw-semibold" style="font-size:.82rem">{{ $product->name }}</div>
                        <div class="text-muted font-monospace" style="font-size:.7rem">{{ $product->sku }}</div>
                    </td>
                    <td><span class="badge badge-soft-purple">{{ $product->category->name ?? '—' }}</span></td>
                    <td>
                        <span class="fw-bold" style="font-size:.95rem;color:{{ $stock <= $product->min_stock ? '#ef4444' : '#10b981' }}">{{ $stock }}</span>
                        <span class="text-muted" style="font-size:.72rem"> {{ $product->unit }}</span>
                    </td>
                    <td class="text-muted">{{ $product->min_stock }}</td>
                    <td style="font-size:.8rem">Rp {{ number_format($product->buy_price, 0, ',', '.') }}</td>
                    <td style="font-size:.8rem;color:#10b981;font-weight:600">Rp {{ number_format($product->sell_price, 0, ',', '.') }}</td>
                    <td>
                        @if($stock <= 0)<span class="badge badge-soft-danger">Habis</span>
                        @elseif($stock <= $product->min_stock)<span class="badge badge-soft-warning">Menipis</span>
                        @else<span class="badge badge-soft-success">Aman</span>@endif
                    </td>
                </tr>
            @empty
                <tr><td colspan="7" class="text-center py-5 text-muted">Tidak ada data</td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
