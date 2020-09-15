<?php 

include "../../../connect.php";

if (isset($_POST['simpan_mapel'])) {
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$id_mapel = $_POST['id_mapel'];

	$input = mysqli_query($koneksi, "INSERT INTO roles_mapel(id_kelas, id_semester, id_mapel) VALUES('".$id_kelas."','".$id_semester."','".$id_mapel."')");

	if ($input) {
		echo "<script>
		alert('Data berhasil di simpan');
		document.location.href = '../index?page=kkm';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal di simpan');
		document.location.href = '../index?page=kkm';
		</script>";
	}

}
?>