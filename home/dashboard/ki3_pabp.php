<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Input Pengetahuan</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>KI-3 PABP</b></i></li>
  </ol>
</nav>
<div class="card">
	<div class="header bg-indigo">
		<h2>KI-3 BABP</h2>
	</div>
	<div class="body">
		<div class="row clearfix">
			<form action="" method="POST">
				<div class="col-lg-3 col-md-2 col-sm-2 col-xs-2">
				<div class="form-group form-float">
					<select name="agama">
						<?php 
						$sql = mysqli_query($koneksi, "SELECT * FROM agama");
						while ($data = mysqli_fetch_array($sql)) {
							echo "<option value='".$data['id_agama']."'>".$data['agama']."</option>";
						}
						?>
					</select>
				</div>
				
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
					<input type="submit" name="get" value="GET" class="btn bg-indigo">
				</div>
			</form>
		</div>
	</div>
</div>
<?php 
if (isset($_POST['get'])) {
	if ($_POST['agama']) {
		$id_agama = $_POST['agama'];
		$sql = mysqli_query($koneksi, "SELECT * FROM agama INNER JOIN mapel WHERE id_agama = '".$id_agama."' GROUP BY id_agama");
		while ($data = mysqli_fetch_array($sql)) { ?>
			<div class="card">
				<div class="header">
					<b><?= $data['agama']."</b>, ".$data['nama_mapel']; ?>
					<a href="javascript:void(0);">
                        <button type="button" class="btn bg-indigo waves-effect m-r-20" data-toggle="modal" data-target="#defaultModal">INPUT KD <?= $data['agama']; ?></button>
                    </a>
				</div>
				<div class="body">
					<div class="table">
						<table class="table table-bordered table-hove font-11">
							<thead>
							<tr>
								<?php $th = array("ID_KD", "NO", "NOMOR_KD","DESKRIPSI","ID_MAPEL","ID_AGAMA","ACTION"); 
								foreach ($th as $key) {
									echo "<th class='bg-light-blue'>".$key."</th>";
								}
								?>
							</tr>
							</thead>
							<tbody>
								<?php 
                                $sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
                                $dtsq1 = mysqli_fetch_array($sq1);

                                $sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
                                $dtsq2 = mysqli_fetch_array($sq2);

								$kd_agama = mysqli_query($koneksi, "SELECT * FROM kd_agama_ki3 WHERE id_agama = '".$data['id_agama']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
								while ($kd = mysqli_fetch_array($kd_agama)) { ?>
									<?php if ($data['id_agama'] === $kd['id_agama']): ?>
										<tr>
											<td><?= $kd['id_kd']; ?></td>
											<td><?= $kd['nom']; ?></td>
											<td><?= $kd['nomor_kd']; ?></td>
											<td><?= $kd['deskripsi']; ?></td>
											<td><?= $kd['id_mapel']; ?></td>
											<td><?= $kd['id_agama']; ?></td>
											<td>
												<div class="dropdown font-12">
                                                    <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                        Action
                                                    </button>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="index.php?page=ki3_pabp&editkd=<?= $kd['id_kd']; ?>" class="font-12">Edit <?= $kd['nomor_kd']; ?></a></li>
                                                        <li><a href="delete/delete_kd_agama.php?id=<?= $kd['id_kd']; ?>" class="font-12" onclick="return confirm('Apakah anda yakin ingin menghapus KD ini?')">Delete</a></li>
                                                    </ul>
                                                </div>
											</td>
										</tr>
									<?php endif ?>
								<?php }
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		<?php } 
$kd_agm = mysqli_query($koneksi, "SELECT * FROM agama INNER JOIN mapel WHERE id_agama = '".$id_agama."' GROUP BY id_agama");
$s =mysqli_fetch_array($kd_agm);
		?>
<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT KD PABP /<?= $s['agama']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_kd_agama.php">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kda" value="<?= $dkdki3; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nom" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nomor_kd" required>
                                                    <label class="form-label">KD</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" required></textarea>
                                                    <label class="form-label">KALIMAT KUNCI KD</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_mapel" value="<?= $s['id_mapel']; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_agama" value="<?= $s['id_agama']; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn bg-indigo waves-effect" name="submit">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">TUTUP</button>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-link btn-primary waves-effect">SAVE CHANGES</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div> -->
                    </div>
                </div>
            </div>
	<?php } 
}else{
	
}

if (isset($_GET['editkd'])) {
	include "edit/edit_kd_agama.php";
}

?>
            