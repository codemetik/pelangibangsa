
<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Input pengetahuan</a></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b>KI-3 mapel</b></i></li>
  </ol>
</nav>
<!-- Basic Examples -->
                <?php 
                    $sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
                    $dtsq1 = mysqli_fetch_array($sq1);

                    $sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
                    $dtsq2 = mysqli_fetch_array($sq2);

                    $sql_mapel = mysqli_query($koneksi, "SELECT y.id_mapel, nama_mapel, singkat_mapel, x.id_kelas, x.id_semester FROM roles_mapel X INNER JOIN mapel Y ON y.id_mapel = x.id_mapel WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY y.id_mapel");
                    while($data_mapel = mysqli_fetch_array($sql_mapel)){
                        if ($data_mapel['id_mapel'] != 'MPL01') {
                ?>
       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h5>
                                <?= $data_mapel['id_mapel']." - ".$data_mapel['nama_mapel']; ?> KOMPETENSI INTI (KI-3)
                                <small>Nilai KI-3.</small>
                            </h5>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#defaultModal">
                                            INPUT KD
                                        </a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                                
                                <div class="body">
                                    <div class="table-responsive">
                                        <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-11">
                                            <thead>
                                                <tr>
                                                <?php
                                                $data = array('No', 'KD', 'Kalimat', 'Opsi');
                                                foreach ($data as $key) {
                                                    echo "<th class='bg-light-blue'>".$key."</th>";
                                                
                                                 } ?>
                                                </tr>
                                            </thead>
                                            <?php 

                                            //stop looping for value table
                                            $kd_1 = mysqli_query($koneksi, "SELECT * FROM kd_pengetahuan WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' ORDER BY id_kd");
                                            while ($data_kd1 = mysqli_fetch_array($kd_1)) { 
                                                if (($data_mapel['id_mapel'] === $data_kd1['id_mapel'])) {
                                            ?>
                                            <tbody>
                                                <tr>
                                                    <td><?= $data_kd1['nom']; ?></td>
                                                    <td><?= $data_kd1['nomor_kd']; ?></td>
                                                    <td><?= $data_kd1['deskripsi']; ?></td>
                                                    <td><a type="button" class="btn bg-indigo m-t-0 waves-effect" href="?page=edit_ki3&id=<?= $data_kd1['id_kd']; ?>">Detail</a></td>
                                                </tr>    
                                            </tbody>
                                            <?php 
                                                } 
                                            }
                                            ?>
                                        </table>
                                    </div>
                                </div>
                    </div> <!--//Close card-->
               </div>
                <?php }
        } ?>
<!-- #END# Basic Examples -->
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
                                                            <b>Pilih Mata Pelajaran</b>
                                                        </p>
                                                        <select class="form-control show-tick" name="id_mapel">
                                                        <?php 
                                                        $sql_id_mapel = mysqli_query($koneksi, "SELECT y.id_mapel, nama_mapel, singkat_mapel, x.id_kelas, x.id_semester FROM roles_mapel X INNER JOIN mapel Y ON y.id_mapel = x.id_mapel WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' GROUP BY y.id_mapel");
                                                        while ($dt_idMapel = mysqli_fetch_array($sql_id_mapel)) { 
                                                            if ($dt_idMapel['id_mapel'] != 'MPL01') {
                                                            ?>
                                                            <option value="<?= $dt_idMapel['id_mapel']; ?>"><?= $dt_idMapel['nama_mapel']; ?></option>
                                                        <?php }
                                                        }
                                                        ?>
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