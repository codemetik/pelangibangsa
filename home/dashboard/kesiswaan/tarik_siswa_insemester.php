<?php 
$sql = mysqli_query($koneksi, "SELECT * FROM data_level_siswa");
$data = mysqli_fetch_array($sql);
$dtsis = mysqli_query($koneksi, "SELECT * FROM simple_siswa_kelas_semester");
$nolevel = mysqli_fetch_array($dtsis);

        $level = mysqli_query($koneksi, "SELECT max(id_level_siswa) AS maxCode FROM data_level_siswa");
        $idlevel = mysqli_fetch_array($level);
        $lv = $idlevel['maxCode'];
        $lve = (int) substr($lv, 3, 7);
        $lve++; 
        $lvsis = "DLA";
        $datalv = $lvsis . sprintf("%07s", $lve);

$sql = mysqli_query($koneksi, "SELECT * FROM data_siswa");
$dat = mysqli_num_rows($sql);
while ($data = mysqli_fetch_array($sql)) {
    $isi[] = array(
        "id_siswa" => $data['id_siswa'],
        "nis" => $data['nis'],
        "jk" => $data['jk'],
        "nama_siswa" => $data['nama_siswa']
    );
}

$sql1 = mysqli_query($koneksi, "SELECT * FROM data_level_siswa");
while ($data1 = mysqli_fetch_array($sql1)) {
    $isi1[] = array(
        "id_siswa" => $data1['id_siswa']
    );
}

$sqlsmtr = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."'");
$dtsmtr = mysqli_fetch_array($sqlsmtr);
// print_r($isi);
if ($data = mysqli_num_rows($sql)) {
    $siswa = count($isi);
}else{
    $siswa = "";
}


if ($data1 = mysqli_num_rows($sql1) == 1) {
    $level = count($isi1);   
}else{
    $level = "";
}

$kls = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$kelas = mysqli_fetch_array($kls);

        $lvsmtr = mysqli_query($koneksi, "SELECT max(id_level_semester) AS maxCode FROM data_level_semester");
        $idleve = mysqli_fetch_array($lvsmtr);
        $lvl = $idleve['maxCode'];
        $lvel = (int) substr($lvl, 3, 7);
        $lvel++;
        $lvsise = "DLS";


?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Kesiswaan</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Tarik siswa ke semester ini</b></i></li>
  </ol>
</nav>

<div class="card">
	<div class="header bg-indigo">
		<h2>Tarik Siswa ke semester ini</h2>
	</div>
	<div class="body">
		
			<div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                <form action="" method="post">
			        <div class="form-group form-float">
                        <div class="button-demo js-modal-buttons">
                        <button type="button" data-color="cyan" data-toggle="modal" data-target="#defaultModal" class="btn bg-indigo waves-effect">Cari NIS</button>
                        </div>
                    </div>
                <?php 
                            $nisn="";
                            if (isset($_GET['id'])) {
                                $ids = $_GET['id'];
                                $dtsql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas WHERE nama_siswa = '".$ids."'");
                                $in = mysqli_fetch_array($dtsql);
                                $dsis = $in['nis'];
                                $dnam = $in['nama_siswa'];
                            }else{
                                $dnam = "";
                                $dsis = "";
                            }
                            ?>
                        <div class="form-group form-float">
                            <label class="form-label">Input nisn pada kolom dibawah ini atau cari nis pada button diatas</label>
                            <div class="form-line">
                            <input type="text" name="nis" class="form-control" value="<?= $dnam; ?>" placeholder="NIS">
                            </div>
                        </div>
                    <input type="submit" name="ambil" class="btn bg-indigo" value="Ambil">
			
                </form>
            </div>
            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
            <form action="proses/proses_tarik_siswa_insemester.php" method="POST">
                <div class="table">
                <table class="table table-bordered table-hover">
                    <tr class="bg-light-blue">
                        <th>ID</th>
                        <th>Nama SISWA</th>
                        <th>SEMESTER SAAT INI</th>
                    </tr>
                <?php 
                if (isset($_POST['ambil'])) {
                    $nis = $_POST['nis'];
                    $sqlni = mysqli_query($koneksi, "SELECT * FROM siswa_kelas WHERE id_kelas = '".$kelas['id_kelas']."' AND nama_siswa LIKE '%".$nis."%'  OR id_siswa LIKE '%".$nis."%'");
                    while ($sqlin = mysqli_fetch_array($sqlni)) { 
                        $no = $lvsise . sprintf("%07s", $lvel++);
                        ?>
                    <tr>
                        <td>
                        <input type="checkbox" id="<?= $sqlin['id_level_siswa']; ?>" name="id_level_siswa[]" value="<?= $sqlin['id_level_siswa']; ?>" class="chk-col-red"/>
                        <label for="<?= $sqlin['id_level_siswa']; ?>"><?= $sqlin['id_level_siswa']; ?></label>
                        </td>
                        <td  hidden>
                            <input type="text" name="id_level_semester[]" value="<?= $no; ?>">
                        </td>
                        <td>
                            <input type="text" name="nama_siswa[]" value="<?= $sqlin['nama_siswa']; ?>" class="form-control" readonly>
                        </td>
                        <td>
                            <select class="form-control show-tick" name="id_semester[]">
                        <?php 
                        $smtr = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
                        $dsmtr = mysqli_fetch_array($smtr); ?>
                            <option value="<?= $dsmtr['id_semester']; ?>"><?= $dsmtr['semester']; ?></option>
                        <?php 
                        ?>
                    </select>
                        </td>
                    </tr>
                   <?php  }
                }
                ?>
                </table>
                </div>
                <?php 
                if (isset($_POST['ambil'])) { ?>
                    <input type="submit" class="btn bg-indigo" name="simpan" value="simpan" onclick="return confirm('Data siswa akan disimpan ke data kelas semester saat ini, Apakah anda yakin?')">
                <?php }else{

                }
                ?>
            </form>
            </div>
		</div>
	</div>
</div>

<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-light-blue">
                            <h2>
                                DATA SISWA <?= $_SESSION['semester']; ?>
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
                                        <a href="?page=tarik_siswa_insemester&halaman=<?= $halamanAktif - 1; ?>" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <?php 
                                    }

                                    for ($i=1; $i <= $jumlahHalaman; $i++) { 
                                        if ($i == $halamanAktif) { ?>
                                            <li><a href="?page=tarik_siswa_insemester&halaman=<?= $i; ?>" style="font-weight: bold; color: red;" class="waves-effect active"><?= $i; ?></a></li>
                                        <?php }else{
                                        ?>
                                        <li><a href="?page=tarik_siswa_insemester&halaman=<?= $i; ?>" class="waves-effect"><?= $i; ?></a></li>
                                    <?php } 
                                    }

                                    if ($halamanAktif < $jumlahHalaman) { ?>
                                    <li>
                                        <a href="?page=tarik_siswa_insemester&halaman=<?= $halamanAktif + 1; ?>" class="waves-effect">
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
                                            "NISN", "NIS", "NAMA SISWA", "KELAS", "SEMESTER","JK","TEMPAT LAHIR","TANGGAL LAHIR","AGAMA","PEND. SEBELUMNYA","ALAMAT SISWA","Action"
                                        );
                                        foreach ($kolom as $key) { 
                                            echo "<th class='bg-light-blue' scope='col'>".$key."</th>";
                                         } ?>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $siswa_sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas_semester WHERE kelas = '".$_SESSION['kelas']."' AND semester = '".$_SESSION['semester']."' LIMIT $awalData, $jumlahDataPerhalaman");
                                        while ($siswa_data = mysqli_fetch_array($siswa_sql)) { ?>
                                            <tr><a href="#">
                                                <td><?= $siswa_data['nisn']; ?></td>
                                                <td><?= $siswa_data['nis']; ?></td>
                                                <td><?= $siswa_data['nama_siswa']; ?></td>
                                                <td><?= $siswa_data['kelas']; ?></td>
                                                <td><?= $siswa_data['semester']; ?></td>
                                                <td><?= $siswa_data['jk']; ?></td>
                                                <td><?= $siswa_data['tempat_lahir']; ?></td>
                                                <td><?= $siswa_data['tanggal_lahir']; ?></td>
                                                <td><?= $siswa_data['id_agama']; ?></td>
                                                <td><?= $siswa_data['pend_sebelumnya']; ?></td>
                                                <td><?= $siswa_data['alamat_serta_didik']; ?></td>
                                                <td><a href="delete/delete_data_level_semester.php?id=<?= $siswa_data['id_level_semester']; ?>" onclick="return confirm('Data siswa akan dikeluarkan/hapus hanya untuk semester ini, Apakah anda yakin?')"><button class="btn bg-indigo">Delete</button></a></td>
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

<!-- Default Size -->
            <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Data Siswa</h4>
                        </div>
                        <div class="modal-body">
                            <div class="table table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <?php 
                                        $array = array('NO','Klik NAMA','STATUS','JK');
                                        foreach ($array as $key) {
                                            echo "<th>".$key."</th>";
                                        }
                                        ?>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $sqli = mysqli_query($koneksi, "SELECT id_level_siswa, X.id_siswa as id_siswa, X.id_kelas, nisn, nis, nama_siswa, jk, id_level_siswa, kelas FROM data_level_siswa X INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas WHERE kelas = '".$_SESSION['kelas']."' ORDER BY id_siswa");
                                            $no=1;
                                            while ($sis = mysqli_fetch_array($sqli)) {
                                            $sqlev = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester_2 WHERE id_level_siswa = '".$sis['id_level_siswa']."' AND semester = '".$_SESSION['semester']."'");
                                            $dtlev = mysqli_fetch_array($sqlev);
                                            $dtlevel = mysqli_num_rows($sqlev);
                                                ?>
                                                <tr>
                                                <td><?= $no++; ?></td>
                                                <td>
                                                <?php 
                                                if ($dtlevel == 1) { ?>
                                                    <a class="btn bg-blue" href="#"><?= $sis['nama_siswa']; ?></a>
                                                <?php }else if($dtlevel == 0){ ?>
                                                    <form action="" method="get">
                                                    <a class="btn bg-green" href="?page=tarik_siswa_insemester&id=<?= $sis['nama_siswa']; ?>"><?= $sis['nama_siswa']; ?></a>
                                                    </form>
                                                <?php }
                                                ?>
                                                </td>
                                                <td>
                                                <?php 
                                                if ($dtlevel == 1) {
                                                    echo "<p style='color:blue;'>DATA ADA DI SEMESTER INI</p>";
                                                }else if($dtlevel == 0){
                                                    echo "<p style='color:green;'>DATA BELUM ADA DI SEMESTER INI</p>";
                                                }
                                                ?></td>
                                                <td><?= $sis['jk']; ?></td>
                                            </tr>
                                            <?php }
                                            ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>
                    </div>
                </div>
            </div>


