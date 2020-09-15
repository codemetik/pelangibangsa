<div class="card">
	<div class="header bg-indigo">
		<h2>Edit Muatan Estrakurikuler</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
			<table class="table table-bordered table-hover">
				<tr>
					<th>ID Muatan</th>
					<th>Teknik Muatan</th>
					<th>Action</th>
				</tr>
				<?php 
			$sql = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai where id_ekstra ='".$_GET['edit']."'");
			while ($data = mysqli_fetch_array($sql)) { ?>
				<tr>
					<td><?= $data['id_muatan']; ?></td>
					<td><?= $data['teknik_muatan']; ?></td>
					<td><a href="?page=delete_ekskul&edit=<?= $data['id_ekstra']; ?>&id=<?= $data['id_muatan']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus muatan ini?')">Delete</a></td>
				</tr>
			<?php }
			?>
			</table>
		</div>
	</div>
</div>

<?php 
	if (isset($_GET['id'])) {
		$id_muatan = $_GET['id'];
		$del = mysqli_query($koneksi, "DELETE from tb_muatan_nilai where id_muatan = '".$id_muatan."'");
		if ($del) {
			echo "<script>
			alert('Data berhasil di hapus');
			document.location.href = '?page=detail_ekskul&id=".$_GET['edit']."';
			</script>";
		}
	}
?>
