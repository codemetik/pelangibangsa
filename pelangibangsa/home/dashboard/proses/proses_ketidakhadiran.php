<?php 
include "../../../connect.php";

if (isset($_POST['submit'])) {
	$nama_siswa = $_POST['nama_siswa'];
	$id_kehadiran = $_POST['id_kehadiran'];
	$id_siswa = $_POST['id_siswa'];
	$sakit = $_POST['sakit'];
	$ijin = $_POST['ijin'];
	$tanpa_keterangan = $_POST['tanpa_keterangan'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tgl_raport = $_POST['tgl_raport'];
	$tawal = $_POST['tahun_awal'];
	$takhir = $_POST['tahun_akhir'];

	$total_tidak_masuk = $sakit + $ijin + $tanpa_keterangan;
	
$sqlcek = mysqli_query($koneksi, "SELECT * FROM ketidakhadiran WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$cek = mysqli_num_rows($sqlcek);
if ($cek == 1) {
	echo "<script>
	alert('Data sudah ada');
	document.location.href = '../?page=nilai&id=".$nama_siswa."';
	</script>";
}else{

	$sql = mysqli_query($koneksi, "INSERT INTO ketidakhadiran(id_kehadiran, id_siswa, sakit, ijin, tanpa_keterangan, total_tidak_masuk, id_kelas, id_semester, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_kehadiran."','".$id_siswa."','".$sakit."','".$ijin."','".$tanpa_keterangan."', '".$total_tidak_masuk."','".$id_kelas."','".$id_semester."', '".$tgl_raport."', '".$tawal."','".$takhir."')");
	if ($sql) {
		echo "<script>
		alert('Data berhasil di simpan');
		document.location.href = '../?page=nilai&id=".$nama_siswa."';
		</script>";
	}else{
		echo "<script>
		alert('Data Gagal disimpan');
		document.location.href = '../?page=nilai&id=".$nama_siswa."';
		</script>";
	}
}

}
?>