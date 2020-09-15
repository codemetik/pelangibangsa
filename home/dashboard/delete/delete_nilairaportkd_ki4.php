<?php 
include "../../../connect.php";

$sql = mysqli_query($koneksi, "DELETE FROM nilai_raportkd_ki4 WHERE id_raportkd = '".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data Berhasil dihapus');
	document.location.href = '../?page=nilai';
	</script>";
}
?>