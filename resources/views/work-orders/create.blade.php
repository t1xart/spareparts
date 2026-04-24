@extends('layouts.app')
@section('title', 'Buat Work Order')
@section('content')

<div class="page-header animate-in">
    <div>
        <h4>Buat Work Order</h4>
        <div class="text-muted mt-1" style="font-size:.78rem">Buat order servis kendaraan baru</div>
    </div>
    <a href="{{ route('work-orders.index') }}" class="btn" style="background:#f1f5f9;border:none;color:#64748b"><i class="fa fa-arrow-left me-2"></i>Kembali</a>
</div>

<form method="POST" action="{{ route('work-orders.store') }}">
    @csrf
    <div class="row g-3">
        <div class="col-lg-8">
            <div class="card mb-3 animate-in">
                <div class="card-header">
                    <div class="icon-badge" style="background:#dbeafe;color:#2563eb"><i class="fa fa-user"></i></div>
                    Data Pelanggan & Kendaraan
                </div>
                <div class="card-body row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Nama Pelanggan <span class="text-danger">*</span></label>
                        <input type="text" name="customer_name" class="form-control" required value="{{ old('customer_name') }}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">No. HP</label>
                        <input type="text" name="customer_phone" class="form-control" value="{{ old('customer_phone') }}">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Plat Nomor</label>
                        <input type="text" name="vehicle_plate" class="form-control" value="{{ old('vehicle_plate') }}" placeholder="B 1234 ABC">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Tipe Kendaraan</label>
                        <select name="vehicle_type_id" class="form-select">
                            <option value="">— Pilih —</option>
                            @foreach($vehicleTypes as $brand => $types)
                                <optgroup label="{{ $brand }}">
                                    @foreach($types as $t)
                                        <option value="{{ $t->id }}" @selected(old('vehicle_type_id') == $t->id)>{{ $t->name }}</option>
                                    @endforeach
                                </optgroup>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Tahun</label>
                        <input type="number" name="vehicle_year" class="form-control" value="{{ old('vehicle_year') }}" min="1990" max="{{ date('Y') }}">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Keluhan</label>
                        <textarea name="complaint" class="form-control" rows="2">{{ old('complaint') }}</textarea>
                    </div>
                </div>
            </div>

            <div class="card animate-in">
                <div class="card-header">
                    <div class="icon-badge" style="background:#d1fae5;color:#059669"><i class="fa fa-list"></i></div>
                    Item Pekerjaan & Sparepart
                    <button type="button" class="btn btn-sm ms-auto" style="background:#ede9fe;border:none;color:#6366f1" id="addItem">
                        <i class="fa fa-plus me-1"></i>Tambah
                    </button>
                </div>
                <div class="card-body p-0">
                    <table class="table mb-0">
                        <thead><tr><th>Deskripsi</th><th>Produk (opsional)</th><th style="width:80px">Qty</th><th style="width:120px">Harga</th><th style="width:100px">Subtotal</th><th style="width:40px"></th></tr></thead>
                        <tbody id="itemsBody">
                            <tr id="emptyRow"><td colspan="6" class="text-center text-muted py-4">
                                <i class="fa fa-plus-circle d-block mb-1 opacity-30" style="font-size:1.5rem"></i>Belum ada item
                            </td></tr>
                        </tbody>
                        <tfoot>
                            <tr style="background:#f8fafc">
                                <td colspan="4" class="text-end fw-bold py-3">Total Parts:</td>
                                <td class="fw-bold py-3" style="color:#6366f1" id="partsTotal">Rp 0</td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card mb-3 animate-in">
                <div class="card-header">
                    <div class="icon-badge" style="background:#fef3c7;color:#d97706"><i class="fa fa-coins"></i></div>
                    Biaya Jasa
                </div>
                <div class="card-body">
                    <label class="form-label">Biaya Jasa</label>
                    <div class="input-group">
                        <span class="input-group-text">Rp</span>
                        <input type="number" name="service_fee" class="form-control" value="{{ old('service_fee', 0) }}" min="0">
                    </div>
                </div>
            </div>
            <div class="card animate-in">
                <div class="card-body">
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                        <i class="fa fa-save me-2"></i>Buat Work Order
                    </button>
                    <a href="{{ route('work-orders.index') }}" class="btn w-100 mt-2" style="background:#f1f5f9;border:none;color:#64748b">Batal</a>
                </div>
            </div>
        </div>
    </div>
</form>

<template id="itemRowTemplate">
    <tr class="item-row">
        <td><input type="text" name="items[__i__][description]" class="form-control form-control-sm" required placeholder="Ganti oli, tune up, dll."></td>
        <td>
            <select name="items[__i__][product_id]" class="form-select form-select-sm product-select">
                <option value="">— Opsional —</option>
                @foreach($products as $p)
                    <option value="{{ $p->id }}" data-price="{{ $p->sell_price }}">{{ $p->name }}</option>
                @endforeach
            </select>
        </td>
        <td><input type="number" name="items[__i__][quantity]" class="form-control form-control-sm qty-input" value="1" min="1"></td>
        <td><input type="number" name="items[__i__][price]" class="form-control form-control-sm price-input" value="0" min="0"></td>
        <td class="fw-semibold subtotal-cell" style="color:#6366f1">Rp 0</td>
        <td><button type="button" class="btn btn-sm btn-icon remove-row" style="background:#fee2e2;border:none;color:#dc2626"><i class="fa fa-times"></i></button></td>
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
    document.getElementById('partsTotal').textContent = fmt(total);
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
