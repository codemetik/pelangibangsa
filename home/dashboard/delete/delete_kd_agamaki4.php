<?php 
include "../../../connect.php";

$sql = mysqli_query($koneksi, "DELETE FROM kd_agama_ki4 WHERE id_kd ='".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=ki4_pabp';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../?page=ki4_pabp';
	</script>";
}
?>