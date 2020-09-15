<?php 
include "../../../connect.php";

$id_so = $_POST['id_jurnal_so'];
$tanggal = $_POST['tanggal'];
$nm_siswa = $_POST['nama_siswa'];
$ki = $_POST['ki'];
$cttn_perilaku = $_POST['cttn_perilaku'];
$butir_sikap = $_POST['butir_sikap'];
$tindak_lanjut = $_POST['tindak_lanjut'];
$sb = $_POST['sb'];
$pb = $_POST['pb'];

if (isset($_POST['submit'])) {
	$datasql = mysqli_query($koneksi, "INSERT INTO jurnal_sosial(id_jurnal_so, tanggal, nama_siswa, ki, catatan_perilaku, butir_sikap, tindak_lanjut, sb, pb) VALUES('$id_so','$tanggal','$nm_siswa','$ki','$cttn_perilaku','$butir_sikap','$tindak_lanjut','$sb','$pb')");
	if ($datasql) {
			echo "<script>
			alert('Data behasil masuk');
			document.location.href = '../index.php?page=ki2';
			</script>";
		}else{
			echo "<script>
			alert('Data gagal masuk');
			document.location.href = '../index.php?page=ki2';
			<script>";
		}
}else{
	echo "Error";
}


?>