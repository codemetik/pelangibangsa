<?php 
include "../../../connect.php";

$ki3 = mysqli_query($koneksi, "SELECT max(id_nilairaport) AS maxCode FROM nilai_raport_ki3");
$data_ki3 = mysqli_fetch_array($ki3);
$ki_3 = $data_ki3['maxCode'];
$nOki3 = (int) substr($ki_3, 4, 7);
$nOki3++; 
$charki3 = "KI-3";
$dataki3 = $charki3 . sprintf("%07s", $nOki3);

if (isset($_POST['simpan'])) {

$id_nilairaport = $dataki3;
$id_siswa = $_POST['id_siswa'];
$id_mapel = $_POST['id_mapel'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];
$nama_mapel = $_POST['nama_mapel'];
$tgl_raport = $_POST['tgl_raport'];
$tahun_awal = $_POST['tahun_awal'];
$tahun_akhir = $_POST['tahun_akhir'];
$nilai = $_POST['nilai'];
$predikat = $_POST['predikat'];
$deskripsi = $_POST['deskripsi'];	

$siswa = mysqli_query($koneksi, "SELECT * FROM data_siswa where id_siswa = '".$id_siswa."'");
$nm_siswa = mysqli_fetch_array($siswa);

$sql = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_siswa = '".$id_siswa."' AND id_mapel = '".$id_mapel."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
$search = mysqli_num_rows($sql);
if ($search == 1) {
	echo "<script>
	alert('Data sudah ada');
	document.location.href = '../?page=nilai&id=".$nm_siswa['nama_siswa']."';
	</script>";
}else{
	
	$input = mysqli_query($koneksi, " INSERT INTO nilai_raport_ki3(id_nilairaport, id_siswa, id_mapel, id_kelas, id_semester, nama_mapel, nilai, predikat, deskripsi, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir)VALUES('".$id_nilairaport."','".$id_siswa."','".$id_mapel."','".$id_kelas."','".$id_semester."','".$nama_mapel."','".$nilai."','".$predikat."','".$deskripsi."','".$tgl_raport."','".$tahun_awal."','".$tahun_akhir."')");
	if ($input) {
		echo "<script>
	alert('Data Berhasil disimpan');
	document.location.href = '../?page=nilai&id=".$nm_siswa['nama_siswa']."';
	</script>";
	}else{
		echo "<script>
	alert('Data Gagal disimpan');
	document.location.href = '../?page=nilai&id=".$nm_siswa['nama_siswa']."';
	</script>";
	}
}

}
?>