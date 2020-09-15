<?php
	include 'koneksi.php';

	echo "<option value=''>-- Pilih Ekskul Pilihan 3-- </option>";

	$query = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra NOT BETWEEN 'EKS001' AND 'EKS013'");
	while ($row = mysqli_fetch_array($query)) {
		echo "<option value='" . $row['id_ekstra'] . "'>" . $row['kegiatan'] . "</option>";
	}
?>