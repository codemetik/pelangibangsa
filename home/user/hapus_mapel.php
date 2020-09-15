<div class="card">
	<div class="header bg-indigo">
		<h2>HAPUS MAPEL UNTUK KELAS</h2>
	</div>
	<div class="body">
		<form action="" method="POST">
			<div class="form-group form-float">
				<select class="form-control" name="id_kelas">
					<option>--PILIH KELAS--</option>
					<?php 
					$sql = mysqli_query($koneksi, "SELECT * FROM kelas");
					while ($dtkelas = mysqli_fetch_array($sql)) { ?>
						<option value="<?= $dtkelas['id_kelas']; ?>"><?= $dtkelas['kelas']; ?></option>
					<?php }
					?>
				</select>
			</div>
			<div class="form-group form-float">
				<select class="form-control" name="id_semester">
					<option>--PILIH SEMESTER--</option>
					<?php 
					$sql2 = mysqli_query($koneksi, "SELECT * FROM semester");
					while ($dtsm = mysqli_fetch_array($sql2)) { ?>
						<option value="<?= $dtsm['id_semester']; ?>"><?= $dtsm['semester']; ?></option>
					<?php }
					?>
				</select>
			</div>
			<input type="submit" name="ambil_data" value="ambil_data" class="btn bg-indigo">
		</form>
	</div>
</div>
<?php 

if (isset($_POST['ambil_data'])) {
	$id_kelas = $_POST['id_kelas'];
	$id_semester = $_POST['id_semester'];

?>
<div class="card">
	<div class="table">
			<table class="table table-brdered table-hover font-11">
				<tr class="table-header bg-indigo">
					<th>KELAS</th>
					<th>SEMESTER</th>
					<th>MAPEL</th>
					<th>NAMA MAPEL</th>
					<th>ACTION</th>
				</tr>
				<?php 
				$sqlmpl = mysqli_query($koneksi, "SELECT * FROM show_mapel_perkelas WHERE id_kelas = '".$id_kelas."' AND id_semester = '".$id_semester."'");
				while ($dt = mysqli_fetch_array($sqlmpl)) { ?>
					<tr>
						<td><?= $dt['id_kelas']; ?></td>
						<td><?= $dt['id_semester']; ?></td>
						<td><?= $dt['id_mapel']; ?></td>
						<td><?= $dt['nama_mapel']; ?></td>
						<td>
							<div class="dropdown">
                                <button type="submit" href="" class="btn bg-indigo" data-toggle="dropdown">
                                    Action
                                </button>
                                <ul class="dropdown-menu pull-right">
                                	<li><a href="?page=cek_admin&hapus=<?= $dt['id_mapel']; ?>&idkelas=<?= $dt['id_kelas']; ?>&idsm=<?= $dt['id_semester']; ?>">Delete</a></li>
                                </ul>
                             </div>
						</td>
					</tr>
				<?php } ?>
			</table>
		</div>
</div>
<?php } ?>