<?php 

$siswa = mysqli_query($koneksi, "SELECT * FROM data_siswa x INNER JOIN agama y ON y.id_agama = x.id_agama 
	WHERE id_siswa = '".$id_siswa."'");
$row = mysqli_fetch_array($siswa);

$sekolah = mysqli_query($koneksi, "SELECT * FROM data_sekolah");
$dts = mysqli_fetch_array($sekolah);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

$spiritual = mysqli_query($koneksi, "SELECT * FROM nilai_raport_spiritual WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
$sprt = mysqli_fetch_array($spiritual);

$sosial = mysqli_query($koneksi, "SELECT * FROM nilai_raport_sosial WHERE id_siswa = '".$id_siswa."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
$sos = mysqli_fetch_array($sosial);


$usr = mysqli_query($koneksi, "SELECT * FROM user WHERE username = '".$xuser."'");
$dtusr = mysqli_fetch_array($usr);

$sql_kkm = mysqli_query($koneksi, "SELECT * FROM satuan_kkm WHERE id_kkm = '1'");
$dtkkm = mysqli_fetch_array($sql_kkm);

//mengambil nilai kkm terkecil dari table mapel
$sqlmapel = mysqli_query($koneksi, "SELECT MIN(pengetahuan) AS pengetahuan, MIN(keterampilan) AS keterampilan,
ROUND((MIN(pengetahuan)+ MIN(keterampilan))/2) AS kkm_min
FROM mapel");
$dtmapel = mysqli_fetch_array($sqlmapel);

?>