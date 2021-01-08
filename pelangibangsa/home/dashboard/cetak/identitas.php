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
$pdf->Image('img/logo.png',75,20,60);

//1. halamn pertama 
//memberikan space kebawah
$pdf->Cell(10,70,'',0,1);
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',14);
// mencetak string judul
$pdf->Cell(190,7,'RAPOR',0,1,'C');
$pdf->Cell(190,7,'PESERTA DIDIK',0,1,'C');
$pdf->Cell(190,7,'SEKOLAH DASAR SWASTA',0,1,'C');
$pdf->Cell(190,7,'(SDS)',0,1,'C');
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


    // foreach ($dtsiswa as $key2 => $value2) {
    //     $pdf->Cell(40,6,'');
    //     $pdf->Cell(45,6,$key2);
    //     $pdf->Cell(35,6, "  : ".$value2);       
    //     $pdf->Ln();
    // }

$pdf->SetWidths(Array(50,5,70));
foreach ($dtsiswa as $alt => $almt) {
    $pdf->Cell(40,6,'');
    $pdf->RowNoBorder(Array($alt," :",$almt));
}

    $ortu = array(
        "8.     Nama Orang Tua" => "",
        "            a. Nama Ayah" => $row['nama_ayah'],
        "            b. Nama Ibu" => $row['nama_ibu'],
        "9.     Pekerjaan Orang Tua" => "",
        "            a. Pekerjaan Ayah" => $row['pekerjaan_ayah'],
        "            b. Pekerjaan Ibu" => $row['pekerjaan_ibu'],
        "10.    Alamat Orang Tua" => "",
        "               Kelurahan/ Desa" => $row['desa_kelurahan'],
        "               Kecamatan" => $row['kecamatan'],
        "               Kabupaten/ Kota" => $row['kabupaten_kota'],
        "               Provinsi" => $row['provinsi'],
        "11.    Wali Peserta Didik" => "",
        "               a. Nama" => $row['nama_wali'],
        "               b. Pekerjaan" => $row['pekerjaan_wali'],
        "               c. Alamat" => $row['alamat_wali']
    );
    
foreach ($ortu as $or => $tu) {
    $pdf->Cell(40,6,'');
    $pdf->RowNoBorder(Array($or," :",$tu));
}


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
    // $pdf->Cell(130,6,'');
    // $pdf->Cell(30,6,'NIY : ' . $dts['niy']);

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

    $pdf->SetFont('Times','',10);

    $pdf->Cell(10,6,'');
    $pdf->SetWidths(Array(42.25,4,59.25,35.25,42.25));

    $pdf->RowNoBorder(Array("Nama Peserta Didik",": ","".$row['nama_siswa'], "    Kelas ", ": ".$kelas ));
    $pdf->Cell(10,0,'');
    $pdf->RowNoBorder(Array("NISN/ NIS",": ","".$row['nisn']."/ ".$row['nis'], "    Semester ", ": ".$ang.' '.$angka ));
    $pdf->Cell(10,0,'');
    $pdf->RowNoBorder(Array("Nama Sekolah", ": ","".$dts['nama_sekolah'], "    Tahun Pelajaran ", ": ".$thawal.'/'.$thakhir ));
    // $pdf->Cell(20,0,'');
    // $pdf->RowNoBorder(Array("Alamat Sekolah", ": ".$dts['alamat_sekolah']));


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
    "Sosial" => $sos['deskripsi']
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
    $pdf->Cell(35,6,'      KKM yang digunakan adalah KKM satuan pendidikan dengan memilih KKM terkecil : '.$dtmapel['kkm_min']);
    // $pdf->Cell(10,6,'');
    //pengetahuan dan keterampilan
     // Memberikan space kebawah agar tidak terlalu rapat

//header table
// $pdf->TabHeader();

// $pdf->Cell(10,6,'');
$pdf->SetWidths(Array(10,35,10,15,47,10,15,47));
// $pdf->SetLineHeight(5);

//mengambil nilai pengetahuandan keterampilan
$sqlrpt = mysqli_query($koneksi, "SELECT Y.id_mapel as id_mapel, Y.nama_mapel as nama_mapel, pengetahuan, keterampilan, Y.nilai as nilaiki3, Y.predikat as predikatki3, Y.deskripsi as deskripsiki3, Z.nilai as nilaiki4, Z.predikat as predikatki4, Z.deskripsi as deskripsiki4 FROM mapel X INNER JOIN data_siswa A INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel WHERE Y.id_siswa = '".$id_siswa."' AND Z.id_siswa = '".$id_siswa."' AND y.id_kelas = '".$dtsq1['id_kelas']."' AND z.id_semester = '".$dtsq2['id_semester']."' GROUP BY id_mapel");
while ($rpt = mysqli_fetch_array($sqlrpt)) {
    $arry[] = Array(
        "id_mapel" => $rpt['id_mapel'],
        "nama_mapel" => $rpt['nama_mapel'],
        "pengetahuan" => $rpt['pengetahuan'],
        "keterampilan" => $rpt['keterampilan'],
        "nilaiki3" => $rpt['nilaiki3'],
        "predikatki3" => $rpt['predikatki3'],
        "deskripsiki3" => $rpt['deskripsiki3'],
        "nilaiki4" => $rpt['nilaiki4'],
        "predikatki4" => $rpt['predikatki4'],
        "deskripsiki4" => $rpt['deskripsiki4']
    );
}
$pdf->TabHeader();
$nom=1;
foreach ($arry as $item) {

        $pdf->Row(Array(
        $nom++,
        $item['nama_mapel'].". kkm-".$dtmapel['kkm_min'],
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
    $pdf->Cell(20,6,'Predikat',1,0,'C');
    $pdf->Cell(124,6,'Keterangan',1,0,'C');
    $pdf->Ln();

$pereks = mysqli_query($koneksi, "SELECT * FROM per_ekstrakurikuler WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
while ($dteks = mysqli_fetch_array($pereks)) {
    $dtarray[] = array(
        "Kegiatan" => $dteks['kegiatan'],
        "predik" => $dteks['predikat'],
        "Keterangan" => $dteks['keterangan']
    );
}

// $pdf->Cell(10,6,'');
$pdf->SetWidths(Array(10,35,20,124));
// $pdf->SetLineHeight(5);

$noo = 1;
foreach ($dtarray as $ky) {
    $pdf->Row(Array(
        $noo++,
        $ky['Kegiatan'],
        $ky['predik'],
        $ky['Keterangan']
    ));
    // $pdf->Cell(10,6,'');
}

    //mmenampilkan kolom tinggi dan berat badan
    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'D. Tinggi dan Berat Badan');
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
    $pdf->Cell(35,6,'E. Kondisi Kesehatan');
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
    $pdf->Cell(35,6,'F. Prestasi');
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

    $pdf->AddPage();

    //menampilkan kolom saran-saran/catatan guru kelas
    //query ini di ambil bukan dari table saran_saran ataupun dari table catatan
    $sran = mysqli_query($koneksi, "SELECT x.id_siswa, nama_siswa, x.id_kelas, x.id_semester, CONCAT('(1) Dari aspek pengetahuan dan keterampilan Ananda ',nama_siswa,
IF(rata_rata >= 100,' memiliki pengetahuan dan keterampilan sangat baik, Untuk itu selamat dan terus kembangkan potensi yang ananda miliki. ',
IF(rata_rata >= 90,' memiliki pengetahuan dan keterampilan baik, Untuk itu selamat dan terus kembangkan potensi yang ananda miliki. ',
IF(rata_rata >= 80,' memiliki pengetahuan dan keterampilan cukup baik, untuk itu perlu peningkatan dan konsistensi dalam belajar. ',
' perlu peningkatan dan konsitensi dalam belajar agar memperoleh pengetahuan dan keterampilan yang cukup baik. '))),
'(2) Di Bidang sikap ',
IF(h.nilai || i.nilai = 'A','spiritual dan sosial ananda berhasil meraih nilai yang sangat baik, Untuk itu selamat dan terus kembangkan sikap spiritual dan sosial yang ananda miliki. ',
IF(h.nilai || i.nilai = 'B','spiritual dan sosial ananda memiliki potensi yang baik untuk di kembangkan.',
IF(h.nilai || i.nilai = 'C','spiritual dan sosial ananda memiliki potensi yang harus terus ada peningkatan.',
' spiritual dan sosial ananda perlu ada bimbingan dalam meraih nilai sikap yang lebih baik. ')))) AS deskripsi, x.tahun_ajaran_awal, x.tahun_ajaran_akhir  
FROM gabunganki3_ki4 X
INNER JOIN per_prestasi Y ON y.id_kelas = x.id_kelas
INNER JOIN ketidakhadiran a ON a.id_kelas = x.id_kelas
INNER JOIN nilai_raport_spiritual h ON h.id_kelas = x.id_kelas
INNER JOIN nilai_raport_sosial i ON i.id_kelas = x.id_kelas
WHERE x.id_siswa = '".$id_siswa."' AND x.id_kelas = '".$dtsq1['id_kelas']."' AND x.id_semester = '".$dtsq2['id_semester']."' AND x.tahun_ajaran_awal = '".$thawal."' AND x.tahun_ajaran_akhir = '".$thakhir."'
GROUP BY x.id_siswa DESC");

/* History Ranking : ,'dan Selamat ananda ',nama_siswa,' telah memperoleh ranking ', FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)),' di kelas.'
*/
    while ($dtdes = mysqli_fetch_array($sran)) {
        $raysar[] = array(
        'id_siswa' => $dtdes['id_siswa'],
        'nama_siswa' => $dtdes['nama_siswa'],
        'deskrip' => $dtdes['deskripsi']
        );
    }

    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'G. Catatan Guru Kelas');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    $pdf->SetWidths(Array(189));
    foreach ($raysar as $vue) {
        $pdf->Row(Array($vue['deskrip']));
        $pdf->Cell(10,6,'');
    }
    //tutup kolom untuk sara-saran/catatan guru kelas

    //menampilkan kolom absensi
    $sqlabsen = mysqli_query($koneksi, "SELECT * FROM ketidakhadiran WHERE id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."' AND id_siswa = '".$id_siswa."' AND tahun_ajaran_awal = '".$thawal."' AND tahun_ajaran_akhir = '".$thakhir."'");
    while ($dtabsen = mysqli_fetch_array($sqlabsen)) {
        $arrayab = array(
            'Sakit' => $dtabsen['sakit'],
            'Ijin' => $dtabsen['ijin'],
            'Tanpa Keterangan' => $dtabsen['tanpa_keterangan'],
            'Total' => $dtabsen['total_tidak_masuk']
        );
    }

    $pdf->Cell(10,6,'',0,1);
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(10,6,'');
    $pdf->Cell(35,6,'H. Absensi');
    $pdf->SetFont('Times','',11);
    $pdf->Ln(10);
    // $pdf->Cell(10,6,'');
    $pdf->Cell(10,6,'No',1,0,'C');
    $pdf->Cell(35,6,'Aspek yang Dinilai',1,0,'C');
    $pdf->Cell(35,6,'Keterangan',1,0,'C');
    $pdf->Ln();

    $pdf->SetWidths(Array(10,35,35));
    $pdf->SetFont('Times','',11);
    $nok =1;
    foreach ($arrayab as $kes => $velyu) {
        $pdf->Row(Array($nok++, $kes, $velyu));
        // $pdf->Cell(10,6,'');
    }

    // $pdf->Cell(10,6,'',0,1);
    // $pdf->SetFont('Times','B',11);
    // $pdf->Cell(10,6,'');
    // $pdf->Cell(35,6,'I. Absensi');
    // $pdf->SetFont('Times','',11);
    // Keputusan:
    // Berdasarkan pencapaian
    // seluruh kompetensi
    // peserta didik dinyatakan
    // Naik ke kelas : III (Tiga)

    $sqlkls = mysqli_query($koneksi, "SELECT * FROM kelas");
    while ($dtkls = mysqli_fetch_array($sqlkls)) {
        $kls[] = array(
            'id_kelas' => $dtkls['id_kelas'], 'kelas' => $dtkls['kelas']
        );
    }

    if ($kelas == $kls[0]['kelas']) {
        $noKelas = 1;
        $kel = $kls[0]['kelas'];
    }else if($kelas == $kls[1]['kelas']){
        $noKelas = 2;
        $kel = $kls[1]['kelas'];
    }else if ($kelas == $kls[2]['kelas']) {
        $noKelas = 3;
        $kel = $kls[2]['kelas'];
    }else if($kelas == $kls[3]['kelas']){
        $noKelas = 4;
        $kel = $kls[3]['kelas'];
    }else if($kelas == $kls[4]['kelas']){
        $noKelas = 5;
        $kel = $kls[4]['kelas'];
    }else if($kelas == $kls[5]['kelas']){
        $noKelas = 6;
        $kel = $kls[5]['kelas'];
    }

    $naik = $noKelas + 1;

    if ($dtsq2['id_semester'] == 'SM02' && $noKelas == '6') {
        $pdf->Cell(10,6,'',0,1);
        $putusan = array('B' => 'Berdasarkan seluruh kompetensi peserta didik, Ananda dinyatakan (LULUS/TIDAK-LULUS)');
        $pdf->SetFont('Times','B',11);
        $pdf->Cell(80,6,'Keputusan Kenaikan Kelas :',1,0,'C');
        $pdf->Cell(10,6,'',0,1);
        $pdf->SetFont('Times','',11);
        $pdf->SetWidths(Array(80));
        foreach ($putusan as $y => $v) {
            $pdf->Row(Array($v));
        }    
    }else if($dtsq2['id_semester'] == 'SM02'){
        $pdf->Cell(10,6,'',0,1);
        $putusan = array('B' => 'Berdasarkan seluruh kompetensi peserta didik, Ananda dinyatakan (NAIK/TIDAK-NAIK) : ke kelas '. $naik);
        $pdf->SetFont('Times','B',11);
        $pdf->Cell(80,6,'Keputusan Kenaikan Kelas :',1,0,'C');
        $pdf->Cell(10,6,'',0,1);
        $pdf->SetFont('Times','',11);
        $pdf->SetWidths(Array(80));
        foreach ($putusan as $y => $v) {
            $pdf->Row(Array($v));
        } 
    }else{

    }

    date_default_timezone_set('Asia/Jakarta'); 
    $tgl = date("d M Y");

    //memberi space kebawah
    $pdf->Cell(10,20,'',0,1);
    //memberi space kesamping
    $pdf->Cell(120,6,'');
    $pdf->SetFont('Times','',11);
    $pdf->Cell(30,6,'Pamulang, ' . $tgl);
    $pdf->Ln();
    $pdf->Cell(10,0,'');
    $pdf->Cell(20,6,'Orang tua Peserta Didik,');
    $pdf->Cell(90,6,'');
    $pdf->Cell(0,6,'Guru Kelas,');
    $pdf->Ln(20);
    $pdf->Cell(10,0,'');
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(20,6,$row['nama_ayah']);
    $pdf->Cell(90,6,'');
    $pdf->Cell(0,6,$dtusr['nama_depan'] .' '. $dtusr['nama_belakang']);
    // $pdf->Ln();
    // $pdf->Cell(120,6,'');
    // $pdf->Cell(0,6,'NUPTK. ' .$dtusr['nuptk']);

    $pdf->Ln(10);
    $pdf->Cell(75,0,'');
    $pdf->SetFont('Times','',11);
    $pdf->Cell(0,6,'Kepala Sekolah,');
    $pdf->Ln(20);
    $pdf->Cell(75,0,'');
    $pdf->SetFont('Times','B',11);
    $pdf->Cell(0,6,$dts['kepala_sekolah']);
    $pdf->Ln(5);
    // $pdf->Cell(75,0,'');
    // $pdf->Cell(0,6,'NIY. ' . $dts['niy']);


    include "ket.php";

    //Halaman baru
    // $pdf->AddPage();
    //clear
$fileName = 'Rapor-'.$kelas."-".$smster."-".$nmsiswa .'.pdf';
$pdf->Output($fileName, 'D');

}

?>