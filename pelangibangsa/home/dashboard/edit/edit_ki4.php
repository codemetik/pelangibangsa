<?php 
include "../../connect.php";
$sql = mysqli_query($koneksi, "SELECT * FROM kd_keterampilan WHERE id_kd = '".$_GET['id']."'");
$sqlkd = mysqli_fetch_array($sql);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);
?>
<div class="card">
    <div class="body">
    <div class="row clearfix">
        <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="">
                                        <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kde" value="<?= $sqlkd['id_kd']; ?>" required readonly>
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
                                                
                                                <div class="row clearfix">
                                                    <div class="col-md-8">
                                                        <p>
                                                            <b>Pilih Mata Pelajaran</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_mapel">
                                                        <?php 
                                                        $sql_id_mapel = mysqli_query($koneksi, "SELECT * FROM mapel WHERE id_mapel ='".$sqlkd['id_mapel']."'");
                                                        while ($dt_idMapel = mysqli_fetch_array($sql_id_mapel)) { ?>
                                                            <option value="<?= $dt_idMapel['id_mapel']; ?>"><?= $dt_idMapel['nama_mapel']; ?></option>
                                                        <?php }
                                                        ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nom" value="<?= $sqlkd['nom']; ?>" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nomor_kd" value="<?= $sqlkd['nomor_kd']; ?>" required>
                                                    <label class="form-label">KD</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" required><?= $sqlkd['deskripsi']; ?></textarea>
                                                    <label class="form-label">KALIMAT KUNCI KD</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary m-t-15 waves-effect" name="submit">SIMPAN</button>
                                                <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="delete/delete_ki4.php?id=<?= $sqlkd['id_kd']; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus KD ini?')">DELETE</a>
                                                <a type="button" class="btn btn-primary m-t-15 waves-effectt" href="?page=ki4">CENCEL</a>
                                            </div>
                                        </form>
                            
                                   
        </div>
                            
    </div>
    </div>
</div>
<?php 
if (isset($_POST['submit'])) {
    $idkd = $_POST['id_kde'];
    $idmapel = $_POST['id_mapel'];
    $id_kelas = $_POST['id_kelas'];
    $id_semester = $_POST['id_semester'];
    $nom = $_POST['nom'];
    $nomor_kd = $_POST['nomor_kd'];
    $deskripsi = $_POST['deskripsi'];

    $sqlkd = mysqli_query($koneksi, "UPDATE kd_keterampilan SET id_kd = '".$idkd."', nom = '".$nom."', nomor_kd ='".$nomor_kd."', deskripsi ='".$deskripsi."', id_mapel = '".$idmapel."', id_kelas = '".$id_kelas."', id_semester = '".$id_semester."' WHERE id_kd = '".$idkd."' ");
    if ($sqlkd) {
        echo "<script>
        alert('Data berhasil diupdate');
        document.location.href = '?page=ki4';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal diupdate');
        document.location.href = '?page=ki4';
        </script>";
    }
}
?>