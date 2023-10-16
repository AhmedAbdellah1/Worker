<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostPhoto extends Model
{
    use HasFactory;
    protected $guarded = [];

    // Specify the custom table name
    protected $table = 'post_photos';
}
