@include('includes/header')
@include('includes/modal_donors')

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="images/blood-reserve-logo.png" alt="Blood Reserve Logo" height="60"
                width="60">
        </div>

        @include('includes/navbar')
        @include('includes/menubar')

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Donors</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                                <li class="breadcrumb-item active">Donors</li>
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
                                <a href="#upload" data-toggle="modal" class="btn btn-outline-dark btn-sm"><i
                                        class="fas fa-upload"></i> Upload</a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Donor No.</th>
                                            <th>Donor Name</th>
                                            <th>Blood Type</th>
                                            <th>Address</th>
                                            <th>Contact</th>
                                            <th>Municipality</th>
                                            <th>Status</th>
                                            <th>Date Uploaded</th>
                                            <th>Uploaded By</th>
                                        </tr>


                                    </thead>
                                    <tbody>
                                        @foreach ($donors as $donor)
                                            <tr>
                                                <td>{{ $donor['id'] }}</td>
                                                <td>{{ $donor['donor_name'] }}</td>
                                                <td>{{ $donor['blood_type'] }}</td>
                                                <td>{{ $donor['address'] }}</td>
                                                <td>{{ $donor['contact'] }}</td>
                                                <td>{{ $donor['municipality'] }}</td>
                                                <td><?php
                                                    if($donor['status'] == 0){
                                                        ?>
                                                    <center><span class="badge bg-green">NEW</span></center>
                                                    <?php
                  
                                                    }else{
                                                        ?>
                                                    <center><span class="badge bg-yellow">TRANSFFERED</span></center>
                                                    <?php
                                                    }
                                                ?>
                                                </td>
                                                <td>{{ $donor['created_at'] }}</td>
                                                <td>{{ $donor['surname'] . ',' . $donor['firstname'] }}</td>

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

</body>

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

</html>
