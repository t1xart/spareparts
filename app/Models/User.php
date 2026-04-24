<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Activitylog\Traits\CausesActivity;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, Notifiable, HasApiTokens, HasRoles, CausesActivity;

    protected $fillable = ['name', 'email', 'password', 'branch_id', 'avatar', 'is_active'];
    protected $hidden = ['password', 'remember_token'];
    protected $casts = ['email_verified_at' => 'datetime', 'is_active' => 'boolean'];

    public function branch() { return $this->belongsTo(Branch::class); }
    public function sales() { return $this->hasMany(Sale::class); }
    public function workOrders() { return $this->hasMany(WorkOrder::class); }
    public function stockMutations() { return $this->hasMany(StockMutation::class); }
}
