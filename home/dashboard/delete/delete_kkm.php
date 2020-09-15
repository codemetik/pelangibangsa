<?php 
include "../../../connect.php";
$sql = mysqli_query($koneksi, "DELETE FROM roles_mapel WHERE id_mapel = '".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=kkm';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../?page=kkm';
	</script>";
}
?>