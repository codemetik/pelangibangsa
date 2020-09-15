<?php 
include "../../../connect.php";

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

$id_level_siswa = $_POST['id_level_siswa'];
$id_level_semester = $_POST['id_level_semester'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];
$id_user = $_POST['id_user'];

if (isset($_POST['submit'])) {

$sql_siswa = mysqli_query($koneksi, "INSERT INTO data_siswa(
	id_siswa, nisn, nis, nama_siswa, jk, tempat_lahir, tanggal_lahir, id_agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu, desa_kelurahan, kecamatan, kabupaten_kota, provinsi, no_telp_hp, nama_wali, pekerjaan_wali, alamat_wali, no_telp_hp_wali, tgl_masuk_siswa,tahun_ajaran_awal, tahun_ajaran_akhir) 
	VALUES('".$id_siswa."','".$nisn."','".$nis."','".$nm_siswa."','".$jk."','".$tempat_lahir."','".$tanggal_lahir."','".$agama."','".$pend_sebelumnya."','".$alamat_didik."','".$nama_ayah."','".$nama_ibu."','".$pekerjaan_ayah."','".$pekerjaan_ibu."','".$kelurahan."','".$kecamatan."','".$kabupaten."','".$provinsi."','".$no_telp_hp."','".$nama_wali."','".$pekerjaan_wali."','".$alamat_wali."','".$no_telp_wali."','".$date_masuk."','".$t_ajaran_awal."','".$t_ajaran_akhir."')");

$sql_kelas = mysqli_query($koneksi, "INSERT INTO data_level_siswa(id_level_siswa, id_siswa, id_kelas, id_user) VALUES('".$id_level_siswa."','".$id_siswa."','".$id_kelas."','".$id_semester."')");

$sql_semester = mysqli_query($koneksi, "INSERT INTO data_level_semester(id_level_semester, id_level_siswa, id_semester) VALUES('".$id_level_semester."','".$id_level_siswa."','".$id_semester."')");

	if ($sql_siswa && $sql_kelas && $sql_semester) {
		echo "<script>
				alert('Data berhasil masuk.');
				document.location.href = '../index.php?page=data_siswa';
			</script>";
	}else{
		echo "<script>
				alert('Data gagal masuk.');
				document.location.href = '../index.php?page=data_siswa';
			</script>";
	}
}else{
	echo "Error";
}

?>