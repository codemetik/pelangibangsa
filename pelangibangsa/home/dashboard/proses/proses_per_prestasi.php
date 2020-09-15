<?php 
include "../../../connect.php";


if (isset($_POST['submit'])) {


$idsiswa = $_POST['id_siswa'];
$nama_siswa = $_POST['nama_siswa'];
$id_prestasi = $_POST['id_prestasi'];
$jn_prestasi = $_POST['jenis_prestasi'];
$ket = $_POST['keterangan'];

$tgl_raport = $_POST['tgl_raport'];
$tawal = $_POST['tahun_awal'];
$takhir = $_POST['tahun_akhir'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];

$count = count($idsiswa);

$sql = "INSERT INTO per_prestasi(id_siswa, id_kelas, id_semester, id_prestasi, jenis_prestasi, keterangan, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES";
for ($i=0; $i < $count; $i++) { 
	$sql .= "('{$idsiswa[$i]}', '{$id_kelas[$i]}', '{$id_semester[$i]}','{$id_prestasi[$i]}','{$jn_prestasi[$i]}','{$ket[$i]}','{$tgl_raport[$i]}','{$tawal[$i]}','{$takhir[$i]}')";
	$sql .= ",";
}
$sql = rtrim($sql,",");
$insert = $koneksi->query($sql);
if (!$insert) {
	echo "<script>
	alert('Data Gagal di simpan ".$koneksi->error."');
	document.location.href = '../index.php?page=nilai&id=".$nama_siswa."';
	</script>";
}else{
	echo "<script>
	alert('Data Berhasil di simpan');
	document.location.href = '../index.php?page=nilai&id=".$nama_siswa."';
	</script>";
}
}
?>