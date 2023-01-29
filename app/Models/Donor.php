<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Donor extends Model
{

    use HasFactory;
    protected $fillable = [
        'donor_name',
        'type_id',
        'address',
        'contact',
        'municipality_id',
        'administrator_id',
        'bank_id'
        // other fillable attributes
    ];
}
