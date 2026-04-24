<?php

namespace App\Http\Controllers;

use App\Models\{Product, Sale, WorkOrder, PurchaseOrder};
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        return view('dashboard');
    }

    public function data()
    {
        $stats = [
            'total_products' => Product::where('is_active', true)->count(),
            'low_stock'      => Product::where('is_active', true)
                ->where('min_stock', '>', 0)
                ->whereHas('stockRecords', fn($q) => $q->whereColumn('quantity', '<=', DB::raw('products.min_stock')))
                ->count(),
            'sales_today'    => (float) Sale::whereDate('created_at', today())->where('status', 'paid')->sum('total'),
            'sales_month'    => (float) Sale::whereMonth('created_at', now()->month)->whereYear('created_at', now()->year)->where('status', 'paid')->sum('total'),
            'sales_year'     => (float) Sale::whereYear('created_at', now()->year)->where('status', 'paid')->sum('total'),
            'pending_po'     => PurchaseOrder::whereIn('status', ['draft', 'sent'])->count(),
            'pending_wo'     => WorkOrder::whereIn('status', ['pending', 'in_progress'])->count(),
        ];

        $recent_sales = Sale::with('user')
            ->latest()
            ->limit(5)
            ->get()
            ->map(fn($s) => [
                'id'             => $s->id,
                'invoice_number' => $s->invoice_number,
                'customer'       => $s->customer_name ?: 'Umum',
                'total'          => (float) $s->total,
                'cashier'        => $s->user?->name,
                'time_ago'       => $s->created_at->diffForHumans(),
            ]);

        // Exclude soft-deleted products and products where both stock=0 and min_stock=0
        $low_stock_products = DB::table('products')
            ->select(
                'products.id',
                'products.sku',
                'products.name',
                'products.min_stock',
                'categories.name as category_name',
                DB::raw('COALESCE(SUM(stock_records.quantity), 0) as total_stock')
            )
            ->leftJoin('stock_records', 'products.id', '=', 'stock_records.product_id')
            ->leftJoin('categories', 'products.category_id', '=', 'categories.id')
            ->where('products.is_active', true)
            ->where('products.min_stock', '>', 0)
            ->whereNull('products.deleted_at')
            ->groupBy('products.id', 'products.sku', 'products.name', 'products.min_stock', 'categories.name')
            ->havingRaw('COALESCE(SUM(stock_records.quantity), 0) <= products.min_stock')
            ->orderByRaw('COALESCE(SUM(stock_records.quantity), 0) ASC')
            ->limit(10)
            ->get()
            ->map(fn($p) => [
                'id'          => $p->id,
                'sku'         => $p->sku,
                'name'        => $p->name,
                'total_stock' => (int) $p->total_stock,
                'min_stock'   => $p->min_stock,
                'category'    => $p->category_name,
            ]);

        return response()->json([
            'stats'              => $stats,
            'recent_sales'       => $recent_sales,
            'low_stock_products' => $low_stock_products,
        ]);
    }
}
