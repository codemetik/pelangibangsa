<?php 
include "../../connect.php";
        $sql = mysqli_query($koneksi, "SELECT max(id_sosial) AS maxCode FROM sikap_sosial");
        $sprt = mysqli_fetch_array($sql);
        $datspr = $sprt['maxCode'];
        $nOsp = (int) substr($datspr, 2, 3);
        $nOsp++; 
        $charsp = "SS";
        $datspr = $charsp . sprintf("%03s", $nOsp);
?>
<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                Sosial <small>Sikap Sosial</small>
                            </h2>
                            
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table id="mainTable" class="table table-sm table-striped table-hover dataTable js-exportable font-11">
                                    <thead>
                                        <tr class="bg-light-blue">
                                            <th>No</th>
                                            <th>ID Sosial</th>
                                            <th>Butir Sikap</th>
                                            <th>Opsi</th>
                                        </tr>
                                    </thead>
                                    
                                        <?php 
                                        $i =1;
                                        $sql = mysqli_query($koneksi, "SELECT * FROM sikap_sosial");
                                        while($sosial = mysqli_fetch_array($sql)){ ?>
                                    <tbody>
                                        <tr>
                                            <td><?= $i++; ?></td>
                                            <td><?= $sosial['id_sosial']; ?></td>
                                            <td><?= $sosial['butir_sikap']; ?></td>
                                            <td><a type="button" class="" data-toggle="modal" href="?page=edit_skpso&id=<?= $sosial['id_sosial']; ?>"><button class="btn bg-indigo">Detail</button></a></td>
                                        </tr>
                                    </tbody>
                                        <?php }
                                        ?>
                                        
                                </table>
                            </div>    
                        </div>
                </div>
            </div>
                <!--Kolom kedua kanan berfungsi tapi hidden -->
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" hidden="">
                    <div class="card">
                        <div class="header bg-indigo">
                            <h2>
                                Input sikap <small>Sikap Sosial</small>
                            </h2>
                            
                        </div>
                        <div class="body">
                            
                            <form action="proses/proses_sikap_sosial.php" method="POST">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="id_sosial" value="<?= $datspr; ?>" class="form-control" readonly>
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