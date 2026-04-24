@extends('layouts.app')
@section('title', 'Mutasi Stok')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Riwayat Mutasi Stok</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Semua pergerakan stok masuk, keluar, dan penyesuaian</div>
    </div>
    <a href="{{ route('stock.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-2"></i>Kembali</a>
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2">
            <div class="col-md-3">
                <select name="type" class="form-select">
                    <option value="">Semua Tipe</option>
                    @foreach(['in'=>'Masuk','out'=>'Keluar','adjustment'=>'Penyesuaian','transfer'=>'Transfer'] as $v => $l)
                        <option value="{{ $v }}" @selected(request('type') == $v)>{{ $l }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search"></i></button>
                <a href="{{ route('stock.mutations') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>Waktu</th><th>Produk</th><th>Gudang</th><th>Tipe</th><th>Qty</th><th>Sebelum → Sesudah</th><th>Oleh</th></tr></thead>
            <tbody>
            @forelse($mutations as $mut)
                @php $tc = ['in'=>'badge-soft-success','out'=>'badge-soft-danger','adjustment'=>'badge-soft-warning','transfer'=>'badge-soft-info']; @endphp
                <tr>
                    <td class="text-muted" style="font-size:.75rem">{{ $mut->created_at->format('d/m/Y H:i') }}</td>
                    <td>
                        <div class="fw-semibold" style="font-size:.82rem">{{ $mut->product->name ?? '—' }}</div>
                    </td>
                    <td class="text-muted" style="font-size:.78rem">{{ $mut->warehouse->name ?? '—' }}</td>
                    <td><span class="badge {{ $tc[$mut->type] ?? 'badge-soft-gray' }}">{{ ucfirst($mut->type) }}</span></td>
                    <td>
                        <span class="fw-bold" style="color:{{ $mut->quantity > 0 ? '#10b981' : '#ef4444' }}">
                            {{ $mut->quantity > 0 ? '+' : '' }}{{ $mut->quantity }}
                        </span>
                    </td>
                    <td class="text-muted" style="font-size:.78rem">
                        {{ $mut->quantity_before }} <i class="fa fa-arrow-right mx-1" style="font-size:.65rem"></i>
                        <strong style="color:#0f172a">{{ $mut->quantity_after }}</strong>
                    </td>
                    <td class="text-muted" style="font-size:.78rem">{{ $mut->user->name ?? '—' }}</td>
                </tr>
            @empty
                <tr><td colspan="7" class="text-center py-5 text-muted">
                    <i class="fa fa-history fa-3x d-block mb-3 opacity-20"></i>Tidak ada data mutasi
                </td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
    @if($mutations->hasPages())
    <div class="card-body border-top py-3">{{ $mutations->links() }}</div>
    @endif
</div>
@endsection
