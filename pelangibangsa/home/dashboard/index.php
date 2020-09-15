<?php 
session_start();
include "../../connect.php";
if (!isset($_SESSION['user'])) {
  header("Location:../../sign-in.php");
}

if (isset($_POST['submit'])) {
$semester = $_POST['semester'];
$kelas = $_POST['kelas'];
    if ($semester) {
        $_SESSION['semester'] = $semester;
        $_SESSION['kelas'] = $kelas;
        
    }
    
}

$position = mysqli_query($koneksi, "SELECT * FROM position");
while ($result = mysqli_fetch_array($position)) {
    $rows[] = array(
        "id_position" => $result['id_position'],
        "name_position" => $result['name_position']
    );
}

        // $kode = mysqli_query($koneksi, "SELECT max(id_tema) AS maxCode FROM tema");
        // $data = mysqli_fetch_array($kode);
        // $kd = $data['maxCode'];
        // $no = (int) substr($kd, 2, 2);
        // $no++; 
        // $char = "TM";
        // $kd = $char . sprintf("%02s", $no);

        $mapel = mysqli_query($koneksi, "SELECT max(id_mapel) AS maxCode FROM mapel");
        $data_mapl = mysqli_fetch_array($mapel);
        $kde = $data_mapl['maxCode'];
        $nO = (int) substr($kde, 3, 2);
        $nO++; 
        $chars = "MPL";
        $kde = $chars . sprintf("%02s", $nO);

        $kdasar = mysqli_query($koneksi, "SELECT max(id_kd) AS maxCode FROM kd_pengetahuan");
        $data_kd = mysqli_fetch_array($kdasar);
        $kdsr = $data_kd['maxCode'];
        $nOkd = (int) substr($kdsr, 3, 10);
        $nOkd++; 
        $charkd = "KTM";
        $kdsr = $charkd . sprintf("%010s", $nOkd);

        $sqlsiswa = mysqli_query($koneksi, "SELECT max(id_siswa) AS maxCode FROM data_siswa");
        $dtsiswa = mysqli_fetch_array($sqlsiswa);
        $datsiswa = $dtsiswa['maxCode'];
        $nOsis = (int) substr($datsiswa, 3, 7);
        $nOsis++; 
        $charsis = "SIS";
        $datsiswa = $charsis . sprintf("%07s", $nOsis);

        $kdktm = mysqli_query($koneksi, "SELECT max(id_kd) AS maxCode FROM kd_keterampilan");
        $data_ktm = mysqli_fetch_array($kdktm);
        $ktm = $data_ktm['maxCode'];
        $nOktm = (int) substr($ktm, 3, 10);
        $nOktm++; 
        $charktm = "KTM";
        $ktm = $charktm . sprintf("%010s", $nOktm);

        //untuk penomoran di table nilai akhir ki3
        $ki3 = mysqli_query($koneksi, "SELECT max(id_nilairaport) AS maxCode FROM nilai_raport_ki3");
        $data_ki3 = mysqli_fetch_array($ki3);
        $ki_3 = $data_ki3['maxCode'];
        $nOki3 = (int) substr($ki_3, 4, 7);
        $nOki3++; 
        $charki3 = "KI-3";
        $dataki3 = $charki3 . sprintf("%07s", $nOki3);

        $ki4 = mysqli_query($koneksi, "SELECT max(id_nilairaport) AS maxCode FROM nilai_raport_ki4");
        $data_ki4 = mysqli_fetch_array($ki4);
        $ki_4 = $data_ki4['maxCode'];
        $nOki4 = (int) substr($ki_4, 4, 7);
        $nOki4++; 
        $charki4 = "KI-4";
        $dataki4 = $charki4 . sprintf("%07s", $nOki4);

        $sp = mysqli_query($koneksi, "SELECT max(id_nilairaport_sp) AS maxCode FROM nilai_raport_spiritual");
        $datsp = mysqli_fetch_array($sp);
        $spp = $datsp['maxCode'];
        $nOsp = (int) substr($spp, 3, 7);
        $nOsp++; 
        $charsp = "SPT";
        $dataspk = $charsp . sprintf("%07s", $nOsp);

        $st = mysqli_query($koneksi, "SELECT max(id_nilairaport_so) AS maxCode FROM nilai_raport_sosial");
        $datso = mysqli_fetch_array($st);
        $so = $datso['maxCode'];
        $nOso = (int) substr($so, 3, 7);
        $nOso++; 
        $charso = "SOS";
        $datasos = $charso . sprintf("%07s", $nOso);

        $kdagm = mysqli_query($koneksi, "SELECT max(id_kd) AS maxCode FROM kd_agama_ki3");
        $datkd = mysqli_fetch_array($kdagm);
        $kdki3 = $datkd['maxCode'];
        $nOkdki3 = (int) substr($kdki3, 3, 10);
        $nOkdki3++; 
        $kdcki3 = "KDA";
        $dkdki3 = $kdcki3 . sprintf("%010s", $nOkdki3);

        $kdagm1 = mysqli_query($koneksi, "SELECT max(id_kd) AS maxCode FROM kd_agama_ki4");
        $datkd1 = mysqli_fetch_array($kdagm1);
        $kdki4 = $datkd1['maxCode'];
        $nOkdki4 = (int) substr($kdki4, 3, 10);
        $nOkdki4++; 
        $kdcki4 = "KDA";
        $dkdki4 = $kdcki4 . sprintf("%010s", $nOkdki4);

        $tinggi = mysqli_query($koneksi, "SELECT max(id_tbb) AS maxCode FROM tinggi_berat_badan");
        $berat = mysqli_fetch_array($tinggi);
        $badan = $berat['maxCode'];
        $ttinggi = (int) substr($badan, 3, 4);
        $ttinggi++; 
        $tberat = "TBB";
        $tbb = $tberat . sprintf("%04s", $ttinggi);

        $sqlhadir = mysqli_query($koneksi, "SELECT max(id_kehadiran) AS maxCode FROM ketidakhadiran");
        $hadir = mysqli_fetch_array($sqlhadir);
        $dthadir = $hadir['maxCode'];
        $nohadir = (int) substr($dthadir, 3, 4);
        $nohadir++; 
        $khdiran = "HDR";
        $dthdr = $khdiran . sprintf("%04s", $nohadir);

        $saran = mysqli_query($koneksi, "SELECT max(id_saran) AS maxCode FROM saran");
        $sqlsrn = mysqli_fetch_array($saran);
        $dtsrn = $sqlsrn['maxCode'];
        $nosrn = (int) substr($dtsrn, 3, 4);
        $nosrn++; 
        $saaran = "SRN";
        $dtsaran = $saaran . sprintf("%04s", $nosrn);

        $catatan = mysqli_query($koneksi, "SELECT max(id_catatan) AS maxCode FROM catatan");
        $sqlctn = mysqli_fetch_array($catatan);
        $cttn = $sqlctn['maxCode'];
        $noctn = (int) substr($cttn, 3, 4);
        $noctn++; 
        $catat = "CTN";
        $dtcatat = $catat . sprintf("%04s", $noctn);

//untuk header html body
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
                <a class="navbar-brand" href="../../home"><?= $_SESSION['judul']." >> ".$_SESSION['kelas']." >> ". $_SESSION['semester']; ?></a>
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
                                        <?php 
                                        if ((($_SESSION['name_position'] == $rows[0]['name_position']))) { ?>
                                            <a href="../admin">
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
                                        <?php }else if (($_SESSION['name_position'] == $rows[1]['name_position'])) { ?>
                                            <a href="../xuser">
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
                                        <?php }else if (($_SESSION['name_position'] == $rows[2]['name_position'])) { ?>
                                            <a href="../xuser">
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
                                        <?php }else if (($_SESSION['name_position'] == $rows[3]['name_position'])) { ?>
                                            <a href="../xuser">
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
                                        <?php }else{
                                            echo "No Access";
                                        }
                                        ?>
                                    </li>
                                    <!-- <li>
                                        <a href="?page=history">
                                            <div class="icon-circle bg-indigo">
                                                <i class="material-icons">layers</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Kesiswaan</h4>
                                                <p>
                                                    new
                                                </p>
                                            </div>
                                        </a>
                                    </li> -->
                                    <!-- <li>
                                        <a href="?page=history">
                                            <div class="icon-circle bg-indigo">
                                                <i class="material-icons">layers</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Kenaikan Kelas</h4>
                                                <p>
                                                    new
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="?page=history">
                                            <div class="icon-circle bg-indigo">
                                                <i class="material-icons">history</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>History</h4>
                                                <p>
                                                    new
                                                </p>
                                            </div>
                                        </a>
                                    </li> -->
                                    <li>
                                        <a href="../index.php?page=download">
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
                                        <a href="../../log-out.php">
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
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="../../images/pb.jpg" width="48" height="48" alt="User" />
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
                            <?php if (($_SESSION['name_position'] == $rows[0]['name_position'])) { ?>
                            <li><a href="../admin"><i class="material-icons">person</i>Profile Admin</a></li>
                            <li role="separator" class="divider"></li>    
                            <?php }else if (($_SESSION['name_position'] == $rows[1]['name_position'])){ ?>
                            <li><a href=""><i class="material-icons">person</i>Profile Kepsek</a></li>
                            <li role="separator" class="divider"></li>
                            <?php }else if (($_SESSION['name_position'] == $rows[2]['name_position'])){ ?>
                            <li><a href=""><i class="material-icons">person</i>Profile Walas</a></li>
                            <li role="separator" class="divider"></li>
                            <?php }else if (($_SESSION['name_position'] == $rows[3]['name_position'])){ ?>
                            <li><a href=""><i class="material-icons">person</i>Profile Mapel</a></li>
                            <li role="separator" class="divider"></li>
                            <?php } else{
                                echo "No Access.";
                            }
                            ?>
                            <li><a href="../../log-out.php"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu font-12">
                <ul class="list">
                    <li>
                        <a href="../dashboard">
                            <i class="material-icons col-indigo">dashboard</i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>DATA UMUM</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                            <?php 
                            if (($_SESSION['name_position'] == $rows[0]['name_position'])) { ?>
                                <a href="index.php?page=data_sekolah" class="group-item"><b>Sekolah</b></a>
                            <?php } else if (($_SESSION['name_position'] == $rows[1]['name_position'])){ ?>
                                <a href="index.php?page=data_sekolah" class="group-item"><b>Sekolah</b></a>
                            <?php }
                             ?>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=data_siswa" class="group-item"><b><i>Data Siswa</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=kkm" class="group-item"><b><i>KKM</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ekp" class="group-item"><b><i>EKP</i></b></a>
                            </li>
                        </ul>
                    </li>
                    <!-- <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>EDIT TEMA</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="">
                                <a href="../dashboard/?page=temaki-3" class="group-item"><b><i>Tema KI-3</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=temaki-4" class="group-item"><b><i>Tema KI-4</i></b></a>
                            </li>
                        </ul>
                    </li> -->
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>INPUT SIKAP</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="">
                                <a href="../dashboard/?page=ki1" class="group-item"><b><i>KI-1 Sikap Spiritual</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ki2" class="group-item"><b><i>KI-2 Sikap Sosial</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=gabungan_nilai_ki1_ki2" class="group-item"><b><i>Gabungan KI-1 & KI-2</i></b></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>INPUT KD PENGETAHUAN</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="">
                                <a href="../dashboard/?page=ki3" class="group-item"><b><i>KI-3 Mapel</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ki3_pabp" class="group-item"><b><i>KI-3 PABP</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=rekap_nilaiki3" class="group-item"><b><i>Rekap Nilai KI-3</i></b></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>INPUT KD KETERAMPILAN</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="">
                                <a href="../dashboard/?page=ki4" class="group-item"><b><i>KI-4 Mapel</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ki4_pabp" class="group-item"><b><i>KI-4 PABP</i></b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=rekap_nilaiki4" class="group-item"><b><i>Rekap Nilai KI-4</i></b></a>
                            </li>
                        </ul>
                    </li>
                    <hr>
                    <!-- menu sebelumnya -->
                    <!-- <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">menu</i>
                            <span>Menu</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                            <?php 
                            if (($_SESSION['name_position'] == $rows[0]['name_position'])) { ?>
                                <a href="index.php?page=data_sekolah" class="group-item"><b>Sekolah</b></a>
                            <?php } else if (($_SESSION['name_position'] == $rows[1]['name_position'])){ ?>
                                <a href="index.php?page=data_sekolah" class="group-item"><b>Sekolah</b></a>
                            <?php }
                             ?>
                            </li>
                            <li>
                                <a href="../dashboard/?page=data_siswa" class="group-item"><b>Siswa</b></a>
                            </li>
                            <li>
                                <a href="../dashboard/?page=nilai" class="group-item"><b>Nilai</b></a>
                            </li>
                            <li>
                                <a href="../dashboard/?page=cetak" class="group-item"><b>Cetak</b></a>
                            </li>
                            <hr>
                            <li>
                                <a href="../dashboard/?page=kkm" class="group-item"><b>KKM</b></a>
                            </li>
                            <li>
                                <a href="../dashboard/?page=ekp" class="group-item"><b>EKP</b></a>
                            </li>
                        </ul>
                    </li> -->
                    <!-- <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">layers</i>
                            <span>Kompetensi Inti (KI)</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="">
                                <a href="../dashboard/?page=ki1" class="group-item"><b>KI-1 (Spiritual)</b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ki2" class="group-item"><b>KI-2 (Sosial)</b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ki3" class="group-item"><b>KI-3 (Pengetahuan)</b></a>
                            </li>
                            <li class="">
                                <a href="../dashboard/?page=ki4" class="group-item"><b>KI-4 (Keterampilan)</b></a>
                            </li>
                        </ul>
                    </li> -->
                    <!-- <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">layers</i>
                            <span>Butir Sikap</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../dashboard/?page=spiritual" class="group-item"><b>Sikap Spiritual</b></a>
                            </li>
                            <li>
                                <a href="../dashboard/?page=sosial" class="group-item"><b>Sikap Sosial</b></a>
                            </li>
                        </ul>
                    </li> -->
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>PENILAIAN</span>
                            <span class="label bg-light-blue"><i class="material-icons font-12 col-white">check</i></span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../dashboard/?page=nilai" class="group-item"><i><b>Nilai</b></i></a>
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
                                <a href="../dashboard/?page=tarik_siswa_insemester" class="group-item"><i><b>Tarik siswa ke semester ini</b></i></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>KENAIKAN KELAS</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../dashboard/?page=kenaikan_kelas" class="group-item"><i><b>Naikan siswa</b></i></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons col-indigo">layers</i>
                            <span>CETAK</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="../dashboard/?page=cetak" class="group-item"><i><b>Cetak Rapor</b></i></a>
                            </li>
                        </ul>
                    </li>
                    <!-- //menusebelumnya -->
                </ul>
            </div>
            <!-- #Menu -->

        </aside>
        <!-- #END# Left Sidebar -->
        <!-- Right Sidebar -->

        <!-- #END# Right Sidebar -->
    </section>

    <section class="content">
        
        <div class="container-fluid">
            <!-- Pilih atas nama siswa -->
        <?php
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            switch ($page) {
                case 'history':
                    include "../user/history.php";
                    break;
                case 'data_sekolah':
                    include "data_sekolah.php";
                    break;
                case 'nilai':
                    include "data_siswa.php";
                    break;
                case 'nilai_siswa':
                    include "nilai.php";
                    break;
                case 'data_siswa':
                    include "list_siswa.php";
                    break;
                case 'add_siswa':
                    include "input_data_siswa.php";
                    break;
                case 'penilaian':
                    include "penilaian.php";
                    break;
                case 'pelajaran':
                    include "pelajaran.php";
                    break;
                case 'cetak':
                    include "cetak/cetak.php";
                    break;
                case 'ki1':
                    include "ki1.php";
                    break;
                case 'ki2':
                    include "ki2.php";
                    break;
                case 'ki3':
                    include "ki3.php";
                    break;
                case 'ki4':
                    include "ki4.php";
                    break;
                case 'kkm':
                    include "kkm.php";
                    break;
                case 'input':
                    include "input.php";
                    break;
                case 'ekp':
                    include "ekp.php";
                    break;
                case 'spiritual':
                    include "sikap_spiritual.php";
                    break;
                case 'sosial':
                    include "sikap_sosial.php";
                    break;
                case 'edit_skpsp':
                    include "edit/edit_sikap_spiritual.php";
                    break;
                case 'edit_skpso':
                    include "edit/edit_sikap_sosial.php";
                    break;
                case 'edit_kkm_kelas':
                    include "edit/edit_kkm_kelas.php";
                    break;
                case 'edit_tema':
                    include "edit/edit_tema.php";
                    break;
                case 'edit_ki3':
                    include "edit/edit_ki3.php";
                    break;
                case 'edit_ki4':
                    include "edit/edit_ki4.php";
                    break;
                case 'edit_ekstra':
                    include "edit/edit_ekstra.php";
                    break;
                case 'edit_per_ekstra':
                    include "edit/edit_per_ekskul.php";
                    break;
                case 'edit_kesehatan':
                    include "edit/edit_kesehatan.php";
                    break;
                case 'edit_kesehatan_1':
                    include "edit/edit_per_kesehatan.php";
                    break;
                case 'edit_prestasi':
                    include "edit/edit_prestasi.php";
                    break;
                case 'edit_prestasi_1':
                    include "edit/edit_per_prestasi.php";
                    break;
                case 'edit_ki1':
                    include "edit/edit_ki1.php";
                    break;
                case 'edit_ki2':
                    include "edit/edit_ki2.php";
                    break;
                case 'tarik_siswa_inkelas':
                    include "kesiswaan/tarik_siswa_inkelas.php";
                    break;
                case 'nilai_akhir_raportki3':
                    include "penilaian/nilai_akhir_raportki3.php";
                    break;
                case 'nilai_akhir_raportki4':
                    include "penilaian/nilai_akhir_raportki4.php";
                    break;
                case 'nilai_akhir_ki3':
                    include "edit/edit_nilai_akhir_raportki3.php";
                    break;
                case 'ki3_pabp':
                    include "ki3_pabp.php";
                    break;
                case 'ki4_pabp':
                    include "ki4_pabp.php";
                    break;
                case 'nilai_akhir_kdagamaki3':
                    include "penilaian/nilai_akhir_kdagama_ki3.php";
                    break;
                case 'nilai_akhir_kdagamaki4':
                    include "penilaian/nilai_akhir_kdagama_ki4.php";
                    break;
                case 'siswa_keluar':
                    include "kesiswaan/siswa_keluar.php";
                    break;
                case 'tarik_siswa_insemester':
                    include "kesiswaan/tarik_siswa_insemester.php";
                    break;
                case 'kenaikan_kelas':
                    include "kenaikan_kelas/kenaikan_kelas.php";
                    break;
                case 'tinggi_berat':
                    include "edit/edit_tinggi_berat.php";
                    break;
                case 'ketidakhadiran':
                    include "edit/edit_ketidakhadiran.php";
                    break;
                case 'edit_catatan':
                    include "edit/edit_catatan.php";
                    break;
                case 'edit_saran':
                    include "edit/edit_saran.php";
                    break;
                case 'ekskul':
                    include "ekskul/ekskul.php";
                    break;
                case 'detail_ekskul':
                    include "ekskul/detail_ekskul.php";
                    break;
                case 'input_muatan_nilai':
                    include "ekskul/muatan_nilai.php";
                    break;
                case 'input_nilaiki3':
                    include "penilaian/input_nilaiki3.php";
                    break;
                case 'input_nilaiki4':
                    include "penilaian/input_nilaiki4.php";
                    break;
                case 'input_nilai_agamaki3':
                    include "penilaian/input_nilai_agamaki3.php";
                    break;
                case 'input_nilai_agamaki4':
                    include "penilaian/input_nilai_agamaki4.php";
                    break;
                case 'delete_ekskul':
                    include "ekskul/delete_ekskul.php";
                    break;
                case 'rekap_nilaiki3':
                    include "penilaian/rekap_nilai/rekap_nilaiki3.php";
                    break;
                case 'rekap_nilaiki4':
                    include "penilaian/rekap_nilai/rekap_nilaiki4.php";
                    break;
                case 'gabungan_nilai_ki3_ki4':
                    include "penilaian/rekap_nilai/gabungan_nilai_ki3_ki4.php";
                    break;
                case 'gabungan_nilai_ki1_ki2':
                    include "penilaian/rekap_nilai/gabungan_nilai_ki1_ki2.php";
                    break;
                case 'gabungan_ekskul':
                    include "penilaian/ekskul/gabungan_ekskul.php";
                    break;

                default:
                    echo "Halaman tidak ada";
                    break;
            }
        }else{
            include "files_dashboard.php";
        }
        ?>
        </div>
    </section>
    
<?php 
include "footer.php";
?>