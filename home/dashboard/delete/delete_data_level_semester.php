<?php 
include "../../../connect.php";

$id_level_semester = $_GET['id'];

$sql = mysqli_query($koneksi, "DELETE FROM data_level_semester WHERE id_level_semester = '".$id_level_semester."'");
if ($sql) {
	echo "<script>
	alert('Siswa berhasil dihapus dari semester ini');
	document.location.href = '../?page=tarik_siswa_insemester';
	</script>";
}else{
	echo "<script>
	alert('Siswa gagal dihapus dari semester ini');
	document.location.href = '../?page=tarik_siswa_insemester';
	</script>";
}
?>