<?php 
include "../../../connect.php";
if (isset($_POST['submit'])) {
	$id_saran = $_POST['id_saran'];
	$id_siswa = $_POST['id_siswa'];
	$nama_siswa = $_POST['nama_siswa'];
	$saran = $_POST['saran'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tgl_raport = $_POST['tgl_raport'];
	$tawal = $_POST['tahun_awal'];
	$takhir = $_POST['tahun_akhir'];

$cek = mysqli_query($koneksi, "SELECT * FROM saran WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$dtcek = mysqli_num_rows($cek);
if ($dtcek == 1) {
	echo "<script>
	alert('Anda sudah menulis saran untuk anak tersebut');
	document.location.href = '../?page=nilai&id=".$nama_siswa."';
	</script>";
}else{

	$sql = mysqli_query($koneksi, "INSERT INTO saran(id_saran, id_siswa, saran, id_kelas, id_semester, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_saran."','".$id_siswa."','".$saran."','".$id_kelas."','".$id_semester."','".$tgl_raport."','".$tawal."','".$takhir."')");
	if ($sql) {
		echo "<script>
		alert('Data berhasil di simpan');
		document.location.href = '../?page=nilai&id=".$nama_siswa."';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal disimpan');
		document.location.href = '../?page=nilai&id=".$nama_siswa."';
		</script>";
	}

}


}
?>