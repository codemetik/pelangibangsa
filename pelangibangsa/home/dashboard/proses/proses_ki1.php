<?php 
include "../../../connect.php";

$id_sp = $_POST['id_jurnal_sp'];
$tanggal = $_POST['tanggal'];
$nm_siswa = $_POST['nama_siswa'];
$ki = $_POST['ki'];
$cttn_perilaku = $_POST['cttn_perilaku'];
$butir_sikap = $_POST['butir_sikap'];
$tindak_lanjut = $_POST['tindak_lanjut'];
$sb = $_POST['sb'];
$pb = $_POST['pb'];

if (isset($_POST['submit'])) {
	$sqlki1 = mysqli_query($koneksi, "INSERT INTO jurnal_spiritual(id_jurnal_sp, tanggal, nama_siswa, ki, catatan_perilaku, butir_sikap, tindak_lanjut, sb, pb) VALUES('$id_sp','$tanggal','$nm_siswa','$ki','$cttn_perilaku','$butir_sikap','$tindak_lanjut','$sb','$pb')");
	if ($sqlki1) {
		echo "<script>
		alert('Data berhasil masuk');
		document.location.href = '../index.php?page=ki1';
		</script>";
	}else{
		echo "<script>
			alert('Data gagal masuk');
			document.location.href = '../index.php?page=ki1';
		</script>";
	}
}else{
	echo "Error";
}

?>