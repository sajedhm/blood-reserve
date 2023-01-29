<?php

namespace App\Imports;

use App\Models\Donor;
use Maatwebsite\Excel\Concerns\ToModel;

class DonorsImporter implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {

        return new Donor([
            "donor_name" => $row['donor_name'],
            "type_id" => $row['type_id'],
            "address" => $row['address'],
            "contact" => $row['contact'],
            "administrator_id" => 1, // User Type User
            "municipality_id" => 1
        ]);
    }
}
