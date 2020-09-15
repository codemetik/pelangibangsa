<?php 
include "../../../connect.php";

$id_eks = $_POST['id_ekstra'];
$no = $_POST['no'];
$kegiatan = $_POST['kegiatan'];

if (isset($_POST['submit'])) {
	$sql = mysqli_query($koneksi, "INSERT INTO ekstrakurikuler(id_ekstra, no, kegiatan) VALUES('$id_eks','$no','$kegiatan')");
	if ($sql) {
		echo "<script>
			alert('Data berhasil masuk.');
			document.location.href = '../index.php?page=input_muatan_nilai&id=".$id_eks."';
		</script>";
	}else{
		echo "<script>
			alert('Data gagal masuk.');
			document.location.href = '../index.php?page=input_muatan_nilai&id=".$id_eks."';
		</script>";
	}
}else{
	echo "Error";
}

?>