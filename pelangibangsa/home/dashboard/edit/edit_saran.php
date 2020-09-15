<?php 
include "../../connect.php";
$sql = mysqli_query($koneksi, "SELECT * FROM saran WHERE id_saran = '".$_GET['id']."' AND id_siswa = '".$_GET['ids']."'");
$data = mysqli_fetch_array($sql);

$dtsiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$dtsis = mysqli_fetch_array($dtsiswa);
?>
<div class="card">
	<div class="header">
		<h2>Edit Saran ( <?= $dtsis['nama_siswa']; ?> ) </h2>
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
	                            	<textarea name="saran" cols="30" rows="5" class="form-control no-resize"><?= $data['saran']; ?></textarea>
	                            </div>
	                        </div>
	                    </td>
					</tr>
				</thead>
			</table>
			<input type="submit" name="simpan" class="btn bg-blue-grey" value="Simpan Perubahan">
			<input type="submit" name="hapus" class="btn bg-blue-grey" value="Hapus">
			<a href="?page=nilai&id=<?= $dtsis['nama_siswa']; ?>" class="btn bg-blue-grey">Cencel</a>
		</div>
	</form>
	</div>
</div>

<?php 
if (isset($_POST['simpan'])) {
	$saran = $_POST['saran'];

	$sql1 = mysqli_query($koneksi, "UPDATE saran SET saran = '".$saran."' WHERE id_saran = '".$data['id_saran']."'AND id_siswa = '".$dtsis['id_siswa']."'");

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

if (isset($_GET['hapus'])) {
	$hapus = $_GET['saran'];

	$sqlhapus = mysqli_query($koneksi, "DELETE FROM saran WHERE id_saran = '".$hapus."' AND id_siswa = '".$dtsis['id_siswa']."'");
	if ($sqlhapus) {
		echo "<script>
		alert('Data Berhasil Di Hapus');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}else{
		echo "<script>
		alert('Data Gagal Di Hapus');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}
}
?>