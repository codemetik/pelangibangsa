<?php 
include "../../../connect.php";

if (isset($_POST['submit'])) {

	$deskrip = $_POST['deskrip'];
	$predikat = $_POST['predikat'];
	$nmsiswa = $_POST['nama_siswa'];
	$idsiswa = $_POST['id_siswa'];
	$idrpt = $_POST['id_nilairaport_sp'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tahun_awal = $_POST['tahun_awal'];
	$tahun_akhir = $_POST['tahun_akhir'];
	$tgl_raport = $_POST['tgl_raport'];

	
$sql = mysqli_query($koneksi, "SELECT * FROM nilai_raport_spiritual WHERE id_siswa = '".$idsiswa."' AND id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."' ");
$cekin = mysqli_num_rows($sql);
if ($cekin == 1) {
	echo "<script>
	alert('Silahkan hapus dahulu nilai sikap Spiritual sebelumnya');
	document.location.href = '../index.php?page=nilai&id=$nmsiswa';
	</script>";
}else{

	//mengambil nilai pertama
		if ($predikat[0] == 'A') {
			$nilai = 4;
			$hasil = 'Sangat baik';
			$des1 = "Ananda ".$nmsiswa.", ".$hasil." dalam ".$deskrip[0];
		}else if ($predikat[0] == 'B') {
			$nilai = 3;
			$hasil = ' Baik';
			$des1 = "Ananda ".$nmsiswa.", ".$hasil." dalam ".$deskrip[0];
		}else if ($predikat[0] == 'C') {
			$nilai = 2;
			$hasil = ' Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan ';
			$des1 = "Ananda ".$nmsiswa.", ".$hasil." dalam ".$deskrip[0];
		}
	//mengambil nilai kedua
		if ($predikat[1] == 'A') {
			$nilai = 4;
			$hasil = 'Sangat baik';
			$des2 = ", dan ".$hasil." dalam ".$deskrip[1];
		}else if ($predikat[1] == 'B') {
			$nilai = 3;
			$hasil = ' Baik';
			$des2 = ", dan ".$hasil." dalam ".$deskrip[1];
		}else if ($predikat[1] == 'C') {
			$nilai = 2;
			$hasil = ' Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan ';
			$des2 = ", dan ".$hasil." dalam ".$deskrip[1];
		}
	//mengambil nilai ketiga
		if ($predikat[2] == 'A') {
			$nilai = 4;
			$hasil = 'Sangat baik';
			$des3 = ", dan ".$hasil." dalam ".$deskrip[2];
		}else if ($predikat[2] == 'B') {
			$nilai = 3;
			$hasil = ' Baik';
			$des3 = ", dan ".$hasil." dalam ".$deskrip[2];
		}else if ($predikat[2] == 'C') {
			$nilai = 2;
			$hasil = ' Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan ';
			$des3 = ", dan ".$hasil." dalam ".$deskrip[2];
		}
	//mengambil nilai keempat
		if ($predikat[3] == 'A') {
			$nilai = 4;
			$hasil = 'Sangat baik';
			$des4 = ", dan ".$hasil." dalam ".$deskrip[3].". ";
		}else if ($predikat[3] == 'B') {
			$nilai = 3;
			$hasil = ' Baik';
			$des4 = ", dan ".$hasil." dalam ".$deskrip[3].". ";
		}else if ($predikat[3] == 'C') {
			$nilai = 2;
			$hasil = ' Dengan bimbingan dan pendampingan yang lebih, akan mampu meningkatkan ';
			$des4 = ", dan ".$hasil." dalam ".$deskrip[3].". ";
		}
// 4	4	4	4	16
// 3	3	3	3	12
// 2	2	2	2	8
// 				36

	//menghitung predikat
		if ($nilai >= 3) {
			$nil = 'A';
			$hasilnya = 'Sangat baik';
		}else if ($nilai <= 2) {
			$nil = 'B';
			$hasilnya = 'baik';
		}else if ($nilai <= 2) {
			$nil = 'C';
			$hasilnya = 'Perlu bimbingan';
		}

		$nilainnya = $nil;
		$des = $des1.""."".$des2."".$des3."".$des4;

	// $des = "Ananda ".$nmsiswa.", ".$hasil." dalam sikap ".$sb1.", ".$pb1;
	// $des = "Ananda ".$nmsiswa.", ".$hasil." dalam sikap ". implode(", dan ", $deskrip);
	//$nilai, $hasil, $des;

	$query = mysqli_query($koneksi, "INSERT INTO nilai_raport_spiritual(id_nilairaport_sp, id_siswa, nilai, predikat, deskripsi, id_kelas, id_semester, tgl_raport, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$idrpt."','".$idsiswa."', '".$nilainnya."','".$hasilnya."','".$des."', '".$id_kelas."','".$id_semester."','".$tgl_raport."','".$tahun_awal."','".$tahun_akhir."')");
	if ($query) {
		echo "<script>
		alert('Data berhasil masuk');
		document.location.href = '../index.php?page=nilai&id=$nmsiswa';
		</script>";
	}else{
		echo "<script>
		document.location.href = '../index.php?page=nilai&id=$nmsiswa';
		<script>";
	}	

}// } tutup

}
?>