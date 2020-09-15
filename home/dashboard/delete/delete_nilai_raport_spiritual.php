<?php 
include "../../../connect.php";

$sql1 = mysqli_query($koneksi, "SELECT * FROM nilai_raport_spiritual WHERE id_nilairaport_sp = '".$_GET['idspiritual']."'");
$dt1 = mysqli_fetch_array($sql1);

$sqlsis = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$dt1['id_siswa']."'");
$dtsis = mysqli_fetch_array($sqlsis);

$sql = mysqli_query($koneksi, "DELETE FROM nilai_raport_spiritual WHERE id_nilairaport_sp = '".$dt1['id_nilairaport_sp']."'");

if ($sql) {
	echo "<script>
	alert('Data berhasil dihapus');
	document.location.href = '../?page=nilai&id=".$dtsis['nama_siswa']."';
	</script>";
}else{
	echo "<script>
	alert('Data gagal dihapus');
	document.location.href = '../?page=nilai&id=".$dtsis['nama_siswa']."';
	</script>";
}
?>