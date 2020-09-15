<?php 
include "../../../connect.php";
$sql = mysqli_query($koneksi, "DELETE FROM jurnal_sosial WHERE id_jurnal_so = '".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=ki2';
	</script>";
}else{
	echo "<script>
	alert('Data gagal dihapus');
	document.location.href = '../?page=ki2';
	</script>";
}
?>