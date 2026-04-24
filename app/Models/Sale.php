<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Sale extends Model
{
    use LogsActivity, SoftDeletes;

    protected $fillable = ['invoice_number', 'branch_id', 'customer_name', 'customer_phone', 'payment_method', 'subtotal', 'discount', 'tax', 'total', 'paid_amount', 'change_amount', 'status', 'notes', 'user_id'];
    protected $casts = ['subtotal' => 'decimal:2', 'discount' => 'decimal:2', 'tax' => 'decimal:2', 'total' => 'decimal:2', 'paid_amount' => 'decimal:2', 'change_amount' => 'decimal:2'];

    public function getActivitylogOptions(): LogOptions {
        return LogOptions::defaults()->logFillable();
    }

    public function branch() { return $this->belongsTo(Branch::class); }
    public function user() { return $this->belongsTo(User::class); }
    public function items() { return $this->hasMany(SaleItem::class); }
    public function stockMutations() { return $this->morphMany(StockMutation::class, 'reference'); }
}
