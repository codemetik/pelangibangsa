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

include '../../../connect.php';
if (isset($_POST['id_siswa'])) {
$id_siswa = $_POST['id_siswa'];
include 'query_sql.php';

$nmsiswa = $row['nama_siswa'];

//manggil data tahun ajaran 
$thawal = $row['tahun_ajaran_awal'];
$thakhir = $row['tahun_ajaran_akhir'];

$pdf = new PDF_MC_Table('P','mm','A4');
$pdf->setTitle($nmsiswa);

// membuat halaman baru
$pdf->AddPage();
//1. halamn pertama 
//memberikan space kebawah
$pdf->Cell(10,60,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',14);
// mencetak string judul
$pdf->Cell(190,7,'RAPOR',0,1,'C');
$pdf->Cell(190,7,'PESERTA DIDIK',0,1,'C');
$pdf->Cell(190,7,'SEKOLAH DASAR',0,1,'C');
$pdf->Cell(190,7,'(SD)',0,1,'C');
    //memberikan space kebawah
    $pdf->Cell(10,10,'',0,1);
    $pdf->SetFont('Times','',11);
    

    $dtsekolah = array(
        "Nama Sekolah" => $dts['nama_sekolah'], 
        "NPSN" => $dts['npsn'],
        "NIS/NSS/NDS" => "-",
        "Alamat Sekolah" => $dts['alamat_sekolah'],
        "Kode Pos" => $dts['kode_pos'],
        "Kelurahan/ Desa" => $dts['kelurahan_desa'],
        "Kecamatan" => $dts['kecamatan'],
        "Kabupaten" => $dts['kabupaten_kota'],
        "Provinsi" => $dts['provinsi'],
        "Telp" => $dts['telp'],
        "Website" => $dts['website'],
        "Email" => $dts['email']
    );

    foreach ($dtsekolah as $key1 => $value1) {
    $pdf->Cell(50,6,'');
    $pdf->Cell(45,6, $key1);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6, "  : ".$value1);
    $pdf->Ln();    
    }




//2. halaman ke dua
// membuat halaman baru
$pdf->AddPage();
//membersi space kebawah
$pdf->Cell(10,30,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',14);
// mencetak string
$pdf->Cell(190,7,'IDENTITAS PESERTA DIDIK',0,1,'C');
$pdf->SetFont('Arial','B',1);
//$pdf->Cell(190,7,'IDENTITAS',0,1,'C');

// Memberikan space kebawah agar tidak terlalu rapat
$pdf->Cell(10,10,'',0,1);

    $pdf->SetFont('Times','',11);

    $dtsiswa = array(
        "1.     Nama Peserta Didik" => $row['nama_siswa'],
        "2.     NISN/NIS" => $row['nisn'],
        "3.     Tempat, Tanggal lahir" => $row['tempat_lahir'].", ".$row['tanggal_lahir'],
        "4.     Jenis Kelamin" => $row['jk'],
        "5.     Agama" => $row['agama'],
        "6.     Pendidikan Sebelumnya" => $row['pend_sebelumnya'],
        "7.     Alamat Peserta Didik" => $row['alamat_serta_didik']
    );

    foreach ($dtsiswa as $key2 => $value2) {
        $pdf->Cell(40,6,'');
        $pdf->Cell(45,6,$key2);
        $pdf->Cell(35,6, "  : ".$value2);       
        $pdf->Ln();
    }
    
    //nama orang tua
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'8.     Nama Orang Tua');
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               a. Ayah');
    $pdf->Cell(35,6, "  : ".$row['nama_ayah']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               b. ibu');
    $pdf->Cell(35,6, "  : ".$row['nama_ibu']);
    //pekerjaan orang tua
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'9.     Pekerjaan Orang Tua');
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               a. Ayah');
    $pdf->Cell(35,6, "  : ".$row['pekerjaan_ayah']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               b. Ibu');
    $pdf->Cell(35,6, "  : ".$row['pekerjaan_ibu']);
    //alamat orang tua
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'10.    Alamat Orang Tua');
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               Jalan');
    $pdf->Cell(35,6, "  : ".$row['jalan']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               Kelurahan/ Desa');
    $pdf->Cell(35,6, "  : ".$row['desa_kelurahan']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               Kecamatan');
    $pdf->Cell(35,6, "  : ".$row['kecamatan']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               Kabupaten/ Kota');
    $pdf->Cell(35,6, "  : ".$row['kabupaten_kota']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               Provinsi');
    $pdf->Cell(35,6, "  : ".$row['provinsi']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'11.    Wali Peserta Didik');
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               a. Nama');
    $pdf->Cell(35,6, "  : ".$row['nama_wali']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               b. Pekerjaan');
    $pdf->Cell(35,6, "  : ".$row['pekerjaan_wali']);
    $pdf->Ln();
    $pdf->Cell(40,6,'');
    $pdf->Cell(45,6,'               c. Alamat');
    $pdf->Cell(35,6, "  : ".$row['alamat_wali']);

    //close
    $pdf->Ln();
    //memberi space kebawah
    $pdf->Cell(10,10,'',0,1);
    $pdf->Cell(70,6,'');
    //letak foto
    $pdf->Cell(30,40,'',1,0);
    //tanggal sekarang 
    date_default_timezone_set('Asia/Jakarta'); 
    $tgl = date("d M Y");
    //ttd
    $pdf->Cell(30,6,'');
    $pdf->Cell(30,6,'Depok, '. $tgl);
    $pdf->Ln();
    $pdf->Cell(130,6,'');
    $pdf->Cell(30,6,'Kelapa Sekolah,');
    //memberi space kebawah
    $pdf->Cell(10,20,'',0,1);
    //memberi space kesamping
    $pdf->Cell(130,6,'');
    $pdf->Cell(30,6,$dts['kepala_sekolah']);
    $pdf->Ln();
    $pdf->Cell(130,6,'');
    $pdf->Cell(30,6,'NIY : ' . $dts['niy']);

    //print raportnya
    //3. halaman ke dua
    // membuat halaman baru
    $pdf->AddPage();
    //membersi space kebawah
    $pdf->Cell(10,10,'',0,1);
    // setting jenis font yang akan digunakan
    $pdf->SetFont('Arial','B',14);
    // mencetak string
    $pdf->Cell(190,7,'RAPORT DAN PROFIL PESERTA DIDIK',0,1,'C');
    $pdf->SetFont('Arial','B',1);
    //$pdf->Cell(190,7,'IDENTITAS',0,1,'C');

    // Memberikan space kebawah agar tidak terlalu rapat
    $pdf->Cell(10,10,'',0,1);

    $pdf->SetFont('Times','',11);

    $pdf->Cell(20,6,'');
    $pdf->SetWidths(Array(42.25,42.25,42.25,42.25));

    $pdf->RowNoBorder(Array("Nama Peserta Didik",": ".$row['nama_siswa'], "Kelas ", ": ".$kelas ));
    $pdf->Cell(20,0,'');
    $pdf->RowNoBorder(Array("NISN/ NIS",": ".$row['nisn']."/ ".$row['nis'], "Semester ", ": ".$ang.' '.$angka ));
    $pdf->Cell(20,0,'');
    $pdf->RowNoBorder(Array("Nama Sekolah", ": ".$dts['nama_sekolah'], "Tahun Pelajaran ", ": ".$thawal.'/'.$thakhir ));
    $pdf->Cell(20,0,'');
    $pdf->RowNoBorder(Array("Alamat Sekolah", ": ".$dts['alamat_sekolah']));


    //sikap
    // Memberikan space kebawah agar tidak terlalu rapat
    $pdf->Cell(10,10,'',0,1);

    $pdf->SetFont('Times','B',11);

    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'A. Sikap');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    // $pdf->Cell(10,6,'');
    $pdf->Cell(10,6,'No',1,0,'C');
    $pdf->Cell(35,6,'Sikap',1,0,'C');
    $pdf->Cell(144,6,'Deskripsi',1,0,'C');
    $pdf->Ln();


$dtray = array(
    "Spiritual" => $sprt['deskripsi'],
    "Sosial" => $sos['deskripsi'],
);

// $pdf->Cell(10,6,'');
$pdf->SetWidths(Array(10,35,144));
// $pdf->SetLineHeight(5);

$no=1;
foreach ($dtray as $ky => $isi) {
    $pdf->Row(array(
        $no++,
        $ky,
        $isi
    ));
    // $pdf->Cell(10,6,'');
}


    //sikap
    // Memberikan space kebawah agar tidak terlalu rapat
    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);    
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'B. Pengetahuan dan Keterampilan');
    $pdf->Ln();
    $pdf->SetFont('Times','',10);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'      KKM yang digunakan adalah KKM satuan pendidikan dengan memilih KKM terkecil : 50');
    // $pdf->Cell(10,6,'');
    //pengetahuan dan keterampilan
     // Memberikan space kebawah agar tidak terlalu rapat

//header table
$pdf->TabHeader();

// $pdf->Cell(10,6,'');
$pdf->SetWidths(Array(10,35,10,15,47,10,15,47));
// $pdf->SetLineHeight(5);

//mengambil nilai pengetahuandan keterampilan
$sqlrpt = mysqli_query($koneksi, "SELECT Y.id_mapel as id_mapel, Y.nama_mapel as nama_mapel, Y.nilai as nilaiki3, Y.predikat as predikatki3, Y.deskripsi as deskripsiki3, Z.nilai as nilaiki4, Z.predikat as predikatki4, Z.deskripsi as deskripsiki4 FROM mapel X INNER JOIN data_siswa A INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel WHERE Y.id_siswa = '".$id_siswa."' AND Z.id_siswa = '".$id_siswa."' GROUP BY id_mapel");
while ($rpt = mysqli_fetch_array($sqlrpt)) {
    $arry[] = Array(
        "id_mapel" => $rpt['id_mapel'],
        "nama_mapel" => $rpt['nama_mapel'],
        "nilaiki3" => $rpt['nilaiki3'],
        "predikatki3" => $rpt['predikatki3'],
        "deskripsiki3" => $rpt['deskripsiki3'],
        "nilaiki4" => $rpt['nilaiki4'],
        "predikatki4" => $rpt['predikatki4'],
        "deskripsiki4" => $rpt['deskripsiki4']
    );
}
$nom=1;
foreach ($arry as $item) {

        $pdf->Row(Array(
        $nom++,
        $item['nama_mapel'],
        $item['nilaiki3'],
        $item['predikatki3'],
        $item['deskripsiki3'],
        $item['nilaiki4'],
        $item['predikatki4'],
        $item['deskripsiki4']
    ));
        // $pdf->Cell(10,6,'');
}

    $pdf->AddPage();
    $pdf->Cell(10,10,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'C. Ekstra Kurikuler');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    // $pdf->Cell(10,6,'');
    $pdf->Cell(10,6,'No',1,0,'C');
    $pdf->Cell(35,6,'Jenis Kegiatan',1,0,'C');
    $pdf->Cell(144,6,'Keterangan',1,0,'C');
    $pdf->Ln();

$pereks = mysqli_query($koneksi, "SELECT * FROM per_ekstrakurikuler WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
while ($dteks = mysqli_fetch_array($pereks)) {
    $dtarray[] = array(
        "Kegiatan" => $dteks['kegiatan'],
        "Keterangan" => $dteks['keterangan']
    );
}

// $pdf->Cell(10,6,'');
$pdf->SetWidths(Array(10,35,144));
// $pdf->SetLineHeight(5);

$noo = 1;
foreach ($dtarray as $ky) {
    $pdf->Row(Array(
        $noo++,
        $ky['Kegiatan'],
        $ky['Keterangan']
    ));
    // $pdf->Cell(10,6,'');
}

    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'D. Saran-saran');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    
    // $pdf->Cell(10,6,'');
    $pdf->SetWidths(Array(189));
    // $pdf->SetLineHeight(5);

    $dtsrn = mysqli_query($koneksi, "SELECT * FROM saran WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
    while ($dtr = mysqli_fetch_array($dtsrn)) {
        $dtar[] = array(
            "Saran" => $dtr['saran']
        );
    }

    $pdf->SetFont('Times','',10);
    $nok =1;
    foreach ($dtar as $vlue) {
        $pdf->Row(Array($vlue['Saran']));
        $pdf->Cell(10,6,'');
    }

    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'E. Tinggi dan Berat Badan');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    // $pdf->Cell(10,6,'');
    $pdf->Cell(10,6,'No',1,0,'C');
    $pdf->Cell(35,6,'Aspek yang Dinilai',1,0,'C');
    $pdf->Cell(35,6,$smster . $angka,1,0,'C');
    $pdf->Ln();

    // $pdf->Cell(10,6,'');
    $pdf->SetWidths(Array(10,35,35));
    // $pdf->SetLineHeight(5);

    $dttinggi = mysqli_query($koneksi, "SELECT * FROM tinggi_berat_badan WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
    $dttb = mysqli_fetch_array($dttinggi);

    $arrytb = array(
            "Tinggi Badan" => $dttb['tinggi_badan'],
            "Berat Badan" => $dttb['berat_badan']
        );

    $nop=1;
    foreach ($arrytb as $ke => $va) {
        $pdf->Row(Array($nop++, $ke, $va));
        // $pdf->Cell(10,6,'');
    }

    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'F. Kondisi Kesehatan');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    // $pdf->Cell(10,6,'');
    $pdf->Cell(10,6,'No',1,0,'C');
    $pdf->Cell(35,6,'Aspek yang Dinilai',1,0,'C');
    $pdf->Cell(144,6,'Keterangan',1,0,'C');
    $pdf->Ln();

    $perkes = mysqli_query($koneksi, "SELECT * FROM per_kesehatan WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
    while ($dtkes = mysqli_fetch_array($perkes)) {
        $arrykes[] = array(
            "Aspek Fisik" => $dtkes['aspek_fisik'],
            "Keterangan" => $dtkes['keterangan']
        );
    }

    // $pdf->Cell(10,6,'');
    $pdf->SetWidths(Array(10,35,144));
    // $pdf->SetLineHeight(5);

    $noe=1;
    foreach ($arrykes as $kes) {
        $pdf->Row(Array($noe++, $kes['Aspek Fisik'], $kes['Keterangan'] ));
        // $pdf->Cell(10,6,'');
    }

    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'G. Prestasi');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    // $pdf->Cell(10,6,'');
    $pdf->Cell(10,6,'No',1,0,'C');
    $pdf->Cell(35,6,'Aspek yang Dinilai',1,0,'C');
    $pdf->Cell(144,6,'Keterangan',1,0,'C');
    $pdf->Ln();

    $perpres = mysqli_query($koneksi, "SELECT * FROM per_prestasi WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
    while ($dtpre = mysqli_fetch_array($perpres)) {
        $arrypre[] = array(
            "Aspek" => $dtpre['jenis_prestasi'],
            "Keterangan" => $dtpre['keterangan']
        );
    }

    // $pdf->Cell(10,6,'');
    $pdf->SetWidths(Array(10,35,144));
    // $pdf->SetLineHeight(5);

    $noe=1;
    foreach ($arrypre as $pres) {
        $pdf->Row(Array($noe++, $pres['Aspek'], $pres['Keterangan'] ));
        // $pdf->Cell(10,6,'');
    }

    $sqlcttn = mysqli_query($koneksi, "SELECT * FROM catatan WHERE id_kelas ='".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
    $dtctn = mysqli_fetch_array($sqlcttn);

    $pdf->AddPage();
    //bembuat baris baru
    $pdf->Ln(10);
    $pdf->Cell(10,6,'');
    //letak foto
    // $pdf->Cell(165,40,'',1,0);
    $pdf->Rect(10,20,189,200);
    $pdf->Ln(10);
    $pdf->Cell(20,6,'');
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(20,0,'Catatan :');
    $pdf->Ln(5);
    $pdf->Cell(20,0,'');
    $pdf->SetFont('Times','',11);
    $pdf->MultiCell(144,6,$dtctn['catatan']);

    date_default_timezone_set('Asia/Jakarta'); 
    $tgl = date("d M Y");

    //memberi space kebawah
    $pdf->Cell(10,20,'',0,1);
    //memberi space kesamping
    $pdf->Cell(120,6,'');
    $pdf->Cell(30,6,'Pamulang, ' . $tgl);
    $pdf->Ln();
    $pdf->Cell(20,0,'');
    $pdf->Cell(20,6,'Orangtua Peserta Didik,');
    $pdf->Cell(80,6,'');
    $pdf->Cell(0,6,'Guru Kelas,');
    $pdf->Ln(20);
    $pdf->Cell(20,0,'');
    $pdf->Cell(20,6,'.......................................');
    $pdf->Cell(80,6,'');
    $pdf->Cell(0,6,$dtusr['nama_depan'] .' '. $dtusr['nama_belakang']);
    $pdf->Ln();
    $pdf->Cell(120,6,'');
    $pdf->Cell(0,6,'NUPTK. ' .$dtusr['nuptk']);

    $pdf->Ln(10);
    $pdf->Cell(75,0,'');
    $pdf->Cell(0,6,'Kepala Sekolah,');
    $pdf->Ln(20);
    $pdf->Cell(75,0,'');
    $pdf->Cell(0,6,$dts['kepala_sekolah']);
    $pdf->Ln(5);
    $pdf->Cell(75,0,'');
    $pdf->Cell(0,6,'NIY. ' . $dts['niy']);


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
    $pdf->Cell(165,6,'Keluar',1,0,'C');

    $pdf->Ln();
    $pdf->Cell(10,6,'');
    $pdf->SetWidths(array(41.25,41.25,41.25,41.25));
    // $pdf->SetLineHeight(5);

    $pdf->RowC(Array("Tanggal", "Kelas Yang ditinggalkan", "Sebab - sebab keluar atau atas permintaan  (Tertulis)","Tanda Tangan Kepala Sekolah, Stempel Sekolah dan Tanda Tangan Orang Tua/Wali"));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));
    $pdf->Cell(10,6,'');
    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));
    $pdf->Cell(10,6,'');
    $pdf->Row(Array("", "", ""," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ...............................           Orang tua/Wali                                                                                                                                    ......................................"));

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
    $pdf->Cell(165,6,'Masuk',1,0,'C');

    $pdf->Ln();
    $pdf->Cell(10,6,'');
    $pdf->SetWidths(array(41.25,82.5,41.25));
    // $pdf->SetLineHeight(5);

    $pdf->Row(Array("1", "Nama Peserta Didik :                                                Nomor Induk :                                                          Nama Sekolah :                                                Masuk di Sekolah ini:                                                a. Tanggal :                                                                b. Di Kelas :                                                          Tahun Pelajaran :                                                "," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ..............................."));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("2", "Nama Peserta Didik :                                                Nomor Induk :                                                          Nama Sekolah :                                                Masuk di Sekolah ini:                                                a. Tanggal :                                                                b. Di Kelas :                                                          Tahun Pelajaran :                                                "," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ..............................."));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("3", "Nama Peserta Didik :                                                Nomor Induk :                                                          Nama Sekolah :                                                Masuk di Sekolah ini:                                                a. Tanggal :                                                                b. Di Kelas :                                                          Tahun Pelajaran :                                                "," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ..............................."));
    $pdf->Cell(10,6,'');

    $pdf->Row(Array("4", "Nama Peserta Didik :                                                Nomor Induk :                                                          Nama Sekolah :                                                Masuk di Sekolah ini:                                                a. Tanggal :                                                                b. Di Kelas :                                                          Tahun Pelajaran :                                                "," ......................................         Kepala Sekolah                                                                                                                                   ...................................... NP. ..............................."));
    $pdf->Cell(10,6,'');


    //Halaman baru
    // $pdf->AddPage();
    //clear
$fileName = 'Rapor-' . $nmsiswa . '.pdf';
$pdf->Output($fileName, 'D');

}

?>