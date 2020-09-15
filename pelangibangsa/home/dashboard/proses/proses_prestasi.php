<?php 
include "../../../connect.php";
$id_prestasi = $_POST['id_prestasi'];
$no = $_POST['no'];
$prestasi = $_POST['prestasi'];

if (isset($_POST['submit'])) {
	$sqlprestasi = mysqli_query($koneksi, "INSERT INTO prestasi(id_prestasi, no, jenis_prestasi) VALUES('$id_prestasi','$no','$prestasi')");
	if ($sqlprestasi) {
		echo "<script>
			alert('Data berhasil masuk.');
			document.location.href = '../index.php?page=ekp';
		</script>";
	}else{
		echo "<script>
			alert('Data gagal masuk.');
			document.location.href = '../index.php?page=ekp';
		</script>";
	}
}else{
	echo "Error";
}
?>