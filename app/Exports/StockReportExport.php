<?php

namespace App\Exports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class StockReportExport implements FromCollection, WithHeadings, WithMapping, WithTitle, ShouldAutoSize
{
    public function collection()
    {
        return Product::with(['category', 'stockRecords.warehouse'])->where('is_active', true)->get();
    }

    public function headings(): array
    {
        return ['SKU', 'Nama Produk', 'Kategori', 'Satuan', 'Total Stok', 'Stok Min', 'Harga Beli', 'Harga Jual', 'Kode Rak', 'Status'];
    }

    public function map($product): array
    {
        $stock = $product->totalStock();
        return [
            $product->sku,
            $product->name,
            $product->category->name ?? '-',
            strtoupper($product->unit),
            $stock,
            $product->min_stock,
            $product->buy_price,
            $product->sell_price,
            $product->shelf_code,
            $stock <= 0 ? 'Habis' : ($stock <= $product->min_stock ? 'Menipis' : 'Aman'),
        ];
    }

    public function title(): string
    {
        return 'Laporan Stok ' . now()->format('d-m-Y');
    }
}
