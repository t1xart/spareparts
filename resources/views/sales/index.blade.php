@extends('layouts.app')
@section('title', 'Penjualan')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Riwayat Penjualan</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Semua transaksi penjualan</div>
    </div>
    @can('sales.create')
    <a href="{{ route('sales.pos') }}" class="btn btn-primary"><i class="fa fa-cash-register me-2"></i>Buka Kasir</a>
    @endcan
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2 align-items-end">
            <div class="col-md-4">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-search text-muted"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="No. Invoice / Pelanggan..." value="{{ request('search') }}">
                </div>
            </div>
            <div class="col-md-2"><input type="date" name="date_from" class="form-control" value="{{ request('date_from') }}"></div>
            <div class="col-md-2"><input type="date" name="date_to" class="form-control" value="{{ request('date_to') }}"></div>
            <div class="col-md-2 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search"></i></button>
                <a href="{{ route('sales.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>Invoice</th><th>Pelanggan</th><th>Pembayaran</th><th>Total</th><th>Status</th><th>Kasir</th><th>Waktu</th><th></th></tr></thead>
            <tbody>
            @forelse($sales as $sale)
                <tr>
                    <td><span class="fw-semibold font-monospace" style="color:#6366f1;font-size:.8rem">{{ $sale->invoice_number }}</span></td>
                    <td class="fw-semibold">{{ $sale->customer_name ?: 'Umum' }}</td>
                    <td><span class="badge badge-soft-gray text-uppercase">{{ $sale->payment_method }}</span></td>
                    <td class="fw-bold" style="color:#10b981">Rp {{ number_format($sale->total, 0, ',', '.') }}</td>
                    <td>
                        @php $map = ['paid'=>'badge-soft-success','pending'=>'badge-soft-warning','returned'=>'badge-soft-info','cancelled'=>'badge-soft-danger']; @endphp
                        <span class="badge {{ $map[$sale->status] ?? 'badge-soft-gray' }}">{{ ucfirst($sale->status) }}</span>
                    </td>
                    <td class="text-muted" style="font-size:.78rem">{{ $sale->user->name ?? '—' }}</td>
                    <td class="text-muted" style="font-size:.75rem">{{ $sale->created_at->format('d/m/Y H:i') }}</td>
                    <td><a href="{{ route('sales.show', $sale) }}" class="btn btn-sm btn-icon" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-eye"></i></a></td>
                </tr>
            @empty
                <tr><td colspan="8" class="text-center py-5 text-muted">
                    <i class="fa fa-receipt fa-3x d-block mb-3 opacity-20"></i>Tidak ada data penjualan
                </td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
    @if($sales->hasPages())
    <div class="card-body border-top py-3 d-flex justify-content-between align-items-center">
        <div class="text-muted" style="font-size:.78rem">{{ $sales->total() }} transaksi</div>
        {{ $sales->links() }}
    </div>
    @endif
</div>
@endsection
