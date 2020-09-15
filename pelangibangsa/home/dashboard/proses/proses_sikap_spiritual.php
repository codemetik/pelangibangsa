<?php 
include "../../../connect.php";

$id = $_POST['id_spiritual'];
$butir = $_POST['butir_sikap'];

if (isset($_POST['submit'])) {
	$sql = mysqli_query($koneksi, "INSERT INTO sikap_spiritual(id_spiritual, butir_sikap) VALUES('$id','$butir')");
	if ($sql) {
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href = '../index.php?page=ki1';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal disimpan');
		document.location.href = '../index.php?page=ki1';
		</script>";
	}
}else{
	echo "Error";
}
?>