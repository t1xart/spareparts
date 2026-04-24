@extends('layouts.app')
@section('title', isset($supplier) ? 'Edit Supplier' : 'Tambah Supplier')
@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="fw-bold mb-0"><i class="fa fa-truck me-2 text-primary"></i>{{ isset($supplier) ? 'Edit Supplier' : 'Tambah Supplier' }}</h4>
    <a href="{{ route('suppliers.index') }}" class="btn btn-light"><i class="fa fa-arrow-left me-1"></i>Kembali</a>
</div>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="card">
            <div class="card-body">
                <form method="POST" action="{{ isset($supplier) ? route('suppliers.update', $supplier) : route('suppliers.store') }}">
                    @csrf
                    @if(isset($supplier)) @method('PUT') @endif
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Nama Supplier <span class="text-danger">*</span></label>
                            <input type="text" name="name" class="form-control" value="{{ old('name', $supplier->name ?? '') }}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Contact Person</label>
                            <input type="text" name="contact_person" class="form-control" value="{{ old('contact_person', $supplier->contact_person ?? '') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">No. Telepon</label>
                            <input type="text" name="phone" class="form-control" value="{{ old('phone', $supplier->phone ?? '') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" class="form-control" value="{{ old('email', $supplier->email ?? '') }}">
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-semibold">Alamat</label>
                            <textarea name="address" class="form-control" rows="2">{{ old('address', $supplier->address ?? '') }}</textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Kota</label>
                            <input type="text" name="city" class="form-control" value="{{ old('city', $supplier->city ?? '') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Provinsi</label>
                            <input type="text" name="province" class="form-control" value="{{ old('province', $supplier->province ?? '') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Bank</label>
                            <input type="text" name="bank_name" class="form-control" value="{{ old('bank_name', $supplier->bank_name ?? '') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">No. Rekening</label>
                            <input type="text" name="bank_account" class="form-control" value="{{ old('bank_account', $supplier->bank_account ?? '') }}">
                        </div>
                        @isset($supplier)
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Rating (0-5)</label>
                            <input type="number" name="rating" class="form-control" value="{{ old('rating', $supplier->rating ?? 0) }}" min="0" max="5">
                        </div>
                        <div class="col-md-6 d-flex align-items-end">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="is_active" value="1" id="isActive" @checked(old('is_active', $supplier->is_active ?? true))>
                                <label class="form-check-label fw-semibold" for="isActive">Aktif</label>
                            </div>
                        </div>
                        @endisset
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-save me-1"></i>Simpan</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
