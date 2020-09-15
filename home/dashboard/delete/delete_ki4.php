<?php 
include "../../../connect.php";
$sql = mysqli_query($koneksi, "DELETE FROM kd_keterampilan WHERE id_kd = '".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../index?page=ki4';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../index?page=ki4';
	</script>";
}
?>