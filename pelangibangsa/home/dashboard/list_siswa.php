<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Data umum</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>siswa</b></i></li>
  </ol>
</nav>
<!-- Exportable Table -->
            <div class="row clearfix m-0">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                DATA SISWA <?= $_SESSION['kelas']; ?>
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
                            <div class="">
                                <div class="table table-responsive">
                                    <table class="table table-sm dataTable">
                                    <tr>
                                        <form action="" method="POST">
                                            <th>
                                                <a type="button" class="btn bg-indigo m-0 waves-effect" href="?page=add_siswa">
                                                    <i class="material-icons">add</i>Tambah Siswa
                                                </a>
                                            </th>
                                            <th></th>
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
                                                      <button type="submit" name="search" class="btn bg-indigo"><i class="material-icons">search</i></button>
                                                </div>
                                            </div>
                                          </th>
                                          <th>
                                              <a href="?page=data_siswa"><button type="button" class="btn bg-indigo">Refresh</button></a>
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
                                        <a href="?page=data_siswa&halaman=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?page=data_siswa&halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?page=data_siswa&halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                    <li>
                                        <a href="?page=data_siswa&halaman=<?= $halamanAktif + 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                    <?php }
                                    ?>
                                </ul>
                            </nav>
                            <!-- #pagination -->
                            <div class="table table-sm table-responsive">
                                <table class="table table-sm table-striped table-hover dataTable js-exportable font-11">
                                    <thead>
                                        <tr>
                                        <?php 
                                        $kolom = array(
                                            "NISN", "NIS", "NAMA SISWA", "KELAS", "JK","TEMPAT LAHIR","TANGGAL LAHIR","AGAMA","PEND. SEBELUMNYA","ALAMAT SISWA", "ACTION"
                                        );
                                        foreach ($kolom as $key) { 
                                            echo "<th class='text-center font-12' scope='col'>".$key."</th>";
                                         } ?>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        <?php 
                                        foreach ($kolom as $key) { 
                                            echo "<th class='text-center font-12'>".$key."</th>";
                                         }
                                        ?>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php 
                                        if (isset($_POST['search'])) {
                                            $cari = $_POST['table_search'];
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester x
                                                INNER JOIN agama y ON y.id_agama = x.id_agama
                                                WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' AND nama_siswa LIKE '%".$cari."%' OR nisn LIKE '%".$cari."%' OR nis LIKE '%".$cari."%' GROUP BY x.id_siswa");
                                        }else{
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester x
                                                INNER JOIN agama y ON y.id_agama = X.id_agama
                                                WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' GROUP BY x.id_siswa LIMIT $awalData, $jumlahDataPerhalaman");
                                        }
                                        while ($siswa_data = mysqli_fetch_array($siswa_sql)) { ?>
                                            <tr class="m-b-0"><a href="#">
                                                <td hidden><?= $siswa_data['id_siswa']; ?></td>
                                                <td><?= $siswa_data['nisn']; ?></td>
                                                <td><?= $siswa_data['nis']; ?></td>
                                                <td><?= $siswa_data['nama_siswa']; ?></td>
                                                <td><?= $siswa_data['kelas']; ?></td>
                                                <td><?= $siswa_data['jk']; ?></td>
                                                <td><?= $siswa_data['tempat_lahir']; ?></td>
                                                <td><?= date('d F Y', strtotime($siswa_data['tanggal_lahir'] )); ?></td>
                                                <td><?= $siswa_data['agama']; ?></td>
                                                <td><?= $siswa_data['pend_sebelumnya']; ?></td>
                                                <td><?= $siswa_data['alamat_serta_didik']; ?></td>
                                                <td>
                                                    
                                                        <div class="dropdown">
                                                            <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                                Action
                                                            </button>
                                                            <ul class="dropdown-menu pull-right">
                                                                <li><a href="?page=data_siswa&id=<?= $siswa_data['id_siswa']; ?>">Detail</a></li>
                                                            </ul>
                                                        </div>
                                                    
                                                </td>
                                            </a>
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
if (!isset($_GET['id'])) {
    echo "";
}else{
    include "edit/edit_list_siswa.php";
}
?>