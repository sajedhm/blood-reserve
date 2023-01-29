<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Inventory;
use App\Models\Type;
use App\Models\Donor;
use App\Models\Evaluation;

class InventoryController extends Controller
{
    // GET ALL BANK INVENTORY ITEMS
    function fetchInventory(Request $req)
    {

        $inventory_types = Inventory::selectRaw('types.symbol as symbol, count(inventories.id) as inventory_count')
            ->join('types', 'types.id', '=', 'inventories.type_id')
            ->groupBy('inventories.type_id')
            ->get();

        $inventories = Inventory::select('donors.donor_name', 'inventories.expired_at', 'inventories.donated_at', 'inventories.administrator_id')
            ->join('banks', 'banks.id', '=', 'inventories.bank_id')
            ->join('donors', 'donors.id', '=', "inventories.donor_id")
            ->where('inventories.bank_id', $req->bank_id)->get();

        $donors = Donor::select('donors.id', 'donors.donor_name', 'types.symbol AS blood_type', 'donors.status', 'donors.created_at')
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->join('banks', 'banks.id', '=', 'donors.bank_id')
            ->where('banks.id', session('bank'))
            ->get();



        return view('inventory', ['types' => $inventory_types, 'inventories' => $inventories, 'donors' => $donors]);
    }
    // GET ALL BANK INVENTORY ITEMS

    // GET BANK INVENTORY ITEMS
    function fetchBankInventory()
    {
        $evaluations = Evaluation::all();

        $inventory_types = Inventory::selectRaw('types.symbol as symbol, count(inventories.id) as inventory_count')
            ->join('donors', 'donors.id', '=', 'inventories.donor_id')
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->groupBy('donors.type_id')
            ->get();

        $inventories = Inventory::select(
            'inventories.id AS inventory_id',
            'donors.id AS donor_id',
            'donors.donor_name',
            'inventories.expired_at',
            'inventories.donated_at',
            'inventories.administrator_id',
            'evaluations.id AS evaluation_id',
            'evaluations.name AS evaluation_name'
        )
            ->join('banks', 'banks.id', '=', 'inventories.bank_id')
            ->join('donors', 'donors.id', '=', "inventories.donor_id")
            ->join('evaluations', 'evaluations.id', '=', 'inventories.evaluation_id')
            ->where('inventories.bank_id', session('bank'))->get();

        $donors = Donor::select(
            'donors.id',
            'donors.donor_name',
            'types.symbol AS blood_type',
            'donors.status',
            'donors.created_at'
        )
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->join('banks', 'banks.id', '=', 'donors.bank_id')
            ->where('banks.id', session('bank'))
            ->where('donors.status', 0)
            ->get();

        return view('inventory', ['types' => $inventory_types, 'inventories' => $inventories, 'donors' => $donors, 'evaluations' => $evaluations]);
    }
    // GET BANK INVENTORY ITEMS

    // SAVE BLOOD BAG TO BANK
    function saveBloodBag(Request $req)
    {

        $validated = $req->validate([
            'donor' => 'required',
            'donated_at' => 'required',
            'expired_at' => 'required'
        ]);

        if (!$validated) {
            return redirect('inventory');
        }


        $donor = Donor::find($req->donor);
        $donor->status = 1;
        $donor->save();

        $bloodbag = new Inventory;
        $bloodbag->bank_id = session('bank');
        $bloodbag->donor_id = $req->donor;
        $bloodbag->donated_at = date('Y/m/d', strtotime($req->donated_at));
        $bloodbag->expired_at = date('Y/m/d', strtotime($req->expired_at));
        $bloodbag->evaluation_id = 1;
        $bloodbag->administrator_id = session('administrator');
        $bloodbag->save();

        return redirect()->back()->with('success', 'Blood bag has been added to inventory!');
    }
    // SAVE BLOOD BAG TO BANK

    // EVALUATE BLOOD BAG TO BANK
    function updateBloodBag(Request $req)
    {

        $validated = $req->validate([
            'inventory' => 'required',
            'evaluation' => 'required',
        ]);

        if (!$validated) {
            return redirect('inventory');
        }

        // $bloodbag = Inventory::find($req->donor);
        // if (is_null($bloodbag)) {
        //     return redirect()->back()->withErrors([
        //         'message' => 'Failed!',
        //     ]);
        // } 
        // else{
        //     return redirect()->back()->with('success',  $req->donor . ' - ' . $req->evaluation);
        // }

        $bloodbag = Inventory::find($req->inventory);
        $bloodbag->evaluation_id = $req->evaluation;

        if ($bloodbag->save()) {
            return redirect()->back()->with('success',  'Blood bag has been evaluated successfully!');
        } else {
            return redirect()->back()->withErrors([
                'message' => 'Blood bag evaluation failed!',
            ]);
        }

        //return redirect()->back()->with('success',  $req->donor . ' - ' . $req->evaluation);
    }
    // EVALUATE BLOOD BAG TO BANK




}
