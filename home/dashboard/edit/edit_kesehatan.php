<?php 
include "../../connect.php";
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM kesehatan WHERE id_kesehatan ='".$id."'");
$kondisi = mysqli_fetch_array($sql);
?>
<div class="card">
    <div class="header">
        <h2>Edit Kesehatan</h2>
    </div>
<div class="body">
<div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form id="form_validation" method="POST" action="">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kesehatan" value="<?= $kondisi['id_kesehatan']; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no" value="<?= $kondisi['no']; ?>" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="aspek_fisik" value="<?= $kondisi['aspek_fisik']; ?>" required>
                                                    <label class="form-label">ASPEK FISIK</label>
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
    $id = $_POST['id_kesehatan'];
    $no = $_POST['no'];
    $aspek = $_POST['aspek_fisik'];
    $sql = mysqli_query($koneksi, "UPDATE kesehatan SET id_kesehatan ='".$id."', no = '".$no."', aspek_fisik = '".$aspek."' WHERE id_kesehatan = '".$id."'");
    if ($sql) {
        echo "<script>
        alert('Data berhasil di update.');
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