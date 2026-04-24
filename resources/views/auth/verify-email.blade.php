<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Verifikasi Email — fajarmotor</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Inter',sans-serif;min-height:100vh;display:flex;align-items:center;justify-content:center;background:linear-gradient(145deg,#020617 0%,#0f172a 50%,#1e1b4b 100%);-webkit-font-smoothing:antialiased}
.card{background:#fff;border-radius:1.25rem;padding:2.5rem;max-width:440px;width:90%;text-align:center;box-shadow:0 32px 80px rgba(0,0,0,.4)}
.icon{width:72px;height:72px;background:linear-gradient(135deg,#6366f1,#818cf8);border-radius:1.25rem;display:flex;align-items:center;justify-content:center;font-size:1.8rem;color:#fff;margin:0 auto 1.5rem;box-shadow:0 8px 24px rgba(99,102,241,.4)}
h2{font-size:1.4rem;font-weight:800;color:#0f172a;margin-bottom:.5rem}
p{color:#64748b;font-size:.88rem;line-height:1.75;margin-bottom:1.5rem}
.email-badge{display:inline-flex;align-items:center;gap:.5rem;background:#ede9fe;border-radius:.5rem;padding:.4rem .9rem;font-size:.82rem;font-weight:600;color:#4f46e5;margin-bottom:1.5rem}
.alert-success{background:#f0fdf4;border:1px solid #bbf7d0;border-radius:.55rem;padding:.75rem 1rem;font-size:.82rem;color:#166534;margin-bottom:1.25rem;display:flex;align-items:center;gap:.5rem}
.btn-resend{width:100%;padding:.75rem;background:linear-gradient(135deg,#6366f1,#4f46e5);color:#fff;border:none;border-radius:.65rem;font-size:.88rem;font-weight:700;font-family:'Inter',sans-serif;cursor:pointer;transition:all .25s;display:flex;align-items:center;justify-content:center;gap:.5rem;margin-bottom:.75rem}
.btn-resend:hover{transform:translateY(-1px);box-shadow:0 8px 24px rgba(99,102,241,.4)}
.btn-resend:disabled{opacity:.6;cursor:not-allowed;transform:none}
.btn-logout{width:100%;padding:.65rem;background:transparent;color:#94a3b8;border:1.5px solid #e2e8f0;border-radius:.65rem;font-size:.85rem;font-weight:600;font-family:'Inter',sans-serif;cursor:pointer;transition:all .25s}
.btn-logout:hover{border-color:#ef4444;color:#ef4444}
.steps{display:flex;flex-direction:column;gap:.6rem;margin-bottom:1.5rem;text-align:left}
.step{display:flex;align-items:center;gap:.75rem;font-size:.82rem;color:#475569}
.step-num{width:24px;height:24px;background:#ede9fe;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:.7rem;font-weight:700;color:#6366f1;flex-shrink:0}
</style>
</head>
<body>
<div class="card">
    <div class="icon"><i class="fa fa-envelope-open-text"></i></div>
    <h2>Verifikasi Email Anda 📧</h2>
    <p>Kami telah mengirimkan link verifikasi ke email Anda. Silakan cek inbox atau folder spam.</p>

    <div class="email-badge">
        <i class="fa fa-envelope"></i>
        {{ auth()->user()?->email }}
    </div>

    @if(session('status'))
    <div class="alert-success">
        <i class="fa fa-circle-check"></i>
        {{ session('status') }}
    </div>
    @endif

    <div class="steps">
        <div class="step"><div class="step-num">1</div>Buka email dari fajarmotor</div>
        <div class="step"><div class="step-num">2</div>Klik tombol "Verifikasi Email"</div>
        <div class="step"><div class="step-num">3</div>Anda akan diarahkan ke dashboard</div>
    </div>

    <form method="POST" action="{{ route('verification.send') }}" id="resendForm">
        @csrf
        <button type="submit" class="btn-resend" id="resendBtn">
            <i class="fa fa-paper-plane"></i> Kirim Ulang Email Verifikasi
        </button>
    </form>

    <form method="POST" action="{{ route('logout') }}">
        @csrf
        <button type="submit" class="btn-logout">
            <i class="fa fa-sign-out-alt" style="margin-right:.4rem"></i>Logout
        </button>
    </form>
</div>
<script>
document.getElementById('resendForm').addEventListener('submit', function() {
    const btn = document.getElementById('resendBtn');
    btn.disabled = true;
    btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Mengirim...';
    setTimeout(() => { btn.disabled = false; btn.innerHTML = '<i class="fa fa-paper-plane"></i> Kirim Ulang Email Verifikasi'; }, 60000);
});
</script>
</body>
</html>
