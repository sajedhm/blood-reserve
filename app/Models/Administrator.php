<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable;



class Administrator extends Model implements Authenticatable
{
    protected $table = 'administrators';

    use HasFactory;
    use \Illuminate\Auth\Authenticatable;

    //protected $table = 'administrators';
    
}
