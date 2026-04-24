@extends('layouts.app')
@section('title', 'Ubah Email')

@section('content')
<div style="max-width:560px;margin:0 auto">

    <div class="page-header animate-in">
        <div>
            <h4>Ubah Email</h4>
            <div class="sub">Verifikasi melalui kode OTP yang dikirim ke email baru</div>
        </div>
        <a href="{{ route('profile.edit') }}" class="btn btn-secondary btn-sm">
            <i class="fa fa-arrow-left me-1"></i>Kembali
        </a>
    </div>

    @if(session('success'))
    <div class="alert alert-success animate-in mb-3">
        <i class="fa fa-check-circle me-2"></i>{{ session('success') }}
    </div>
    @endif

    {{-- Current email info --}}
    <div class="card animate-in mb-3">
        <div class="card-body" style="display:flex;align-items:center;gap:14px">
            <div style="width:42px;height:42px;border-radius:11px;background:rgba(99,102,241,.12);color:var(--primary);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0">
                <i class="fa fa-envelope"></i>
            </div>
            <div>
                <div style="font-size:11px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.08em;margin-bottom:2px">Email Aktif Saat Ini</div>
                <div style="font-size:14px;font-weight:700">{{ auth()->user()?->email }}</div>
            </div>
            <span style="margin-left:auto;font-size:10px;background:rgba(16,185,129,.12);color:var(--success);border:1px solid rgba(16,185,129,.2);border-radius:20px;padding:3px 10px;font-weight:700;white-space:nowrap">
                <i class="fa fa-check me-1"></i>Terverifikasi
            </span>
        </div>
    </div>

    @if(!$pendingOtp)
    {{-- STEP 1: Request OTP --}}
    <div class="card animate-in">
        <div class="card-header">
            <div class="ch-icon" style="background:rgba(99,102,241,.15);color:var(--primary)"><i class="fa fa-paper-plane"></i></div>
            Langkah 1 — Masukkan Email Baru
        </div>
        <div class="card-body">
            @if($errors->has('new_email'))
            <div class="alert alert-danger mb-3"><i class="fa fa-exclamation-circle me-2"></i>{{ $errors->first('new_email') }}</div>
            @endif

            <form method="POST" action="{{ route('profile.email.request') }}" id="reqForm">
                @csrf
                <div style="margin-bottom:16px">
                    <label style="font-size:12px;font-weight:600;color:var(--text2);display:block;margin-bottom:6px">
                        Email Baru <span style="color:var(--danger)">*</span>
                    </label>
                    <div style="position:relative">
                        <i class="fa fa-envelope" style="position:absolute;left:.9rem;top:50%;transform:translateY(-50%);color:var(--text3);font-size:.8rem;pointer-events:none"></i>
                        <input type="email" name="new_email" value="{{ old('new_email') }}"
                            class="form-control" style="padding-left:2.5rem"
                            placeholder="email_baru@gmail.com" required autofocus>
                    </div>
                    <div style="font-size:11px;color:var(--muted);margin-top:6px">
                        <i class="fa fa-circle-info me-1"></i>Kode OTP 6 digit akan dikirim ke email baru ini. Berlaku 10 menit.
                    </div>
                </div>

                <button type="submit" id="sendBtn"
                    style="background:linear-gradient(135deg,var(--primary),var(--primary-dark));color:#fff;border:none;border-radius:9px;padding:10px 24px;font-size:13px;font-weight:700;font-family:'Inter',sans-serif;cursor:pointer;transition:all .2s;display:inline-flex;align-items:center;gap:8px"
                    onmouseover="this.style.transform='translateY(-1px)';this.style.boxShadow='0 6px 20px rgba(99,102,241,.4)'"
                    onmouseout="this.style.transform='';this.style.boxShadow=''">
                    <i class="fa fa-paper-plane"></i>Kirim Kode OTP
                </button>
            </form>
        </div>
    </div>

    @else
    {{-- STEP 2: Enter OTP --}}
    <div class="card animate-in">
        <div class="card-header">
            <div class="ch-icon" style="background:rgba(16,185,129,.15);color:var(--success)"><i class="fa fa-shield-halved"></i></div>
            Langkah 2 — Masukkan Kode OTP
        </div>
        <div class="card-body">
            <div style="background:rgba(99,102,241,.06);border:1px solid rgba(99,102,241,.2);border-radius:10px;padding:14px 18px;margin-bottom:20px;display:flex;align-items:center;gap:12px">
                <i class="fa fa-envelope-circle-check" style="color:var(--primary);font-size:20px;flex-shrink:0"></i>
                <div>
                    <div style="font-size:13px;font-weight:600">Kode OTP dikirim ke <strong>{{ $pendingOtp->new_email }}</strong></div>
                    <div style="font-size:11px;color:var(--muted);margin-top:2px">
                        Cek inbox atau folder spam.
                        Kedaluwarsa: <strong>{{ \Carbon\Carbon::parse($pendingOtp->expires_at)->format('H:i') }} WIB</strong>
                    </div>
                </div>
            </div>

            @if($errors->has('otp'))
            <div class="alert alert-danger mb-3"><i class="fa fa-exclamation-circle me-2"></i>{{ $errors->first('otp') }}</div>
            @endif

            <form method="POST" action="{{ route('profile.email.verify') }}" id="otpForm">
                @csrf
                <div style="margin-bottom:20px">
                    <label style="font-size:12px;font-weight:600;color:var(--text2);display:block;margin-bottom:8px">
                        Kode OTP (6 digit)
                    </label>
                    <input type="text" name="otp" maxlength="6" inputmode="numeric" pattern="[0-9]{6}"
                        style="width:200px;padding:12px 16px;border:2px solid var(--border);border-radius:10px;font-size:28px;font-weight:900;font-family:monospace;color:var(--primary);background:var(--bg);outline:none;text-align:center;letter-spacing:10px;transition:all .2s;display:block"
                        placeholder="000000" required autofocus
                        onfocus="this.style.borderColor='var(--primary)';this.style.boxShadow='0 0 0 3px rgba(99,102,241,.12)'"
                        onblur="this.style.borderColor='var(--border)';this.style.boxShadow='none'"
                        oninput="this.value=this.value.replace(/[^0-9]/g,'')">
                </div>

                <div style="display:flex;gap:10px;flex-wrap:wrap">
                    <button type="submit" id="verifyBtn"
                        style="background:linear-gradient(135deg,var(--success),#059669);color:#fff;border:none;border-radius:9px;padding:10px 24px;font-size:13px;font-weight:700;font-family:'Inter',sans-serif;cursor:pointer;transition:all .2s;display:inline-flex;align-items:center;gap:8px"
                        onmouseover="this.style.transform='translateY(-1px)';this.style.boxShadow='0 6px 20px rgba(16,185,129,.4)'"
                        onmouseout="this.style.transform='';this.style.boxShadow=''">
                        <i class="fa fa-check-circle"></i>Verifikasi & Simpan Email
                    </button>
                    <a href="{{ route('profile.email') }}"
                        style="background:transparent;color:var(--muted);border:1.5px solid var(--border);border-radius:9px;padding:10px 18px;font-size:13px;font-weight:600;font-family:'Inter',sans-serif;cursor:pointer;transition:all .2s;display:inline-flex;align-items:center;gap:7px;text-decoration:none">
                        <i class="fa fa-rotate-left"></i>Kirim Ulang OTP
                    </a>
                </div>
            </form>
        </div>
    </div>
    @endif

    {{-- How it works --}}
    <div class="card animate-in mt-3">
        <div class="card-body">
            <div style="font-size:11px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.08em;margin-bottom:12px">Cara Kerja</div>
            <div style="display:flex;flex-direction:column;gap:10px">
                @foreach([
                    ['1','fa-envelope','Masukkan email baru yang ingin digunakan','var(--primary)'],
                    ['2','fa-paper-plane','Kode OTP 6 digit dikirim ke email baru tersebut','var(--info)'],
                    ['3','fa-shield-halved','Masukkan kode OTP untuk memverifikasi kepemilikan email','var(--success)'],
                    ['4','fa-check-circle','Email akun diperbarui dan langsung aktif','var(--success)'],
                ] as [$n,$ico,$txt,$c])
                <div style="display:flex;align-items:center;gap:12px">
                    <div style="width:26px;height:26px;border-radius:50%;background:rgba(99,102,241,.1);color:var(--primary);display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:800;flex-shrink:0">{{ $n }}</div>
                    <i class="fa {{ $ico }}" style="color:{{ $c }};font-size:14px;flex-shrink:0;width:16px;text-align:center"></i>
                    <span style="font-size:12px;color:var(--text2)">{{ $txt }}</span>
                </div>
                @endforeach
            </div>
        </div>
    </div>

</div>
@endsection

@push('scripts')
<script>
document.getElementById('reqForm')?.addEventListener('submit', function() {
    const btn = document.getElementById('sendBtn');
    btn.disabled = true;
    btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Mengirim...';
});
document.getElementById('otpForm')?.addEventListener('submit', function() {
    const btn = document.getElementById('verifyBtn');
    btn.disabled = true;
    btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Memverifikasi...';
});
</script>
@endpush
