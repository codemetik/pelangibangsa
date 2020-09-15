                <!-- Basic Examples -->
                    <div class="card">
                        <div class="header">
                            <h1>
                                APLIKASI RAPORT KURIKULUM 2013 (K-I3)
                                <small></small>
                            </h1>
                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel-group" id="accordion_1" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingOne_1">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_1" href="#collapseOne_1" aria-expanded="true" aria-controls="collapseOne_1">
                                                        DATA UMUM
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne_1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne_1">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                            <?php 
                                                            if (($_SESSION['name_position'] == $rows[0]['name_position'])) { ?>
                                                                <a href="?page=data_sekolah" class="list-group-item">Data Sekolah</a>
                                                            <?php }else if (($_SESSION['name_position'] == $rows[1]['name_position'])){ ?>
                                                                <a href="?page=data_sekolah" class="list-group-item">Data Sekolah</a>
                                                            <?php } ?>
                                                                    
                                                                    <a href="?page=data_siswa" class="list-group-item">Biodata Siswa</a>
                                                                    <a href="?page=kkm" class="list-group-item">Muatan Pelajaran (KKM)</a>
                                                                    <a href="?page=ekp" class="list-group-item">EKP</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingTwo_1">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_1" href="#collapseTwo_1" aria-expanded="false"
                                                       aria-controls="collapseTwo_1">
                                                        INPUT SIKAP
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo_1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo_1">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=ki1" class="list-group-item">Sikap Spiritual (K-I1)</a>
                                                                    <a href="?page=ki2" class="list-group-item">Sikap Sosial (K-I2)</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="?page=gabungan" class="list-group-item">-</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingThree_1">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_1" href="#collapseThree_1" aria-expanded="false"
                                                       aria-controls="collapseThree_1">
                                                        KD PENGETAHUAN
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree_1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree_1">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=ki3" class="list-group-item">K-I3 Mapel</a>
                                                                    <a href="?page=ki3_pabp" class="list-group-item">K-I3 PSBP</a>
                                                                    <a href="?page=rekap_nilaiki3" class="list-group-item">Rekap Nilai KI-3</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingFour_1">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_1" href="#collapseFour_1" aria-expanded="false"
                                                       aria-controls="collapseFour_1">
                                                        KD KETERAMPILAN
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseFour_1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour_1">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=ki4" class="list-group-item">K-I4 Mapel</a>
                                                                    <a href="?page=ki4_pabp" class="list-group-item">K-I4 PABP</a>
                                                                    <a href="?page=rekap_nilaiki4" class="list-group-item">Rekap Nilai KI-4</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel-group" id="accordion_2" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingOne_2">
                                                <h4 class="panel-title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion_2" href="#collapseOne_2" aria-expanded="true" aria-controls="collapseOne_2">
                                                        PENILAIAN
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne_2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne_2">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=nilai" class="list-group-item">Masuk Ke penilaian</a>
                                                                    <a href="?page=gabungan_nilai_ki1_ki2" class="list-group-item">Gabungan Nilai KI-1 & KI-2</a>
                                                                    <a href="?page=gabungan_nilai_ki3_ki4" class="list-group-item">Gabungan Nilai KI-3 & KI-4</a>
                                                                    <a href="?page=gabungan_ekskul" class="list-group-item">Gabungan Ekskul</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingTwo_2">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_2" href="#collapseTwo_2" aria-expanded="false"
                                                       aria-controls="collapseTwo_2">
                                                        KESISWAAN
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo_2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo_2">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=tarik_siswa_insemester" class="list-group-item">Tarik Siswa Ke Semester ini</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingThree_2">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_2" href="#collapseThree_2" aria-expanded="false"
                                                       aria-controls="collapseThree_2">
                                                        KENAIKAN KELAS
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree_2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree_2">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=kenaikan_kelas" class="list-group-item">Naikan Siswa</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingFour_2">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_2" href="#collapseFour_2" aria-expanded="false"
                                                       aria-controls="collapseFour_2">
                                                        CETAK / PRINT
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseFour_2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour_2">
                                                <div class="panel-body">
                                                    <!-- Linked Items -->
                                                        <div class="list-group">
                                                                    <a href="?page=cetak" class="list-group-item">Cetak / Print</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                    <a href="javascript:void(0);" class="list-group-item">-</a>
                                                                </div>
                                                    <!-- #END# Linked Items -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- #END# Basic Examples -->