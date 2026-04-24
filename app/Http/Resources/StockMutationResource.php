<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StockMutationResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id'              => $this->id,
            'product'         => ['id' => $this->product_id, 'name' => $this->product?->name, 'sku' => $this->product?->sku],
            'warehouse'       => ['id' => $this->warehouse_id, 'name' => $this->warehouse?->name],
            'type'            => $this->type,
            'quantity'        => $this->quantity,
            'quantity_before' => $this->quantity_before,
            'quantity_after'  => $this->quantity_after,
            'notes'           => $this->notes,
            'user'            => $this->user?->name,
            'created_at'      => $this->created_at?->toISOString(),
        ];
    }
}
