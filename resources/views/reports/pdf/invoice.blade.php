<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body { font-family: Arial, sans-serif; font-size: 12px; color: #333; }
    .header { text-align: center; border-bottom: 2px solid #1a56db; padding-bottom: 10px; margin-bottom: 15px; }
    .header h2 { color: #1a56db; margin: 0; }
    .info-row { display: flex; justify-content: space-between; margin-bottom: 15px; }
    table { width: 100%; border-collapse: collapse; margin-bottom: 10px; }
    th { background: #f1f5f9; padding: 6px 8px; text-align: left; border-bottom: 1px solid #e2e8f0; }
    td { padding: 5px 8px; border-bottom: 1px solid #f1f5f9; }
    .text-right { text-align: right; }
    .total-row td { font-weight: bold; font-size: 14px; }
    .footer { text-align: center; margin-top: 20px; color: #94a3b8; font-size: 11px; }
</style>
</head>
<body>
<div class="header">
    <h2>fajarmotor</h2>
    <div>{{ $sale->branch->name ?? '' }}</div>
</div>
<div class="info-row">
    <div>
        <strong>INVOICE: {{ $sale->invoice_number }}</strong><br>
        Tanggal: {{ $sale->created_at->format('d M Y, H:i') }}<br>
        Kasir: {{ $sale->user->name ?? '-' }}
    </div>
    <div>
        Pelanggan: {{ $sale->customer_name ?: 'Umum' }}<br>
        @if($sale->customer_phone)HP: {{ $sale->customer_phone }}<br>@endif
        Pembayaran: {{ ucfirst($sale->payment_method) }}
    </div>
</div>
<table>
    <thead><tr><th>Produk</th><th>SKU</th><th class="text-right">Qty</th><th class="text-right">Harga</th><th class="text-right">Subtotal</th></tr></thead>
    <tbody>
    @foreach($sale->items as $item)
        <tr>
            <td>{{ $item->product->name ?? '-' }}</td>
            <td>{{ $item->product->sku ?? '' }}</td>
            <td class="text-right">{{ $item->quantity }}</td>
            <td class="text-right">Rp {{ number_format($item->sell_price, 0, ',', '.') }}</td>
            <td class="text-right">Rp {{ number_format($item->subtotal, 0, ',', '.') }}</td>
        </tr>
    @endforeach
    </tbody>
    <tfoot>
        <tr><td colspan="4" class="text-right">Subtotal</td><td class="text-right">Rp {{ number_format($sale->subtotal, 0, ',', '.') }}</td></tr>
        @if($sale->discount > 0)<tr><td colspan="4" class="text-right">Diskon</td><td class="text-right">- Rp {{ number_format($sale->discount, 0, ',', '.') }}</td></tr>@endif
        <tr class="total-row"><td colspan="4" class="text-right">TOTAL</td><td class="text-right">Rp {{ number_format($sale->total, 0, ',', '.') }}</td></tr>
        <tr><td colspan="4" class="text-right">Bayar</td><td class="text-right">Rp {{ number_format($sale->paid_amount, 0, ',', '.') }}</td></tr>
        <tr><td colspan="4" class="text-right">Kembalian</td><td class="text-right">Rp {{ number_format($sale->change_amount, 0, ',', '.') }}</td></tr>
    </tfoot>
</table>
<div class="footer">Terima kasih atas kepercayaan Anda! • fajarmotor</div>
</body>
</html>
