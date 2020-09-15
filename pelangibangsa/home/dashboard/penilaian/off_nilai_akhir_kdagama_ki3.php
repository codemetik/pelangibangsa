<?php 
$sql = mysqli_query($koneksi, "SELECT id_raportkd, Z.id_siswa as id_siswa, nama_siswa, X.id_mapel as id_mapel, X.nama_mapel as nama_mapel, C.id_agama as id_agama, Y.id_kd as id_kd, Y.nomor_kd as nomor_kd, Y.deskripsi as deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas FROM nilai_agamakd_ki3 B RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel INNER JOIN agama C ON C.id_agama = Y.id_agama INNER JOIN data_siswa Z WHERE Z.id_siswa = '".$_GET['sis']."' AND Y.id_agama = '".$_GET['agm']."' GROUP BY Z.id_agama");
$data = mysqli_fetch_array($sql);
include "ambildatasiswa.php";

$viewdt = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE id_siswa = '".$data['id_siswa']."'");
$dtview = mysqli_fetch_array($viewdt);
?>
<div class="card">
	<div class="header bg-indigo">
		<h2>Penilaian akhir kd Mapel : <?= $data['nama_mapel'].", ".$_GET['agm']; ?></h2>
	</div>
	<div class="body">
		<div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
			<div class="form-line">
				<input type="text" class="form-control" value="<?= $data['nama_siswa']; ?>" readonly>
			</div>
		</div>
		<table class="table table-responsive">
			<thead>
				<tr>
					<?php 
					$array = array("Nomor Kd"," Deskripsi"," Action");
					foreach ($array as $value) {
						echo "<th>".$value."</th>";
					}
					?>
				</tr>
			</thead>
			<?php 
			$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
            $dtsq1 = mysqli_fetch_array($sq1);

            $sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
            $dtsq2 = mysqli_fetch_array($sq2);

			$query = mysqli_query($koneksi, "SELECT id_raportkd, Z.id_siswa as id_siswa , X.id_mapel as id_mapel, Y.id_kelas as id_kelas, Y.id_semester as id_semester , X.nama_mapel as nama_mapel, C.id_agama as id_agama, Y.id_kd as id_kd, Y.nomor_kd as nomor_kd, Y.deskripsi as deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas FROM nilai_agamakd_ki3 B RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel INNER JOIN agama C ON C.id_agama = Y.id_agama INNER JOIN data_siswa Z WHERE Z.id_siswa = '".$data['id_siswa']."' AND Y.id_agama = '".$data['id_agama']."' AND Y.id_mapel = '".$data['id_mapel']."' AND Y.id_kelas = '".$dtsq1['id_kelas']."' AND Y.id_semester = '".$dtsq2['id_semester']."' GROUP BY Y.id_kd");
				while ($kd = mysqli_fetch_array($query)) { ?>
					<tbody class="font-12">
						<tr>
							<td hidden>
							<input type="text" name="id_mapel" value="<?= $kd['id_mapel']; ?>" readonly> 
							<input type="text" name="id_kd" value="<?= $kd['id_kd']; ?>" readonly>
							</td>
							<td>
				               <input type="text" class="form-control" name="nomor_kd" value="<?= $kd['nomor_kd']; ?>" readonly>
				               <label class="form-label"></label>
				            </td>
							<td>
				               <textarea name="deskripsi" cols="110" rows="3" class="form-control no-resize font-12" required readonly><?= $kd['deskripsi']; ?></textarea>
				            </td>
							<td>
								<div class="dropdown">
                                    <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">Action</button>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="?page=nilai_akhir_kdagamaki3&id=<?= $data['id_mapel'] ?>&sis=<?= $data['id_siswa']; ?>&agm=<?= $kd['id_agama']; ?>&kd=<?= $kd['id_kd']; ?>">Nilai</a></li>
                                    </ul>
                                </div>
							</td>
						</tr>
					</tbody>
			<?php } ?>
		</table>
		<div class="table table-responsive">
		<table class="table table-responsive table-bordered table-hover">
			<thead>
				<tr>
					<?php 

					$nilai = array("Nomor_kd","Tugas1","Tugas2","Tugas3","Tugas4","Tugas5","PH1","PH2","PH3","PH4","PTS","PAS","NILAI KD", "ACTION");
					foreach ($nilai as $nil) {
						echo "<th class='bg-light-blue'>".$nil."</th>";
					}
					?>
				</tr>
			</thead>
			<?php 
			//data diambil dari view hitung_kd
			$sqlkd = mysqli_query($koneksi, "SELECT * FROM hitung_kdagm_ki3 WHERE id_mapel = '".$data['id_mapel']."' AND id_siswa = '".$data['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");


			// $query = mysqli_query($koneksi, "SELECT * FROM nilai_raportkd_ki3 WHERE id_mapel = '".$data['id_mapel']."' AND id_siswa = '".$data['id_siswa']."' GROUP BY id_kd");
			while ($kd = mysqli_fetch_array($sqlkd)) { ?>
				<tbody>
					<tr class="font-12">
						<td class=""><?= $kd['nomor_kd']; ?></td>
						<td><?= $kd['tugas1']; ?></td>
						<td><?= $kd['tugas2']; ?></td>
						<td><?= $kd['tugas3']; ?></td>
						<td><?= $kd['tugas4']; ?></td>
						<td><?= $kd['tugas5']; ?></td>
						<td><?= $kd['ph1']; ?></td>
						<td><?= $kd['ph2']; ?></td>
						<td><?= $kd['ph3']; ?></td>
						<td><?= $kd['ph4']; ?></td>
						<td><?= $kd['pts']; ?></td>
						<td><?= $kd['pas']; ?></td>
						<td><?= $kd['nilai_kd']; ?></td>
						<td>
							<div class="dropdown">
                                    <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                                                Action
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="?page=nilai_akhir_kdagamaki3&id=<?= $data['id_mapel']; ?>&sis=<?= $data['id_siswa']; ?>&agm=<?= $data['id_agama'] ?>&edit=<?= $kd['id_kd']; ?>">Edit</a></li>
                                    </ul>
                                </div>
						</td>
					</tr>
				</tbody>
			<?php }
			?>
		</table>
		<?php 
		$sqlcek = mysqli_query($koneksi, "SELECT * FROM nilai_raport_ki3 WHERE id_mapel = '".$data['id_mapel']."' AND id_siswa = '".$data['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
		$cekmpl = mysqli_num_rows($sqlcek);
		if ($cekmpl == 1) {
		    echo "<div class='pull-right'><a href='?page=nilai&id=".$data['nama_siswa']."'><button class='btn btn-success'><h4>Nilai sudah keluar</h4></button></a></div>";
		}else{
		    echo "<div class='pull-right'><a href='?page=nilai&id=".$data['nama_siswa']."'><button class='btn btn-danger'><h4>Nilai belum keluar</h4></button></a></div>";
		}
		?>
		</div>
		<form>
			<button type="button" class="btn bg-indigo" data-toggle="modal" data-target="#defaultModal">Hitung</button>
		</form>
	</div>
</div>

<?php 
//untuk include halaman ketika edit/input
if (isset($_GET['kd'])) {
	include "input_akhir_agama_ki3.php";
}
if(isset($_GET['edit'])){
	include "edit/edit_nilai_akhir_agamaki3.php";
}else{
	echo "";
}
?>

<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">Nilai : <?= $data['id_mapel']; ?> Atas Nama : <?= $data['nama_siswa']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                            <?php $nilkd = mysqli_query($koneksi, "SELECT max(nilai_kd) as nilai FROM hitung_kdagm_ki3 WHERE id_mapel = '".$data['id_mapel']."' AND id_siswa ='".$data['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
                            $datakd = mysqli_fetch_array($nilkd);

                            $sqlkkm = mysqli_query($koneksi, "SELECT Y.pengetahuan as pengetahuan, Y.id_mapel as id_mapel , id_kelas , id_semester FROM hitung_kdagm_ki3 X INNER JOIN mapel Y WHERE Y.id_mapel ='".$data['id_mapel']."' AND id_siswa = '".$data['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
										$datakkm = mysqli_fetch_array($sqlkkm);

										$nilaimax = $datakd['nilai'];
										$kkm = $datakkm['pengetahuan'];
										$rentang = (100 - $kkm)/3; //100 - kkm satuan pendidikan dibagi 3

										//echo "Nilai : ".$nilaimax."<br>"; //nialimax();
										//echo "KKM : ".$kkm."<br>"; // kkm per mapel
										$e = $kkm - $rentang;
										$d = $e + $rentang; //70 - 10 = 60
										$c = $d + $rentang; //60 + 10 = 80
										$b = $c + $rentang; //80 + 10 = 90
										$a = $b + $rentang; //90 + 10 = 100

										// echo $a.", ".$b.", ".$c.", ".$d.", ".$e;
										// echo "<br><hr><br>";

										/*
										Grade A = Sangat baik
										Grade B = Baik
										Grade C = Cukup 
										Grade D = Perlu bimbingan
										Grade E = Kurang
										*/
										//< lebih kecil dari
										//> lebih besar dari
										if ($nilaimax >= $b) {
											$grade = "A";
											$sttm = "sudah ";
											$stm = "Sangat baik ";
											$sis = $sqlsis['nama_siswa'];
										}else if ($nilaimax >= $c) {
											$grade = "B";
											$sttm = "sudah ";
											$stm = "Baik ";
											$sis = $sqlsis['nama_siswa'];
										}else if ($nilaimax >= $d) {
											$grade = "C";
											$sttm = "sudah ";
											$stm = "Cukup ";
											$sis = $sqlsis['nama_siswa'];
										}else if ($nilaimax >= $e){
											$grade = "D";
											$sttm = "belum ";
											$stm = "Perlu bimbingan ";
											$sis = $sqlsis['nama_siswa'];
										}else if ($nilaimax <= $e){
											$grade = "E";
											$sttm = "belum ";
											$stm = "Kurang ";
											$sis = $sqlsis['nama_siswa'];
										}else{
											$grade = "0";
											$sis = $sqlsis['nama_siswa'];
										}
										$km = $datakkm['pengetahuan'];
										include "ambilnilaisiswa.php";
                            ?>        
                            
                                        <form id="form_validation" method="POST" action="proses/simpan_hasil.php">
                                        <div class="row">
                                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                        	<div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">ID Siswa</label>
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $data['id_siswa']; ?>" required readonly>
                                                </div>
                                                <div class="form-line" hidden>
                                                    <label class="form-label">Tahun awal</label>
                                                    <input type="text" class="form-control" name="tahun_awal" value="<?= $dtview['tahun_ajaran_awal']; ?>" required readonly>
                                                </div>
                                                <div class="form-line" hidden>
                                                    <label class="form-label">Tahun akhir</label>
                                                    <input type="text" class="form-control" name="tahun_akhir" value="<?= $dtview['tahun_ajaran_akhir']; ?>" required readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">ID Mapel</label>
                                                    <input type="text" class="form-control" name="id_mapel" value="<?= $datakkm['id_mapel']; ?>" required readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">ID Kelas</label>
                                                    <input type="text" class="form-control" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>" required readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">ID Semester</label>
                                                    <input type="text" class="form-control" name="id_semester" value="<?= $dtsq2['id_semester']; ?>" required readonly>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                        	<div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Nama Siswa</label>
                                                    <input type="text" class="form-control" name="nama_siswa" value="<?= $data['nama_siswa']; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Nama Mapel</label>
                                                    <input type="text" class="form-control" name="nama_mapel" value="<?= $data['nama_mapel']; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Nilai</label>
                                                    <input type="text" class="form-control" name="nilai" value="<?= $datakd['nilai']; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Predikat</label>
                                                    <input type="text" class="form-control" name="predikat" value="<?= $grade; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Deskripsi</label>
                                                    <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" required readonly><?php echo $sis . $sttm . "tuntas dengan predikat " . $stm . ", " . $sis ." ". $stm . " dalam "; kkmagmki3(); ?></textarea>
                                                </div>
                                            </div>
                                            <?php 
                                            date_default_timezone_set('Asia/Jakarta'); 
											$date_raport = date("Y-m-d h:i:s");
                                            ?>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <label class="form-label">Tanggal Raport</label>
                                                    <input type="text" class="form-control" name="tgl_raport" value="<?= $date_raport; ?>" required readonly>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn bg-indigo waves-effect" name="simpan">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">NANTI</button>
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