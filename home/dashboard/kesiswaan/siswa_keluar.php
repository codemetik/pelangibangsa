<?php 
$sqlkeluar = mysqli_query($koneksi, "SELECT * FROM data_siswa_keluar");
$dtskl = mysqli_fetch_array($sqlkeluar);
?>

<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Siswa</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Siswa pindah / keluar</b></i></li>
  </ol>
</nav>

<div class="card">
	<div class="header bg-indigo">
		<h2>SISWA PINDAH / KELUAR</h2>
	</div>
	<div class="body">
		<div class="row">
			<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
				<form action="" method="POST">
					<div class="form-group form-float">
						<div class="button-demo js-modal-buttons">
						<button type="button" data-color="cyan" data-toggle="modal" data-target="#defaultModal" class="btn bg-light-blue waves-effect">KLIK NAMA</button>
						</div>
					</div>
                    <div class="form-group form-float">
	                    <div class="form-line">
	                    	<label>Input nama siswa</label>
	                    	<?php 
	                    	if (isset($_GET['id'])) {
	                    		$inisnya = $_GET['id'];
	                    	}else{
	                    		$inisnya = "";
	                    	}
	                    	?>
	                        <input type="text" class="form-control" name="kliknis" value="<?= $inisnya; ?>" placeholder=" . . .">
	                    </div>
	                </div>
	                <div class="form-group">
	                	<input type="submit" class="btn bg-indigo" name="simpan" value="Ambil">
	                </div>
            	</form>
			</div>
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
				<div class="table table-responsive">
					<table class="table table-bordered table-hover font-11">
						<thead>
							<tr>
								<th class="bg-light-blue">ID SISWA</th>
								<th class="bg-light-blue">NAMA SISWA</th>
								<th class="bg-light-blue">KELAS</th>
								<th class="bg-light-blue">KELUARKAN</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							if (isset($_POST['simpan'])) {
								$nis = $_POST['kliknis'];
								$sql = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester WHERE nama_siswa LIKE '%".$nis."%' OR id_siswa LIKE '%".$nis."%' GROUP BY id_siswa");
								while ($data = mysqli_fetch_array($sql)) { ?>
									<tr>
										<td><?= $data['id_siswa']; ?></td>
										<td><?= $data['nama_siswa']; ?></td>
										<td><?= $data['kelas']; ?></td>
										<td>
											<a class="btn bg-indigo" href="dashboard/proses/proses_siswa_keluar.php?nis=<?= $data['id_siswa']; ?>" onclick="return confirm('Apakah anda yakin ingin mengeluarkan siswa <?= $data['nama_siswa']; ?>?')">Keluarkan</a>
										</td>
									</tr>
								<?php }
							} ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Default Size -->
            <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">AMBIL DATA SISWA DAN KELUARKAN SISWA</h4>
                        </div>
                        <div class="modal-body">
                           	<div class="table table-responsive">
                           		<table class="table table-bordered font-11">
                           			<thead>
                           			<tr>
										<?php 
										$array = array('NO','Klik Nama Siswa','Status','Nama','JK');
										foreach ($array as $key) {
											echo "<th>".$key."</th>";
										} ?>
									</tr>
									</thead>
									<tbody>
					
									<?php
									$sqli = mysqli_query($koneksi, "SELECT * FROM data_siswa");
									$no=1;
									while ($sis = mysqli_fetch_array($sqli)) {
									$dtsis = mysqli_query($koneksi, "SELECT * FROM data_siswa_kelas_semester WHERE id_siswa = '".$sis['id_siswa']."' GROUP BY id_siswa ASC");
	                                $data =  mysqli_num_rows($dtsis);
	                                $adakelas = mysqli_fetch_array($dtsis);

									?>
										<tr>
											<td><?= $no++; ?></td>
											<td>
											<?php 
											if ($data == 1) { ?>
											<a class="btn bg-blue" href="admin.php?page=siswa_keluar&id=<?= $sis['nama_siswa']; ?>"><?= $sis['nama_siswa']; ?></a>	
											<?php }else if($sis['id_siswa'] == $dtskl['id_siswa'] ){ ?>
												<a class="btn bg-red" href="#"><?= $dtskl['nama_siswa']; ?></a>
											<?php }else if($data == 0){ ?>
												<a class="btn bg-green" href="#"><?= $sis['nama_siswa']; ?></a>
											<?php }
											?>
											</td>
											<td>
											<?php 
											if ($data == 1) {
												echo "<p style='color:blue;'>ADA DI KELAS</p>";
											}else if($sis['id_siswa'] == $dtskl['id_siswa']){
												echo "<p style='color:red;'>KELUAR</p>";
											}else if($data == 0){
												echo "<p style='color:green'>TIDAK ADA DI KELAS</p>";
											}
											?>
											</td>
											<td><?= $sis['nama_siswa']; ?></td>
											<td><?= $sis['jk']; ?></td>
										</tr>
										<?php } ?>
									</tbody>
                           		</table>
                           	</div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">CLOSE</button>
                        </div>
                    </div>
                </div>
            </div>
<div class="card">
	<div class="header">
		<h2>SISWA KELUAR</h2>
	</div>
	<div class="body">
		<div class="table table-responsive">
			<table class="table table-bordered table-hover font-11">
				<thead>
					<tr>
						<?php 
						$array = array('NO','IDSK','TGL MASUK','TGL KELUAR','KELAS','SEMESTER','NAMA','JK','TEMPAT & TGL LAHIR','AGAMA','TAHUN AJARAN','ACTION');
						foreach ($array as $key) {
							echo "<th>".$key."</th>";
						}
						?>
					</tr>
				</thead>
				<tbody>
					<?php 
					$nom=1;
					$sqlsk = mysqli_query($koneksi, "SELECT * FROM data_siswa_keluar LIMIT 0,10");
					while ($dtsk = mysqli_fetch_array($sqlsk)) { ?>
						<tr>
							<td><?= $nom++; ?></td>
							<td><?= $dtsk['id_siswa_keluar']; ?></td>
							<td><?= $dtsk['tgl_masuk_siswa']; ?></td>
							<td><?= $dtsk['tgl_keluar_siswa']; ?></td>
							<td><?= $dtsk['id_kelas']; ?></td>
							<td><?= $dtsk['id_semester']; ?></td>
							<td><?= $dtsk['nama_siswa']; ?></td>
							<td><?= $dtsk['jk']; ?></td>
							<td><?= $dtsk['tempat_lahir'].", ".$dtsk['tanggal_lahir']; ?></td>
							<td><?= $dtsk['id_agama']; ?></td>
							<td><?= $dtsk['tahun_ajaran_awal']."/".$dtsk['tahun_ajaran_akhir']; ?></td>
							<td><a href="?page=siswa_keluar&idsk=<?= $dtsk['id_siswa_keluar']; ?>" class="btn bg-indigo">Cetak Ket</a></td>
						</tr>
					<?php }
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<?php 
if (isset($_GET['idsk'])) {
	$idsk = $_GET['idsk'];
	echo $idsk;

	$sql_keluar = mysqli_query($koneksi, "SELECT * FROM data_siswa_keluar WHERE id_siswa_keluar = '".$idsk."'");
	$dt_keluar = mysqli_fetch_array($sql_keluar);
	?>

<div class="card">
	<div class="header bg-indigo">
		<h2><?= $idsk; ?></h2>
	</div>
	<div class="body">
		<form action="dashboard/cetak/hal_ket_keluar.php" method="POST" target="_blank">
			<div class="row">
			<div class="col-lg-6">
				<div class="form-group">
					<label>ID siswa Keluar</label>
					<div class="form-line">
						<input type="text" name="id_siswa_keluar" class="form-control" value="<?= $dt_keluar['id_siswa_keluar']; ?>" readonly>
					</div>
				</div>
				<div class="form-group">
					<div class="form-line">
						<input type="text" name="tgl_keluar_siswa" class="form-control" value="<?= $dt_keluar['tgl_keluar_siswa']; ?>">
					</div>
				</div>
				<div class="form-group">
					<div class="form-line">
						<input type="text" name="nama_siswa" class="form-control" value="<?= $dt_keluar['nama_siswa']; ?>" readonly>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="form-group">
					<label>Alasan Keluar</label>
					<div class="form-line">
						<textarea name="alasan" cols="30" rows="5" class="form-control no-resize font-11" required placeholder="Input disini"></textarea>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<input type="submit" name="print" value="Print">
			</div>
		</div>		
		</form>
	</div>
</div>

<?php }
?>