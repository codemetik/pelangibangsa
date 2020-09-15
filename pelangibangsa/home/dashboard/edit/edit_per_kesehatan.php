<?php 
$id = $_GET['id'];
$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

echo $siswa['nama_siswa'];
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
					$query = mysqli_query($koneksi, "SELECT * FROM per_kesehatan WHERE id_siswa = '".$siswa['id_siswa']."'  AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
					while ($dt = mysqli_fetch_array($query)) {
						$array[] = array(
							'id_siswa' => $dt['id_siswa'],
							'id_kelas' => $dt['id_kelas'],
							'id_semester' => $dt['id_semester'],
							'id_kesehatan' => $dt['id_kesehatan'],
							'aspek_fisik' => $dt['aspek_fisik'],
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
							<td hidden><input type="text" name="idKes[]" value="<?= $array[$i]['id_kesehatan']; ?>"></td>
							<td scope="row" class="col-xs-2"><?= $array[$i]['aspek_fisik'] ?></td>
							<td scope="row" class="col-xs-2"><input type="text" name="keTer[]" value="<?= $array[$i]['keterangan']; ?>"></td>
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
    $idkes = $_POST['idKes'];
    $keTer = $_POST['keTer'];
    $ini = count($idkes);
    for ($i=0; $i < $ini ; $i++) { 
        $query = mysqli_query($koneksi, "UPDATE per_kesehatan SET keterangan = '$keTer[$i]' where id_kesehatan = '$idkes[$i]'");
        if ($query) {
            echo "<script>
                alert('Data berhasil di rubah');
                document.location.href = '?page=edit_kesehatan_1&id=".$siswa['nama_siswa']."';
            </script>";
        }
    }
}
?>