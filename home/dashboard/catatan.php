<?php 
$sqlid = mysqli_query($koneksi, "SELECT * FROM data_siswa WHERE nama_siswa ='".$_GET['id']."'");
$siswa = mysqli_fetch_array($sqlid);

$sq1 = mysqli_query($koneksi, "SELECT * FROM kelas WHERE kelas = '".$_SESSION['kelas']."'");
$dtsq1 = mysqli_fetch_array($sq1);

$sq2 = mysqli_query($koneksi, "SELECT * FROM semester WHERE semester = '".$_SESSION['semester']."'");
$dtsq2 = mysqli_fetch_array($sq2);
?>
<div class="body">
	<!--Saran-saran-->
	<div class="row">
		<div class="header bg-indigo">
			<h2>Saran-saran <small>Catatan Guru</small>
			</h2>
            <?php
            $sql = mysqli_query($koneksi, "SELECT * FROM saran WHERE id_siswa = '".$siswa['id_siswa']."' AND id_kelas = '".$dtsq1['id_kelas']."' AND id_semester = '".$dtsq2['id_semester']."'");
            $dt = mysqli_fetch_array($sql);
            ?>
			<ul class="header-dropdown m-r-5" hidden>
	            <li class="dropdown">
	                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button class="btn bg-light-blue"><i class="material-icons">library_add</i> Input</button>
	                </a>
	                <ul class="dropdown-menu pull-right">
	                    <li><a href="" data-toggle="modal" data-target="#defaultsaran">Saran</a></li>
	                    <li><a href="?page=edit_saran&id=<?= $dt['id_saran'] ?>&ids=<?= $dt['id_siswa']; ?>">Edit</a></li>
	                </ul>
	            </li>
	        </ul>
		</div>
		<div class="table tabl-responsive">
			<table class="table table-bordered table-hover font-11">
				<thead>
					<tr class="bg-light-blue">
						<th>Catatan Guru Otomatis</th>
					</tr>
				</thead>
                <tbody>
                    <?php 
                        $sqls = mysqli_query($koneksi, "SELECT x.id_siswa, nama_siswa, x.id_kelas, x.id_semester, CONCAT('(1) Dari aspek pengetahuan dan keterampilan Ananda ',nama_siswa,
IF(rata_rata >= 100,' memiliki pengetahuan dan keterampilan sangat baik, Untuk itu selamat dan terus kembangkan potensi yang ananda miliki. ',
IF(rata_rata >= 90,' memiliki pengetahuan dan keterampilan baik, Untuk itu selamat dan terus kembangkan potensi yang ananda miliki. ',
IF(rata_rata >= 80,' memiliki pengetahuan dan keterampilan cukup baik, untuk itu perlu peningkatan dan konsistensi dalam belajar. ',
' perlu peningkatan dan konsitensi dalam belajar agar memperoleh pengetahuan dan keterampilan yang cukup baik. '))),
'(2) Di Bidang sikap ',
IF(h.nilai || i.nilai = 'A','spiritual dan sosial ananda berhasil meraih nilai yang sangat baik, Untuk itu selamat dan terus kembangkan sikap spiritual dan sosial yang ananda miliki. ',
IF(h.nilai || i.nilai = 'B','spiritual dan sosial ananda memiliki potensi yang baik untuk di kembangkan.',
IF(h.nilai || i.nilai = 'C','spiritual dan sosial ananda memiliki potensi yang harus terus ada peningkatan.',
' spiritual dan sosial ananda perlu ada bimbingan dalam meraih nilai sikap yang lebih baik. '))),
'(3) Ketidakhadiran ananda ', nama_siswa,' sebanyak : ',total_tidak_masuk,'kali dengan keterangan Sakit : ',sakit,'kali, Ijin : ',ijin,'kali, Tanpa keterangan : ',tanpa_keterangan,'kali.',
' dan Selamat ananda ',nama_siswa,' telah memperoleh ranking ', FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)),' di kelas.'
) AS deskripsi, x.tahun_ajaran_awal, x.tahun_ajaran_akhir  
FROM gabunganki3_ki4 X
INNER JOIN per_prestasi Y ON y.id_kelas = x.id_kelas
INNER JOIN ketidakhadiran a ON a.id_kelas = x.id_kelas
INNER JOIN nilai_raport_spiritual h ON h.id_kelas = x.id_kelas
INNER JOIN nilai_raport_sosial i ON i.id_kelas = x.id_kelas WHERE x.id_siswa = '".$siswa['id_siswa']."' AND x.id_kelas = '".$dtsq1['id_kelas']."' AND x.id_semester = '".$dtsq2['id_semester']."' GROUP BY x.id_siswa DESC");
                        while ($datas = mysqli_fetch_array($sqls)) { 
                        if (($datas['id_siswa'] == $siswa['id_siswa']) && ($datas['id_kelas'] == $dtsq1['id_kelas']) && ($datas['id_semester'] == $dtsq2['id_semester'])) {
                        ?>
                        <tr>
                            <td>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <textarea name="saran" cols="30" rows="5" class="form-control no-resize font-11" required readonly><?= $datas['deskripsi']; ?></textarea>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    <?php }else if(($datas['id_siswa'] != $siswa['id_siswa']) && ($datas['id_kelas'] != $dtsq1['id_kelas']) && ($datas['id_semester'] != $dtsq2['id_semester'])){ ?>
                        <tr>
                            <td>Data tidak ada</td>
                        </tr>
                    <?php }
                    }
                        ?>
                </tbody>
			</table>
		</div>
	</div>

</div>

