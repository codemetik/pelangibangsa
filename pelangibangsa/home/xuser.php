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

$qr_kelas = mysqli_query($koneksi, "SELECT * FROM siswa_kelas");
while ($result = mysqli_fetch_array($qr_kelas)) {
    $rows[] = array(
        "id_kelas" => $result['id_kelas'],
        "kelas" => $result['kelas']
    );
}

//array ambil master_level 
$query_level = mysqli_query($koneksi, "SELECT * FROM master_level");
while($data = mysqli_fetch_array($query_level)){
    $array[$data['id_user']] = array(
        "id_master" => $data['id_master'],
        "id_user" => $data['id_user'],
        "id_position" => $data['id_position'],
        "id_kelas" => $data['id_kelas']
    );
}
// $array['USR0006']['id_kelas'];

include "header.php";
?>
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="../home"><?= $_SESSION['name_position']; ?></a> <a href="../home" hidden><?= $_SESSION['kelas']; ?></a>
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
                                        <a href="xuser">
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
                            <li><a href="xuser"><i class="material-icons">person</i>Profile user</a></li>
                            <li><a href="../log-out.php"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div> -->
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li>
                        <a href="xuser"><i class="material-icons col-indigo">dashboard</i><span>Dashboard Walas</span></a>
                    </li>
                    <!-- <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">menu</i>
                            <span>Menu</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="?page=class_room">Data Kelas</a>
                                </li> 
                            <li>
                                <a href="?page=ki3pengetahuan">KI-3 Pengetahuan</a>
                            </li>
                            <li>
                                <a href="?page=ki4keterampilan">KI-4 Keterampilan</a>
                            </li>
                        </ul>
                    </li> -->
                    <li>
                        <a href="">
                            <span></span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- #Menu -->
           
        </aside>
        <!-- #END# Left Sidebar -->

    </section>

    <section class="content">
        <div class="container-fluid">
            <?php

            
            if (isset($_GET['page'])) {
                $page = $_GET['page'];
                switch ($page) {
                    case 'class_room':
                        include "user/class_room.php";
                        break;
                    // case 'about_account':
                    //     include "about_account.php";
                    //     break;
                    default:
                        include "404.php";    
                        break;
                }
            }else{
                include "contenct_xuser.php";
            }
?>
        </div>
    </section>

<?php 
include "footer.php";
?>
