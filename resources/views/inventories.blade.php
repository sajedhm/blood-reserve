@include('includes/header')
@include('includes/modal_banks')

<style>
    @import url('https://fonts.googleapis.com/css?family=Heebo:400,700|Open+Sans:400,700');

    :root {
        --color: #3c3163;
        --transition-time: 0.5s;
    }

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        font-family: 'Open Sans';
        background: #fafafa;
    }

    a {
        color: inherit;
    }

    .cards-wrapper {
        display: grid;
        justify-content: center;
        align-items: center;
        grid-template-columns: 1fr 1fr 1fr;
        grid-gap: 4rem;
        padding: 4rem;
        margin: 0 auto;
        width: max-content;
    }

    .boxx {
        font-family: 'Heebo';
        --bg-filter-opacity: 0.5;
        background-image: linear-gradient(rgba(0, 0, 0, var(--bg-filter-opacity)), rgba(0, 0, 0, var(--bg-filter-opacity))), var(--bg-img);
        height: 20em;
        width: 16em;
        font-size: 1.2em;
        color: white;
        border-radius: 1em;
        padding: 1em;
        /*margin: 2em;*/
        display: flex;
        align-items: flex-end;
        background-size: cover;
        background-position: center;
        box-shadow: 0 0 5em -1em #fff;
        transition: all, var(--transition-time);
        position: relative;
        overflow: hidden;
        border: 3px solid #ccc;
        text-decoration: none;
    }

    .boxx:hover {
        transform: rotate(0);
    }

    .boxx h1 {
        margin: 0;
        font-size: 1.5em;
        line-height: 1.2em;
    }

    .boxx p {
        font-size: 0.75em;
        font-family: 'Open Sans';
        margin-top: 0.5em;
        line-height: 2em;
    }

    .boxx .tags {
        display: flex;
    }

    .boxx .tags .tag {
        font-size: 0.75em;
        background: rgba(255, 255, 255, 0.5);
        border-radius: 0.3rem;
        padding: 0 0.5em;
        margin-right: 0.5em;
        line-height: 1.5em;
        transition: all, var(--transition-time);
    }

    .boxx:hover .tags .tag {
        background: var(--color);
        color: white;
    }

    .boxx .date {
        position: absolute;
        top: 0;
        right: 0;
        font-size: 0.75em;
        padding: 1em;
        line-height: 1em;
        opacity: .8;
    }

    .boxx:before,
    .boxx:after {
        content: '';
        transform: scale(0);
        transform-origin: top left;
        border-radius: 50%;
        position: absolute;
        left: -50%;
        top: -50%;
        z-index: -5;
        transition: all, var(--transition-time);
        transition-timing-function: ease-in-out;
    }

    .boxx:before {
        background: #ddd;
        width: 250%;
        height: 250%;
    }

    .boxx:after {
        background: white;
        width: 200%;
        height: 200%;
    }

    .boxx:hover {
        color: var(--color);
    }

    .boxx:hover:before,
    .boxx:hover:after {
        transform: scale(1);
    }

    .box-grid-space .num {
        font-size: 3em;
        margin-bottom: 1.2rem;
        margin-left: 1rem;
    }

    .info {
        font-size: 1.2em;
        display: flex;
        padding: 1em 3em;
        height: 3em;
    }

    .info img {
        height: 3em;
        margin-right: 0.5em;
    }

    .info h1 {
        font-size: 1em;
        font-weight: normal;
    }

    /* MEDIA QUERIES */
    @media screen and (max-width: 1285px) {
        .cards-wrapper {
            grid-template-columns: 1fr 1fr;
        }
    }

    @media screen and (max-width: 900px) {
        .cards-wrapper {
            grid-template-columns: 1fr;
        }

        .info {
            justify-content: center;
        }

        .box-grid-space .num {
            /margin-left: 0;
            /text-align: center;
        }
    }

    @media screen and (max-width: 500px) {
        .cards-wrapper {
            padding: 4rem 2rem;
        }

        .boxx {
            max-width: calc(100vw - 4rem);
        }
    }

    @media screen and (max-width: 450px) {
        .info {
            display: block;
            text-align: center;
        }

        .info h1 {
            margin: 0;
        }
    }

    .img {
        
    }

    .brand_logo_container {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        height: 130px;
        width: 130px;
        border-radius: 50%;
        padding: 10px;
        text-align: center;
    }

    .brand_logo {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        height: 130px;
        width: 130px;
        border-radius: 50%;
    }

    .bank_name {
        text-align: center;
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
                      <h1>Inventories</h1>
                    </div>
                    <div class="col-sm-6">
                      <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                        <li class="breadcrumb-item active">Inventories</li>
                      </ol>
                    </div>
                  </div>
                </div><!-- /.container-fluid -->
              </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">

                        <div class="card" style="width:100%;">
                            <div class="card-header">
                                {{-- <a href="#add" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fas fa-plus"></i> New</a> --}}
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <form action="inventory-view" method="POST" class="form-horizontal">
                                    @csrf
                                    <div class="row">

                                        @foreach ($banks as $bank)
                                            <div class="col-md-3">
                                                <div class="box-grid-space">
                                                    <button class="boxx" type="submit" name="bank_id"
                                                        value="{{ $bank->id }}"
                                                        href="https://codetheweb.blog/2017/10/06/html-syntax/"
                                                        style="--bg-img: url(https://media.istockphoto.com/id/1320162065/vector/blood-cells-red-erythrocytes.jpg?s=612x612&w=0&k=20&c=rX8kGwiOsHW-V-BOal3Cf6ADKdjx_U5snDdykya0jbs=)">
                                                        <div>


                                                            <h1 class="bank_name">{{ $bank['name'] }}</h1>

                                                            <div class="brand_logo_container">
                                                                <img class="brand_logo"
                                                                    src="{{ asset('images/banks/' . $bank['logo']) }}"
                                                                    style="width:150px;height:150px;margin-bottom:40px;"
                                                                    alt="Bank Logo" >

                                                            </div>

                                                            <div class="tags">
                                                                <div class="tag">View Inventory</div>
                                                            </div>
                                                        </div>
                                                        </a>
                                                </div>
                                            </div>
                                        @endforeach


                                    </div>
                                </form>
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

            $('#example2 tbody').on("click", ".view", function() {
                $('#view').modal('show');
                var id = $(this).data('id');

                $('#view_id').val(id);
            });
        });
    </script>

</body>

</html>
