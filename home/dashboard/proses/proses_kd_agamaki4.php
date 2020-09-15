<?php 
include "../../../connect.php";

	$id_kd = $_POST['id_kda'];
	$nom = $_POST['nom'];
	$nomor_kd = $_POST['nomor_kd'];
	$des = $_POST['deskripsi'];
	$id_mapel = $_POST['id_mapel'];
	$id_agama = $_POST['id_agama'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];


if (isset($_POST['submit'])) {
	$sql = mysqli_query($koneksi, "INSERT INTO kd_agama_ki4(id_kd, nom, nomor_kd, deskripsi, id_mapel, id_agama, id_kelas, id_semester) VALUES('".$id_kd."','".$nom."','".$nomor_kd."','".$des."','".$id_mapel."','".$id_agama."', '".$id_kelas."', '".$id_semester."' )");
	if ($sql) {
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href = '../index.php?page=ki4_pabp';
		</script>";
	}else{
		echo "<script>
		alert(Data gagal dihapus);
		document.location.href = '../index.php?page=ki4_pabp';
		</script>";
	}
}else{
	echo "Gagal";
}
?>