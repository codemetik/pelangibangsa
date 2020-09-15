<div class="card">
	<div class="header">
		<h2>Download File Panduan</h2>
	</div>
	<div class="body">
		<div class="table">
			<table border="1">
				<thead>
					<tr>
						<th>Deskrpisi</th>
						<th>Name File</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
include "../connect.php";

	$query = mysqli_query($koneksi,"SELECT * FROM download ORDER BY id_download ASC");
	while ($hasil = mysqli_fetch_array($query)) { ?>
	<tr>
		<td><b><?= $hasil['deskripsi']; ?></b></td>
		<td><?= $hasil['file_name']; ?></td>
		<td><a href='download.php?file=<?= $hasil['file_name']; ?>'>
			<button class="btn">
                <i class="material-icons">file_download</i>
            </button>
             </a>
        </td>
	</tr>
	<?php }
?>
				</tbody>
			</table>
		</div>
	</div>
</div>