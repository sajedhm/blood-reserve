<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Donor;
use App\Models\Municipality;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\FromArray;

class DonorsController extends Controller
{

    function uploadDonors(Request $req)
    {
        $validated = $req->validate([
            'excel' => 'required|mimes:xls,xlsx',
            'municipality_id' => 'required'
        ]);

        //Excel::import(new DonorsImport($req), request()->file('excel'));
        $import = new DonorsImport($req);
        Excel::import($import, $req->file('excel'));

        return redirect()->back()->with('success', 'Donors has been uploaded successfully!');
    }

    function fetchDonors()
    {

        $donors = Donor::select(
            'donors.id',
            'donors.donor_name',
            'types.symbol AS blood_type',
            'donors.address',
            'donors.contact',
            'municipalities.name AS municipality',
            'donors.status',
            'donors.created_at',
            'users.surname',
            'users.firstname'
        )
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->join('municipalities', 'municipalities.id', '=', 'donors.municipality_id')
            ->join('users', 'users.id', '=', 'donors.administrator_id')
            ->where('municipalities.status', '1')
            ->get();

        //$donors = Donor::all();
        $municipalities = Municipality::all();

        return view('donors', ['donors' => $donors, 'municipalities' => $municipalities]);
    }


    function fetchBankDonors()
    {
        $donors = Donor::select(
            'donors.id',
            'donors.donor_name',
            'types.symbol AS blood_type',
            'donors.address',
            'donors.contact',
            'municipalities.name AS municipality',
            'donors.created_at',
            'users.surname',
            'users.firstname'
        )
            ->join('users', 'users.id', '=', 'donors.administrator_id')
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->join('banks', 'banks.id', '=', 'donors.bank_id')
            ->join('municipalities', 'municipalities.id', '=', 'donors.municipality_id')
            ->where('municipalities.status', '1')
            ->where('banks.id', session('bank'))
            ->get();

        $municipalities = Municipality::all();

        return view('donors', ['donors' => $donors, 'municipalities' => $municipalities]);
    }

    public function exportDonors()
    {
        return Excel::download(new DonorsExport, 'Donors.xlsx');
    }
}
class DonorsImport implements ToModel, WithHeadingRow
{
    protected $request;
    private $municipalityId;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function model(array $row)
    {
        $blood_type_map = [
            'A+' => 1,
            'A-' => 2,
            'B+' => 3,
            'B-' => 4,
            'O+' => 5,
            'O-' => 6,
            'AB+' => 7,
            'AB-' => 8,
        ];

        $municipalityId = $this->request->input('municipality_id');
        if (session('role') == 0) {
            $bankId = 0;
        } else {
            $bankId = session('bank');
        }

        return new Donor([
            'donor_name' => $row['donor'],
            'type_id' => $blood_type_map[$row['type']],
            'address' => $row['address'],
            'contact' => $row['contact'],
            'municipality_id' => $municipalityId,
            'bank_id' => $bankId,
            'administrator_id' => session('administrator'),
        ]);
    }
}

class DonorsExport implements FromArray
{
    public function array(): array
    {
        return [
            ['DONOR NAME', 'BLOOD TYPE', 'ADDRESS', 'CONTACT'],
            ['John Smith', 'O+', '123 Main St', '555-555-1212'],
            ['Jane Doe', 'A-', '456 Park Ave', '555-555-1213'],
            ['Bob Johnson', 'B+', '789 Fifth St', '555-555-1214'],
        ];
    }
}
