@extends('layouts.app')
@section('title', 'Manajemen Stok')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Manajemen Stok</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Pantau dan kelola stok per gudang</div>
    </div>
    <div class="d-flex gap-2">
        <a href="{{ route('stock.mutations') }}" class="btn btn-sm" style="background:#f1f5f9;border:none;color:#64748b">
            <i class="fa fa-history me-1"></i>Mutasi Stok
        </a>
        <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#adjustModal">
            <i class="fa fa-sliders me-2"></i>Sesuaikan Stok
        </button>
    </div>
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2 align-items-end">
            <div class="col-md-5">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-search text-muted"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="Cari produk atau SKU..." value="{{ request('search') }}">
                </div>
            </div>
            <div class="col-md-4">
                <select name="warehouse_id" class="form-select">
                    <option value="">Semua Gudang</option>
                    @foreach($warehouses as $wh)
                        <option value="{{ $wh->id }}" @selected(request('warehouse_id') == $wh->id)>{{ $wh->name }} — {{ $wh->branch->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search"></i></button>
                <a href="{{ route('stock.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>Produk</th><th>Kategori</th><th>Gudang</th><th>Stok</th><th>Min</th><th>Status</th></tr></thead>
            <tbody>
            @forelse($stocks as $rec)
                <tr>
                    <td>
                        <div class="fw-semibold" style="font-size:.83rem">{{ $rec->product->name }}</div>
                        <div class="text-muted font-monospace" style="font-size:.7rem">{{ $rec->product->sku }}</div>
                    </td>
                    <td><span class="badge badge-soft-purple">{{ $rec->product->category->name ?? '—' }}</span></td>
                    <td>
                        <div style="font-size:.82rem">{{ $rec->warehouse->name }}</div>
                        <div class="text-muted" style="font-size:.72rem">{{ $rec->warehouse->branch->name }}</div>
                    </td>
                    <td>
                        <span class="fw-bold" style="font-size:1rem;color:{{ $rec->quantity <= $rec->product->min_stock ? '#ef4444' : '#10b981' }}">
                            {{ $rec->quantity }}
                        </span>
                        <span class="text-muted" style="font-size:.72rem"> {{ $rec->product->unit }}</span>
                    </td>
                    <td class="text-muted">{{ $rec->product->min_stock }}</td>
                    <td>
                        @if($rec->quantity <= 0)
                            <span class="badge badge-soft-danger">Habis</span>
                        @elseif($rec->quantity <= $rec->product->min_stock)
                            <span class="badge badge-soft-warning">Menipis</span>
                        @else
                            <span class="badge badge-soft-success">Aman</span>
                        @endif
                    </td>
                </tr>
            @empty
                <tr><td colspan="6" class="text-center py-5 text-muted">
                    <i class="fa fa-warehouse fa-3x d-block mb-3 opacity-20"></i>Tidak ada data stok
                </td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
    @if($stocks->hasPages())
    <div class="card-body border-top py-3">{{ $stocks->links() }}</div>
    @endif
</div>

{{-- Adjust Modal --}}
<div class="modal fade" id="adjustModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border-radius:1rem;border:none;box-shadow:0 20px 60px rgba(0,0,0,.15)">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Sesuaikan Stok</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" action="{{ route('stock.adjust') }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-12">
                        <label class="form-label">Produk</label>
                        <select name="product_id" class="form-select" required>
                            <option value="">— Pilih Produk —</option>
                            @foreach($products as $p)
                                <option value="{{ $p->id }}">{{ $p->name }} ({{ $p->sku }})</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Gudang</label>
                        <select name="warehouse_id" class="form-select" required>
                            @foreach($warehouses as $wh)
                                <option value="{{ $wh->id }}">{{ $wh->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Tipe</label>
                        <select name="type" class="form-select" id="adjustType" required>
                            <option value="in">Stok Masuk</option>
                            <option value="out">Stok Keluar</option>
                            <option value="adjustment">Penyesuaian</option>
                            <option value="transfer">Transfer Gudang</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Jumlah</label>
                        <input type="number" name="quantity" class="form-control" required min="1">
                    </div>
                    <div class="col-md-6" id="toWarehouseField" style="display:none">
                        <label class="form-label">Gudang Tujuan</label>
                        <select name="to_warehouse_id" class="form-select">
                            @foreach($warehouses as $wh)
                                <option value="{{ $wh->id }}">{{ $wh->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Catatan</label>
                        <textarea name="notes" class="form-control" rows="2" placeholder="Opsional..."></textarea>
                    </div>
                </div>
                <div class="modal-footer border-0 pt-0">
                    <button type="button" class="btn" style="background:#f1f5f9;border:none;color:#64748b" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
document.getElementById('adjustType').addEventListener('change', function() {
    document.getElementById('toWarehouseField').style.display = this.value === 'transfer' ? '' : 'none';
});
</script>
@endpush
