<?php 
include "../../connect.php";

$sql = mysqli_query($koneksi, "SELECT * FROM tinggi_berat_badan WHERE id_tbb = '".$_GET['id']."'");
$data = mysqli_fetch_array($sql);

$sqlsiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$dtsis = mysqli_fetch_array($sqlsiswa);
?>
<div class="card">
	<div class="header">
		<h2>Edit Tinggi dan Berat Badan</h2>
	</div>
	<div class="body">
	<form action="" method="POST">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" hidden>
				<div class="form-group form-float">
					<div class="form-line">
						<input type="text" name="id_tbb" class="form-control" value="<?= $data['id_tbb']; ?>">
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
						<label class="form-label">Tanggal Raport</label>
						<input type="text" name="tgl_raport" class="form-control" value="<?= $data['tgl_raport']; ?>" readonly>
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
						<label class="form-label">Tinggi Badan</label>
						<input type="text" name="tinggi_badan" class="form-control" value="<?= $data['tinggi_badan']; ?>">
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
				<div class="form-group form-float">
					<div class="form-line">
						<label class="form-label">Berat Badan</label>
						<input type="text" name="berat_badan" class="form-control" value="<?= $data['berat_badan']; ?>">
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
	$id_tbb = $_POST['id_tbb'];
	$id_siswa = $_POST['id_siswa'];
	$tinggi_badan = $_POST['tinggi_badan'];
	$berat_badan = $_POST['berat_badan'];
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];
	$tgl_raport= $_POST['tgl_raport'];
	$tawal = $_POST['tahun_awal'];
	$takhir = $_POST['tahun_akhir'];

	$sqlt = mysqli_query($koneksi, "UPDATE tinggi_berat_badan SET id_tbb = '".$id_tbb."', id_siswa = '".$id_siswa."', tinggi_badan = '".$tinggi_badan."', berat_badan = '".$berat_badan."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."', tgl_raport = '".$tgl_raport."', tahun_ajaran_awal = '".$tawal."', tahun_ajaran_akhir = '".$takhir."' WHERE id_tbb = '".$id_tbb."'");
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