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

//session id_user.
$_SESSION['id_user'];
$users = $_SESSION['id_user'];

include "header.php";
?>

    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Search Bar -->
    <div class="search-bar">
        <div class="search-icon">
            <i class="material-icons">search</i>
        </div>
        <input type="text" placeholder="START TYPING...">
        <div class="close-search">
            <i class="material-icons">close</i>
        </div>
    </div>
    <!-- #END# Search Bar -->
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="../home"><?= $_SESSION['judul']; ?></a>
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
                                        <a href="?page=download">
                                            <div class="icon-circle bg-indigo">
                                                <i class="material-icons">file_download</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Download file panduan</h4>
                                                <p>
                                                    
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
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php
                        
                        $us = $_SESSION['user'];
                        $kelas = $_SESSION['name_position'];

                        if ($rows[0]['name_position']) {
                            echo $us . " , Sebagai : ". $kelas;
                        }else if($rows[1]['name_position']) {
                            echo $us . " , Sebagai : ". $kelas;
                        }else if($rows[2]['name_position']){
                            echo $us . ", Sebagai : ". $kelas;
                        }else if($rows[3]['name_position']){
                            echo $us . ", Sebagai : ". $kelas;
                        }else{
                            echo "No Access.";
                        }
                        
                        ?>        
                    </div>
                    <div class="email"><?= $_SESSION['email']; ?></div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <!-- <?php if (($_SESSION['name_position'] === $rows[0]['name_position'])) { ?>
                            <li><a href="admin"><i class="material-icons">person</i>Profile Admin</a></li>
                            <li role="separator" class="divider"></li>    
                            <?php }else if (($_SESSION['name_position'] === $rows[1]['name_position'])){ ?>
                            <li><a href="xuser"><i class="material-icons">person</i>Profile Kepsek</a></li>
                            <li role="separator" class="divider"></li>
                            <?php }else if (($_SESSION['name_position'] === $rows[2]['name_position'])){ ?>
                            <li><a href="xuser"><i class="material-icons">person</i>Profile Walas</a></li>
                            <li role="separator" class="divider"></li>
                            <?php }else if (($_SESSION['name_position'] === $rows[3]['name_position'])){ ?>
                            <li><a href="xuser"><i class="material-icons">person</i>Profile Mapel</a></li>
                            <li role="separator" class="divider"></li>
                            <?php } else{
                                echo "No Access.";
                            }
                            ?> -->
                            <li><a href="../log-out.php"><i class="material-icons">input</i>LOG OUT</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <?php include "level_akses.php"; ?>
                
            </div>
            <!-- #Menu -->

        </aside>
        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->

        <!-- #END# Right Sidebar -->
    </section>

    <section class="content">
        <div class="container-fluid">
        <?php
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            switch ($page) {
                case 'Kelas I':
                    include "kelas1.php";
                    break;
                case 'Kelas II':
                    include "kelas1.php";
                    break;
                case 'Kelas III':
                    include "kelas1.php";
                    break;
                case 'Kelas IV':
                    include "kelas1.php";
                    break;
                case 'Kelas V':
                    include "kelas1.php";
                    break;
                case 'Kelas VI':
                    include "kelas1.php";
                    break;
                case 'detail_siswa':
                    include "detail_siswa.php";
                    break;
                case 'xuser':
                    include "xuser.php";
                    break;
                case 'download':
                    include "file_download.php";
                    break;
                default:
                    include "404.php";
                    break;
            }
        }else{
        include "files_home.php";
    }
        ?>
        </div>
    </section>

<?php 
include "footer.php";
?>