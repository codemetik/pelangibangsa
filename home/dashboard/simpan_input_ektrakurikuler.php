<!-- Input nilai Eksktrakurikuler -->
            <div class="modal fade" id="defaultEkskul" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT EKSTRAKURIKULER <?= $_GET['id']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form method="POST" action="proses/proses_per_ekskul.php">
                                            <div class="form-group form-float">
                                                <div class="form-line" hidden>
                                                    <input type="text" class="form-control" name="id_siswa" value="<?= $siswa['id_siswa']; ?>" readonly required hidden>
                                                    <label class="form-label"></label>
                                                    <input type="text" name="nama_siswa" value="<?= $siswa['nama_siswa']; ?>" hidden>
                                                </div>
                                            </div>
                                            <div class="form-group form-float" hidden>
                                                <div class="form-line">
                                                    <input type="text" class="form-control" name="id_per_ekskul" value="<?= $datasos; ?>" readonly required hidden>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr class="bg-light-blue">
                                                            <th><b>ID Ekstra</b></th>
                                                            <th><b>Kegiatan</b></th>
                                                            <th><b>Keterangan</b></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>   
                                                    <?php 
                                                    $sql = mysqli_query($koneksi, "SELECT * FROM ekstrakurikuler");
                                                    while ($dat = mysqli_fetch_array($sql)) { ?>
                                                    <tr>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="">
                                                                    <input type="text" class="form-control" name="id_ekstra[]" value="<?= $dat['id_ekstra']; ?>" readonly>
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="">
                                                                    <input type="text" class="form-control" name="kegiatan[]" value="<?= $dat['kegiatan']; ?>" readonly>
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group form-float">
                                                                <div class="form-line">
                                                                    <input type="text" class="form-control" name="keterangan[]">
                                                                    <label class="form-label"></label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <?php 
                                                        date_default_timezone_set('Asia/Jakarta'); 
                                                        $raport_ekskul = date("Y-m-d h:i:s");
                                                        ?>
                                                        <div class="form-group form-float" hidden>
                                                            <div class="form-line">
                                                                <label class="form-label">Tanggal Raport</label>
                                                                <input type="text" class="form-control" name="tgl_raport[]" value="<?= $raport_ekskul; ?>" required readonly>
                                                            </div>
                                                        </div>
                                                        <td hidden>
                                                            <input type="text" name="id_siswa[]" value="<?= $siswa['id_siswa']; ?>" hidden>
                                                            <input type="text" name="id_kelas[]" value="<?= $dtsq1['id_kelas']; ?>" hidden>
                                                            <input type="text" name="id_semester[]" value="<?= $dtsq2['id_semester']; ?>" hidden>
                                                            <input type="text" name="tahun_awal[]" value="<?= $siswa['tahun_ajaran_awal']; ?>" hidden>
                                                            <input type="text" name="tahun_akhir[]" value="<?= $siswa['tahun_ajaran_akhir']; ?>" hidden>
                                                        </td>
                                                    </tr>
                                                <?php }  ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit"name="submit" class="btn bg-indigo waves-effect">SIMPAN</button>
                                                <button type="button" class="btn bg-indigo waves-effect" data-dismiss="modal">CLOSE</button>
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