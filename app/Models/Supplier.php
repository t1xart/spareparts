<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Supplier extends Model
{
    use LogsActivity;

    protected $fillable = ['name', 'code', 'contact_person', 'phone', 'email', 'address', 'city', 'province', 'bank_name', 'bank_account', 'rating', 'is_active'];
    protected $casts = ['is_active' => 'boolean'];

    public function getActivitylogOptions(): LogOptions {
        return LogOptions::defaults()->logFillable();
    }

    public function purchaseOrders() { return $this->hasMany(PurchaseOrder::class); }
}
