<?php 
include "../../../connect.php";
$sql = mysqli_query($koneksi, "DELETE FROM jurnal_spiritual WHERE id_jurnal_sp = '".$_GET['id']."'");
if ($sql) {
	echo "<script>
	alert('Data berhasil di hapus');
	document.location.href = '../?page=ki1';
	</script>";
}else{
	echo "<script>
	alert('Data gagal dihapus');
	document.location.href = '../?page=ki1';
	</script>";
}
?>