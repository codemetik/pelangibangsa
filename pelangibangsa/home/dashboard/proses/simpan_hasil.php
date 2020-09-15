<?php
include "../../../connect.php";


if (isset($_POST['simpan'])) {

$id_siswa = $_POST['id_siswa'];
$nama_siswa = $_POST['nama_siswa'];
$id_mapel = $_POST['id_mapel'];
$id_kelas = $_POST['id_kelas'];
$id_semester = $_POST['id_semester'];
$nmapel = $_POST['nama_mapel'];
$nilai = $_POST['nilai'];
$predikat = $_POST['predikat'];
$deskrip = $_POST['deskripsi'];
$tawal = $_POST['tahun_awal'];
$takhir = $_POST['tahun_akhir'];
$tgl_raport = $_POST['tgl_raport'];

	$sqlcek = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_siswa = '".$id_siswa."' AND id_mapel = '".$id_mapel."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
	$datacek = mysqli_num_rows($sqlcek);
if ($datacek == 1) {
	echo "<script>
	alert('Silahkan hapus nilai PENGETAHUAN sebelumnya, jika ingin update nilai mapel terbaru.');
	document.location.href = '../?page=nilai&id=".$nama_siswa."';
	</script>";
}else{


		$kd = mysqli_query($koneksi, "SELECT max(id_nilairaport) AS maxCode FROM nilai_raport_ki3");
        $hasil = mysqli_fetch_array($kd);
        $has = $hasil['maxCode'];
        $nOkd = (int) substr($has, 6, 7);
        $nOkd++; 
        $kdc = "kkmki3";
        $id_raport = $kdc . sprintf("%07s", $nOkd);

	$sql = mysqli_query($koneksi, "INSERT INTO nilai_raport_ki3(id_nilairaport, id_siswa, id_mapel, id_kelas, id_semester, nama_mapel, nilai, predikat, deskripsi, tgl_raport,tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$id_raport."','".$id_siswa."','".$id_mapel."', '".$id_kelas."', '".$id_semester."','".$nmapel."','".$nilai."','".$predikat."','".$deskrip."', '".$tgl_raport."','".$tawal."','".$takhir."')");
	if ($sql) {
		echo "<script>
		alert('Data nilai berhasil disimpan');
		document.location.href = '../?page=nilai&id=".$nama_siswa."';
		</script>";
		}else{
			echo "<script>
			alert(Data gagal disimpan);
			document.location.href = '../?page=nilai&id=".$nama_siswa."';
			</script>";
		}
}//tutup cek

}
?>