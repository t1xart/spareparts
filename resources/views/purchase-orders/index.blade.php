@extends('layouts.app')
@section('title', 'Purchase Order')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Purchase Order</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Kelola pembelian ke supplier</div>
    </div>
    @can('po.create')
    <a href="{{ route('purchase-orders.create') }}" class="btn btn-primary"><i class="fa fa-plus me-2"></i>Buat PO</a>
    @endcan
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2">
            <div class="col-md-3">
                <select name="status" class="form-select">
                    <option value="">Semua Status</option>
                    @foreach(['draft','sent','partial','received','cancelled'] as $s)
                        <option value="{{ $s }}" @selected(request('status') == $s)>{{ ucfirst($s) }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <select name="supplier_id" class="form-select">
                    <option value="">Semua Supplier</option>
                    @foreach($suppliers as $sup)
                        <option value="{{ $sup->id }}" @selected(request('supplier_id') == $sup->id)>{{ $sup->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search"></i></button>
                <a href="{{ route('purchase-orders.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>No. PO</th><th>Supplier</th><th>Cabang</th><th>Total</th><th>Status</th><th>Tanggal</th><th></th></tr></thead>
            <tbody>
            @forelse($orders as $po)
                @php $sc = ['draft'=>'badge-soft-gray','sent'=>'badge-soft-info','partial'=>'badge-soft-warning','received'=>'badge-soft-success','cancelled'=>'badge-soft-danger']; @endphp
                <tr>
                    <td><span class="fw-semibold font-monospace" style="color:#6366f1;font-size:.8rem">{{ $po->po_number }}</span></td>
                    <td class="fw-semibold">{{ $po->supplier->name ?? '—' }}</td>
                    <td class="text-muted" style="font-size:.78rem">{{ $po->branch->name ?? '—' }}</td>
                    <td class="fw-semibold">Rp {{ number_format($po->total_amount, 0, ',', '.') }}</td>
                    <td><span class="badge {{ $sc[$po->status] ?? 'badge-soft-gray' }}">{{ ucfirst($po->status) }}</span></td>
                    <td class="text-muted" style="font-size:.75rem">{{ $po->ordered_at?->format('d/m/Y') ?? '—' }}</td>
                    <td><a href="{{ route('purchase-orders.show', $po) }}" class="btn btn-sm btn-icon" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-eye"></i></a></td>
                </tr>
            @empty
                <tr><td colspan="7" class="text-center py-5 text-muted">
                    <i class="fa fa-file-invoice fa-3x d-block mb-3 opacity-20"></i>Tidak ada data PO
                </td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
    @if($orders->hasPages())
    <div class="card-body border-top py-3">{{ $orders->links() }}</div>
    @endif
</div>
@endsection
