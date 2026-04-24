@extends('layouts.app')
@section('title', 'Buat Purchase Order')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Buat Purchase Order</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Order pembelian ke supplier</div>
    </div>
    <a href="{{ route('purchase-orders.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-2"></i>Kembali</a>
</div>

<form method="POST" action="{{ route('purchase-orders.store') }}">
    @csrf
    <div class="row g-3">
        <div class="col-lg-8">
            <div class="card mb-3 animate-in">
                <div class="card-header">
                    <div class="icon-badge" style="background:#dbeafe;color:#2563eb"><i class="fa fa-info-circle"></i></div>
                    Informasi PO
                </div>
                <div class="card-body row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Supplier <span class="text-danger">*</span></label>
                        <select name="supplier_id" class="form-select" required>
                            <option value="">— Pilih Supplier —</option>
                            @foreach($suppliers as $sup)
                                <option value="{{ $sup->id }}">{{ $sup->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Tanggal Order</label>
                        <input type="date" name="ordered_at" class="form-control" value="{{ date('Y-m-d') }}">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Catatan</label>
                        <textarea name="notes" class="form-control" rows="2" placeholder="Opsional..."></textarea>
                    </div>
                </div>
            </div>

            <div class="card animate-in">
                <div class="card-header">
                    <div class="icon-badge" style="background:#d1fae5;color:#059669"><i class="fa fa-list"></i></div>
                    Item Produk
                    <button type="button" class="btn btn-sm ms-auto" style="background:#ede9fe;border:none;color:#6366f1" id="addItem">
                        <i class="fa fa-plus me-1"></i>Tambah Item
                    </button>
                </div>
                <div class="card-body p-0">
                    <table class="table mb-0">
                        <thead><tr><th>Produk</th><th style="width:90px">Qty</th><th style="width:140px">Harga Beli</th><th style="width:120px">Subtotal</th><th style="width:40px"></th></tr></thead>
                        <tbody id="itemsBody">
                            <tr id="emptyRow"><td colspan="5" class="text-center text-muted py-4">
                                <i class="fa fa-plus-circle d-block mb-1 opacity-30" style="font-size:1.5rem"></i>Belum ada item
                            </td></tr>
                        </tbody>
                        <tfoot>
                            <tr style="background:#f8fafc">
                                <td colspan="3" class="text-end fw-bold py-3">Total:</td>
                                <td class="fw-bold py-3" style="color:#6366f1" id="grandTotal">Rp 0</td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card animate-in">
                <div class="card-body">
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                        <i class="fa fa-save me-2"></i>Buat Purchase Order
                    </button>
                    <a href="{{ route('purchase-orders.index') }}" class="btn w-100 mt-2" style="background:#f1f5f9;border:none;color:#64748b">Batal</a>
                </div>
            </div>
        </div>
    </div>
</form>

<template id="itemRowTemplate">
    <tr class="item-row">
        <td>
            <select name="items[__i__][product_id]" class="form-select form-select-sm product-select" required>
                <option value="">— Pilih Produk —</option>
                @foreach($products as $p)
                    <option value="{{ $p->id }}" data-price="{{ $p->buy_price }}">{{ $p->name }} ({{ $p->sku }})</option>
                @endforeach
            </select>
        </td>
        <td><input type="number" name="items[__i__][quantity]" class="form-control form-control-sm qty-input" value="1" min="1" required></td>
        <td>
            <div class="input-group input-group-sm">
                <span class="input-group-text">Rp</span>
                <input type="number" name="items[__i__][buy_price]" class="form-control price-input" value="0" min="0" required>
            </div>
        </td>
        <td class="fw-semibold subtotal-cell" style="color:#6366f1">Rp 0</td>
        <td>
            <button type="button" class="btn btn-sm btn-icon remove-row" style="background:#fee2e2;border:none;color:#dc2626">
                <i class="fa fa-times"></i>
            </button>
        </td>
    </tr>
</template>
@endsection
@push('scripts')
<script>
let rowIndex = 0;
const fmt = n => 'Rp ' + Math.round(n).toLocaleString('id-ID');
function updateTotal() {
    let total = 0;
    document.querySelectorAll('.item-row').forEach(row => {
        const qty = parseFloat(row.querySelector('.qty-input').value) || 0;
        const price = parseFloat(row.querySelector('.price-input').value) || 0;
        const sub = qty * price;
        row.querySelector('.subtotal-cell').textContent = fmt(sub);
        total += sub;
    });
    document.getElementById('grandTotal').textContent = fmt(total);
}
document.getElementById('addItem').addEventListener('click', () => {
    document.getElementById('emptyRow').style.display = 'none';
    const tpl = document.getElementById('itemRowTemplate').innerHTML.replaceAll('__i__', rowIndex++);
    const div = document.createElement('tbody');
    div.innerHTML = tpl;
    const row = div.firstElementChild;
    document.getElementById('itemsBody').appendChild(row);
    row.querySelector('.product-select').addEventListener('change', function() {
        const opt = this.options[this.selectedIndex];
        if (opt.dataset.price) row.querySelector('.price-input').value = opt.dataset.price;
        updateTotal();
    });
    row.querySelector('.qty-input').addEventListener('input', updateTotal);
    row.querySelector('.price-input').addEventListener('input', updateTotal);
    row.querySelector('.remove-row').addEventListener('click', () => { row.remove(); updateTotal(); });
});
</script>
@endpush
