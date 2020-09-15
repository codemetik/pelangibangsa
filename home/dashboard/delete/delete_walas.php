<?php 
include "../../../connect.php";

$id_user = $_GET['id'];

$sql = mysqli_query($koneksi, "DELETE FROM user WHERE id_user = '".$id_user."'");

$sql1 = mysqli_query($koneksi, "DELETE FROM master_level WHERE id_user = '".$id_user."'");

if ($sql && $sql1) {
	echo "<script>
	alert('Data User berhasil dihapus');
	document.location.href = '../../admin.php?page=data_user';
	</script>";
}else{
	echo "<script>
	alert('Data User gagal dihapus');
	document.location.href = '../../admin.php?page=data_user';
	</script>";
}
?>