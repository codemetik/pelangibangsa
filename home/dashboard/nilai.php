<nav aria-label="breadcrumb m-0">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../dashboard">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle">Penilaian</a></li>
    <li class="breadcrumb-item"><a href="javascript:void(0);" class="menu-toggle"><i><b>nilai</b></i></a></li>
    <li class="breadcrumb-item" aria-current="page"><i><b><?= $_SESSION['kelas']; ?></b></i></li>
    <li class="breadcrumb-item" aria-current="page"><i><b><?= $_SESSION['semester']; ?></b></i></li>
    <li class="breadcrumb-item active" aria-current="page"><i><b><?= $_GET['id']; ?></b></i></li>
  </ol>
</nav>
<!-- Example Tab -->
            <div class="row p-0">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <!-- <div class="header">
                                <h4>
                                    NILAI 
                                    <small></small>
                                </h4>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Input Nilai</a></li>
                                        <li><a href="javascript:void(0);">Input Nilai</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div> -->
                        <div class="body">
                            <!-- Nav tabs -->
                        
                            <ul class="nav nav-tabs tab-nav-center" role="tablist">
                                <li role="presentation"><a href="#siswa" data-toggle="tab"><b>DATA SISWA</b></a></li>
                                <li role="presentation" class="active"><a href="#penilaian" data-toggle="tab"><b>PENILAIAN</b></a></li>
                                <li role="presentation"><a href="#perkembangan" data-toggle="tab"><b>PERKEMBANGAN</b></a></li>
                                <li role="presentation"><a href="#catatan" data-toggle="tab"><b>CATATAN</b></a></li>
                            </ul>
                        

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade" id="siswa">
                                    <?php 
                                        //include "input_data_siswa.php";
                                        include "edit/edit_data_siswa.php";
                                        ?>
                                </div>
                                <div role="tabpanel" class="tab-pane fade in active media" id="penilaian">
                                    <?php 
                                        include "penilaian.php";
                                    ?>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="perkembangan">
                                    <?php 
                                        include "perkembangan.php";
                                    ?>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="catatan">
                                    <?php 
                                        include "catatan.php";
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Example Tab -->
