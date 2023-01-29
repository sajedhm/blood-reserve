@include('includes/header')
@include('includes/modal_patients')
<style>
    .box-style {
        background-color: white;
        padding: 5px;
        box-shadow: 0 0 9px 5px #00000096;
    }

    .file-chooser {
        margin-top: 5px;
    }
</style>

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
                            <h1>Patients</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                                <li class="breadcrumb-item active">Patients</li>
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
                                <a href="#add" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i
                                        class="fas fa-plus"></i> New</a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Patient No.</th>
                                            <th>Blood Type</th>
                                            <th>Last Name</th>
                                            <th>First Name</th>
                                            <th>Middle Name</th>
                                            <th>Status</th>
                                            <th>Request Date</th>
                                            <th>Tools</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        @foreach ($patients as $patient)
                                            <tr>
                                                <td>{{ $patient['id'] }}</td>
                                                <td>{{ $patient['type_name'] }}</td>
                                                <td>{{ $patient['surname'] }}</td>
                                                <td>{{ $patient['firstname'] }}</td>
                                                <td>{{ $patient['middlename'] }}</td>
                                                <!--<td><img src="{{ asset('images/patients/' . $patient['photo']) }}"
                                                        style="width:80px;height:80px;" alt="Patient Photo"></td>
                                                <td>{{ $patient['contact'] }}</td>
                                                <td>{{ $patient['email'] }}</td> -->
                                                <td><?php
                                                    if($patient['status'] == 0){
                                                        ?>
                                                    <center><span class="badge bg-green">NEW</span></center>
                                                    <?php

                                                    }else if($patient['status'] == 1){
                                                        ?>
                                                    <center><span class="badge bg-yellow">RELEASED</span></center>
                                                    <?php
                                                    }
                                                ?>
                                                </td>
                                                <td>{{ date('M d, Y h:i:s a', strtotime($patient['created_at'])) }}
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-sm view"
                                                        data-id="{{ $patient['id'] }}"><i class="fas fa-search"></i>
                                                        View Patient</button>

                                                    <?php
                                                    if($patient['status'] == 0){
                                                        ?>
                                                    <button type="button" class="btn btn-danger btn-sm release"
                                                        data-id="{{ $patient['id'] }}"
                                                        data-name="{{ $patient['surname'] . ', ' . $patient['firstname'] . ' ' . $patient['middlename'] }}"
                                                        data-type="{{ $patient['type_name'] }}"><i
                                                            class="fa-solid fa-kit-medical"></i>
                                                        Release Blood Bag</button>

                                                    <?php
                                                    }
                                                ?>
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

    <script>
        $(function() {
            var table = $('#example2').DataTable();

            $('#example1 tbody').on("click", ".release", function() {
                $('#release').modal('show');

                var patient_id = $(this).data('id');
                var patient_type = $(this).data('type');
                var patient_name = $(this).data('name');


                var table = $('#example2').DataTable();
                table.rows().every(function() {
                    var donor_type = this.data();
                    if (donor_type[3] != patient_type) {
                        $(this.node()).hide();
                    }
                });
                table.draw();

                $('#selected_patient_id').val(patient_id);
                $('#patient_name').val(patient_name);
                $('#patient_type').val(patient_type);

            });

            $('#release').on('hidden.bs.modal', function(e) {
                var table = $('#example2').DataTable();
                table.rows().every(function() {
                    $(this.node()).show();
                });
                table.draw();
            });


            $('#example2 tbody').on("click", ".delete", function() {
                $('#delete').modal('show');
                var id = $(this).data('id');

                $('#delete_id').val(id);
            });
        });
    </script>

    <script>
        function setValue(value) {
            console.log(value);
            var selected_type_id = document.getElementById('selected_type_id');
            var selected_inventory_id = document.getElementById('selected_inventory_id');

            selected_type_id.value = JSON.parse(value).type_id;
            selected_inventory_id.value = JSON.parse(value).inventory_id;
            $('#donor_name').val(JSON.parse(value).donor_name);
            $('#donor_type').val(JSON.parse(value).blood_type);
            $('#inventory_expiration').val(JSON.parse(value).expiration_date);
            $("#collapseTwo").collapse("toggle");
        }
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
