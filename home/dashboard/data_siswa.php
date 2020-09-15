
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Penilaian</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle"><i><b>nilai</b></i></a></li>
    <li class="breadcrumb-item" aria-current="page"><i><b><?= $_SESSION['kelas']; ?></b></i></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b><?= $_SESSION['semester']; ?></b></i></li>
  </ol>
</nav>

<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                DATA SISWA
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Print .pdf</a></li>
                                        <li><a href="javascript:void(0);">Print .csv</a></li>
                                        <li><a href="javascript:void(0);">Print Excel</a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <div class="body">

                            <div>
                                <div class="table">
                                    <table class="table table-sm dataTable">
                                    <tr>
                                        <form action="" method="POST">
                                            <th>
                                            </th>
                                          <th>
                                              <div class="form-group form-float">
                                                <div class="form-line ">
                                                      <input type="text" name="table_search" class="form-control float-right" placeholder="Search name">
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <div class="form-group form-float">
                                                <div class="input-group-append">
                                                      <button type="submit" class="btn bg-indigo" name="search"><i class="material-icons">search</i></button>
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <a href="../dashboard/?page=nilai"><button type="button" class="btn bg-indigo">Refresh</button></a>
                                          </th>
                                        </form>
                                    </tr>
                                    </table>
                                </div>
                            </div>
                            <?php 
                            // pagination
                            $jumlahDataPerhalaman = 5 ;
                            $result = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' ");
                            $jumlahData = mysqli_num_rows($result);
                            $jumlahHalaman = ceil($jumlahData / $jumlahDataPerhalaman);
                            $halamanAktif = (isset($_GET['halaman']) ) ? $_GET['halaman'] : 1;
                            $awalData = ($jumlahDataPerhalaman * $halamanAktif) - $jumlahDataPerhalaman;
                            // #pagination
                            ?>
                          <!-- pagination -->
                            <nav>
                                <ul class="pagination pagination-sm">
                                    <?php 
                                    if ($halamanAktif > 1) { ?>
                                    <li>
                                        <a href="?page=nilai&halaman=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?page=nilai&halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?page=nilai&halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                    <li>
                                        <a href="?page=nilai&halaman=<?= $halamanAktif + 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                    <?php }
                                    ?>
                                </ul>
                            </nav>
                            <!-- #pagination -->
                            <div class="table table-sm table-responsive">
                                <table class="table table-striped table-hover dataTable js-exportable font-11">
                                    <thead>
                                        <tr class="p-0">
                                        <?php 
                                        $kolom = array(
                                            "NILAI", "NISN", "NIS", "NAMA SISWA", "KELAS", "SEMESTER","JK","TEMPAT LAHIR","TANGGAL LAHIR","AGAMA","PEND. SEBELUMNYA","ALAMAT SISWA"
                                        );
                                        foreach ($kolom as $key) { 
                                            echo "<th class='bg-light-blue'>".$key."</th>";
                                         } ?>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        <?php 
                                        foreach ($kolom as $key) { 
                                            echo "<th class=''>".$key."</th>";
                                         }
                                        ?>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php

                                        if (isset($_POST['search'])) {
                                            $cari = $_POST['table_search'];
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester X
                                            INNER JOIN agama Y ON Y.id_agama = X.id_agama WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' AND nama_siswa LIKE '%".$cari."%' OR nisn LIKE '%".$cari."%' OR nis LIKE '%".$cari."%'");
                                        }else{
                                        $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester X
                                            INNER JOIN agama Y ON Y.id_agama = X.id_agama
                                            WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' GROUP BY X.id_siswa LIMIT $awalData, $jumlahDataPerhalaman");
                                        }
                                        while ($siswa_data = mysqli_fetch_array($siswa_sql)) { ?>
                                            <tr>
                                                <td><a type="button" class="btn bg-indigo btn-circle waves-effect waves-circle waves-float" href="?page=nilai&id=<?= $siswa_data['nama_siswa']; ?>"><i class="material-icons">assessment</i></a></td>
                                                <td><?= $siswa_data['nisn']; ?></td>
                                                <td><?= $siswa_data['nis']; ?></td>
                                                <td><?= $siswa_data['nama_siswa']; ?></td>
                                                <td><?= $siswa_data['kelas']; ?></td>
                                                <td><?= $siswa_data['semester']; ?></td>
                                                <td><?= $siswa_data['jk']; ?></td>
                                                <td><?= $siswa_data['tempat_lahir']; ?></td>
                                                <td><?= date('d F Y', strtotime($siswa_data['tanggal_lahir'] )); ?></td>
                                                <td><?= $siswa_data['agama']; ?></td>
                                                <td><?= $siswa_data['pend_sebelumnya']; ?></td>
                                                <td><?= $siswa_data['alamat_serta_didik']; ?></td>
                                            
                                            </tr>
                                        <?php }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Exportable Table -->

<?php 
if (isset($_GET['id'])) {
    include "nilai.php";
}else{
echo "";
}
?>
