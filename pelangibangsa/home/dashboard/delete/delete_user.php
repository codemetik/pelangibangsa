<?php 
include "../../../connect.php";

$id_user = $_GET['id'];

$sql = mysqli_query($koneksi, "DELETE FROM user WHERE id_user = '".$id_user."'");
if ($sql) {
	echo "<script>
	alert('Data User berhasil dihapus');
	document.location.href = '../../admin.php?page=data_user';
	</script>";
}else{
	echo "<script>
	alert('Data User dihapus dari semester ini');
	document.location.href = '../../admin.php?page=data_user';
	</script>";
}
?>