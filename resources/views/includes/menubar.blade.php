<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ url('home') }}" class="brand-link">
        <img src="images/blood-reserve-logo.png" alt="Blood Reserve Logo" class="brand-image img-circle elevation-3"
            style="opacity: .8">
        <span class="brand-text font-weight-light">Blood Reserve</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <br>
        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                    aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- Dashboard -->

                <li class="nav-item">
                    <a href="{{ url('home') }}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>

                <!-- Dashboard -->

                <!-- Administrators -->

                


                <?php 
                if(session('role') == 0 ){
                ?>
                <li class="nav-item">
                    <a href="{{ url('administrators') }}" class="nav-link">
                        <i class="nav-icon fas fa-user-secret"></i>
                        <p>
                            Administrators
                        </p>
                    </a>
                </li>

                <?php
                }else if(session('role') == 1){
                    ?>
                <li class="nav-item">
                    <a href="{{ url('bank-administrators') }}" class="nav-link">
                        <i class="nav-icon fas fa-user-secret"></i>
                        <p>
                            Administrators
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>

                <!-- Administrators -->

                <!-- Municipalitites -->
                <?php 
                if(session('role') == 0 ){
                ?>
                <li class="nav-item">
                    <a href="{{ url('municipalities') }}" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Municipalities
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>

                <!-- Municipalitites -->


                <!-- Inventories -->
                <?php 
                if(session('role') == 0 ){
                ?>
                <li class="nav-item">
                    <a href="{{ url('inventories') }}" class="nav-link">
                        <i class="nav-icon fa-solid fa-kit-medical"></i>
                        <p>
                            Inventories
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>
                <!-- Inventories -->


                <!-- Inventory -->
                <?php 
                if(session('role') == 1 || session('role') == 2){
                ?>
                <li class="nav-item">
                    <a href="{{ url('bank-inventory-view') }}" class="nav-link">
                        <i class="nav-icon fa-solid fa-kit-medical"></i>
                        <p>
                            Inventory
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>
                <!-- Inventory -->



                <!-- Banks -->
                <?php 
                if(session('role') == 0 ){
                ?>
                <li class="nav-item">
                    <a href="{{ url('banks') }}" class="nav-link">
                        <i class="nav-icon fa-solid fa-building-columns"></i>
                        <p>
                            Banks
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>
                <!-- Banks -->


                <!-- Donors -->
                <?php 
                if(session('role') == 0 ){
                ?>
                <li class="nav-item">
                    <a href="{{ url('donors') }}" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Donors
                        </p>
                    </a>
                </li>

                <?php
                }else if(session('role') == 1 || session('role') == 2){
                    ?>
                <li class="nav-item">
                    <a href="{{ url('bank-donors') }}" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Donors
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>

                <!-- Donors -->


                <!-- Receivers -->
                

                <?php 
                if(session('role') == 0 ){
                ?>
                <li class="nav-item">
                    <a href="{{ url('patients') }}" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            Patients
                        </p>
                    </a>
                </li>

                <?php
                }else if(session('role') == 1 || session('role') == 2){
                    ?>
                <li class="nav-item">
                    <a href="{{ url('bank-patients') }}" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            Patients
                        </p>
                    </a>
                </li>
                <?php
                }
                ?>

                <!-- Receivers -->

                <!-- Blood Types -->
                <li class="nav-item">
                    <a href="types" class="nav-link">
                        <i class="nav-icon fas fa-list"></i>
                        <p>
                            Types
                        </p>
                    </a>
                </li>

                <!-- Blood Types -->


            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
