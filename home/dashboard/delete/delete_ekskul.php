<?php 
include "../../../connect.php";

$id = $_GET['id'];
$kls = $_GET['kls'];
$sm = $_GET['sm'];

$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sql1 = mysqli_query($koneksi, "DELETE FROM tb_ekskul_wajib WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$kls."' AND id_semester = '".$sm."'");
$sql2 = mysqli_query($koneksi, "DELETE FROM tb_ekskul_pil1 WHERE id_siswa = '".$id."' AND id_kelas ='".$kls."' AND id_semester = '".$sm."'");
$sql3 = mysqli_query($koneksi, "DELETE FROM tb_ekskul_pil2 WHERE id_siswa = '".$id."' AND id_kelas ='".$kls."' AND id_semester = '".$sm."'");
$sql4 = mysqli_query($koneksi, "DELETE FROM tb_ekskul_pil3 WHERE id_siswa = '".$id."' AND id_kelas ='".$kls."' AND id_semester = '".$sm."'");

$del = mysqli_query($koneksi, "DELETE FROM per_ekstrakurikuler WHERE id_siswa = '".$id."' AND id_kelas ='".$kls."' AND id_semester = '".$sm."'");

if ($sql1 && $sql2 && $sql3 && $sql4 && $del) {
	echo "<script>
	alert('Data berhasil dihapus');
	document.location.href = '../?page=nilai&id=".$siswa['nama_siswa']."';
	</script>";
}else{
	echo "<script>
	alert('Data gagal di hapus');
	document.location.href = '../?page=nilai&id=".$siswa['nama_siswa']."';
	</script>";
}
?>