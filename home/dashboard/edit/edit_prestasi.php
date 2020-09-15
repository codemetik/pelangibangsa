<?php 
include "../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM prestasi WHERE id_prestasi ='".$id."'");
$prestasi = mysqli_fetch_array($sql);
?>
<div class="card">
    <div class="header">
        <h2>Edit Prestasi</h2>
    </div>
<div class="body">
<div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_prestasi" value="<?= $prestasi['id_prestasi']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" value="<?= $prestasi['no']; ?>" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="prestasi" value="<?= $prestasi['jenis_prestasi']; ?>" required>
                                                    <label class="form-label">KEGIATAN</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-link btn-primary waves-effect" name="submit">SIMPAN</button>
                                                <a type="button" class="btn btn-link waves-effect" href="?page=ekp">TUTUP</a>
                                            </div>
                                        </form>
                                </div>
                            </div>
                        </div>
                    </div>
<?php 
if (isset($_POST['submit'])) {
    $id = $_POST['id_prestasi'];
    $no = $_POST['no'];
    $prestasi = $_POST['prestasi'];

    $sql = mysqli_query($koneksi, "UPDATE prestasi SET id_prestasi ='".$id."', no ='".$no."', jenis_prestasi ='".$prestasi."' WHERE id_prestasi = '".$id."'");
    if ($sql) {
        echo "<script>
        alert('Data berhasil di update');
        document.location.href = '?page=ekp';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal di update');
        document.location.href = '?page=ekp';
        </script>";
    }
}
?>