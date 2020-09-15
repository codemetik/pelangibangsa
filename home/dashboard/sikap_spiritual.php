<?php 
include "../../connect.php";
        $sql = mysqli_query($koneksi, "SELECT max(id_spiritual) AS maxCode FROM sikap_spiritual");
        $sprt = mysqli_fetch_array($sql);
        $datspr = $sprt['maxCode'];
        $nOsp = (int) substr($datspr, 2, 3);
        $nOsp++; 
        $charsp = "ST";
        $datspr = $charsp . sprintf("%03s", $nOsp);
?>
<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                Spiritual <small>Sikap Spiritual</small>
                            </h2>
                            
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-11">
                                    <thead>
                                        <tr class="bg-light-blue">
                                            <th>No</th>
                                            <th>ID Spiritual</th>
                                            <th>Butir Sikap</th>
                                            <th>Opsi</th>
                                        </tr>
                                    </thead>
                                    
                                        <?php 
                                        $i = 1;
                                        $sql = mysqli_query($koneksi, "SELECT * FROM sikap_spiritual");
                                        while($spiritual = mysqli_fetch_array($sql)){ ?>
                                    <tbody>
                                        <tr>
                                            <td><?= $i++; ?></td>
                                            <td><?= $spiritual['id_spiritual']; ?></td> 
                                            <td><?= $spiritual['butir_sikap']; ?></td>
                                            <td><a type="button" class="" data-toggle="modal" href="?page=edit_skpsp&id=<?= $spiritual['id_spiritual']; ?>"><button class="btn bg-indigo">Detail</button></a></td>
                                        </tr>
                                    </tbody>
                                        <?php }
                                        ?>
                                        
                                </table>
                            </div>    
                        </div>
                </div>
            </div>
                <!--Kolom kedua kanan di berfungsi tapi hidden--> 
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" hidden>
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                Input sikap <small>Sikap Spiritual</small>
                            </h2>
                            
                        </div>
                        <div class="body">
                            
                            <form action="proses/proses_sikap_spiritual.php" method="POST">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="id_spiritual" value="<?= $datspr; ?>" class="form-control" readonly>
                                        <label class="form-label"></label>
                                    </div>
                                </div>

                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="butir_sikap" class="form-control" required>
                                        <label class="form-label">Butir sikap</label>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" name="submit" class="btn bg-indigo m-t-15 waves-effect" >SIMPAN</button>
                            </form>
                        
                        </div>
                    </div>
                </div>
            
</div>

<!-- Large Size -->
            <div class="modal fade" id="myModal<?= $spiritual['id_spiritual']; ?>" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="defaultModalLabel">INPUT KD KI-3 PENGETAHUAN <?= $spiritual['id_spiritual']; ?></h4>
                        </div>
                        <div class="modal-body">
                            <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    
                            
                                        <form action="proses/proses_sikap_spiritual.php" method="POST">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" name="id_spiritual" value="<?= $spiritual['id_spiritual']; ?>" class="form-control" readonly>
                                                    <label class="form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" name="butir_sikap" class="form-control" required>
                                                    <label class="form-label">Butir sikap</label>
                                                </div>
                                            </div>
                                            <br>
                                            <button type="submit" name="submit" class="btn btn-primary m-t-15 waves-effect" >SIMPAN</button>
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

