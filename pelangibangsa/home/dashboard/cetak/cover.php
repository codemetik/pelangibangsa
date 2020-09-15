<?php
session_start();
$_SESSION['user'];
$xuser = $_SESSION['user'];
$_SESSION['semester'];
$smster = $_SESSION['semester'];
$_SESSION['kelas'];
$kelas = $_SESSION['kelas'];

if ($smster == 'Semester 1') {
    $ang = '1';
    $angka = '(Satu)';
}else if($smster == 'Semester 2'){
    $ang = '2';
    $angka = '(Dua)';
}

// memanggil library FPDF
require('fpdf181/mc_table.php');

// intance object dan memberikan pengaturan halaman PDF
$pdf = new FPDF('P','mm','A4');
// membuat halaman baru
$pdf->AddPage();

$pdf->Image('img/lg_rapor.png',75,15,60);

//memberikan space kebawah
$pdf->Cell(10,70,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',14);
// mencetak string judul
$pdf->Cell(190,7,'RAPOR',0,1,'C');
$pdf->Cell(190,7,'PESERTA DIDIK',0,1,'C');
$pdf->Cell(190,7,'SEKOLAH DASAR SWASTA',0,1,'C');
$pdf->Cell(190,7,'(SD)',0,1,'C');

// // setting jenis font yang akan digunakan
// $pdf->SetFont('Arial','B',16);
// // mencetak string 
// $pdf->Cell(190,7,'SEKOLAH PELANGI BANGSA',0,1,'C');
// $pdf->SetFont('Arial','B',12);
// $pdf->Cell(190,7,'DATA SISWA',0,1,'C');

if (isset($_POST['cover'])) {
	$id_siswa = $_POST['id_siswa'];

include '../../../connect.php';
require('query_sql.php');
$nmsiswa = $row['nama_siswa'];

$thawal = $row['tahun_ajaran_awal'];
$thakhir = $row['tahun_ajaran_akhir'];

$pdf->setTitle($nmsiswa);
// Memberikan space kebawah agar tidak terlalu rapat
$pdf->Cell(10,30,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','',12);
$pdf->Cell(190,7,'Nama Peserta Didik',0,1,'C');
$pdf->SetFont('Arial','B',12);
$pdf->Cell(190,7,$row['nama_siswa'],0,1,'C');	
// Memberikan space kebawah agar tidak terlalu rapat
$pdf->Cell(10,30,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','',12);
$pdf->Cell(190,7,'NISN/NIS',0,1,'C');
$pdf->SetFont('Arial','',12);
$pdf->Cell(190,7,$row['nisn']." / ".$row['nis'],0,1,'C');

// Memberikan space kebawah agar tidak terlalu rapat
$pdf->Cell(10,60,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',12);
$pdf->Cell(190,7,'KEMENTRIAN PENDIDIKAN DAN KEBUDAYAAN',0,1,'C');
$pdf->SetFont('Arial','B',12);
$pdf->Cell(190,7,'REPUBLIK INDONESIA',0,1,'C');

$fileName = 'Cover-Rapor-' . $nmsiswa . '.pdf';
$pdf->Output($fileName, 'D');
}


// $pdf->SetFont('Arial','B',10);
// $pdf->Cell(20,6,'');
// $pdf->Cell(35,6,'ID_SISWA',1,0);
// $pdf->Cell(35,6,'NAMA SISWA',1,0);
// $pdf->Cell(35,6,'ID AGAMA',1,0);
// $pdf->Cell(35,6,'TEMPA LAHIR',1,1);

// $pdf->SetFont('Arial','',10);

// include '../../../connect.php';
// $mahasiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa");
// while ($row = mysqli_fetch_array($mahasiswa)){
//     $pdf->Cell(35,6,$row['id_siswa'],1,0);
//     $pdf->Cell(35,6,$row['nama_siswa'],1,0);
//     $pdf->Cell(35,6,$row['id_agama'],1,0);
//     $pdf->Cell(35,6,$row['tempat_lahir'],1,1); 
// }


?>