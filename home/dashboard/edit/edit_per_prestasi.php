<?php 
$id = $_GET['id'];
$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);
?>
<div class="card">
	<div class="header">
		<h2>Edit Prestasi : <?= $siswa['nama_siswa']; ?></h2>
	</div>
	<div class="body">
		<div class="">
		<form action="" method="POST">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th scope="col" class="col-xs-2 bg-light-blue">Kegiatan</th>
						<th scope="col" class="col-xs-2 bg-light-blue">Keterangan</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$query = mysqli_query($koneksi, "SELECT * FROM per_prestasi WHERE id_siswa = '".$siswa['id_siswa']."'  AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
					while ($dt = mysqli_fetch_array($query)) {
						$array[] = array(
							'id_siswa' => $dt['id_siswa'],
							'id_kelas' => $dt['id_kelas'],
							'id_semester' => $dt['id_semester'],
							'id_prestasi' => $dt['id_prestasi'],
							'jenis_prestasi' => $dt['jenis_prestasi'],
							'keterangan' => $dt['keterangan'],
							'tgl_raport' => $dt['tgl_raport'],
							'tahun_ajaran_awal' => $dt['tahun_ajaran_awal'],
							'tahun_ajaran_akhir' => $dt['tahun_ajaran_akhir'] 
						);
					}
					$isi = count($array);
					$pcs = 0;
					for ($i=$pcs; $i < $isi; $i++) { ?>
						<tr>
							<td hidden><input type="text" name="idPres[]" value="<?= $array[$i]['id_prestasi']; ?>"></td>
							<td scope="row" class="col-xs-2"><?= $array[$i]['jenis_prestasi'] ?></td>
							<td scope="row" class="col-xs-2"><input type="text" name="jenisPres[]" value="<?= $array[$i]['keterangan']; ?>"></td>
						</tr>
					<?php }
					?>
				</tbody>
			</table>
			<input type="submit" name="simpan" class="btn bg-indigo">
			<a href="?page=nilai&id=<?= $siswa['nama_siswa']; ?>" class="btn bg-indigo">Cencel</a>
		</form>
		</div>
	</div>
</div>
<?php 
include "../../connect.php";

if (isset($_POST['simpan'])) {
    $idpres = $_POST['idPres'];
    $jenis = $_POST['jenisPres'];
    $ini = count($idpres);
    for ($i=0; $i < $ini ; $i++) { 
        $query = mysqli_query($koneksi, "UPDATE per_prestasi SET keterangan = '$jenis[$i]' where id_prestasi = '$idpres[$i]'");
        if ($query) {
            echo "<script>
                alert('Data berhasil di rubah');
                document.location.href = '?page=edit_prestasi_1&id=".$siswa['nama_siswa']."';
            </script>";
        }
    }
}
?>