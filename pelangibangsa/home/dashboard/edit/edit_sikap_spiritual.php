<?php
include "../../connect.php";
$_GET['id'];
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM sikap_spiritual WHERE id_spiritual = '".$id."'");
$sikap = mysqli_fetch_array($sql);
?>
<div class="row clearfix">
    <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="header bg-green">
                            <h2>
                                Edit butir sikap spiritual
                            </h2>
                        </div>
                        <div class="body">
                            
                            <form action="" method="POST">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="id_spiritual" value="<?= $id; ?>" class="form-control" readonly>
                                        <label class="form-label"></label>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="butir_sikap" class="form-control" value="<?= $sikap['butir_sikap']; ?>" required>
                                        <label class="form-label">Butir sikap</label>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" name="submit" class="btn btn-primary m-t-15 waves-effect" >SIMPAN</button>
                                <!-- <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="delete/delete_spiritual.php?id=<?= $id; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus jurnal sikap ini?')">DELETE</a> -->
                                <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="?page=ki1">CENCEL</a>
                            </form>
                        
                        </div>
                    </div>
                </div>
</div>

<?php 
if (isset($_POST['submit'])) {
$id_sp =  $_POST['id_spiritual'];
$btr = $_POST['butir_sikap'];

    $sqlsikap = mysqli_query($koneksi, "UPDATE sikap_spiritual SET id_spiritual = '".$id_sp."', butir_sikap = '".$btr."' WHERE id_spiritual = '".$id_sp."'");
    if ($sqlsikap) {
        echo "<script>
                alert('Data berhasil diupdate.');
                document.location.href = 'index.php?page=ki1';
            </script>";
    }else{
        echo "<script>
                alert('Data gagal diupdate.');
                document.location.href = 'index.php?page=ki1';
            </script>";
    }
}
?>