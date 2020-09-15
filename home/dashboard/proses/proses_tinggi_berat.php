<?php 
include "../../../connect.php";

if (isset($_POST['submit'])) {
	$nama_siswa = $_POST['nama_siswa'];
	$id_tbb = $_POST['id_tbb'];
	$id_siswa = $_POST['id_siswa'];
	$tinggi_badan = $_POST['tinggi_badan'];
	$berat_badan = $_POST['berat_badan'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tgl_raport = $_POST['tgl_raport'];
	$tawal = $_POST['tahun_awal'];
	$takhir = $_POST['tahun_akhir'];

$sqlcek = mysqli_query($koneksi, "SELECT * FROM tinggi_berat_badan WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$cek = mysqli_num_rows($sqlcek);
if ($cek == 1) {
	echo "<script>
	alert('Data sudah ada');
	document.location.href = '../?page=nilai&id=".$nama_siswa."';
	</script>";
}else{

	$sql = mysqli_query($koneksi, "INSERT INTO tinggi_berat_badan(id_tbb, id_siswa , tinggi_badan, berat_badan, id_kelas, id_semester, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_tbb."','".$id_siswa."','".$tinggi_badan."','".$berat_badan."','".$id_kelas."','".$id_semester."','".$tgl_raport."','".$tawal."','".$takhir."')");
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