<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Bank;

class InventoriesController extends Controller
{
    function fetchBanks(){
        $banks = Bank::all();
        return view('inventories', ['banks'=>$banks]);
    }


}
