<?php

namespace App\filter;

use Illuminate\Database\Eloquent\Builder;
use Spatie\QueryBuilder\AllowedFilter;

// this class i created from my self to organizing my code ..

class PostFilter
{
    public function filter()
    {
        return [
            'content',
            'price',
            'worker.name',

            AllowedFilter::callback('item', function (Builder $query, $value) {

                $query->where('price', 'like', "%{$value}%")
                    ->orWhere('content', 'like', "%{$value}%")

                    ->orWhereHas('worker', function (Builder $query) use ($value) {
                        $query->where('name', 'like', "%{$value}%");
                    });
            })
        ];
    }
}
