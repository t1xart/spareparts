<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta name="robots" content="noindex, nofollow">
<title>Lupa Password — fajarmotor</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Inter',sans-serif;min-height:100vh;display:flex;background:#f8fafc;-webkit-font-smoothing:antialiased}
.left{flex:1;background:linear-gradient(145deg,#020617 0%,#0f172a 40%,#1e1b4b 75%,#312e81 100%);display:flex;flex-direction:column;justify-content:center;align-items:center;padding:3rem;position:relative;overflow:hidden}
.left::before{content:'';position:absolute;width:500px;height:500px;background:radial-gradient(circle,rgba(99,102,241,.2),transparent 70%);top:-100px;right:-100px;border-radius:50%}
.left::after{content:'';position:absolute;width:300px;height:300px;background:radial-gradient(circle,rgba(139,92,246,.15),transparent 70%);bottom:-50px;left:-50px;border-radius:50%}
.left-content{position:relative;z-index:1;text-align:center;max-width:380px}
.left-logo{width:68px;height:68px;background:linear-gradient(135deg,#6366f1,#818cf8);border-radius:1.25rem;display:flex;align-items:center;justify-content:center;font-size:1.7rem;color:#fff;margin:0 auto 1.5rem;box-shadow:0 8px 32px rgba(99,102,241,.4)}
.left-content h1{color:#f1f5f9;font-size:1.85rem;font-weight:800;margin-bottom:.6rem}
.left-content p{color:#94a3b8;font-size:.88rem;line-height:1.75}
.fi{display:flex;align-items:center;gap:.75rem;color:#cbd5e1;font-size:.82rem;padding:.5rem 0;margin-top:.5rem}
.fi-icon{width:30px;height:30px;background:rgba(99,102,241,.2);border-radius:.45rem;display:flex;align-items:center;justify-content:center;color:#a5b4fc;font-size:.75rem;flex-shrink:0}
.right{width:460px;display:flex;align-items:center;justify-content:center;padding:2.5rem;background:#fff}
.box{width:100%;max-width:380px}
.box h2{font-size:1.45rem;font-weight:800;color:#0f172a;margin-bottom:.3rem}
.box .sub{color:#64748b;font-size:.85rem;margin-bottom:1.75rem;line-height:1.6}
.form-group{margin-bottom:1.1rem}
.form-group label{display:block;font-size:.78rem;font-weight:600;color:#374151;margin-bottom:.4rem}
.input-wrap{position:relative}
.input-icon{position:absolute;left:.9rem;top:50%;transform:translateY(-50%);color:#94a3b8;font-size:.8rem;pointer-events:none}
.input-wrap input{width:100%;padding:.7rem .9rem .7rem 2.5rem;border:1.5px solid #e2e8f0;border-radius:.6rem;font-size:.875rem;font-family:'Inter',sans-serif;color:#0f172a;background:#f8fafc;transition:all .2s;outline:none}
.input-wrap input:focus{border-color:#6366f1;background:#fff;box-shadow:0 0 0 3px rgba(99,102,241,.1)}
.input-wrap:focus-within .input-icon{color:#6366f1}
.btn-submit{width:100%;padding:.78rem;background:linear-gradient(135deg,#6366f1,#4f46e5);color:#fff;border:none;border-radius:.65rem;font-size:.9rem;font-weight:700;font-family:'Inter',sans-serif;cursor:pointer;transition:all .25s;display:flex;align-items:center;justify-content:center;gap:.5rem;margin-top:.5rem}
.btn-submit:hover{transform:translateY(-1px);box-shadow:0 8px 24px rgba(99,102,241,.4)}
.btn-submit:disabled{opacity:.6;cursor:not-allowed;transform:none}
.alert-success{background:#f0fdf4;border:1px solid #bbf7d0;border-radius:.55rem;padding:.75rem 1rem;font-size:.82rem;color:#166534;margin-bottom:1.25rem;display:flex;align-items:center;gap:.5rem}
.alert-error{background:#fef2f2;border:1px solid #fecaca;border-radius:.55rem;padding:.65rem .9rem;font-size:.8rem;color:#991b1b;margin-bottom:1.25rem;display:flex;align-items:center;gap:.5rem}
.back-link{display:flex;align-items:center;justify-content:center;gap:.4rem;margin-top:1.25rem;font-size:.82rem;color:#64748b;text-decoration:none;transition:color .2s}
.back-link:hover{color:#6366f1}
@media(max-width:768px){.left{display:none}.right{width:100%}}
</style>
</head>
<body>
<div class="left">
    <div class="left-content">
        <div class="left-logo"><i class="fa fa-motorcycle"></i></div>
        <h1>fajarmotor</h1>
        <p>Reset password akun Anda dengan mudah dan aman.</p>
        <div class="fi"><div class="fi-icon"><i class="fa fa-envelope"></i></div>Link reset dikirim ke email Anda</div>
        <div class="fi"><div class="fi-icon"><i class="fa fa-clock"></i></div>Link berlaku selama 60 menit</div>
        <div class="fi"><div class="fi-icon"><i class="fa fa-shield-halved"></i></div>Proses aman & terenkripsi</div>
    </div>
</div>
<div class="right">
    <div class="box">
        <h2>Lupa Password? 🔑</h2>
        <p class="sub">Masukkan email Anda dan kami akan mengirimkan link untuk mereset password.</p>

        @if(session('status'))
        <div class="alert-success">
            <i class="fa fa-circle-check"></i>
            {{ session('status') }}
        </div>
        @endif

        @if($errors->any())
        <div class="alert-error">
            <i class="fa fa-circle-exclamation"></i>
            {{ $errors->first() }}
        </div>
        @endif

        <form method="POST" action="{{ route('password.email') }}" id="form">
            @csrf
            <div class="form-group">
                <label for="email">Alamat Email</label>
                <div class="input-wrap">
                    <i class="fa fa-envelope input-icon"></i>
                    <input type="email" id="email" name="email" value="{{ old('email') }}"
                        placeholder="nama@email.com" required autofocus autocomplete="email">
                </div>
            </div>
            <button type="submit" class="btn-submit" id="btn">
                <i class="fa fa-paper-plane"></i> Kirim Link Reset
            </button>
        </form>

        <a href="{{ route('login') }}" class="back-link">
            <i class="fa fa-arrow-left"></i> Kembali ke halaman login
        </a>
    </div>
</div>
<script>
document.getElementById('form').addEventListener('submit', function() {
    const btn = document.getElementById('btn');
    btn.disabled = true;
    btn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Mengirim...';
});
</script>
</body>
</html>
