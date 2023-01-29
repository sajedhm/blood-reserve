<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use Illuminate\Http\Request;
use App\Models\Patient;
use App\Models\Type;
use Intervention\Image\Facades\Image;

class PatientController extends Controller
{

    // GET PATIENTS
    function fetchPatients()
    {

        $patients = Patient::all();
        $types = Type::all();

        return view('patients', ['patients' => $patients, 'types' => $types]);
    }
    // GET PATIENTS

    // GET BANK INVENTORY ITEMS
    function fetchBankPatients()
    {
        $types = Type::all();

        //SELECT `id`, `surname`, `firstname`, `middlename`, `photo`, `type_id`, `bank_id`, `inventory_id`, `address`, `contact`, `email`, 
        //`guardian`, `guardian_relationship`, `status`, `created_at`, `updated_at`, `administrator_id` FROM `patients` WHERE 1

        $patients = Patient::select(
            'patients.id AS id',
            'patients.surname',
            'patients.firstname',
            'patients.middlename',
            'patients.photo',
            'types.id AS type_id',
            'types.symbol AS type_name',
            'banks.id AS bank_id',
            'banks.name AS bank_name',
            'patients.address',
            'patients.contact',
            'patients.email',
            'patients.guardian',
            'patients.guardian_relationship',
            'patients.status',
            'patients.created_at',
            'patients.updated_at',
            'users.surname AS administrator_surname',
            'users.firstname AS administrator_firstname'
        )
            ->join('types', 'types.id', '=', 'patients.type_id')
            ->join('banks', 'banks.id', '=', 'patients.bank_id')
            ->join('users', 'users.id', '=', 'patients.administrator_id')->get();


        $inventories = Inventory::select(
            'inventories.id AS inventory_id',
            'inventories.expired_at AS expiration_date',
            'donors.id AS donor_id',
            'donors.donor_name',
            'donors.type_id',
            'types.symbol AS blood_type',
            'donors.address',
            'donors.contact',
            'municipalities.name AS municipality',
            'donors.created_at',
            'users.surname',
            'users.firstname'
        )
            ->join('donors', 'donors.id', '=', 'inventories.donor_id')
            ->join('users', 'users.id', '=', 'donors.administrator_id')
            ->join('types', 'types.id', '=', 'donors.type_id')
            ->join('banks', 'banks.id', '=', 'donors.bank_id')
            ->join('municipalities', 'municipalities.id', '=', 'donors.municipality_id')
            ->where('municipalities.status', '1')
            ->where('banks.id', session('bank'))
            ->where('inventories.status', '0')
            ->get();



        return view('patients', ['types' => $types, 'patients' => $patients, 'inventories' => $inventories]);
    }
    // GET BANK INVENTORY ITEMS

    // SAVE PATIENT
    function savePatient(Request $req)
    {

        $validated = $req->validate([
            'photo' => 'required',
            'lastname' => 'required',
            'firstname' => 'required',
            'middlename' => 'required',
            'address' => 'required',
            'contact' => 'required',
            'email' => 'required',
            'type' => 'required',
            'glastname' => 'required',
            'gfirstname' => 'required',
            'gmiddlename' => 'required',
            'grelationship' => 'required'
        ]);

        if (!$validated) {
            return redirect('patients');
        }

        $photo = $req->file('photo');
        $photo_name = uniqid() . '.' . $photo->getClientOriginalExtension();

        $thumbnail = Image::make($photo)->save(public_path('images/patients/' . $photo_name));

        $patient = new Patient;
        $patient->surname = $req->lastname;
        $patient->firstname = $req->firstname;
        $patient->middlename = $req->middlename;
        $patient->photo = $photo_name;
        $patient->address = $req->address;
        $patient->contact = $req->contact;
        $patient->email = $req->email;
        $patient->guardian = $req->glastname . ', ' . $req->gfirstname . ' ' . $req->gmiddlename;
        $patient->guardian_relationship = $req->grelationship;
        $patient->type_id = $req->type;
        $patient->bank_id = session('bank');
        $patient->administrator_id = session('administrator');
        $patient->save();
        //$municipality->latitude=$req->latitude;
        //$municipality->longitude=$req->longitude;
        //$municipality->status="1";
        //$municipality->administrator_id="1";
        //$municipality->save();

        //return redirect('municipalities');
        return redirect()->back()->with('success', 'Patient has been added successfully!');
    }
    // SAVE PATIENT


    // DELETE PATIENT
    function deletePatient(Request $req)
    {
        $validated = $req->validate([
            'id' => 'required',
        ]);

        if (!$validated) {
            return redirect('patients');
        }

        $data = Patient::find($req->id);
        $data->delete();

        //return redirect('municipalities');
        return redirect()->back()->with('success', 'Patient has been deleted successfully!');
    }
    // DELETE PATIENT


    // UPDATE PATIENT
    function updateMunicipality(Request $req)
    {

        $validated = $req->validate([
            'name' => 'required|max:255',
            'latitude' => 'required',
            'longitude' => 'required',
            'status' => 'required',
        ]);

        if (!$validated) {
            return redirect('municipalities');
        }

        $data = Patient::find($req->id);
        $data->name = $req->name;
        $data->latitude = $req->latitude;
        $data->longitude = $req->longitude;
        $data->status = $req->status;
        $data->administrator_id = "1";
        $data->save();

        //return redirect('municipalities');
        return redirect()->back()->with('success', 'Patient has been updated successfully!');
    }
    // UPDATE PATIENT


    // RELEASE BLOOD BAG
    function releaseBloodBag(Request $req){
        $validated = $req->validate([
            'patient_id' => 'required',
            'inventory_id' => 'required',

        ]);

        $inventory = Inventory::find($req->inventory_id);
        $inventory->patient_id = $req->patient_id;
        $inventory->status = 1;
        $inventory->save();
        return redirect()->back()->with('success', 'Blood bag has been released! successfully!');
    }
    // RELEASE BLOOD BAG
}
