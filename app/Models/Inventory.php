<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'bank_id',
        'donor_id',
        'evaluation_id',
        'donated_at',
        'expired_at',
        'created_at',
        'updated_at',
        'administrator_id',
        // other fillable attributes
    ];

   
}
