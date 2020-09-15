<div class="card">
	<div class="header bg-indigo">
		<h2>DATA KKM PELANGI BANGSA</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
			<table class="table table-bordered table-hover font-11">
				<thead>
					<tr>
						<th>ID Mapel</th>
						<th>Nama Mapel</th>
						<th>Singkat Mapel</th>
						<th>KKM Pengetahuan</th>
						<th>KKM Keterampilan</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$sql = mysqli_query($koneksi, "SELECT * FROM mapel");
					while ($data = mysqli_fetch_array($sql)) { ?>
						<tr>
							<td><?= $data['id_mapel']; ?></td>
							<td><?= $data['nama_mapel']; ?></td>
							<td><?= $data['singkat_mapel']; ?></td>
							<td><?= $data['pengetahuan']; ?></td>
							<td><?= $data['keterampilan']; ?></td>
							<td>
								<div class="dropdown">
                                    <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                        Action
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                    	<?php 
                                    	if ($data['id_mapel'] == 'MPL01') { ?>
                                    		<li>
											<a href="?page=edit_kkm&id=<?= $data['id_mapel']; ?>">Detail</a>
										</li>
                                    	<?php }else{ ?>
                                    		<!-- code untuk menghapus data mapel berdasarkan id_mape <li>
										<a href="admin.php?page=show_kkm&id=<?= $data['id_mapel']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus data ini?')">Delete</a>
										</li> -->
										<li>
											<a href="?page=edit_kkm&id=<?= $data['id_mapel']; ?>">Detail</a>
										</li>
                                    	<?php }
                                    	?>
									</ul>
                                </div>
							</td>
						</tr>
					<?php }
					?>
				</tbody>
			</table>
		</div>	
	</div>
</div>

<?php 
//code untuk menghapus data mapel berdasarkan id_mapel
// if (isset($_GET['id'])) {
// 	$id = $_GET['id'];
	
// 	$dsql = mysqli_query($koneksi, "DELETE FROM mapel where id_mapel = '".$id."'");
// 	if ($dsql) {
// 		echo "<script>
// 		alert('Data berhasil dihapus');
// 		document.location.href = 'admin.php?page=show_kkm';
// 		</script>";
// 	}else{
// 		echo "<script>
// 		alert('Data gagal dihapus');
// 		document.location.href = 'admin.php?page=show_kkm';
// 		</script>";	
// 	}
// }
?>