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

$t_ajaran_awal = $_POST['tahun_awal'];
$t_ajaran_akhir = $_POST['tahun_akhir'];

if (isset($_POST['submit'])) {

$sql_siswa = mysqli_query($koneksi, "
	UPDATE data_siswa SET id_siswa ='".$id_siswa."', 
	nisn='".$nisn."', 
	nis= '".$nis."', 
	nama_siswa ='".$nm_siswa."', 
	jk ='".$jk."', 
	tempat_lahir='".$tempat_lahir."', 
	tanggal_lahir='".$tanggal_lahir."', 
	id_agama='".$agama."', 
	pend_sebelumnya='".$pend_sebelumnya."', 
	alamat_serta_didik='".$alamat_didik."', 
	nama_ayah='".$nama_ayah."', 
	nama_ibu='".$nama_ibu."', 
	pekerjaan_ayah='".$pekerjaan_ayah."', 
	pekerjaan_ibu='".$pekerjaan_ibu."', 
	desa_kelurahan='".$kelurahan."', 
	kecamatan='".$kecamatan."', 
	kabupaten_kota='".$kabupaten."', 
	provinsi='".$provinsi."', 
	no_telp_hp='".$no_telp_hp."', 
	nama_wali='".$nama_wali."', 
	pekerjaan_wali='".$pekerjaan_wali."', 
	alamat_wali='".$alamat_wali."', 
	no_telp_hp_wali='".$no_telp_wali."',
	tahun_ajaran_awal = '".$t_ajaran_awal."',
	tahun_ajaran_akhir = '".$t_ajaran_akhir."'
	WHERE id_siswa='".$id_siswa."'
	");
	if ($sql_siswa) {
		echo "<script>
				alert('Data siswa berhasil diupdate.');
				document.location.href = '../index.php?page=data_siswa';
			</script>";
	}else{
		echo "<script>
				alert('Data siswa gagal diupdate.');
				document.location.href = '../index.php?page=data_siswa';
			</script>";
	}
}else{
	echo "Error";
}

?>