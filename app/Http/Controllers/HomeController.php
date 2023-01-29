<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipality;
use App\Models\Bank;
use App\Models\Inventory;
use App\Models\Donor;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{


    function fetchActiveMunicipalities()
    {
        $donors = Donor::select('donors.id AS donor_id', DB::raw('COUNT(donors.id) as donors_count'), 
        'municipalities.latitude AS municipality_latitude', 'municipalities.longitude AS municipality_longitude')
            ->join('municipalities', 'municipalities.id', '=', 'donors.municipality_id')
            ->where('municipalities.status', '1')
            ->groupBy('municipalities.id')
            ->get();

        $municipalities = Municipality::select(
            'id',
            'name',
            'logo',
            'address',
            'latitude',
            'longitude',
            'status',
            'created_at',
            'updated_at',
            'administrator_id'
        )
            ->where('status', '1')
            ->get();

        $banks = Bank::all();
        return view('home', ['municipalities' => $municipalities, 'banks' => $banks, 'donors' => $donors]);
    }

    public function checkCount()
    {
        $inventories = Inventory::select(
            'types.id AS type_id',
            'types.symbol AS type_name',
            DB::raw('COUNT(inventories.id) as count'),
            'donors.municipality_id AS donor_municipality'
        )
            ->join('donors', 'donors.id', '=', 'inventories.donor_id')
            ->join('banks', 'banks.id', '=', 'inventories.bank_id')
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->where('inventories.bank_id', session('bank'))
            ->where('inventories.status', '0')
            ->groupBy('donors.type_id')
            ->get();

        return response()->json(['inventories' => $inventories]);
    }

    public function checkLocation($id)
    {

        $donors = Donor::select(
            'types.symbol',
            DB::raw('COUNT(donors.id) as donors_count'),
            'municipalities.name AS municipality_name',
            'municipalities.latitude AS municipality_latitude',
            'municipalities.longitude AS municipality_longitude'
        )
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->join('municipalities', 'municipalities.id', '=', 'donors.municipality_id')
            ->where('donors.type_id', $id)
            ->groupBy('donors.type_id')
            ->groupBy('donors.municipality_id')
            ->get();

        return response()->json(['donors' => $donors]);
    }
}
