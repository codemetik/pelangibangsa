<?php 
include "../../../connect.php";

$id = $_POST['id_sosial'];
$butir = $_POST['butir_sikap'];

if (isset($_POST['submit'])) {
	$sql = mysqli_query($koneksi, "INSERT INTO sikap_sosial(id_sosial, butir_sikap) VALUES('$id','$butir')");
	if ($sql) {
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href = '../index.php?page=ki2';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal disimpan');
		document.location.href = '../index.php?page=ki2';
		</script>";
	}
}else{
	echo "Error";
}
?>