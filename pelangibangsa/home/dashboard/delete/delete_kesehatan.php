<?php 
include "../../../connect.php";

$sql = mysqli_query($koneksi, "DELETE FROM kesehatan WHERE id_kesehatan ='".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=ekp';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../?page=ekp';
	</script>";
}
?>