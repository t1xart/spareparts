<!DOCTYPE html>
<html lang="id">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Kode OTP — FajarMotor</title></head>
<body style="margin:0;padding:0;background:#f1f5f9;font-family:'Inter',Arial,sans-serif">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#f1f5f9;padding:40px 20px">
  <tr><td align="center">
    <table width="520" cellpadding="0" cellspacing="0" style="background:#fff;border-radius:16px;overflow:hidden;box-shadow:0 4px 24px rgba(0,0,0,.08)">

      {{-- Header --}}
      <tr><td style="background:linear-gradient(135deg,#0f172a,#1e1b4b);padding:32px;text-align:center">
        <div style="width:52px;height:52px;background:linear-gradient(135deg,#6366f1,#818cf8);border-radius:14px;display:inline-flex;align-items:center;justify-content:center;margin-bottom:14px">
          <span style="font-size:24px">🏍️</span>
        </div>
        <div style="color:#f1f5f9;font-size:20px;font-weight:800;letter-spacing:.5px">FajarMotor</div>
        <div style="color:#64748b;font-size:12px;margin-top:4px">Workshop Management System</div>
      </td></tr>

      {{-- Body --}}
      <tr><td style="padding:36px 40px">
        <p style="color:#0f172a;font-size:16px;font-weight:700;margin:0 0 8px">Halo, {{ $userName }} 👋</p>
        <p style="color:#64748b;font-size:14px;line-height:1.7;margin:0 0 28px">
          Anda meminta perubahan email akun ke <strong style="color:#0f172a">{{ $newEmail }}</strong>.<br>
          Gunakan kode OTP berikut untuk mengkonfirmasi perubahan:
        </p>

        {{-- OTP Box --}}
        <div style="background:#f8fafc;border:2px dashed #e2e8f0;border-radius:12px;padding:28px;text-align:center;margin-bottom:28px">
          <div style="font-size:11px;font-weight:700;color:#94a3b8;letter-spacing:3px;text-transform:uppercase;margin-bottom:12px">Kode OTP Anda</div>
          <div style="font-size:42px;font-weight:900;letter-spacing:12px;color:#6366f1;font-family:monospace">{{ $otp }}</div>
          <div style="font-size:12px;color:#94a3b8;margin-top:12px">
            <span style="background:#fef3c7;color:#92400e;padding:3px 10px;border-radius:20px;font-weight:600">⏱ Berlaku 10 menit</span>
          </div>
        </div>

        <div style="background:#fef2f2;border:1px solid #fecaca;border-radius:10px;padding:14px 18px;margin-bottom:24px">
          <p style="color:#991b1b;font-size:13px;margin:0;font-weight:600">⚠️ Peringatan Keamanan</p>
          <p style="color:#b91c1c;font-size:12px;margin:6px 0 0;line-height:1.6">
            Jangan bagikan kode ini kepada siapapun. Tim FajarMotor tidak pernah meminta kode OTP Anda.
            Jika Anda tidak meminta perubahan ini, abaikan email ini.
          </p>
        </div>

        <p style="color:#94a3b8;font-size:12px;line-height:1.7;margin:0">
          Kode ini hanya berlaku untuk perubahan email ke <strong>{{ $newEmail }}</strong> dan akan kedaluwarsa dalam 10 menit.
        </p>
      </td></tr>

      {{-- Footer --}}
      <tr><td style="background:#f8fafc;border-top:1px solid #e2e8f0;padding:20px 40px;text-align:center">
        <p style="color:#94a3b8;font-size:11px;margin:0">© {{ date('Y') }} FajarMotor — Jambi Handil. All rights reserved.</p>
      </td></tr>

    </table>
  </td></tr>
</table>
</body>
</html>
