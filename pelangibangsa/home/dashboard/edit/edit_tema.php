<?php 
include "../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM tema WHERE id_tema ='".$id."'");
$tema = mysqli_fetch_array($sql);
?>
<div class="card">
<div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" value="<?= $id; ?>" required readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float md-4">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="judul_tema" value="<?= $tema['judul_tema']; ?>" required>
                                                    <label class="form-label">JUDUL TEMA</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="simpan" class="btn btn-primary m-t-15 waves-effect" name="simpan">SIMPAN</button>
                                                <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="delete/delete_tema.php?id=<?= $id; ?>">DELETE</a>
                                                <a type="button" class="btn btn-primary m-t-15 waves-effect" href="?page=kkm">CENCEL</a>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                    </div>
<?php 
if (isset($_POST['simpan'])) {
    $id_tema = $_POST['no'];
    $judul_tema = $_POST['judul_tema'];
    $sqltema = mysqli_query($koneksi, "UPDATE tema SET id_tema ='".$id_tema."', judul_tema = '".$judul_tema."' WHERE id_tema ='".$id_tema."'");
    if ($sqltema) {
        echo "<script>
        alert('Data berhasil diupdate');
        document.location.href ='?page=kkm';
        </script>";
    }else{
        echo "<script>
            alert('Data gagal diupdate');
            document.location.href ='?page=kkm';
            </script>";
    }
}
?>