<?php

// memanggil library FPDF
require('fpdf181/mc_table1.php');

// intance object dan memberikan pengaturan halaman PDF
$pdf = new PDF_MC_Table('P','mm','A4');
// membuat halaman baru
$pdf->AddPage();

if (isset($_POST['print'])) {
	$idsk = $_POST['id_siswa_keluar'];
	$alasan = $_POST['alasan'];

include '../../../connect.php';
$sqlkeluarsis = mysqli_query($koneksi, "SELECT * FROM data_siswa_keluar X INNER JOIN kelas Y ON y.id_kelas = x.id_kelas
INNER JOIN semester Z ON z.id_semester = x.id_semester WHERE id_siswa_keluar = '".$idsk."'");
$dtkel = mysqli_fetch_array($sqlkeluarsis);

$tgl = date("d-F-Y", strtotime($dtkel['tgl_keluar_siswa']));

//membersi space kebawah
    $pdf->Cell(10,10,'',0,1);
    // setting jenis font yang akan digunakan
    $pdf->SetFont('Arial','B',14);
    // mencetak string
    $pdf->Cell(190,7,'KETERANGAN PINDAH SEKOLAH',0,1,'C');
    $pdf->SetFont('Arial','B',1);
    //$pdf->Cell(190,7,'IDENTITAS',0,1,'C');

    // Memberikan space kebawah agar tidak terlalu rapat
    $pdf->Cell(10,10,'',0,1);
    $pdf->SetFont('Times','',11);

    $pdf->Cell(10,6,'');
    $pdf->Cell(0,6,'Nama Peserta Didik : ' . $dtkel['nama_siswa']);
    $pdf->Ln(10);
    $pdf->Cell(10,6,'');
    $pdf->Cell(165,6,'KELUAR',1,0,'C');

    $pdf->Ln();
    $pdf->Cell(10,6,'');
    $pdf->SetWidths(array(41.25,41.25,41.25,41.25));
    // $pdf->SetLineHeight(5);

    $pdf->RowC(Array("Tanggal", "Kelas Yang ditinggalkan", "Sebab - sebab keluar atau atas permintaan  (Tertulis) dari :","Tanda Tangan Kepala Sekolah, Stempel Sekolah dan Tanda Tangan Orang Tua/Wali"));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("                              ".$tgl, "                                        ".$dtkel['kelas'], "                              ".$alasan," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NIP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));
    $pdf->Cell(10,6,'');
    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NIP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));
    $pdf->Cell(10,6,'');
    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NIP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));

$fileName = 'Cover-Rapor-' . $dtkel['nama_siswa'] . '.pdf';
$pdf->Output($fileName, 'D');
}

?>