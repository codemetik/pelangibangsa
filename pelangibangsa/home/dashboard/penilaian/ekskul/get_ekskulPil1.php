<?php
	include 'koneksi.php';

	echo "<option value=''>-- Pilih Ekskul Pilihan 1-- </option>";

	$query = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra BETWEEN 'EKS002' AND 'EKS008'");
	while ($row = mysqli_fetch_array($query)) {
		echo "<option value='" . $row['id_ekstra'] . "'>" . $row['kegiatan'] . "</option>";
	}
?>