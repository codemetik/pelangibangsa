<?php 
include "../../../connect.php";
$sql = mysqli_query($koneksi, "DELETE FROM ekstrakurikuler WHERE id_ekstra = '".$_GET['id']."'");

if ($sql) {
	echo "<script>
	alert('Data berhasil dihapus');
	document.location.href = '../?page=ekp';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../?page=ekp';
	</script>";
}
?>