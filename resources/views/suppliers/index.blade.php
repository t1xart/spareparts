@extends('layouts.app')
@section('title', 'Supplier')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Supplier</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Kelola data supplier dan vendor</div>
    </div>
    @can('suppliers.create')
    <a href="{{ route('suppliers.create') }}" class="btn btn-primary"><i class="fa fa-plus me-2"></i>Tambah Supplier</a>
    @endcan
</div>

<div class="card mb-3 animate-in">
    <div class="card-body py-3">
        <form method="GET" class="row g-2">
            <div class="col-md-5">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa fa-search text-muted"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="Cari nama atau kode supplier..." value="{{ request('search') }}">
                </div>
            </div>
            <div class="col-md-2 d-flex gap-2">
                <button class="btn btn-primary flex-fill"><i class="fa fa-search"></i></button>
                <a href="{{ route('suppliers.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-times"></i></a>
            </div>
        </form>
    </div>
</div>

<div class="card animate-in">
    <div class="card-body p-0">
        <table class="table mb-0">
            <thead><tr><th>Supplier</th><th>Kontak</th><th>Kota</th><th>Rating</th><th>Status</th><th></th></tr></thead>
            <tbody>
            @forelse($suppliers as $sup)
                <tr>
                    <td>
                        <div class="d-flex align-items-center gap-3">
                            <div style="width:36px;height:36px;border-radius:.5rem;background:linear-gradient(135deg,#6366f1,#818cf8);display:flex;align-items:center;justify-content:center;color:#fff;font-size:.75rem;font-weight:700;flex-shrink:0">
                                {{ strtoupper(substr($sup->name, 0, 2)) }}
                            </div>
                            <div>
                                <div class="fw-semibold" style="font-size:.83rem">{{ $sup->name }}</div>
                                <div class="text-muted font-monospace" style="font-size:.7rem">{{ $sup->code }}</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div style="font-size:.78rem">{{ $sup->phone ?: '—' }}</div>
                        <div class="text-muted" style="font-size:.72rem">{{ $sup->email ?: '' }}</div>
                    </td>
                    <td class="text-muted" style="font-size:.78rem">{{ $sup->city ?: '—' }}</td>
                    <td>
                        <div class="d-flex gap-1">
                            @for($i=1;$i<=5;$i++)
                            <i class="fa fa-star" style="font-size:.7rem;color:{{ $i <= $sup->rating ? '#f59e0b' : '#e2e8f0' }}"></i>
                            @endfor
                        </div>
                    </td>
                    <td><span class="badge {{ $sup->is_active ? 'badge-soft-success' : 'badge-soft-gray' }}">{{ $sup->is_active ? 'Aktif' : 'Nonaktif' }}</span></td>
                    <td>
                        <div class="d-flex gap-1">
                            <a href="{{ route('suppliers.show', $sup) }}" class="btn btn-sm btn-icon" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-eye"></i></a>
                            @can('suppliers.edit')
                            <a href="{{ route('suppliers.edit', $sup) }}" class="btn btn-sm btn-icon" style="background:#fef3c7;border:none;color:#d97706"><i class="fa fa-pen"></i></a>
                            @endcan
                        </div>
                    </td>
                </tr>
            @empty
                <tr><td colspan="6" class="text-center py-5 text-muted">
                    <i class="fa fa-truck fa-3x d-block mb-3 opacity-20"></i>Tidak ada data supplier
                </td></tr>
            @endforelse
            </tbody>
        </table>
    </div>
    @if($suppliers->hasPages())
    <div class="card-body border-top py-3">{{ $suppliers->links() }}</div>
    @endif
</div>
@endsection
