<?php 
include "../../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "DELETE FROM tema WHERE id_tema ='".$id."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=kkm';
	</script>";
}else{
	echo "<script>
	alert('Data gagal dihapus');
	document.location.href='../?page=kkm';
	</script>";
}
?>