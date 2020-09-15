<?php 
include "../connect.php";
$id_mapel = $_GET['id'];

$sql = mysqli_query($koneksi, "SELECT * FROM mapel WHERE id_mapel = '".$id_mapel."'");
$mapel = mysqli_fetch_array($sql);

?>
                <div class="card">
                    <div class="header">
                        <h2>Edit Mata Pelajaran</h2>
                    </div>
                    <div class="body">
                        <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form action="" method="POST">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="no_mapel" value="<?= $id_mapel; ?>" readonly required>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float md-4">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nm_mapel" value="<?= $mapel['nama_mapel']; ?>" required>
                                                    <label class="form-label">NAMA MATA PELAJARAN</label>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                            <div class="form-group form-float">
                                                <div class="row clearfix">
                                                    <div class="col-md-8">
                                                        <p>
                                                            <b>Kelompok</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="kelompok">
                                                            <?php 
                                                            $kelompok = array('A', 'B', 'C');
                                                            foreach ($kelompok as $key) {
                                                                if ($key == $mapel['kelompok']) {
                                                                    $select = "selected";
                                                                }else{
                                                                    $select = "";
                                                                }
                                                            ?>
                                                                <option value="<?= $key; ?>" <?= $select; ?> ><?= $key; ?></option>        
                                                            <?php }
                                                            ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="singkatan_mapel" value="<?= $mapel['singkat_mapel']; ?>" required>
                                                    <label class="form-label">SINGKATAN MAPEL</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kkm_pengetahuan" value="<?= $mapel['pengetahuan']; ?>" required>
                                                    <label class="form-label">KKM PENGETAHUAN</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="kkm_keterampilan" value="<?= $mapel['keterampilan']; ?>" required>
                                                    <label class="form-label">KKM KETERAMPILAN</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox" id="checkbox" name="tema">
                                                <label for="checkbox">Menggunakan Tema</label>
                                            </div>
                                            <div class="modal-footer">
                                                <?php 
                                                if ($mapel['id_mapel'] == 'MPL01') { ?>
                                                    <button type="submit" name="simpan" class="btn btn-primary m-t-15 waves-effect">SIMPAN PERUBAHAN</button>
                                                    <a type="submit" href="?page=show_kkm" class="btn btn-primary m-t-15 waves-effect">CENCEL</a>
                                                <?php }else if ($mapel['id_mapel'] != 'MPL01') { ?>
                                                    <button type="submit" name="simpan" class="btn btn-primary m-t-15 waves-effect">SIMPAN PERUBAHAN</button>
                                                    <a href="?page=proses_hapus_mapel_permanen&mapel=<?= $id_mapel; ?>" class="btn btn-primary m-t-15 waves-effect">DELETE</a>
                                                    <!-- code untuk menghapus data mepel berdasarkan id_mapel 
                                                        <a type="submit" class="btn btn-primary m-t-15 waves-effect" href="delete/delete_kkm.php?id=<?= $id; ?>" onclick="return confirm('Apakah anda yakin ingin menghapus Mata Pelajaran ini?')">DELETE</a> -->
                                                    <a type="submit" href="?page=show_kkm" class="btn btn-primary m-t-15 waves-effect">CENCEL</a>
                                                <?php }
                                                ?>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                        </div>
                     </div>
                 </div>

                 

<!-- Large Size -->
            <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT KD KI-3 PENGETAHUAN</h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                    <form id="form_validation" method="POST" action="proses/proses_kd_ki3.php">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_kde" value="<?= $kdsr; ?>" required readonly>
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
                                                            <b>Mata Pelajaran</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_mapel">
                                                        <?php 
                                                        $sql_id_mapel = mysqli_query($koneksi, "SELECT * FROM mapel WHERE id_mapel = '".$id."'");
                                                        while ($dt_idMapel = mysqli_fetch_array($sql_id_mapel)) {?>
                                                            <option value="<?= $dt_idMapel['id_mapel']; ?>"><?= $dt_idMapel['nama_mapel']; ?></option>
                                                        <?php } ?>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nom" required>
                                                    <label class="form-label">NO</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="nomor_kd" required>
                                                    <label class="form-label">KD</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <textarea name="deskripsi" cols="30" rows="5" class="form-control no-resize" required></textarea>
                                                    <label class="form-label">KALIMAT KUNCI KD</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn bg-indigo waves-effect" name="submit">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">TUTUP</button>
                                            </div>
                                        </form>
                            
                                   
                                </div>
                            
                            </div>
                        </div>
                        </div>
                        <!-- <div class="modal-footer">
                            <button type="button" class="btn btn-link btn-primary waves-effect">SAVE CHANGES</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">CLOSE</button>
                        </div> -->
                    </div>
                </div>
            </div>

<?php 
if (isset($_POST['simpan'])) {

$idmapel =  $_POST['no_mapel'];
$nm_mapel = $_POST['nm_mapel'];
$kelompok= $_POST['kelompok'];
$singkat_mapel = $_POST['singkatan_mapel'];
$kkm_tahu = $_POST['kkm_pengetahuan'];
$kkm_terampil = $_POST['kkm_keterampilan'];
$tema = $_POST['tema'];

    $sqlmapel = mysqli_query($koneksi, "UPDATE mapel SET 
        id_mapel = '".$idmapel."', 
        nama_mapel = '".$nm_mapel."', 
        kelompok = '".$kelompok."', 
        singkat_mapel = '".$singkat_mapel."', 
        pengetahuan = '".$kkm_tahu."', 
        keterampilan = '".$kkm_terampil."', 
        tema = '".$tema."' 
        WHERE id_mapel = '".$idmapel."' ");
    if ($sqlmapel) {
        echo "<script>
                alert('Data mapel berhasil diupdate.');
                document.location.href = '?page=show_kkm';
            </script>";
    }else{
        echo "<script>
                alert('Data mapel gagal diupdate.');
                document.location.href = '?page=show_kkm';
            </script>";
    }
}
?>