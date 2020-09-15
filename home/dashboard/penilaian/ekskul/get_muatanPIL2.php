<?php
	include 'koneksi.php';
	$ekskulPil2 = $_POST['ekskulPil2'];

	echo "<option value=''>Pilih Muatan Nilai</option>";

	$query = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai WHERE id_ekstra = '".$ekskulPil2."'");
	while ($row = mysqli_fetch_array($query)) {
		echo "<option value='" . $row['teknik_muatan'] . "'>" . $row['teknik_muatan'] . "</option>";
	}
?>