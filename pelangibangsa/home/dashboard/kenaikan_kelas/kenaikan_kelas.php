<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Kenaikan kelas</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Naikan siswa</b></i></li>
  </ol>
</nav>

<div class="card">
	<div class="header bg-indigo">
		<h2>Naikan siswa ke kelas berikutnya</h2>
	</div>
	<div class="body">
		<div class="row">
		<form action="" method="POST">
			<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
					<div class="form-group form-float">
						<label class="form-label">Nama siswa</label>
						<select name="id_siswa">
							<?php 
							$sql = mysqli_query($koneksi, "SELECT * FROM siswa_kelas WHERE kelas = '".$_SESSION['kelas']."'");
							while ($data = mysqli_fetch_array($sql)) { ?>
								<option value="<?= $data['id_siswa']; ?>"><?= $data['nama_siswa']; ?></option>
							<?php }
							?>
						</select>	
					</div>
				</div>
				<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
					<label class="form-label">Naik ke kelas</label>
					<div class="form-group form-float">
						<select name="kelas">
							<?php 
							$sqlin = mysqli_query($koneksi, "SELECT * FROM kelas");
							while ($dtsql = mysqli_fetch_array($sqlin)) { ?>
							 	<option value="<?= $dtsql['kelas']; ?>"><?= $dtsql['kelas']; ?></option>
							 <?php } 
							?>
						</select>
					</div>
				</div>
			</div>
			<input type="submit" name="ambil" value="Tampilkan" class="btn bg-indigo">
		</form>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bg-light-blue">
			<div class="header">
			<h2>Table kenailan</h2>
		</div>	
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<form action="" method="POST">
				<div class="table table-responsive">
					<table class="table table-responsive table-bordered table-hover">
						<thead>
						<tr>
							<?php
							$array = array('NIS','NISN','NAMA SISWA','JK','KELAS','NAIK KE KELAS','TANGGAL KENAIKAN', 'TAHUN AJARAN','Action');
							foreach ($array as $key) {
								echo "<th>".$key."</th>";
							}
							?>
						</tr>
						</thead>
						<tbody>
							<?php 
							if (isset($_POST['ambil'])) {
								$id_siswa = $_POST['id_siswa'];
								$kelas = $_POST['kelas'];

								date_default_timezone_set('Asia/Jakarta'); 
								$tgl_naik = date("Y-m-d h:i:s");

									$sqldat = mysqli_query($koneksi, "SELECT * FROM siswa_kelas WHERE id_siswa = '".$id_siswa."'");
									while ($dt = mysqli_fetch_array($sqldat)) {
								?>
								<tr>
									<td hidden><input type="text" name="id_siswa" class="form-control" value="<?= $dt['id_siswa']; ?>" readonly></td>
									<td><input type="text" name="nisn" class="form-control" value="<?= $dt['nisn']; ?>" readonly></td>
									<td><input type="text" name="nis" class="form-control" value="<?= $dt['nis']; ?>" readonly></td>
									<td class="col-md-2"><input type="text" name="nama_siswa" class="form-control" value="<?= $dt['nama_siswa']; ?>" readonly></td>
									<td><input type="text" name="jk" class="form-control" value="<?= $dt['jk']; ?>" readonly></td>
									<td><input type="text" name="kelas" class="form-control" value="<?= $_SESSION['kelas']; ?>" readonly></td>
									<td><input type="text" name="kelas" class="form-control" value="<?= $kelas; ?>" readonly></td>
									<td class="col-md-2"><input type="text" name="tgl_kenaikan" class="form-control" value="<?= $tgl_naik; ?>" readonly></td>
									<td><input type="text" name="tahun_ajaran" class="form-control" value="<?= $dt['tahun_ajaran_awal']."/".$dt['tahun_ajaran_akhir']; ?>" readonly></td>
									<td><input type="submit" name="simpan" class="btn bg-indigo" value="Simpan" onclick="return confirm('Apakah anda yakin ingin menaikan siswa ini?')"></td>
								</tr>
							<?php } 
							}
							?>
						</tbody>
					</table>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

<?php 

if (isset($_POST['simpan'])) {

	$naik = mysqli_query($koneksi, "SELECT max(id_kenaikan) AS maxCode FROM data_siswa_kenaikan");
    $sqlnaik = mysqli_fetch_array($naik);
    $kenaikan = $sqlnaik['maxCode'];
    $nonaik = (int) substr($kenaikan, 3, 6);
    $nonaik++; 
    $naikan = "NXT";
    $dtnaik = $naikan . sprintf("%06s", $nonaik);

	$id_siswa = $_POST['id_siswa'];
	$kelas = $_POST['kelas'];
	// $tgl_kenaikan = $_POST['tgl_kenaikan'];

	date_default_timezone_set('Asia/Jakarta'); 
	$tgl_naik = date("Y-m-d h:i:s");

	$sqlkelas = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$kelas."'");
	$dtkls = mysqli_fetch_array($sqlkelas);

	$sql = mysqli_query($koneksi, "SELECT * FROM data_level_siswa WHERE id_siswa = '".$id_siswa."'");
	$data = mysqli_fetch_array($sql);

	$siswa = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$id_siswa."'");
	$dtsis = mysqli_fetch_array($siswa);

	$taw1 = $dtsis['tahun_ajaran_awal'] + 1;
	$tak2 = $dtsis['tahun_ajaran_akhir'] + 1;

	$sql1 = mysqli_query($koneksi, "INSERT INTO data_siswa_kenaikan(id_kenaikan, id_siswa, id_kelas, id_kelas_sebelumnya, tanggal_kenaikan, tahun_ajaran_sebelumnya, tahun_ajaran_awal, tahun_ajaran_akhir) VALUES('".$dtnaik."','".$id_siswa."','".$dtkls['id_kelas']."','".$data['id_kelas']."','".$tgl_naik."', '".$dtsis['tahun_ajaran_awal']."-".$dtsis['tahun_ajaran_akhir']."','".$taw1."','".$tak2."')");

	$sql2 = mysqli_query($koneksi, "UPDATE data_level_siswa SET id_kelas = '".$dtkls['id_kelas']."' WHERE id_level_siswa = '".$data['id_level_siswa']."'");

	$sqlsis = mysqli_query($koneksi, "UPDATE data_siswa SET tahun_ajaran_awal = '".$taw1."', tahun_ajaran_akhir = '".$tak2."' WHERE id_siswa = '".$dtsis['id_siswa']."'");

	if ($sql1 & $sql2) {
		echo "<script>
		alert('Siswa berhasil dinaikan');
		document.location.href = '?page=kenaikan_kelas';
		</script>";
	}else{
		echo "<script>
		alert('Siswa gagal dinaikan');
		document.location.href = '?page=kenaikan_kelas';
		</script>";
	}
}
?>