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
$siswa = count($isi);

if ($data1 = mysqli_num_rows($sql1) == 1) {
    $level = count($isi1);
}else{
    $level = "";
}

$kls = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$kelas = mysqli_fetch_array($kls);

        $lvsmtr = mysqli_query($koneksi, "SELECT max(id_level_siswa) AS maxCode FROM data_level_semester");
        $idleve = mysqli_fetch_array($lvsmtr);
        $lvl = $idleve['maxCode'];
        $lvel = (int) substr($lvl, 3, 7);
        $lvel++;
        $lvsise = "DLS";
        $datalvel = $lvsise . sprintf("%07s", $lvel);

$sqlkeluar = mysqli_query($koneksi, "SELECT * FROM data_siswa_keluar GROUP BY id_siswa ASC");
$dtskl = mysqli_fetch_array($sqlkeluar);


?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Kesiswaan</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Tarik siswa ke kelas ini</b></i></li>
  </ol>
</nav>

<div class="card">
	<div class="header bg-indigo">
		<h2>Tarik Siswa ke kelas</h2>
	</div>
	<div class="body">
			<div class="row">
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                <form action="" method="post">
                    <div class="form-group form-float">
                        <div class="button-demo js-modal-buttons">
                        <button type="button" data-color="cyan" data-toggle="modal" data-target="#defaultModal" class="btn bg-light-blue waves-effect">KLIK NAMA</button>
                        </div>
                    </div>
                <div class="form-group form-float">
                    <label class="form-label">Input Nama Siswa pada kolom dibawah ini atau Klik Nama pada button di atas</label>
                            <div class="form-line">
                                <?php 
                                $nisn="";
                            if (isset($_GET['id'])) {
                                $nis = $_GET['id'];
                                $dtsql = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa LIKE '%".$nis."%'");
                                $in = mysqli_fetch_array($dtsql);
                                $dsis = $in['id_siswa'];
                                $dname = $in['nama_siswa'];
                            }else{
                                $nis = "";
                                $dsis = "";
                                $dname = "";
                            }
                            ?>
                            <input type="text" class="form-control" name="nis" value="<?= $nis; ?>" placeholder="Ketik nama siswa disini">
                            </div>
                        </div>
                    <input type="submit" class="btn bg-indigo" name="ambil" value="Ambil">
            </form>
            </div>
            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                <form action="dashboard/proses/proses_tarik_siswa_inkelas.php" method="POST">
                    <div class="table">
                        <table class="table table-bordered table-hover font-11">
                            <tr class="bg-light-blue">
                                <th>ID SISWA</th>
                                <th>NAMA SISWA</th>
                                <th>KELAS</th>
                            </tr>
                            <?php 
                            if (isset($_POST['ambil'])) {
                                $id_sis = $_POST['nis'];
                                $dt = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa LIKE '%".$id_sis."%' OR id_siswa LIKE '%".$id_sis."%' GROUP BY id_siswa ASC");
                            
                            $catatan = mysqli_query($koneksi, "SELECT max(id_level_siswa) AS maxCode FROM data_level_siswa");
                            $sqlctn = mysqli_fetch_array($catatan);
                            $cttn = $sqlctn['maxCode'];
                            $noctn = (int) substr($cttn, 3, 7);
                            $noctn++; 
                            $catat = "DLA";
                        while ($dat = mysqli_fetch_array($dt)) { 
                            $no = $dtcatat = $catat . sprintf("%07s", $noctn++);
                            ?>
                            <tr>
                                <td>
                                    <input type="checkbox" id="<?= $dat['id_siswa']; ?>" name="id_siswa[]" value="<?= $dat['id_siswa']; ?>" class="chk-col-red"/>
                                    <label for="<?= $dat['id_siswa']; ?>"><?= $dat['id_siswa']; ?></label>
                                </td>
                                <td>
                                    <input type="text" name="nama_siswa[]" value="<?= $dat['nama_siswa']; ?>" class="form-control" readonly>
                                </td>
                                <td hidden>
                                    <input type="text" name="id_level_siswa[]" value="<?= $no; ?>" class="form-control">
                                    <input type="text" name="id_user[]" value="<?= $_SESSION['id_user']; ?>" class="form-control">
                                </td>
                                <td>
                                    <div class="form-group">
                                    <select class="form-control" name="id_kelas[]">
                                        <option value="">--Pilih Kelas--</option>
                                        <?php 
                                        $sqlkelas = mysqli_query($koneksi, "SELECT * FROM kelas");
                                        while ($dtkls = mysqli_fetch_array($sqlkelas)) {?>
                                            <option value="<?= $dtkls['id_kelas']; ?>"><?= $dtkls['kelas']; ?></option>
                                        <?php } ?>
                                    </select>
                                    </div>
                                </td>
                            </tr>
                        <?php }
                        } ?>
                        </table>
                        <?php if (isset($_POST['ambil'])){ ?>
                            <input type="submit" name="simpan" value="SIMPAN" onclick="return confirm('Apakah anda yakin ingin menyimpan siswa ini ke kelas tersebut?')">
                        <?php }else{ echo "";} ?>
                        
                    </div>
                </form>
            </div>
	   		</div>
    </div>
</div>

<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                DATA SISWA
                            </h2>
                        </div>
                        <div class="body">
                            <form action="" method="POST">
                            <div class="header col-sm-12 bg-blue-grey">
                                <h5>Tampilkan data siswa perkelas</h5>
                                <div class="col-sm-12">
                                    <input name="kelas" type="radio" id="kelas1" value="KLS01" class="with-gap radio-col-red" checked />
                                    <label for="kelas1">KELAS 1</label>
                                    <input name="kelas" type="radio" id="kelas2" value="KLS02" class="with-gap radio-col-red"/>
                                    <label for="kelas2">KELAS 2</label>
                                    <input name="kelas" type="radio" id="kelas3" value="KLS03" class="with-gap radio-col-red"/>
                                    <label for="kelas3">KELAS 3</label>
                                    <input name="kelas" type="radio" id="kelas4" value="KLS04" class="with-gap radio-col-red"/>
                                    <label for="kelas4">KELAS 4</label>
                                    <input name="kelas" type="radio" id="kelas5" value="KLS05" class="with-gap radio-col-red"/>
                                    <label for="kelas5">KELAS 5</label>
                                    <input name="kelas" type="radio" id="kelas6" value="KLS06" class="with-gap radio-col-red"/>
                                    <label for="kelas6">KELAS 6</label>
                                </div>
                                <div class="col-sm-12">
                                    <input name="semester" type="radio" id="semester1" value="SM01" class="with-gap radio-col-red" checked />
                                    <label for="semester1">Semester 1</label>
                                    <input name="semester" type="radio" id="semester2" value="SM02" class="with-gap radio-col-red"/>
                                    <label for="semester2">Semester 2</label>
                                </div>
                                <input type="submit" name="ambil_kelas" value="Tampilkan" class="btn bg-light-blue">
                            </div>    
                            </form>
                            <?php 
                            if (isset($_POST['ambil_kelas'])) {
                                $kls = $_POST['kelas']; $sm = $_POST['semester'];
                                $sq = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester WHERE id_kelas ='".$kls."' AND id_semester='".$sm."'");
                                $dtsq = mysqli_fetch_array($sq);
                                echo "<h5>".$dtsq['kelas']." & ".$dtsq['semester']."</h5>";
                            }
                            ?>
                            <div class="table table-sm table-responsive">
                                <table class="table table-striped table-hover dataTable js-exportable font-11">
                                    <thead>
                                        <tr class="p-0">
                                        <?php 
                                        $kolom = array(
                                            "ID SISWA","NISN", "NIS", "NAMA SISWA", "KELAS","SEMESTER"
                                        );
                                        foreach ($kolom as $key) { 
                                            echo "<th class='bg-light-blue' scope='col'>".$key."</th>";
                                         } ?>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <?php 
                                        if (isset($_POST['ambil_kelas'])) {
                                            $kelas = $_POST['kelas'];
                                            $semester = $_POST['semester'];
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester_2 WHERE id_kelas = '".$kelas."' AND id_semester = '".$semester."'");    
                                        }else{
                                            $siswa_sql = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester_2 WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'");
                                        }
                                        while ($siswa_data = mysqli_fetch_array($siswa_sql)) {?>
                                            <tr><a href="#">
                                                <td><?= $siswa_data['id_siswa']; ?></td>
                                                <td><?= $siswa_data['nisn']; ?></td>
                                                <td><?= $siswa_data['nis']; ?></td>
                                                <td><?= $siswa_data['nama_siswa']; ?></td>
                                                <td><?= $siswa_data['kelas']; ?></td>
                                                <td><?= $siswa_data['semester']; ?></td>
                                            </a>
                                            </tr>
                                        <?php } ?>
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
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Data Siswa</h4>
                        </div>
                        <div class="modal-body">
                            <div class="table table-responsive">
                                <table class="table table-bordered table-hover font-11">
                                    <thead>
                                    <tr>
                                        <?php 
                                        $array = array('NO','Klik NAMA SISWA','Status','JK');
                                        foreach ($array as $key) {
                                            echo "<th>".$key."</th>";
                                        }
                                        ?>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $sqli = mysqli_query($koneksi, "SELECT * FROM data_siswa GROUP BY id_siswa ASC");
                                            $no=1;
                                            while ($sis = mysqli_fetch_array($sqli)) {
                                            $dtsis = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester WHERE id_siswa = '".$sis['id_siswa']."' GROUP BY id_siswa ASC");
                                            $data =  mysqli_num_rows($dtsis);
                                            $adakelas = mysqli_fetch_array($dtsis);
                                                ?>
                                                <tr>
                                                <td><?= $no++; ?></td>
                                                <td>
                                                    <form action="" method="get">
                                                    <?php
                                                    if ($data == 1) { ?>
                                                        <a class="btn bg-blue" href="#"><?= $sis['nama_siswa']; ?></a>
                                                    <?php }else if($sis['id_siswa'] == $dtskl['id_siswa']){ ?>
                                                        <a class="btn bg-red" href="#"><?= $dtskl['nama_siswa']; ?> </a>    
                                                    <?php }else if($data == 0){ ?>
                                                        <a href="?page=tarik_siswa_inkelas&id=<?= $sis['nama_siswa']; ?>" class="btn bg-green"><?= $sis['nama_siswa']; ?></a>
                                                    <?php } ?>
                                                    </form>
                                                </td>
                                                <td>
                                                    <?php
                                                    if ($data == 1 ) { 
                                                        echo "<p style='color: blue;'>ADA DI KELAS ".$adakelas['kelas']."</p>";
                                                    }else if ($sis['id_siswa'] == $dtskl['id_siswa']) {
                                                        echo "<p style='color: red;'>KELUAR</p>";
                                                    }else if ($data == 0) {
                                                        echo "<p style='color: green;'>TIDAK DI KELAS</p>";
                                                    }
                                                    ?>
                                                </td>
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

<?php 
if (isset($_GET['edit'])) {
    
}
?>

