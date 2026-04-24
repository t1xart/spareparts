@extends('layouts.app')
@section('title', 'Detail PO')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>{{ $purchaseOrder->po_number }}</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Detail Purchase Order</div>
    </div>
    <a href="{{ route('purchase-orders.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-2"></i>Kembali</a>
</div>

@php $sc = ['draft'=>'badge-soft-gray','sent'=>'badge-soft-info','partial'=>'badge-soft-warning','received'=>'badge-soft-success','cancelled'=>'badge-soft-danger']; @endphp

<div class="row g-3">
    <div class="col-lg-8">
        <div class="card mb-3 animate-in">
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Supplier</div>
                        <div class="fw-semibold">{{ $purchaseOrder->supplier->name }}</div>
                    </div>
                    <div class="col-md-6">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Cabang</div>
                        <div class="fw-semibold">{{ $purchaseOrder->branch->name }}</div>
                    </div>
                    <div class="col-md-6">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Tanggal Order</div>
                        <div>{{ $purchaseOrder->ordered_at?->format('d M Y') ?? '—' }}</div>
                    </div>
                    <div class="col-md-6">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Dibuat Oleh</div>
                        <div>{{ $purchaseOrder->user->name ?? '—' }}</div>
                    </div>
                    @if($purchaseOrder->notes)
                    <div class="col-12">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Catatan</div>
                        <div class="text-muted" style="font-size:.82rem">{{ $purchaseOrder->notes }}</div>
                    </div>
                    @endif
                </div>
            </div>
        </div>

        <div class="card animate-in">
            <div class="card-header">
                <div class="icon-badge" style="background:#d1fae5;color:#059669"><i class="fa fa-list"></i></div>
                Item Produk
            </div>
            <div class="card-body p-0">
                @if(in_array($purchaseOrder->status, ['sent', 'partial']))
                <form method="POST" action="{{ route('purchase-orders.receive', $purchaseOrder) }}">
                    @csrf
                @endif
                <table class="table mb-0">
                    <thead><tr><th>Produk</th><th>Dipesan</th><th>Diterima</th><th>Harga</th><th>Subtotal</th>
                        @if(in_array($purchaseOrder->status, ['sent', 'partial']))<th>Terima Skrg</th>@endif
                    </tr></thead>
                    <tbody>
                    @foreach($purchaseOrder->items as $item)
                        <tr>
                            <td>
                                <div class="fw-semibold" style="font-size:.82rem">{{ $item->product->name ?? '—' }}</div>
                                <div class="text-muted font-monospace" style="font-size:.7rem">{{ $item->product->sku ?? '' }}</div>
                            </td>
                            <td>{{ $item->quantity }}</td>
                            <td><span class="badge {{ $item->received_quantity >= $item->quantity ? 'badge-soft-success' : 'badge-soft-warning' }}">{{ $item->received_quantity }}</span></td>
                            <td>Rp {{ number_format($item->buy_price, 0, ',', '.') }}</td>
                            <td class="fw-semibold">Rp {{ number_format($item->buy_price * $item->quantity, 0, ',', '.') }}</td>
                            @if(in_array($purchaseOrder->status, ['sent', 'partial']))
                            <td>
                                <input type="hidden" name="items[{{ $loop->index }}][id]" value="{{ $item->id }}">
                                <input type="number" name="items[{{ $loop->index }}][received_quantity]" class="form-control form-control-sm"
                                       value="{{ $item->quantity - $item->received_quantity }}" min="0" max="{{ $item->quantity - $item->received_quantity }}" style="width:80px">
                            </td>
                            @endif
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                        <tr style="background:#f8fafc">
                            <td colspan="4" class="text-end fw-bold py-3">Total:</td>
                            <td class="fw-bold py-3" style="color:#6366f1">Rp {{ number_format($purchaseOrder->total_amount, 0, ',', '.') }}</td>
                            @if(in_array($purchaseOrder->status, ['sent', 'partial']))<td></td>@endif
                        </tr>
                    </tfoot>
                </table>
                @if(in_array($purchaseOrder->status, ['sent', 'partial']))
                    <div class="p-3 border-top">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-check me-2"></i>Konfirmasi Penerimaan</button>
                    </div>
                </form>
                @endif
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="card animate-in">
            <div class="card-body">
                <div class="text-muted mb-2" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Status</div>
                <span class="badge {{ $sc[$purchaseOrder->status] ?? 'badge-soft-gray' }}" style="font-size:.82rem;padding:.4em .8em">{{ ucfirst($purchaseOrder->status) }}</span>
                <div class="mt-4 pt-3 border-top">
                    <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Total Nilai PO</div>
                    <div class="fw-bold" style="font-size:1.4rem;color:#6366f1">Rp {{ number_format($purchaseOrder->total_amount, 0, ',', '.') }}</div>
                </div>
                @if($purchaseOrder->received_at)
                <div class="mt-3 pt-3 border-top">
                    <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Tanggal Diterima</div>
                    <div>{{ $purchaseOrder->received_at->format('d M Y') }}</div>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
