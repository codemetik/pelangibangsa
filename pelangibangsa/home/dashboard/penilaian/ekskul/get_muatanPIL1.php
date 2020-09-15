<?php
	include 'koneksi.php';
	$ekskulPil1 = $_POST['ekskulPil1'];

	echo "<option value=''>Pilih Muatan Nilai</option>";

	$query = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai WHERE id_ekstra = '".$ekskulPil1."'");
	while ($row = mysqli_fetch_array($query)) {
		echo "<option value='" . $row['teknik_muatan'] . "'>" . $row['teknik_muatan'] . "</option>";
	}
?>