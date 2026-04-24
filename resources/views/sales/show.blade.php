@extends('layouts.app')
@section('title', 'Invoice ' . $sale->invoice_number)
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Invoice</h4>
        <div class="text-muted mt-1 font-monospace" style="font-size:.78rem">{{ $sale->invoice_number }}</div>
    </div>
    <div class="d-flex gap-2">
        <a href="{{ route('sales.invoice.pdf', $sale) }}" class="btn btn-sm" style="background:#fee2e2;border:none;color:#dc2626" target="_blank">
            <i class="fa fa-file-pdf me-1"></i>PDF
        </a>
        @can('processReturn', $sale)
        @if($sale->status === 'paid')
        <form method="POST" action="{{ route('sales.return', $sale) }}" onsubmit="return confirm('Proses retur?')">
            @csrf
            <button class="btn btn-sm" style="background:#fef3c7;border:none;color:#d97706"><i class="fa fa-undo me-1"></i>Retur</button>
        </form>
        @endif
        @endcan
        <a href="{{ route('sales.index') }}" class="btn btn-sm" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-1"></i>Kembali</a>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-lg-7">
        <div class="card animate-in">
            <div class="card-body p-4">
                {{-- Header --}}
                <div class="d-flex justify-content-between align-items-start mb-4 pb-3 border-bottom">
                    <div>
                        <div class="d-flex align-items-center gap-2 mb-1">
                            <div style="width:32px;height:32px;background:linear-gradient(135deg,#6366f1,#818cf8);border-radius:.5rem;display:flex;align-items:center;justify-content:center;color:#fff;font-size:.8rem">
                                <i class="fa fa-motorcycle"></i>
                            </div>
                            <span class="fw-bold" style="color:#6366f1">fajarmotor</span>
                        </div>
                        <div class="text-muted" style="font-size:.75rem">{{ $sale->branch->name ?? '' }}</div>
                    </div>
                    <div class="text-end">
                        <div class="fw-bold" style="font-size:1.1rem">INVOICE</div>
                        <div class="font-monospace" style="color:#6366f1;font-size:.85rem">{{ $sale->invoice_number }}</div>
                        <div class="text-muted" style="font-size:.72rem">{{ $sale->created_at->format('d M Y, H:i') }}</div>
                        @php $map = ['paid'=>'badge-soft-success','returned'=>'badge-soft-info','cancelled'=>'badge-soft-danger']; @endphp
                        <span class="badge {{ $map[$sale->status] ?? 'badge-soft-gray' }} mt-1">{{ ucfirst($sale->status) }}</span>
                    </div>
                </div>

                {{-- Customer & Cashier --}}
                <div class="row mb-4">
                    <div class="col-6">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Pelanggan</div>
                        <div class="fw-semibold">{{ $sale->customer_name ?: 'Umum' }}</div>
                        @if($sale->customer_phone)<div class="text-muted" style="font-size:.78rem">{{ $sale->customer_phone }}</div>@endif
                    </div>
                    <div class="col-6 text-end">
                        <div class="text-muted mb-1" style="font-size:.72rem;text-transform:uppercase;letter-spacing:.05em">Kasir</div>
                        <div class="fw-semibold">{{ $sale->user->name ?? '—' }}</div>
                        <span class="badge badge-soft-gray text-uppercase">{{ $sale->payment_method }}</span>
                    </div>
                </div>

                {{-- Items --}}
                <table class="table table-sm mb-0">
                    <thead><tr><th>Produk</th><th class="text-center">Qty</th><th class="text-end">Harga</th><th class="text-end">Subtotal</th></tr></thead>
                    <tbody>
                    @foreach($sale->items as $item)
                        <tr>
                            <td>
                                <div class="fw-semibold" style="font-size:.82rem">{{ $item->product->name ?? '—' }}</div>
                                <div class="text-muted font-monospace" style="font-size:.7rem">{{ $item->product->sku ?? '' }}</div>
                            </td>
                            <td class="text-center">{{ $item->quantity }}</td>
                            <td class="text-end">Rp {{ number_format($item->sell_price, 0, ',', '.') }}</td>
                            <td class="text-end fw-semibold">Rp {{ number_format($item->subtotal, 0, ',', '.') }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                        <tr><td colspan="3" class="text-end text-muted border-top pt-2">Subtotal</td><td class="text-end border-top pt-2">Rp {{ number_format($sale->subtotal, 0, ',', '.') }}</td></tr>
                        @if($sale->discount > 0)
                        <tr><td colspan="3" class="text-end text-muted">Diskon</td><td class="text-end" style="color:#ef4444">− Rp {{ number_format($sale->discount, 0, ',', '.') }}</td></tr>
                        @endif
                        <tr style="background:#f8fafc">
                            <td colspan="3" class="text-end fw-bold py-2">TOTAL</td>
                            <td class="text-end fw-bold py-2" style="color:#6366f1;font-size:1rem">Rp {{ number_format($sale->total, 0, ',', '.') }}</td>
                        </tr>
                        <tr><td colspan="3" class="text-end text-muted">Bayar</td><td class="text-end">Rp {{ number_format($sale->paid_amount, 0, ',', '.') }}</td></tr>
                        <tr><td colspan="3" class="text-end text-muted">Kembalian</td><td class="text-end fw-semibold" style="color:#10b981">Rp {{ number_format($sale->change_amount, 0, ',', '.') }}</td></tr>
                    </tfoot>
                </table>

                <div class="text-center mt-4 pt-3 border-top text-muted" style="font-size:.75rem">
                    Terima kasih atas kepercayaan Anda! 🙏
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
