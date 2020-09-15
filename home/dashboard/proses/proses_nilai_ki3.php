<?php 
//proses nilai dari page penilaian pengetahuan
include "../../../connect.php";
if (isset($_POST['submit'])) {
$idraport = $_POST['id_nilairaport'];
$idsiswa = $_POST['id_siswa'];
$idmapel = $_POST['id_mapel'];
$nilai = $_POST['nilai'];
$predikat = $_POST['predikat'];
$deskripsi = $_POST['description'];

	$sql = mysqli_query($koneksi, "INSERT INTO nilai_raport_ki3(id_nilairaport, id_siswa, id_mapel, nilai, predikat, deskripsi) VALUES('$idraport', '$idsiswa','$idmapel','$nilai','$predikat','$deskripsi')");
	if ($sql) {
		echo "<script>
		alert('Data berhasil di simpan');
		document.location.href = '../index.php?page=nilai';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal di simpan');
		document.location.href = '../index.php?page=nilai';
		</script>";
	}
}
?>