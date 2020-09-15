<?php 
include "../../connect.php";
$sql = mysqli_query($koneksi, "SELECT * FROM catatan WHERE id_catatan = '".$_GET['id']."' AND id_siswa = '".$_GET['ids']."'");
$data = mysqli_fetch_array($sql);

$dtsiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$dtsis = mysqli_fetch_array($dtsiswa);
?>
<div class="card">
	<div class="header">
		<h2>Edit Catatan ( <?= $dtsis['nama_siswa']; ?> ) </h2>
	</div>
	<div class="body">
		<form action="" method="POST">
		<div class="table tabl-responsive">
			<table class="table table-bordered">
				<thead>
					<tr class="bg-light-blue">
						<th>Catanan</th>
					</tr>
					<tr>
						<td>
							<div class="form-group form-float">
	                            <div class="form-line">
	                            	<textarea name="catatan" cols="30" rows="5" class="form-control no-resize"><?= $data['catatan']; ?></textarea>
	                            </div>
	                        </div>
	                    </td>
					</tr>
				</thead>
			</table>
			<input type="submit" name="simpan" class="btn bg-blue-grey" value="Simpan Perubahan">
			<a href="?page=nilai&id=<?= $dtsis['nama_siswa']; ?>" class="btn bg-blue-grey">Cencel</a>
		</div>
	</form>
	</div>
</div>

<?php 
if (isset($_POST['simpan'])) {
	$catatan = $_POST['catatan'];

	$sql1 = mysqli_query($koneksi, "UPDATE catatan SET catatan = '".$catatan."' WHERE id_catatan = '".$data['id_catatan']."'AND id_siswa = '".$dtsis['id_siswa']."'");

	if ($sql1) {
		echo "<script>
		alert('Data Berhasil di Update');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}else{
		echo "<script>
		alert('Data Gagal Di Update');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}
}
?>