<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use App\Models\Product;
use App\Models\Sale;
use App\Policies\ProductPolicy;
use App\Policies\SalePolicy;

class AuthServiceProvider extends ServiceProvider
{
    protected $policies = [
        Product::class => ProductPolicy::class,
        Sale::class    => SalePolicy::class,
    ];

    public function boot(): void
    {
        $this->registerPolicies();
    }
}
