<?php 
include "../../../connect.php";

if (isset($_POST['submit'])) {

	$nama_sekolah = $_POST['nama_sekolah'];
	$npsn = $_POST['npsn'];
	$alamat_sekolah = $_POST['alamat_sekolah'];
	$kode_pos = $_POST['kode_pos'];
	$kelurahan_desa = $_POST['kelurahan_desa'];
	$kecamatan = $_POST['kecamatan'];
	$kabupaten_kota = $_POST['kabupaten_kota'];
	$provinsi = $_POST['provinsi'];
	$telp = $_POST['telp'];
	$website = $_POST['website'];
	$kepala_sekolah = $_POST['kepala_sekolah'];
	// $niy = $_POST['niy']; 
	$semester = $_POST['semester'];
	$tahun_pelajaran = $_POST['tahun_pelajaran'];
	$guru_kelas_wali = $_POST['guru_kelas_wali'];
	$nuptk = $_POST['nuptk'];
	// $tmpt_wkt_pemetaan_kd = $_POST['tmpt_wkt_pemetaan_kd'];
	// $tmpt_wkt_analisis_kkm = $_POST['tmpt_wkt_analisis_kkm'];
	$tmpt_wkt_pembagian_raport = $_POST['tmpt_wkt_pembagian_raport'];
	// $banyak_mulok_diberikan = $_POST['banyak_mulok_diberikan'];
	$email = $_POST['email'];
	$id_sekolah = $_POST['id_sekolah'];

	$sql = mysqli_query($koneksi, "UPDATE data_sekolah SET 
	nama_sekolah = '".$nama_sekolah."', 
	npsn =  '".$npsn."', 
	alamat_sekolah =  '".$alamat_sekolah."', 
	kode_pos =  '".$kode_pos."', 
	kelurahan_desa =  '".$kelurahan_desa."', 
	kecamatan =  '".$kecamatan."', 
	kabupaten_kota =  '".$kabupaten_kota."', 
	provinsi =  '".$provinsi."', 
	telp =  '".$telp."', 
	website =  '".$website."', 
	kepala_sekolah =  '".$kepala_sekolah."',
	semester =  '".$semester."', 
	tahun_pelajaran =  '".$tahun_pelajaran."', 
	guru_kelas_wali =  '".$guru_kelas_wali."', 
	nuptk =  '".$nuptk."',
	tmpt_wkt_pembagian_raport ='".$tmpt_wkt_pembagian_raport."',
	email =  '".$email."', 
	id_sekolah =  '".$id_sekolah."'
	WHERE id_sekolah =  '".$id_sekolah."'");

	if ($sql) {
		echo "<script>
		alert('Data berhasil di update');
		document.location.href = '../index.php?page=data_sekolah';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal diupdate');
		document.location.href = '../index.php?page=data_sekolah';
		</script>";
	}

}
?>