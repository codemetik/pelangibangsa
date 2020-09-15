<?php 
include "../../../connect.php";

$no = $_POST['no'];
$tema = $_POST['judul_tema'];

if (isset($_POST['submit'])) {
	$sql = mysqli_query($koneksi, "INSERT INTO tema(id_tema, judul_tema) VALUES('$no','$tema')");
	if ($sql) {
		echo "<script>
			alert('Data berhasil masuk.');
			document.location.href = '../index.php?page=kkm';
		</script>";
	}else{
		echo "<script>
			alert('Data gagal masuk .');
			document.location.href = '../index.php?page=kkm';
		</script>";
	}
}else{
	echo "error";
}
?>