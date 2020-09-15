<?php
	include 'koneksi.php';

	echo "<option value=''>-- Pilih Ekskul Wajib-- </option>";

	$query = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra = 'EKS001'");
	while ($row = mysqli_fetch_array($query)) {
		echo "<option value='" . $row['id_ekstra'] . "'>" . $row['kegiatan'] . "</option>";
	}
?>