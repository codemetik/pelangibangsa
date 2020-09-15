<?php 
include "../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler WHERE id_ekstra ='".$id."'");
$ekstra = mysqli_fetch_array($sql);
?>
<div class="card">
    <div class="header">
        <h2>Edit Extrakurikuler</h2>
    </div>
<div class="body">
<div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_ekstra" value="<?= $ekstra['id_ekstra']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" value="<?= $ekstra['no']; ?>" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kegiatan" value="<?= $ekstra['kegiatan']; ?>" required>
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
    $id = $_POST['id_ekstra'];
    $no = $_POST['no'];
    $kegiatan = $_POST['kegiatan'];

    $sql = mysqli_query($koneksi, "UPDATE ekstrakurikuler SET id_ekstra = '".$id."', no = '".$no."', kegiatan = '".$kegiatan."' WHERE id_ekstra = '".$id."'");
    if ($sql) {
        echo "<script>
        alert('Data berhasil diupdate');
        document.location.href = '?page=ekp';
        </script>";
    }else{
        echo "<script>
        alert('Data gagal diupdate');
        document.location.href = '?page=ekp';
        </script>";
    }
}
?>