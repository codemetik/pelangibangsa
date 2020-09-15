<?php 
session_start();
include "../connect.php";
if (!isset($_SESSION['user'])) {

  header("Location:../index.php");
}


$position = mysqli_query($koneksi, "SELECT * FROM position");
while ($result = mysqli_fetch_array($position)) {
    $rows[] = array(
        "id_position" => $result['id_position'],
        "name_position" => $result['name_position']
    );
}

include "header.php";
?>
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="../home"><?= $_SESSION['name_position']; ?></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Call Search -->
                    <!-- <li><a href="javascript:void(0);" class="js-search" data-close="true"><i class="material-icons">search</i></a></li> -->
                    <!-- #END# Call Search -->
                    <!-- Notifications -->
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">person</i>
                            <span class="label-count"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Menu</li>
                            <li class="body">
                                <ul class="menu">
                                    <li>
                                        <a href="admin">
                                            <div class="icon-circle bg-indigo">
                                                <i class="material-icons">person</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Profile</h4>
                                                <p>
                                                    <?= $_SESSION['user']; ?>
                                                    <!-- <i class="material-icons">access_time</i> 14 mins ago -->
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../log-out.php">
                                            <div class="icon-circle bg-indigo">
                                                <i class="material-icons">input</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Log-out</h4>
                                                <p>
                                                    <!-- <i class="material-icons">access_time</i> 22 mins ago -->
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="javascript:void(0);">View All Notifications</a>
                            </li>
                        </ul>
                    </li>
                    <!-- #END# Notifications -->
                </ul>
            </div>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="../images/pb.jpg" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?= $_SESSION['user']; ?></div>
                    <div class="email"><?= $_SESSION['email']; ?></div>
                    <!-- <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="admin"><i class="material-icons">person</i>Profile Admin</a></li>
                            <li><a href="../log-out.php"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div> -->
                </div>
            </div>
            <!-- #User Info -->
            
            <!-- Menu -->
            <div class="menu font-12">
                <ul class="list">
                    <li>
                        <a href="admin"><i class="material-icons col-indigo">dashboard</i><span>Dashboard Admin</span></a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>USER</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="?page=data_user"><i>Data user</i></a>
                                </li> 
                            <li>
                                <a href="admin.php?page=add_user"><i>Tambah user</i></a>
                            </li>
                            <li>
                                <a href="admin.php?page=add_kelas"><i>Tambah akses guru kelas</i></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>SISWA</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="admin.php?page=data_siswa"><i>Data siswa</i></a>
                            </li>
                            <li>
                                <a href="admin.php?page=siswa_baru"><i>Siswa Baru</i></a>
                            </li>
                            <li>
                                <a href="admin.php?page=siswa_keluar"><i>Siswa Pindah/Keluar</i></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>MATA PELAJARAN</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="admin.php?page=input_kkm"><i>Tambah Mapel</i></a>
                            </li>
                            <li>
                                <a href="admin.php?page=show_kkm"><i>Data Mapel</i></a>
                            </li>
                            <li>
                                <a href="admin.php?page=hapus_mapel"><i>Data Mapel Per Kelas</i></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>KESISWAAN</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="admin.php?page=tarik_siswa_inkelas"><i>Tarik siswa ke kelas</i></a>
                            </li>
                            <li>
                                <a href="admin.php?page=data_kelas"><i>Data kelas</i></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- #Menu -->
           
        </aside>
        <!-- #END# Left Sidebar -->

    </section>

    <section class="content">
        <div class="container-fluid body">
            <?php

            
            if (isset($_GET['page'])) {
                $page = $_GET['page'];
                switch ($page) {
                    case 'add_user':
                        include "add_user.php";
                        break;
                    case 'about_account':
                        include "about_account.php";
                        break;
                    case 'data_user':
                        include "user/data_user.php";
                        break;
                    case 'detail_user':
                        include "user/detail_user.php";
                        break;
                    case 'guru_kelas':
                        include "user/detail_guru_kelas.php";
                        break;
                    case 'add_kelas':
                        include "add_kelas.php";
                        break;
                    case 'siswa_keluar':
                        include "dashboard/kesiswaan/siswa_keluar.php";
                        break;
                    case 'siswa_baru':
                        include "dashboard/kesiswaan/siswa_baru.php";
                        break;
                    case 'data_siswa':
                        include "dashboard/kesiswaan/data_siswa.php";
                        break;
                    case 'tarik_siswa_inkelas':
                        include "dashboard/kesiswaan/tarik_siswa_inkelas.php";
                        break;
                    case 'input_kkm':
                        include "user/input_kkm.php";
                        break;
                    case 'show_kkm':
                        include "user/show_kkm.php";
                        break;
                    case 'edit_kkm':
                        include "user/edit_kkm.php";
                        break;
                    case 'data_kelas':
                        include "dashboard/kesiswaan/data_siswa_perkelas.php";
                        break;
                    case 'hapus_mapel':
                        include "user/hapus_mapel.php";
                        break;
                    case 'cek_admin':
                        include "user/proses_hapus_mapel.php";
                        break;
                    case 'proses_hapus_mapel_permanen':
                        include "user/proses_hapus_mapel_permanen.php";
                        break;
                    default:
                        include "404.php";    
                        break;
                }
            }else{
                include "contenct_admin.php";
            }
?>
        </div>
    </section>

<?php 
include "footer.php";
?>
