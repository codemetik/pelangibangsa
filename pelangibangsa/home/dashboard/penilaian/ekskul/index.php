<?php 
session_start();
include "../../../../connect.php";
if (!isset($_SESSION['user'])) {
  header("Location:../../../../sign-in.php");
}

if (isset($_POST['submit'])) {
$semester = $_POST['semester'];
$kelas = $_POST['kelas'];
    if ($semester) {
        $_SESSION['semester'] = $semester;
        $_SESSION['kelas'] = $kelas;
        
    }
    
}

$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);

		$wajib = mysqli_query($koneksi, "SELECT max(id_ekskul_wajib) AS maxCode FROM tb_ekskul_wajib");
        $dtwjb = mysqli_fetch_array($wajib);
        $dataw = $dtwjb['maxCode'];
        $nOWjb = (int) substr($dataw, 5, 7);
        $nOWjb++; 
        $wjib = "EKSWJ";
        $dtawajib = $wjib . sprintf("%07s", $nOWjb);

        $pil1 = mysqli_query($koneksi, "SELECT max(id_ekskul_pil1) AS maxCode FROM tb_ekskul_pil1");
        $dtpil1 = mysqli_fetch_array($pil1);
        $datpil1 = $dtpil1['maxCode'];
        $nOpil1 = (int) substr($datpil1, 5, 7);
        $nOpil1++; 
        $npil1 = "EKSPA";
        $dtapil1 = $npil1 . sprintf("%07s", $nOpil1);

        $pil2 = mysqli_query($koneksi, "SELECT max(id_ekskul_pil2) AS maxCode FROM tb_ekskul_pil2");
        $dtpil2 = mysqli_fetch_array($pil2);
        $datpil2 = $dtpil2['maxCode'];
        $nOpil2 = (int) substr($datpil2, 5, 7);
        $nOpil2++; 
        $npil2 = "EKSPB";
        $dtapil2 = $npil2 . sprintf("%07s", $nOpil2);

        $pil3 = mysqli_query($koneksi, "SELECT max(id_ekskul_pil3) AS maxCode FROM tb_ekskul_pil3");
        $dtpil3 = mysqli_fetch_array($pil3);
        $datpil3 = $dtpil3['maxCode'];
        $nOpil3 = (int) substr($datpil3, 5, 7);
        $nOpil3++; 
        $npil3 = "EKSPC";
        $dtapil3 = $npil3 . sprintf("%07s", $nOpil3);

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title><?= $_SESSION['sekolah']; ?></title>
    <!-- Favicon-->
    <link rel="icon" href="../../../../images/logo.svg" type="image/x-icon">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="../../../../plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../../../../plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="../../../../plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="../../../../plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="../../../../plugins/morrisjs/morris.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="../../../../css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="../../../../css/themes/all-themes.css" rel="stylesheet" />
    <!-- Dropzone Css -->
    <link href="../../../../plugins/dropzone/dropzone.css" rel="stylesheet">
    <!-- Bootstrap Select Css -->
    <link href="../../../../plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
</head>
<body class="theme-indigo">
<nav class="navbar">
	<div class="navbar-header">
		<a class="navbar-brand" href="../../../../home"><?= $_SESSION['judul']." >> ".$_SESSION['kelas']." >> ". $_SESSION['semester']; ?></a>
            </div>
</nav>
<div class="content">
	<div class="container-fluid">
        <div class="card m-t-100">
			<div class="header bg-light-blue">
				<h2>Ekstrakurikuler : <?= $siswa['nama_siswa']; ?></h2>
			</div>
			<div class="body">
				<form method="POST" action="proses_hitung_simpan.php">
                    <div class="form-group form-float" hidden>
                        <div class="form-line">
                            <input type="text" name="id_siswa" value="<?= $siswa['id_siswa']; ?>">
                            <input type="text" name="id_kelas" value="<?= $dtsq1['id_kelas']; ?>">
                            <input type="text" name="id_semester" value="<?= $dtsq2['id_semester']; ?>">
                        </div>
                    </div>
                    <div class="form-group form-float" hidden>
                        <div class="form-line">
                            <input type="text" name="id_ekswajib" value="<?= $dtawajib; ?>">
                            <input type="text" name="id_ekspil1" value="<?= $dtapil1; ?>">
                            <input type="text" name="id_ekspil2" value="<?= $dtapil2; ?>">
                            <input type="text" name="id_ekspil3" value="<?= $dtapil3; ?>">
                        </div>
                    </div>
                    <div class="">
                        <table class="table table-bordered bg-grey">
                            <thead>
                                <tr class="bg-light-blue">
                                    <th class="col-xs-2" rowspan="2"><b>Kegiatan</b></th>
                                    <th class="col-xs-4" colspan="3"><b>Muatan Nilai</b></th>
                                </tr>
                                <tr>
                                    <th class="col-xs-2 bg-grey">Muatan 1</th>
                                    <th class="col-xs-2 bg-grey">Muatan 2</th>
                                    <th class="col-xs-2 bg-grey">Muatan 3</th>
                                </tr>
                            </thead>
                            <tbody>   
                            <tr>
                            <td>
                                <div class="form-group">
									<select class="form-control bg-indigo" name="ekskulWajib" id="ekskulWajib">
										<option value=""></option>
									</select>
								</div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanW_1" id="muatanW_1">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeWajib_1">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanW_2" id="muatanW_2">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeWajib_2">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanW_3" id="muatanW_3">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeWajib_3">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            </tr>
                            <tr>
                            	<td>
                                <div class="form-group">
									<select class="form-control bg-indigo" name="ekskulPil1" id="ekskulPil1">
										<option value=""></option>
									</select>
								</div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP1_1" id="muatanP1_1">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP1_1">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP1_2" id="muatanP1_2">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP1_2">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP1_3" id="muatanP1_3">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP1_3">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            </tr>
                            <tr>
                            	<td>
                                <div class="form-group">
									<select class="form-control bg-indigo" name="ekskulPil2" id="ekskulPil2">
										<option value=""></option>
									</select>
								</div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP2_1" id="muatanP2_1">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP2_1">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP2_2" id="muatanP2_2">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP2_2">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP2_3" id="muatanP2_3">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP2_3">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            </tr>
                            <tr>
                            	<td>
                                <div class="form-group">
									<select class="form-control bg-indigo" name="ekskulPil3" id="ekskulPil3">
										<option value=""></option>
									</select>
								</div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP3_1" id="muatanP3_1">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP3_1">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP3_2" id="muatanP3_2">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP3_2">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <select class="form-control bg-indigo" name="muatanP3_3" id="muatanP3_3">
                                        <option value=""></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="form-control bg-light-blue" name="gradeMuatanP3_3">
                                        <option value="">Grade</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </div>
                            </td>
                            </tr>
                            <tr hidden>
                            	<?php 
                                date_default_timezone_set('Asia/Jakarta'); 
                                $raport_ekskul = date("Y-m-d h:i:s");
                                ?>
                                <td >
                                	<input type="text" name="tgl_raport" value="<?= $raport_ekskul; ?>">
                                    <input type="text" name="tahun_awal" value="<?= $siswa['tahun_ajaran_awal']; ?>">
                                    <input type="text" name="tahun_akhir" value="<?= $siswa['tahun_ajaran_akhir']; ?>">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" name="simpan" class="btn bg-indigo waves-effect">SIMPAN</button>
                        <a href="../../?page=nilai&id=<?= $siswa['nama_siswa']; ?>" class="btn bg-indigo waves-effect" >Cencel</a>
                    </div>
                </form>
		</div>
		</div>

	</div>
</div>
	<script src="jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
          	$.ajax({
                type: 'POST',
              	url: "get_ekskulWajib.php",
              	cache: false, 
              	success: function(msg){
                  $("#ekskulWajib").html(msg);
                }
            });

          	$("#ekskulWajib").change(function(){
          	var ekskulWajib = $("#ekskulWajib").val();
	          	$.ajax({
	          		type: 'POST',
	              	url: "get_muatanWJB.php",
	              	data: {ekskulWajib: ekskulWajib},
	              	cache: false,
	              	success: function(msg){
	                  $("#muatanW_1").html(msg);
	                  $("#muatanW_2").html(msg);
	                  $("#muatanW_3").html(msg);
	                }
	            });
            });
//tutupwajib
//bukapil1
            $.ajax({
                type: 'POST',
              	url: "get_ekskulPil1.php",
              	cache: false, 
              	success: function(msg1){
                  $("#ekskulPil1").html(msg1);
                }
            });

          	$("#ekskulPil1").change(function(){
          	var ekskulPil1 = $("#ekskulPil1").val();
	          	$.ajax({
	          		type: 'POST',
	              	url: "get_muatanPIL1.php",
	              	data: {ekskulPil1: ekskulPil1},
	              	cache: false,
	              	success: function(msg1){
	                  $("#muatanP1_1").html(msg1);
	                  $("#muatanP1_2").html(msg1);
	                  $("#muatanP1_3").html(msg1);
	                }
	            });
            });
//tutuppil1
//bukapil2
            $.ajax({
                type: 'POST',
              	url: "get_ekskulPil2.php",
              	cache: false, 
              	success: function(msg2){
                  $("#ekskulPil2").html(msg2);
                }
            });

          	$("#ekskulPil2").change(function(){
          	var ekskulPil2 = $("#ekskulPil2").val();
	          	$.ajax({
	          		type: 'POST',
	              	url: "get_muatanPIL2.php",
	              	data: {ekskulPil2: ekskulPil2},
	              	cache: false,
	              	success: function(msg2){
	                  $("#muatanP2_1").html(msg2);
	                  $("#muatanP2_2").html(msg2);
	                  $("#muatanP2_3").html(msg2);
	                }
	            });
            });
//tutuppil2
//bukapil3
    		$.ajax({
                type: 'POST',
              	url: "get_ekskulPil3.php",
              	cache: false, 
              	success: function(msg3){
                  $("#ekskulPil3").html(msg3);
                }
            });

          	$("#ekskulPil3").change(function(){
          	var ekskulPil3 = $("#ekskulPil3").val();
	          	$.ajax({
	          		type: 'POST',
	              	url: "get_muatanPIL3.php",
	              	data: {ekskulPil3: ekskulPil3},
	              	cache: false,
	              	success: function(msg3){
	                  $("#muatanP3_1").html(msg3);
	                  $("#muatanP3_2").html(msg3);
	                  $("#muatanP3_3").html(msg3);
	                }
	            });
            });

         });

	// $("#muatanW_1").on("change", function(){
	//   // ambil nilai
	//   var hasil = $("#muatanW_1 option:selected").attr("value");
	//   // pindahkan nilai ke input
	//   $("#hasil").val(hasil);
	// });

	</script>
	<!-- Jquery Core Js -->
    <script src="../../../../plugins/jquery/jquery.min.js"></script>
	<!-- Jquery Core Js -->
    <script src="../../../../plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="../../../../plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="../../../../plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="../../../../plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Jquery CountTo Plugin Js -->
    <script src="../../../../plugins/jquery-countto/jquery.countTo.js"></script>

    <!-- Morris Plugin Js -->
    <script src="../../../../plugins/raphael/raphael.min.js"></script>
    <script src="../../../../plugins/morrisjs/morris.js"></script>

    <!-- ChartJs -->
    <script src="../../../../plugins/chartjs/Chart.bundle.js"></script>

    <!-- Custom Js -->
    <script src="../../../../js/admin.js"></script>

    <!-- Demo Js -->
    <script src="../../../../js/demo.js"></script>

    <!-- Multi Select Plugin Js -->
    <script src="../../../../plugins/multi-select/js/jquery.multi-select.js"></script>

    <script src="../../../../plugins/jquery-datatable/jquery.dataTables.js"></script>
</body>
</html>