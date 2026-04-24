@extends('layouts.app')
@section('title', 'Laporan Penjualan')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Laporan Penjualan</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Periode: {{ \Carbon\Carbon::parse($from)->isoFormat('D MMM Y') }} — {{ \Carbon\Carbon::parse($to)->isoFormat('D MMM Y') }}</div>
    </div>
    @can('reports.export')
    <div class="d-flex gap-2">
        <a href="{{ route('reports.sales.pdf', request()->query()) }}" class="btn btn-sm" style="background:#fee2e2;border:none;color:#dc2626" target="_blank">
            <i class="fa fa-file-pdf me-1"></i>PDF
        </a>
        <a href="{{ route('reports.sales.excel', request()->query()) }}" class="btn btn-sm" style="background:#d1fae5;border:none;color:#059669">
            <i class="fa fa-file-excel me-1"></i>Excel
        </a>
    </div>
    @endcan
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2 align-items-end">
            <div class="col-md-3"><label class="form-label" style="font-size:.75rem">Dari Tanggal</label><input type="date" name="date_from" class="form-control" value="{{ $from }}"></div>
            <div class="col-md-3"><label class="form-label" style="font-size:.75rem">Sampai Tanggal</label><input type="date" name="date_to" class="form-control" value="{{ $to }}"></div>
            <div class="col-md-2"><button class="btn btn-primary w-100"><i class="fa fa-search me-1"></i>Filter</button></div>
        </form>
    </div>
</div>

<div class="row g-3 mb-4">
    <div class="col-md-4 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#ede9fe;color:#6366f1"><i class="fa fa-receipt"></i></div>
            <div class="stat-value" style="color:#6366f1">{{ number_format($summary['total_transactions']) }}</div>
            <div class="stat-label">Total Transaksi</div>
        </div>
    </div>
    <div class="col-md-4 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#d1fae5;color:#059669"><i class="fa fa-coins"></i></div>
            <div class="stat-value" style="color:#10b981;font-size:1.2rem">Rp {{ number_format($summary['total_revenue'], 0, ',', '.') }}</div>
            <div class="stat-label">Total Pendapatan</div>
        </div>
    </div>
    <div class="col-md-4 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#dbeafe;color:#2563eb"><i class="fa fa-box"></i></div>
            <div class="stat-value" style="color:#3b82f6">{{ number_format($summary['total_items']) }}</div>
            <div class="stat-label">Total Item Terjual</div>
        </div>
    </div>
</div>

<div class="row g-3">
    <div class="col-lg-7 animate-in">
        <div class="card">
            <div class="card-header">
                <div class="icon-badge" style="background:#ede9fe;color:#6366f1"><i class="fa fa-list"></i></div>
                Daftar Transaksi
            </div>
            <div class="card-body p-0">
                <table class="table mb-0">
                    <thead><tr><th>Invoice</th><th>Pelanggan</th><th>Total</th><th>Waktu</th></tr></thead>
                    <tbody>
                    @forelse($sales as $sale)
                        <tr>
                            <td><a href="{{ route('sales.show', $sale) }}" class="fw-semibold text-decoration-none" style="color:#6366f1;font-size:.8rem">{{ $sale->invoice_number }}</a></td>
                            <td>{{ $sale->customer_name ?: 'Umum' }}</td>
                            <td class="fw-semibold" style="color:#10b981">Rp {{ number_format($sale->total, 0, ',', '.') }}</td>
                            <td class="text-muted" style="font-size:.75rem">{{ $sale->created_at->format('d/m/Y H:i') }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="4" class="text-center text-muted py-4">Tidak ada data</td></tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-lg-5 animate-in">
        <div class="card">
            <div class="card-header">
                <div class="icon-badge" style="background:#fef3c7;color:#d97706"><i class="fa fa-trophy"></i></div>
                Produk Terlaris
            </div>
            <div class="card-body p-0">
                <table class="table mb-0">
                    <thead><tr><th>#</th><th>Produk</th><th>Qty</th><th>Revenue</th></tr></thead>
                    <tbody>
                    @forelse($topProducts as $i => $item)
                        <tr>
                            <td>
                                <span class="badge {{ $i < 3 ? 'badge-soft-warning' : 'badge-soft-gray' }}">{{ $i+1 }}</span>
                            </td>
                            <td class="fw-semibold" style="font-size:.8rem">{{ $item->product->name ?? '—' }}</td>
                            <td><span class="badge badge-soft-purple">{{ $item->total_qty }}</span></td>
                            <td class="text-muted" style="font-size:.75rem">Rp {{ number_format($item->total_revenue, 0, ',', '.') }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="4" class="text-center text-muted py-4">Tidak ada data</td></tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
