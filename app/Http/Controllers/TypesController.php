<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Type;

class TypesController extends Controller
{
    // GET TYPES
    function fetchTypes(){
        
        $types = Type::all();
        return view('types', ['types'=>$types]);

    }
    // GET TYPES
}
