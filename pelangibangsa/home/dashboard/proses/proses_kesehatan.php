<?php 
include "../../../connect.php";

$id_kesehatan = $_POST['id_kesehatan'];
$no = $_POST['no'];
$aspek_fisik = $_POST['aspek_fisik'];

if (isset($_POST['submit'])) {
	$sqlaspek = mysqli_query($koneksi, "INSERT INTO kesehatan(id_kesehatan, no, aspek_fisik) VALUES('$id_kesehatan','$no','$aspek_fisik')");
	if ($sqlaspek) {
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