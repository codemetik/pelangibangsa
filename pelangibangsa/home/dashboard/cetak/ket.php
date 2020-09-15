<?php 
$pdf->AddPage();
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
    $pdf->Cell(0,6,'Nama Peserta Didik : ' . $row['nama_siswa']);
    $pdf->Ln(10);
    $pdf->Cell(10,6,'');
    $pdf->Cell(165,6,'KELUAR',1,0,'C');

    $pdf->Ln();
    $pdf->Cell(10,6,'');
    $pdf->SetWidths(array(41.25,41.25,41.25,41.25));
    // $pdf->SetLineHeight(5);

    $pdf->RowC(Array("Tanggal", "Kelas Yang ditinggalkan", "Sebab - sebab keluar atau atas permintaan  (Tertulis) dari :","Tanda Tangan Kepala Sekolah, Stempel Sekolah dan Tanda Tangan Orang Tua/Wali"));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NIP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));
    $pdf->Cell(10,6,'');
    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NIP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));
    $pdf->Cell(10,6,'');
    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NIP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));

    $pdf->AddPage();
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
    $pdf->Cell(0,6,'Nama Peserta Didik : ' . $row['nama_siswa']);
    $pdf->Ln(10);
    $pdf->Cell(10,6,'');
    $pdf->Cell(165,6,'MASUK',1,0,'C');

    $pdf->Ln();
    $pdf->Cell(10,6,'');
    $pdf->SetWidths(array(11.25,102.5,51.25));
    // $pdf->SetLineHeight(5);

    $pdf->Row(Array("1", "Nama Peserta Didik :                                                          Nomor Induk :	                                                          
    Nama Sekolah :                                                
    Masuk di Sekolah ini:                                                
    	a. Tanggal :                                                                
    	b. Di Kelas :                                                          
    Tahun Pelajaran :                                                ","      ......................................              Kepala Sekolah                                                                                                                                   ........................................... NIP. ..............................."));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("2", "Nama Peserta Didik :                                                          Nomor Induk :	                                                          
    Nama Sekolah :                                               
    Masuk di Sekolah ini:                                                
    	a. Tanggal :                                                                
    	b. Di Kelas :                                                          
    Tahun Pelajaran :                                                ","      ......................................              Kepala Sekolah                                                                                                                                   ........................................... NIP. ..............................."));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("3", "Nama Peserta Didik :                                                          Nomor Induk :	                                                          
    Nama Sekolah :                                                
    Masuk di Sekolah ini:                                                
    	a. Tanggal :                                                                
    	b. Di Kelas :                                                          
    Tahun Pelajaran :                                                ","      ......................................              Kepala Sekolah                                                                                                                                   ........................................... NIP. ..............................."));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("4", "Nama Peserta Didik :                                                          Nomor Induk :	                                                          
    Nama Sekolah :                                                
    Masuk di Sekolah ini:                                                
    	a. Tanggal :                                                                
    	b. Di Kelas :                                                          
    Tahun Pelajaran :                                                ","      ......................................              Kepala Sekolah                                                                                                                                   .............................................. NP. ..............................."));
    $pdf->Cell(10,6,'');
?>