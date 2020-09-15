<?php 
include "../../../connect.php";

$id_kd = $_POST['id_kd_keterampilan'];
$nom = $_POST['nom'];
$nomor_kd = $_POST['nomor_kd'];
$deskripsi = $_POST['deskripsi'];
$id_mapel = $_POST['id_mapel'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];

if (isset($_POST['submit'])) {
	$sql_kd = mysqli_query($koneksi, "INSERT INTO kd_keterampilan(id_kd, nom, nomor_kd, deskripsi, id_mapel, id_kelas, id_semester) 
		VALUES('$id_kd','$nom','$nomor_kd','$deskripsi','$id_mapel','$id_kelas','$id_semester')");
	if ($sql_kd) {
		echo "<script>
		alert('Data berhasil masuk');
		document.location.href = '../index.php?page=ki4';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal masuk');
		document.location.href = '../index.php?page=ki4';
		</script>";
	}
}else{
	echo "Error";
}

?>
