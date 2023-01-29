@include('includes/header')


<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="images/blood-reserve-logo.png" alt="Blood Reserve Logo" height="180"
                width="180">
        </div>

        @include('includes/navbar')
        @include('includes/menubar')

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Inventory</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                                <li class="breadcrumb-item active">Inventory</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">

                @if ($errors->any())
                    <div class='alert alert-danger alert-dismissible'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        <h4><i class='icon fa fa-warning'></i> Error!</h4>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                @if (session()->has('success'))
                    <div class='alert alert-success alert-dismissible'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        <h4><i class='icon fa fa-check'></i> Success!</h4>
                        <ul>
                            {{ session()->get('success') }}
                        </ul>
                    </div>
                @endif

                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">

                        <div class="card" style="width:100%;">
                            <div class="card-header">
                                {{-- <a href="#add" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fas fa-plus"></i> New</a> --}}

                                <?php 
                                if(session('role') == 0){ // admin
                                 ?>

                                <?php   
                                } 
                                else{                       // blood bank admin
                                ?>
                                <a href="#transfer" data-toggle="modal" class="btn btn-outline-primary btn-sm"
                                    style="margin-bottom:10px;"><i class="fas fa-plus"></i> New</a>
                                <?php
                                }
                                ?>

                                <div class="row">
                                    {{-- Blood Type Card --}}
                                    @foreach ($types as $type)
                                        <div class="col-12 col-sm-6 col-md-3">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-green elevation-1">
                                                    @if ($type->symbol == 'AB+')
                                                        <img src="images/ABplus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'AB-')
                                                        <img src="images/Aminus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'A-')
                                                        <img src="images/Aminus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'A+')
                                                        <img src="images/ABminus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'B-')
                                                        <img src="images/Bminus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'B+')
                                                        <img src="images/Bminus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'O-')
                                                        <img src="images/Ominus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @elseif ($type->symbol == 'O+')
                                                        <img src="images/Ominus-removebg-preview.png"
                                                            style="padding:5px;">
                                                    @endif

                                                </span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">{{ $type['symbol'] }}</span>
                                                    <span class="info-box-number">
                                                        {{ $type['inventory_count'] }}
                                                        <small>bags</small>
                                                    </span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>
                                        <!-- /.col -->
                                    @endforeach
                                    {{-- Blood Type Card --}}
                                </div>


                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Donor No.</th>
                                            <th>Donor Name</th>
                                            <th>Status/Evaluation</th>
                                            <th>Expiration</th>
                                            <th>Receiving Date</th>
                                            <th>Updated by</th>
                                            <th>Tools</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        @foreach ($inventories as $inventory)
                                            <tr>
                                                <td>{{ $inventory['inventory_id'] }}</td>
                                                <td>{{ $inventory['donor_id'] }}</td>
                                                <td>{{ ucwords($inventory['donor_name']) }}
                                                </td>

                                                <td>{{ $inventory['evaluation_name'] }}</td>
                                                <td>{{ $inventory['expired_at'] }}</td>
                                                <td>{{ $inventory['donated_at'] }}</td>
                                                <td>{{ $inventory['administrator_id'] }}</td>
                                                <td <button type="button" class="btn btn-outline-info evaluate btn-sm"
                                                    data-inventory="{{ $inventory['inventory_id'] }}"
                                                    data-evaluation="{{ $inventory['evaluation_id'] }}"><i
                                                        class="fas fa-edit"></i>
                                                    Evaluate</button>

                                                </td>
                                            </tr>
                                        @endforeach

                                    </tbody>
                                    <tfoot>

                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

            </section>
            <!-- right col -->
        </div>
        <!-- /.row (main row) -->
    </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    @include('includes/footer')

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    @include('includes/scripts')
    @include('includes/modal_inventory')

    <script>
        var stepper;
        document.addEventListener('DOMContentLoaded', function() {
            stepper = new Stepper(document.querySelector('#stepper1'));
            $("#transfer").on("shown.bs.modal", function() {
                stepper.to(1);
            });
        });
    </script>

    <script>
        function setValue(value) {
            var donor = document.getElementById("donor");
            //var donor_name = document.getElementById("donor_name");

            value = JSON.parse(value);

            donor.value = value['id'];

            document.getElementById('donor_name').innerHTML = value['donor_name'];
            document.getElementById('blood_type').innerHTML = value['blood_type'];
            var type_image = document.getElementById("type_image");

            switch (value['blood_type']) {
                case "A+":
                    type_image.src = "images/Aplus.png";
                    break;
                case "A-":
                    type_image.src = "images/Aminus.png";
                    break;
                case "B+":
                    type_image.src = "images/Bplus.png";
                    break;
                case "B-":
                    type_image.src = "images/Bminus.png";
                    break;
                case "AB+":
                    type_image.src = "images/ABplus.png";
                    break;
                case "AB-":
                    type_image.src = "images/ABminus.png";
                    break;
                case "O+":
                    type_image.src = "images/Oplus.png";
                    break;
                case "O-":
                    type_image.src = "images/O-.png";
                    break;
            }

            stepper.next();

        }
    </script>

    <script>
        function showDates() {
            var date_donated = document.getElementById("donated_at").value;
            var expiration_date = document.getElementById("expired_at").value;
            document.getElementById('ddonated_at').innerHTML = date_donated;
            document.getElementById('dexpired_at').innerHTML = expiration_date;
            stepper.next();

        }
    </script>

    <script>
        //Date picker
        $('#datedonatedpicker').datetimepicker({
            format: 'L'
        });

        $('#expirationdatepicker').datetimepicker({
            format: 'L'
        });
    </script>

    <script>
        $(function() {

            $('#example1 tbody').on("click", ".evaluate", function() {
                $('#evaluate').modal('show');

                var inventory = $(this).data('inventory');
                var evaluation = $(this).data('evaluation');

                console.log("ID:" + inventory);
                console.log("EVALUATION ID:" + evaluation);

                $('#edit_id').val(inventory);
                $('#edit_evaluation_id').val(evaluation).change();
                // $('#edit_surname').val(surname);
                // $('#edit_bank').val(bank).change();
                // $('#edit_email').val(email);
                // $('#edit_contact').val(contact);
                // $('#edit_status').val(status).change();
            });


        });
    </script>

<script>
    var intervalId = setInterval(function() {
        $.ajax({
            url: '/blood-reserve/public/inventories-count',
            type: 'GET',
            success: function(data) {
                $.each(data, function(index, element) {
                    $.each(element, function(index, element2) {

                        if (element2.count < 5) {

                            var highest_donor_count = 0;
                            var recommended_municipality_id = 0;
                            var recommended_municipality_name = 0;
                            var recommended_municipality_latitude = 0;
                            var recommended_municipality_longitude = 0;
                            console.log('BLOOD TYPE: ' + element2.type_name);
                            console.log('QTY: ' + element2.count);
                            console.log("BLOOD BAG IS LOW!");
                            
                            $.ajax({
                                url: '/blood-reserve/public/maps-recommender/' + element2.type_id,
                                type: "GET",
                                success: function(data2) {
                                    $.each(data2, function(index3, element3) {

                                        $.each(element3, function(index4, element4) {

                                            if(element4.donors_count > highest_donor_count){
                                                recommended_municipality_id = element4.municipality_id;
                                                recommended_municipality_name = element4.municipality_name;
                                                recommended_municipality_latitude = element4.municipality_latitude;
                                                recommended_municipality_longitude = element4.municipality_longitude;
                                                //console.log('Recommended Location is ' + element4.municipality_name);
                                                
                                                // ----------------------------------------

                                            }

                                            
                                                
                                                
                                        });
                                         

                                        console.log('Recommended Location is ' + recommended_municipality_name);
                                        clearInterval(intervalId);    
                                    });
                                }
                            });

                        }

                    });
                });
            }
        });
    }, 5000);
</script>


</body>


</html>
