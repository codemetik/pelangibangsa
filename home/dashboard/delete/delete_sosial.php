<?php 
include "../../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "DELETE FROM sikap_sosial WHERE id_sosial ='".$id."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=ki2';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../?page=ki2';
	</script>";
}
?>