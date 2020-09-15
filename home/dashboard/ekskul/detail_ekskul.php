<?php 
$ide = $_GET['id'];

$query = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai WHERE id_ekstra = '$ide'");
while ($data = mysqli_fetch_array($query)) {
	$array[] = array(
		'id_muatan' => $data['id_muatan'],
		'id_ekstra' => $data['id_ekstra'],
		'teknik_muatan' => $data['teknik_muatan']
	);
}
// echo count($array);
?>
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Data umum</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>ekp</b></i></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>Detail Ekskul</b></i></li>
  </ol>
</nav>
<!-- Basic Examples -->

<div class="card">
	<div class="header">
		<?php 
		$sql = mysqli_query($koneksi, "SELECT x.id_ekstra as ide, kegiatan FROM ekstrakurikuler x INNER JOIN tb_muatan_nilai y ON y.id_ekstra = x.id_ekstra WHERE x.id_ekstra = '".$array[0]['id_ekstra']."'"); 
		$dtsql = mysqli_fetch_array($sql);
		?>
		<h2><?= $dtsql['kegiatan']; ?> <a href="" class="btn bg-indigo" data-toggle="modal" data-target="#defaultModal">Tambah Muatan</a></h2>
	</div>
	<div class="body">
		<form action="ekskul/proses_ekskul.php" method="POST">
	        <div class="row">
            <?php 

            $quer = mysqli_query($koneksi, "SELECT * FROM tb_muatan_nilai where id_ekstra = '".$dtsql['ide']."'");
            while($dt = mysqli_fetch_array($quer)){
                $ray[] = array(
                    'id_muatan' => $dt['id_muatan'],
                    'id_ekstra' => $dt['id_ekstra'],
                    'teknik_muatan' => $dt['teknik_muatan']
                 );
            }
            $isi = count($ray);
            $pcs = 0;
            $no=1;
            for ($i=$pcs; $i < $isi; $i++) {?>
                <div class="col-xs-3 col-md-3 col-lg-3">
                   <div class="form-group form-float">
                        <div class="form-line">
                            <label><?= $no++ ."."; ?></label>
                            <div hidden>
                            <input type="text" name="id_muatan[]" value="<?= $ray[$i]['id_muatan']; ?>" class="form-control">    
                            </div>
                            <div hidden>
                            	<input type="text" name="idekstra" value="<?= $ray[$i]['id_ekstra']; ?>">
                            </div>
                            <label><?= 'Muatan Nilai'; ?></label>
                            <input type="text" name="teknik_muatan[]" value="<?= $ray[$i]['teknik_muatan']; ?>" class="form-control">
                        </div>
                    </div>
               </div>
            <?php  }
            ?>
            </div>
	        <br>
	        <button type="submit" name="simpan" class="btn bg-indigo m-t-15 waves-effect" >SIMPAN</button>
	        <a href="?page=ekp" class="btn bg-indigo m-t-15 waves-effect">Cencel</a>
            <!-- <button type="submit" name="edit" class="btn bg-indigo m-t-15 waves-effect">Edit</button> -->
            <a href="?page=delete_ekskul&edit=<?= $ray[0]['id_ekstra']; ?>" class="btn bg-indigo m-t-15 waves-effect" name="edit">Delete Muatan</a>
	    </form>
	</div>
</div>

<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="defaultModalLabel">Input Teknik Muatan</h4>
            </div>
            <form action="" method="POST">
            <div class="modal-body">
                <div class="form-group">
                    <div class="form-line">
                        <input type="text" name="id_ekstra" class="form-control" value="<?= $ide; ?>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-line">
                        <input type="text" name="teknik_muatan" class="form-control">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-link waves-effect" name="simpan_muatan">Simpan</button>
                <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Tutup</button>
            </div>
            </form>
        </div>
    </div>
</div>
<?php 
if (isset($_POST['simpan_muatan'])) {
    $id_ekstra = $_POST['id_ekstra'];
    $teknik_muatan = $_POST['teknik_muatan'];

    $sql_int = mysqli_query($koneksi, "INSERT INTO tb_muatan_nilai(id_ekstra, teknik_muatan) VALUES('".$id_ekstra."','".$teknik_muatan."')");
    if ($sql_int) {
        echo "<script>
        alert('Data berhasil disimpan');
        document.location.href = '?page=detail_ekskul&id=".$id_ekstra."';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal disimpan');
        document.location.href = '?page=detail_ekskul&id=".$id_ekstra."';
        </script>";
    }
}
?>