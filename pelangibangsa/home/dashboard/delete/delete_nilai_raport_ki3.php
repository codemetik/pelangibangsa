<?php 
include "../../../connect.php";
$sql = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_nilairaport = '".$_GET['idnilai']."'");
$data = mysqli_fetch_array($sql);
$siswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$sis = mysqli_fetch_array($siswa);

$sql1 = mysqli_query($koneksi, "DELETE FROM nilai_raport_ki3 WHERE id_nilairaport = '".$data['id_nilairaport']."'");
if ($sql1) {
	echo "<script>
	alert('Data berhasil dihapus');
	document.location.href = '../?page=nilai&id=".$sis['nama_siswa']."';
	</script>";
}else{
	echo "<script>
	alert('data gagal dihapus');
	document.location.href= '../?page=nilai&id=".$sis['nama_siswa']."';
	</script>";
}
?>