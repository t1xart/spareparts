@extends('layouts.app')
@section('title', 'Laporan Profit')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Laporan Profit</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Periode: {{ \Carbon\Carbon::parse($from)->isoFormat('D MMM Y') }} — {{ \Carbon\Carbon::parse($to)->isoFormat('D MMM Y') }}</div>
    </div>
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

@php
    $totalRevenue = $profitData->sum('revenue');
    $totalCogs    = $profitData->sum('cogs');
    $totalProfit  = $profitData->sum('profit');
    $totalMargin  = $totalRevenue > 0 ? ($totalProfit / $totalRevenue) * 100 : 0;
@endphp

<div class="row g-3 mb-4">
    <div class="col-md-3 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#d1fae5;color:#059669"><i class="fa fa-arrow-up"></i></div>
            <div class="stat-value" style="color:#10b981;font-size:1.1rem">Rp {{ number_format($totalRevenue, 0, ',', '.') }}</div>
            <div class="stat-label">Total Pendapatan</div>
        </div>
    </div>
    <div class="col-md-3 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#fee2e2;color:#dc2626"><i class="fa fa-arrow-down"></i></div>
            <div class="stat-value" style="color:#ef4444;font-size:1.1rem">Rp {{ number_format($totalCogs, 0, ',', '.') }}</div>
            <div class="stat-label">Total HPP (COGS)</div>
        </div>
    </div>
    <div class="col-md-3 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#ede9fe;color:#6366f1"><i class="fa fa-coins"></i></div>
            <div class="stat-value" style="color:#6366f1;font-size:1.1rem">Rp {{ number_format($totalProfit, 0, ',', '.') }}</div>
            <div class="stat-label">Total Profit</div>
        </div>
    </div>
    <div class="col-md-3 animate-in">
        <div class="stat-card">
            <div class="stat-icon" style="background:#dbeafe;color:#2563eb"><i class="fa fa-percent"></i></div>
            <div class="stat-value" style="color:#3b82f6">{{ number_format($totalMargin, 1) }}%</div>
            <div class="stat-label">Margin Rata-rata</div>
        </div>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>Produk</th><th>Qty Terjual</th><th>Revenue</th><th>HPP</th><th>Profit</th><th style="width:180px">Margin</th></tr></thead>
            <tbody>
            @forelse($profitData as $row)
                @php $margin = $row['revenue'] > 0 ? ($row['profit'] / $row['revenue']) * 100 : 0; @endphp
                <tr>
                    <td class="fw-semibold" style="font-size:.82rem">{{ $row['product']->name ?? '—' }}</td>
                    <td><span class="badge badge-soft-gray">{{ number_format($row['qty']) }}</span></td>
                    <td style="color:#10b981;font-weight:600;font-size:.82rem">Rp {{ number_format($row['revenue'], 0, ',', '.') }}</td>
                    <td style="color:#ef4444;font-size:.82rem">Rp {{ number_format($row['cogs'], 0, ',', '.') }}</td>
                    <td class="fw-bold" style="color:{{ $row['profit'] >= 0 ? '#6366f1' : '#ef4444' }};font-size:.82rem">
                        Rp {{ number_format($row['profit'], 0, ',', '.') }}
                    </td>
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <div style="flex:1;height:6px;background:#f1f5f9;border-radius:99px;overflow:hidden">
                                <div style="height:100%;width:{{ min(100, max(0, $margin)) }}%;background:{{ $margin >= 20 ? '#10b981' : ($margin >= 10 ? '#f59e0b' : '#ef4444') }};border-radius:99px;transition:.3s"></div>
                            </div>
                            <span style="font-size:.72rem;font-weight:600;min-width:36px">{{ number_format($margin, 1) }}%</span>
                        </div>
                    </td>
                </tr>
            @empty
                <tr><td colspan="6" class="text-center py-5 text-muted">Tidak ada data</td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
