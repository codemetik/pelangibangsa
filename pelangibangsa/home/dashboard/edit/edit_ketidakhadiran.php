<?php 
include "../../connect.php";

$sql = mysqli_query($koneksi, "SELECT * FROM ketidakhadiran WHERE id_kehadiran = '".$_GET['id']."'");
$data = mysqli_fetch_array($sql);

$sqlsiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$dtsis = mysqli_fetch_array($sqlsiswa);
?>
<div class="card">
	<div class="header">
		<h2>Edit Kehadiran</h2>
	</div>
	<div class="body">
	<form action="" method="POST">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" hidden>
				<div class="form-group form-float">
					<div class="form-line">
						<input type="text" name="id_kehadiran" class="form-control" value="<?= $data['id_kehadiran']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12"  hidden>
				<div class="form-group form-float">
					<div class="form-line">
						<input type="text" name="id_siswa" class="form-control" value="<?= $data['id_siswa']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
				<div class="form-group form-float">
					<div class="form-line">
						<label class="form-label">Sakit</label>
						<input type="text" name="sakit" class="form-control" value="<?= $data['sakit']; ?>">
					</div>
				</div>
				<div class="form-group form-float" hidden>
					<div class="form-line">
						<label class="form-label">Tahun Ajaran Awal</label>
						<input type="text" name="tahun_awal" class="form-control" value="<?= $data['tahun_ajaran_awal']; ?>">
					</div>
				</div>
				<div class="form-group form-float" hidden>
					<div class="form-line">
						<label class="form-label">Tahun Ajaran Akhir</label>
						<input type="text" name="tahun_akhir" class="form-control" value="<?= $data['tahun_ajaran_akhir']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
				<div class="form-group form-float">
					<div class="form-line">
						<label class="form-label">Ijin</label>
						<input type="text" name="ijin" class="form-control" value="<?= $data['ijin']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
				<div class="form-group form-float">
					<div class="form-line">
						<label class="form-label">Tanpa keterangan</label>
						<input type="text" name="tanpa_keterangan" class="form-control" value="<?= $data['tanpa_keterangan']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
				<div class="form-group form-float">
					<div class="form-line">
						<label class="form-label">Tanggal Raport</label>
						<input type="text" name="tgl_raport" class="form-control" value="<?= $data['tgl_raport']; ?>" readonly>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" hidden>
				<div class="form-group form-float">
					<div class="form-line">
						<input type="text" name="id_kelas" class="form-control" value="<?= $data['id_kelas']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" hidden>
				<div class="form-group form-float">
					<div class="form-line">
						<input type="text" name="id_semester" class="form-control" value="<?= $data['id_semester']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
				<div class="form-group form-float">
						<input type="submit" name="simpan"  value="Simpan" class="btn bg-blue-grey">
					<a href="?page=nilai&id=<?= $dtsis['nama_siswa']; ?>" class="btn bg-blue-grey">Cencel</a>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>

<?php 
if (isset($_POST['simpan'])) {
	$id_kehadiran = $_POST['id_kehadiran'];
	$id_siswa = $_POST['id_siswa'];
	$sakit = $_POST['sakit'];
	$ijin = $_POST['ijin'];
	$tanpa_keterangan = $_POST['tanpa_keterangan'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tgl_raport = $_POST['tgl_raport'];
	$tawal = $_POST['tahun_awal'];
	$takhir = $_POST['tahun_akhir'];

	$total_tidak_masuk = $sakit + $ijin + $tanpa_keterangan;

	$sqlt = mysqli_query($koneksi, "UPDATE ketidakhadiran SET id_kehadiran = '".$id_kehadiran."', id_siswa = '".$id_siswa."', sakit = '".$sakit."', ijin = '".$ijin."', tanpa_keterangan = '".$tanpa_keterangan."', total_tidak_masuk = '".$total_tidak_masuk."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', tgl_raport = '".$tgl_raport."', tahun_ajaran_awal = '".$tawal."', tahun_ajaran_akhir = '".$takhir."' WHERE id_kehadiran = '".$id_kehadiran."'");
	if ($sqlt) {
		echo "<script>
		alert('Data berhasil di Update');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}else{
		echo "<script>
		alert('Data Gagal di Update');
		document.location.href = '?page=nilai&id=".$dtsis['nama_siswa']."';
		</script>";
	}
}
?>