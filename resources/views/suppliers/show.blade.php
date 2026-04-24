@extends('layouts.app')
@section('title', $supplier->name)
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>{{ $supplier->name }}</h4>
        <div class="text-muted mt-1 font-monospace" style="font-size:.78rem">{{ $supplier->code }}</div>
    </div>
    <div class="d-flex gap-2">
        @can('suppliers.edit')
        <a href="{{ route('suppliers.edit', $supplier) }}" class="btn btn-primary"><i class="fa fa-pen me-2"></i>Edit</a>
        @endcan
        <a href="{{ route('suppliers.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-2"></i>Kembali</a>
    </div>
</div>

<div class="row g-3">
    <div class="col-lg-4">
        <div class="card animate-in">
            <div class="card-body">
                <div class="text-center mb-4">
                    <div style="width:64px;height:64px;border-radius:1rem;background:linear-gradient(135deg,#6366f1,#818cf8);display:flex;align-items:center;justify-content:center;color:#fff;font-size:1.4rem;font-weight:700;margin:0 auto .75rem">
                        {{ strtoupper(substr($supplier->name, 0, 2)) }}
                    </div>
                    <h5 class="fw-bold mb-0">{{ $supplier->name }}</h5>
                    <div class="text-muted font-monospace" style="font-size:.75rem">{{ $supplier->code }}</div>
                    <div class="mt-2">
                        @for($i=1;$i<=5;$i++)
                        <i class="fa fa-star" style="font-size:.8rem;color:{{ $i <= $supplier->rating ? '#f59e0b' : '#e2e8f0' }}"></i>
                        @endfor
                    </div>
                </div>
                <table class="table table-sm mb-0">
                    <tr><td class="text-muted" style="width:40%">Kontak</td><td class="fw-semibold">{{ $supplier->contact_person ?: '—' }}</td></tr>
                    <tr><td class="text-muted">Telepon</td><td>{{ $supplier->phone ?: '—' }}</td></tr>
                    <tr><td class="text-muted">Email</td><td>{{ $supplier->email ?: '—' }}</td></tr>
                    <tr><td class="text-muted">Kota</td><td>{{ $supplier->city ? $supplier->city . ', ' . $supplier->province : '—' }}</td></tr>
                    <tr><td class="text-muted">Bank</td><td>{{ $supplier->bank_name ? $supplier->bank_name . ' — ' . $supplier->bank_account : '—' }}</td></tr>
                    <tr><td class="text-muted">Status</td><td><span class="badge {{ $supplier->is_active ? 'badge-soft-success' : 'badge-soft-gray' }}">{{ $supplier->is_active ? 'Aktif' : 'Nonaktif' }}</span></td></tr>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-8">
        <div class="card animate-in">
            <div class="card-header">
                <div class="icon-badge" style="background:#dbeafe;color:#2563eb"><i class="fa fa-file-invoice"></i></div>
                Riwayat Purchase Order
                @can('po.create')
                <a href="{{ route('purchase-orders.create') }}" class="btn btn-sm ms-auto" style="background:#ede9fe;border:none;color:#6366f1"><i class="fa fa-plus me-1"></i>Buat PO</a>
                @endcan
            </div>
            <div class="card-body p-0">
                <table class="table mb-0">
                    <thead><tr><th>No. PO</th><th>Total</th><th>Status</th><th>Tanggal</th><th></th></tr></thead>
                    <tbody>
                    @forelse($supplier->purchaseOrders as $po)
                        @php $sc = ['draft'=>'badge-soft-gray','sent'=>'badge-soft-info','partial'=>'badge-soft-warning','received'=>'badge-soft-success','cancelled'=>'badge-soft-danger']; @endphp
                        <tr>
                            <td class="fw-semibold font-monospace" style="color:#6366f1;font-size:.8rem">{{ $po->po_number }}</td>
                            <td>Rp {{ number_format($po->total_amount, 0, ',', '.') }}</td>
                            <td><span class="badge {{ $sc[$po->status] ?? 'badge-soft-gray' }}">{{ ucfirst($po->status) }}</span></td>
                            <td class="text-muted" style="font-size:.75rem">{{ $po->ordered_at?->format('d/m/Y') }}</td>
                            <td><a href="{{ route('purchase-orders.show', $po) }}" class="btn btn-sm btn-icon" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-eye"></i></a></td>
                        </tr>
                    @empty
                        <tr><td colspan="5" class="text-center text-muted py-4">
                            <i class="fa fa-file-invoice fa-2x d-block mb-2 opacity-20"></i>Belum ada PO
                        </td></tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
