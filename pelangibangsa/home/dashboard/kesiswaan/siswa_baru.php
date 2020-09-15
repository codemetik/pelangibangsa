<?php 
$sqlsiswa = mysqli_query($koneksi, "SELECT max(id_siswa) AS maxCode FROM data_siswa");
        $dtsiswa = mysqli_fetch_array($sqlsiswa);
        $datsiswa = $dtsiswa['maxCode'];
        $nOsis = (int) substr($datsiswa, 3, 7);
        $nOsis++; 
        $charsis = "SIS";
        $datsiswa = $charsis . sprintf("%07s", $nOsis);
?>

<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Siswa</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Siswa baru</b></i></li>
  </ol>
</nav>

<!-- Basic Examples -->
                
                    <div class="card bg-white">
                        <div class="header bg-indigo">
                            <h2>
                                SISWA
                                <small>Data Siswa.</small>
                            </h2>
                            <!-- <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul> -->
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $datsiswa; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nisn" required>
                                                    <label class="form-label">NISN*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nis" required>
                                                    <label class="form-label">NIS*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_siswa" required>
                                                    <label class="form-label">NAMA SISWA*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <p>
                                                            <b>JENIS KELAMIN*</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="jk">
                                                            <?php 
                                                            $sqljk = mysqli_query($koneksi, "SELECT * FROM jenis_kelamin");
                                                            while ($jk = mysqli_fetch_array($sqljk)) { ?>
                                                                <option value="<?= $jk['singkatan']; ?>"><?= $jk['kelamin']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="tempat_lahir" required>
                                                    <label class="form-label">TEMPAT LAHIR*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <label class="form-label">TANGGAL LAHIR*</label>
                                                    <input type="date" class="form-control" name="tanggal_lahir">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-4">
                                                        <p>
                                                            <b>AGAMA*</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_agama">
                                                            <?php 
                                                            include "../../connect.php";
                                                            $agama = mysqli_query($koneksi, "SELECT * FROM agama");
                                                            while ($dat = mysqli_fetch_array($agama)) { ?>
                                                                <option value="<?= $dat['id_agama']; ?>"><?= $dat['agama']; ?></option>
                                                            <?php }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pend_sebelumnya" required>
                                                    <label class="form-label">PENDIDIKAN SEBELUMNYA*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_didik" required>
                                                    <label class="form-label">ALAMAT PESERTA DIDIK*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_ayah" required>
                                                    <label class="form-label">NAMA AYAH*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_ibu" required>
                                                    <label class="form-label">NAMA IBU*</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_ayah">
                                                    <label class="form-label">PEKERJAAN AYAH</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_ibu">
                                                    <label class="form-label">PEKERJAAN IBU</label>
                                                </div>
                                            </div>
                                </div>
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                                            <div class="row">
                                            <div class="col-md-3">
                                            <!-- <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="jalan">
                                                    <label class="form-label">Jalan</label>
                                                </div>
                                            </div> -->
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kelurahan">
                                                    <label class="form-label">Kelurahan/Desa</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kecamatan">
                                                    <label class="form-label">Kecamatan</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kabupaten">
                                                    <label class="form-label">Kabupaten/Kota</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="provinsi">
                                                    <label class="form-label">Provinsi</label>
                                                </div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_telp_hp">
                                                    <label class="form-label">No.Telp/Hp</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nama_wali">
                                                    <label class="form-label">NAMA WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="pekerjaan_wali">
                                                    <label class="form-label">PEKERJAAN WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="alamat_wali">
                                                    <label class="form-label">ALAMAT WALI</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_telp_wali">
                                                    <label class="form-label">No.Telp/Hp</label>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="header">
                                                    <h2>Tahun Ajaran</h2>
                                                </div>
                                                <div class="body">
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_awal">
                                                            <label class="form-label">Tahun Awal</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <input type="text" class="form-control" name="tahun_akhir">
                                                            <label class="form-label">Tahun akhir</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox" id="checkbox" name="checkbox">
                                                <label for="checkbox">I have read and accept the terms</label>
                                            </div>
                                            <button class="btn bg-indigo waves-effect" type="submit" name="submit">SUBMIT</button>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                    </div>
                
<!-- #END# Basic Examples -->
<?php 

if (isset($_POST['submit'])) {

$id_siswa = $_POST['id_siswa'];
$nisn = $_POST['nisn'];
$nis = $_POST['nis'];
$nm_siswa = $_POST['nama_siswa'];
$jk = $_POST['jk'];
$tempat_lahir = $_POST['tempat_lahir'];
$tanggal_lahir = $_POST['tanggal_lahir'];
$agama = $_POST['id_agama'];
$pend_sebelumnya = $_POST['pend_sebelumnya'];
$alamat_didik = $_POST['alamat_didik'];
$nama_ayah = $_POST['nama_ayah'];
$nama_ibu = $_POST['nama_ibu'];
$pekerjaan_ayah = $_POST['pekerjaan_ayah'];
$pekerjaan_ibu = $_POST['pekerjaan_ibu'];
// $jalan = $_POST['jalan'];
$kelurahan = $_POST['kelurahan'];
$kecamatan = $_POST['kecamatan'];
$kabupaten = $_POST['kabupaten'];
$provinsi = $_POST['provinsi'];
$no_telp_hp = $_POST['no_telp_hp'];
$nama_wali = $_POST['nama_wali'];
$pekerjaan_wali = $_POST['pekerjaan_wali'];
$alamat_wali = $_POST['alamat_wali'];
$no_telp_wali = $_POST['no_telp_wali'];

date_default_timezone_set('Asia/Jakarta'); 
$date_masuk = date("Y-m-d h:i:s");

$t_ajaran_awal = $_POST['tahun_awal'];
$t_ajaran_akhir = $_POST['tahun_akhir'];

$sql_siswa = mysqli_query($koneksi, "INSERT INTO data_siswa(
    id_siswa, nisn, nis, nama_siswa, jk, tempat_lahir, tanggal_lahir, id_agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu, desa_kelurahan, kecamatan, kabupaten_kota, provinsi, no_telp_hp, nama_wali, pekerjaan_wali, alamat_wali, no_telp_hp_wali, tgl_masuk_siswa,tahun_ajaran_awal, tahun_ajaran_akhir) 
    VALUES('".$id_siswa."','".$nisn."','".$nis."','".$nm_siswa."','".$jk."','".$tempat_lahir."','".$tanggal_lahir."','".$agama."','".$pend_sebelumnya."','".$alamat_didik."','".$nama_ayah."','".$nama_ibu."','".$pekerjaan_ayah."','".$pekerjaan_ibu."','".$kelurahan."','".$kecamatan."','".$kabupaten."','".$provinsi."','".$no_telp_hp."','".$nama_wali."','".$pekerjaan_wali."','".$alamat_wali."','".$no_telp_wali."','".$date_masuk."','".$t_ajaran_awal."','".$t_ajaran_akhir."')");
    if ($sql_siswa) {
        echo "<script>
                alert('Data berhasil masuk.');
                document.location.href = '?page=data_siswa';
            </script>";
    }else{
        echo "<script>
                alert('Data gagal masuk.');
                document.location.href = '?page=data_siswa';
            </script>";
    }
}else{
    echo "Error";
}

?>