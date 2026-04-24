<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body { font-family: Arial, sans-serif; font-size: 11px; }
    h2 { color: #1a56db; }
    table { width: 100%; border-collapse: collapse; }
    th { background: #1a56db; color: white; padding: 5px 8px; }
    td { padding: 4px 8px; border-bottom: 1px solid #e2e8f0; }
    .text-right { text-align: right; }
    .total { font-weight: bold; background: #f1f5f9; }
</style>
</head>
<body>
<h2>Laporan Penjualan</h2>
<p>Periode: {{ $from }} s/d {{ $to }}</p>
<table>
    <thead><tr><th>Invoice</th><th>Pelanggan</th><th>Pembayaran</th><th class="text-right">Total</th><th>Waktu</th></tr></thead>
    <tbody>
    @foreach($sales as $sale)
        <tr>
            <td>{{ $sale->invoice_number }}</td>
            <td>{{ $sale->customer_name ?: 'Umum' }}</td>
            <td>{{ ucfirst($sale->payment_method) }}</td>
            <td class="text-right">Rp {{ number_format($sale->total, 0, ',', '.') }}</td>
            <td>{{ $sale->created_at->format('d/m/Y H:i') }}</td>
        </tr>
    @endforeach
    <tr class="total"><td colspan="3">TOTAL ({{ $sales->count() }} transaksi)</td><td class="text-right">Rp {{ number_format($sales->sum('total'), 0, ',', '.') }}</td><td></td></tr>
    </tbody>
</table>
</body>
</html>
