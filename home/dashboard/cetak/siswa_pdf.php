<?php
// memanggil library FPDF
require('fpdf181/fpdf.php');
// intance object dan memberikan pengaturan halaman PDF
$pdf = new FPDF();
// membuat halaman baru
$pdf->AddPage();
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',16);
// mencetak string 
$pdf->Cell(190,7,'SEKOLAH PELANGI BANGSA',0,1,'C');
$pdf->SetFont('Arial','B',12);
$pdf->Cell(190,7,'DATA SISWA',0,1,'C');

// Memberikan space kebawah agar tidak terlalu rapat
$pdf->Cell(10,7,'',0,1);

$pdf->SetFont('Arial','B',10);
$pdf->Cell(20,6,'');
$pdf->Cell(35,6,'ID_SISWA',1,0);
$pdf->Cell(35,6,'NAMA SISWA',1,0);
$pdf->Cell(35,6,'ID AGAMA',1,0);
$pdf->Cell(35,6,'TEMPA LAHIR',1,1);

$pdf->SetFont('Arial','',10);

include '../../../connect.php';
$mahasiswa = mysqli_query($koneksi, "SELECT * FROM data_siswa");
while ($row = mysqli_fetch_array($mahasiswa)){
    $pdf->Cell(35,6,$row['id_siswa'],1,0);
    $pdf->Cell(35,6,$row['nama_siswa'],1,0);
    $pdf->Cell(35,6,$row['id_agama'],1,0);
    $pdf->Cell(35,6,$row['tempat_lahir'],1,1); 
}

$pdf->Output();
?>