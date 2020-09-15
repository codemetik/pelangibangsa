<?php
include "../../connect.php";
$_GET['id'];
$id = $_GET['id'];
$sql = mysqli_query($koneksi, "SELECT * FROM sikap_sosial WHERE id_sosial= '".$id."'");
$sikap = mysqli_fetch_array($sql);
?>
<div class="row clearfix">
    <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="header bg-orange">
                            <h2>
                                Edit butir sikap sosial
                            </h2>
                        </div>
                        <div class="body">
                            
                            <form action="" method="POST">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="id_sosial" value="<?= $id; ?>" class="form-control" readonly>
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
                                <!-- <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="delete/delete_sosial.php?id=<?= $id; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus jurnal sikap ini?')">DELETE</a> -->
                                <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="index.php?page=ki2">CENCEL</a>
                            </form>
                        
                        </div>
                    </div>
                </div>
</div>

<?php 
if (isset($_POST['submit'])) {
$id_sp =  $_POST['id_sosial'];
$btr = $_POST['butir_sikap'];

    $sqlsikap = mysqli_query($koneksi, "UPDATE sikap_sosial SET id_sosial = '".$id_sp."', butir_sikap = '".$btr."' WHERE id_sosial = '".$id_sp."'");
    if ($sqlsikap) {
        echo "<script>
                alert('Data berhasil diupdate.');
                document.location.href = 'index.php?page=ki2';
            </script>";
    }else{
        echo "<script>
                alert('Data gagal diupdate.');
                document.location.href = 'index.php?page=ki2';
            </script>";
    }
}
?>