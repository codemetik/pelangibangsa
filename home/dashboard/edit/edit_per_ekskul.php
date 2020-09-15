<?php 
$sql = mysqli_query($koneksi, "SELECT * FROM per_ekstrakurikuler WHERE id_ekstra = '".$_GET['id']."' AND id_siswa = '".$_GET['disis']."'");
$data = mysqli_fetch_array($sql);

$dtsiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$dtsis = mysqli_fetch_array($dtsiswa);
?>
<div class="card">
	<div class="header">
		<h2>Edit Perkembangan Ektrakurikuler ( <?= $dtsis['nama_siswa']; ?> ) </h2>
	</div>
	<div class="body">
		<form action="" method="POST">
		<div class="row" hidden>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
			<div class="form-float form-group">
				<div class="form-line">
					<label>ID Ekstrakurikuler</label>
					<input type="text" name="id_ekstra" class="form-control" value="<?= $data['id_ekstra']; ?>" readonly>
				</div>
			</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
			<div class="form-float form-group">
				<div class="form-line">
					<label>ID Siswa</label>
					<input type="text" name="id_siswa" class="form-control" value="<?= $data['id_siswa']; ?>" readonly>
				</div>
			</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
			<div class="form-float form-group">
				<div class="form-line">
					<label>Kegiatan</label>
					<input type="text" name="kegiatan" class="form-control" value="<?= $data['kegiatan']; ?>" readonly>
				</div>
			</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
			<div class="form-float form-group">
				<div class="form-line">
					<label>Keterangan</label>
					<input type="text" name="keterangan" class="form-control" value="<?= $data['keterangan']; ?>">
				</div>
			</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<input type="submit" name="simpan" value="Simpan" class="btn">
				<a href="?page=nilai&id=<?= $dtsis['nama_siswa']; ?>" class="btn">Cencel</a>
			</div>
		</div>
		</form>
	</div>
</div>

<?php 

if (isset($_POST['simpan'])) {
	$id_ekstra = $_POST['id_ekstra'];
	$id_siswa = $_POST['id_siswa'];
	$kegiatan = $_POST['kegiatan'];
	$keterangan = $_POST['keterangan'];

	$update = mysqli_query($koneksi, "UPDATE per_ekstrakurikuler SET id_siswa = '".$id_siswa."', id_ekstra = '".$id_ekstra."', kegiatan = '".$kegiatan."', keterangan = '".$keterangan."' WHERE id_ekstra = '".$id_ekstra."' AND id_siswa = '".$id_siswa."'");
	if ($update) {
		echo "<script>
		alert('Data berhasil di update');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}else{
		echo "<script>
		alert('Data gagal di Update');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}
}
?>