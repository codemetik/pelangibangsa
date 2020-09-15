<?php 
$sql = mysqli_query($koneksi, "SELECT* FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = '".$_GET['id']."'");
$data = mysqli_fetch_array($sql);

$quer = mysqli_query($koneksi, "SELECT max(id_raportkd) AS maxCode FROM nilai_raportkd_ki3");
$dat = mysqli_fetch_array($quer);
$no = $dat['maxCode'];
$nOio = (int) substr($no, 3, 7);
$nOio++; 
$chario = "KI3";
$datai = $chario . sprintf("%07s", $nOio);
?>
<div class="card">
	<div class="header">
		<h2>Penilaian akhir kd A/n : <?= $data['id_siswa']; ?> , Mapel : <?= $data['nama_mapel']; ?></h2>
	</div>
	<div class="body">
		<div class="table-responsive">
		<form action="" method="post">
			<table class="table table-bordered font-12">
				<thead>
					<tr>
						<?php $kd = array("nomor_kd","deskripsi","Tugas1","Tugas2","Tugas3","Tugas4","Tugas5","PH1","PH2","PH3","PH4","PTS","PAS", "ACTION");
							foreach ($kd as $key) { ?>
							<th scope="row"><?= $key ?></th>
						<?php }
						?>
					</tr>
				</thead>
				<?php 
				// $query_new = mysqli_query($koneksi, "SELECT * FROM nilai_raportkd_ki3 WHERE id_mapel = '".$data['id_mapel']."' AND id_siswa = '".$data['id_siswa']."' ORDER BY id_kd");
				// $q = mysqli_fetch_assoc($query_new);
				$query = mysqli_query($koneksi, "SELECT * FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = '".$data['id_mapel']."' AND id_siswa = '".$data['id_siswa']."' GROUP BY id_kd");
				$cekin = mysqli_num_rows($query);
				while ($kd = mysqli_fetch_array($query)) { ?>
					<tbody>
						<tr class="perhitungan">
						<div>
							<?php
							if (!isset($kd['id_raportkd'])) {
								$isi = $datai;
							} else{
								$isi = $kd['id_raportkd'];
							}
							?>
							<input type="text" name="id_raportkd[]" value="<?= $isi; ?>">
							<!-- <input type="text" name="id_raportkd[]" value="<?= $datai; ?>"> -->
							<input type="text" name="id_siswa[]" value="<?= $kd['id_siswa']; ?>">
							<input type="text" name="id_mapel[]" value="<?= $kd['id_mapel']; ?>">
							<input type="text" name="nama_mapel[]" value="<?= $kd['nama_mapel']; ?>">
							<input type="text" name="id_kd[]" value="<?= $kd['id_kd']; ?>">
						</div>
							<td><input style="width: 100%;" type="text" name="nomor_kd[]" id="nomor_kd[]" value="<?= $kd['nomor_kd']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="deskripsi[]" id="deskripsi[]" value="<?= $kd['deskripsi']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="tugas1[]" id="tugas1[]" value="<?= $kd['tugas1']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="tugas2[]" id="tugas2[]" value="<?= $kd['tugas2']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="tugas3[]" id="tugas3[]" value="<?= $kd['tugas3']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="tugas4[]" id="tugas4[]" value="<?= $kd['tugas4']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="tugas5[]" id="tugas5[]" value="<?= $kd['tugas5']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="ph1[]" id="ph1[]" value="<?= $kd['ph1']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="ph2[]" id="ph2[]" value="<?= $kd['ph2']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="ph3[]" id="ph3[]" value="<?= $kd['ph3']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="ph4[]" id="ph4[]" value="<?= $kd['ph4']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="pts[]" id="pts[]"  value="<?= $kd['pts']; ?>"></td>
							<td><input style="width: 100%;" type="text" name="pas[]" id="pas[]" value="<?= $kd['pas']; ?>"></td>
							<td hidden><input style="width: 100%;" type="text" name="nilai[]" id="nilai[]" value="<?= $kd['nilai']; ?>"></td>
							<td>
								<div class="dropdown">
                                    <button type="submit" href="" class="" data-toggle="dropdown">
                                                                Action
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="?page=nilai_akhir_raportki3&id=<?= $data['id_mapel'] ?>&data=<?= $kd['id_kd']; ?>">Nilai</a></li>
                                        <li><a href="delete/delete_ki1.php?id=<?= $kd['id_kd']; ?>">Edit</a></li>
                                    </ul>
                                </div>
							</td>
						</tr>
					</tbody>
				<?php }
				?>
			</table>
			<button type="submit" class="btn btn-link btn-primary waves-effect" name="saved">SIMPAN</button>
		</form>
		</div>
	</div>
</div>

<?php 

//open code logic
if (isset($_POST['saved'])) {
	
$id_raportkd = $_POST['id_raportkd'];
$id_siswa = $_POST['id_siswa'];
$id_mapel = $_POST['id_mapel'];
$nama_mapel = $_POST['nama_mapel'];
$id_kd = $_POST['id_kd'];
$nomor_kd = $_POST['nomor_kd'];
$deskripsi = $_POST['deskripsi'];
$tugas1 = $_POST['tugas1'];
$tugas2 = $_POST['tugas2'];
$tugas3 = $_POST['tugas3'];
$tugas4 = $_POST['tugas4'];
$tugas5 = $_POST['tugas5'];
$ph1 = $_POST['ph1'];
$ph2 = $_POST['ph2'];
$ph3 = $_POST['ph3'];
$ph4 = $_POST['ph4'];
$pts = $_POST['pts'];
$pas = $_POST['pas'];
$nilai = $_POST['nilai'];

$count = count($id_kd);


$sqlku = "INSERT INTO nilai_raportkd_ki3(id_raportkd,id_siswa,id_mapel,nama_mapel,id_kd,nomor_kd,deskripsi,tugas1,tugas2,tugas3,tugas4,tugas5,ph1,ph2,ph3,ph4,pts,pas,nilai) VALUES";
for ($i=0; $i < $count; $i++) { 
	$sqlku .= "('{$id_raportkd[$i]}','{$id_siswa[$i]}','{$id_mapel[$i]}','{$nama_mapel[$i]}','{$id_kd[$i]}','{$nomor_kd[$i]}','{$deskripsi[$i]}','{$tugas1[$i]}','{$tugas2[$i]}','{$tugas3[$i]}','{$tugas4[$i]}','{$tugas5[$i]}','{$ph1[$i]}','{$ph2[$i]}','{$ph3[$i]}','{$ph4[$i]}','{$pts[$i]}','{$pas[$i]}','{$nilai[$i]}')";
	$sqlku .= ",";
}
$sqlku = rtrim($sqlku,",");
$insert = $koneksi->query($sqlku);
	if (!$insert ) {
		echo "<script>
		alert('Data gagal di simpan".$koneksi->error."');
		document.location.href ='?';
		</script>";
	}else{
		echo "<script>
		alert('Data berhasil disimpan');
		document.location.href ='?';
		</script>";
	}


} //close code logic
?>

<?php 
//untuk include halaman ketika edit/input
if (isset($_GET['data'])) {
	include "input_akhir_raport_ki3.php";
}else{
	echo "";
}
?>

<!-- Large Size -->
            <div class="modal fade" id="defaultKd" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT KD <?= $kd['id_kd']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="proses/proses_ekstra.php">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_ekstra" value="<?= $datekstra; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kegiatan" required>
                                                    <label class="form-label">KEGIATAN</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-link btn-primary waves-effect" name="submit">SIMPAN</button>
                                                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">TUTUP</button>
                                            </div>
                                        </form>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>