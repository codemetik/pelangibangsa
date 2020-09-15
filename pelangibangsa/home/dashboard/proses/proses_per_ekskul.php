<?php 
include "../../../connect.php";


if (isset($_POST['submit'])) {


$idsiswa = $_POST['id_siswa'];
$nama_siswa = $_POST['nama_siswa'];
$id_ekstra = $_POST['id_ekstra'];
$kegiatan = $_POST['kegiatan'];
$ket = $_POST['keterangan'];
$tgl_raport = $_POST['tgl_raport'];
$tawal = $_POST['tahun_awal'];
$takhir = $_POST['tahun_akhir'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];

// $coun = count($idsiswa);

// for ($j=0; $j < $coun; $j++) { 
// 	$sql_cel = mysqli_query($koneksi, "SELECT * FROM per_ekstrakurikuler WHERE id_siswa = '".$idsiswa[$j]."'");
// 	$cek = mysqli_num_rows($sql_cel);	

// if ($cek == 1) {
// 	echo "<script>
// 	alert('Data sudah ada');
// 	document.location.href = '../index.php?page=nilai';
// 	<script>";
// }else{

$count = count($idsiswa);

$sql = "INSERT INTO per_ekstrakurikuler(id_siswa, id_kelas, id_semester, id_ekstra,kegiatan, keterangan, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES";
for ($i=0; $i < $count; $i++) { 
	$sql .= "('{$idsiswa[$i]}', '{$id_kelas[$i]}', '{$id_semester[$i]}','{$id_ekstra[$i]}','{$kegiatan[$i]}','{$ket[$i]}','{$tgl_raport[$i]}','{$tawal[$i]}','{$takhir[$i]}')";
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

//}//tutup

}

//}
?>