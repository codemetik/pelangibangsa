<?php 
include "../../../connect.php";

	$id_lsiswa = $_GET['id'];

	$sql = mysqli_query($koneksi, "DELETE FROM data_level_siswa WHERE id_level_siswa = '".$id_lsiswa."'");
	if ($sql) {
		echo "<script>
		alert('Siswa berhasil di hapus dari kelas ini');
		document.location.href = '../../admin.php?page=data_kelas';
		</script>";
	}else{
		echo "<script>
		alert('Mohon hapus ter lebih dahulu data siswa per semesternya');
		document.location.href = '../../admin.php?page=data_kelas';
		</script>";
	}

?>