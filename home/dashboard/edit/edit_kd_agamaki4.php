<?php 
$editkd = mysqli_query($koneksi, "SELECT * FROM kd_agama_ki4 WHERE id_kd = '".$_GET['editkd']."' GROUP BY id_agama");
$datikd =mysqli_fetch_array($editkd);
$sqlini = mysqli_query($koneksi, "SELECT * FROM agama INNER JOIN mapel WHERE id_agama = '".$datikd['id_agama']."' GROUP BY id_agama");
$fet = mysqli_fetch_array($sqlini);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

?>
<div class="card">
    <div class="header bg-light-blue">
        <h4>EDIT KD PABP /<?= $fet['agama']; ?></h4>
    </div>
    <div class="body">
        <div class="row clearfix">
            <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                
        
                    <form id="form_validation" method="POST" action="">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="id_kda" value="<?= $datikd['id_kd']; ?>" required readonly>
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
                                <input type="text" class="form-control" name="nom" value="<?= $datikd['nom']; ?>" required>
                                <label class="form-label">NO</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="nomor_kd" value="<?= $datikd['nomor_kd']; ?>" required>
                                <label class="form-label">KD</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" required><?= $datikd['deskripsi']; ?></textarea>
                                <label class="form-label">KALIMAT KUNCI KD</label>
                            </div>
                        </div>
                        <div class="form-group form-float" hidden>
                            <div class="form-line">
                                <input type="text" class="form-control" name="id_mapel" value="<?= $datikd['id_mapel']; ?>" required readonly>
                                <label class="form-label"></label>
                            </div>
                        </div>
                        <div class="form-group form-float" hidden>
                            <div class="form-line">
                                <input type="text" class="form-control" name="id_agama" value="<?= $datikd['id_agama']; ?>" required readonly>
                                <label class="form-label"></label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn bg-indigo waves-effect" name="edit">SIMPAN</button>
                            <a href="index.php?page=ki4_pabp" type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">TUTUP</a>
                        </div>
                    </form>
        
               
            </div>
        
        </div>
    </div>
</div>

<?php 
if (isset($_POST['edit'])) {
    $id_kd = $_POST['id_kda'];
    $id_kelas = $_POST['id_kelas'];
    $id_semester = $_POST['id_semester'];
    $nom = $_POST['nom'];
    $nomor_kd = $_POST['nomor_kd'];
    $des = $_POST['deskripsi'];
    $id_mapel = $_POST['id_mapel'];
    $id_agama = $_POST['id_agama'];

$sqledit = mysqli_query($koneksi, "UPDATE kd_agama_ki4 SET id_kd = '".$id_kd."', nom = '".$nom."', nomor_kd = '".$nomor_kd."', deskripsi = '".$des."', id_mapel = '".$id_mapel."', id_agama = '".$id_agama."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."' WHERE id_kd = '".$id_kd."'");
if ($sqledit) {
        echo "<script>
        alert('Data berhasil di perbaharui');
        document.location.href = 'index.php?page=ki4_pabp';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal diperbaharui');
        document.location.href = 'index.php?page=ki4_pabp';
        </script>";
    }
}

?>