SELECT * FROM users

SET @no:=0;
SELECT @no:=@no+1 AS NO, agent_id, agent_name FROM users WHERE agent_id ORDER BY agent_id ASC

SELECT * FROM USER;
SELECT * FROM user_level
SELECT * FROM mapel
SELECT * FROM kompt_dasar
SELECT username FROM USER
SELECT username, email, PASSWORD, LEVEL 
FROM USER X
INNER JOIN user_level Y ON Y.id_level = X.id_user WHERE id_user ='USR0001';

ALTER TABLE USER CHANGE LEVEL id_level VARCHAR(25);
UPDATE USER SET id_level ='LV02' WHERE  id_user ='USR0002';
UPDATE user_level SET LEVEL = 'User 2' WHERE id_level ='LV03';

SELECT * FROM  POSITION
SELECT * FROM USER
//gabung USER sama POSITION
SELECT DISTINCT username, email, Y.id_level, LEVEL 
FROM user_level Y
INNER JOIN USER X ON X.`id_level` = Y.id_level;

SELECT * FROM master_level WHERE id_user = 'USR0005';
INSERT INTO kelas(id_kelas, kelas) VALUES(
'KLS01',' Kelas I'),('KLS02','Kelas II'),('KLS03','Kelas III');
UPDATE kelas SET kelas='Kelas I' WHERE id_kelas = 'KLS01'
)
INSERT INTO kelas(id_kelas, kelas) VALUES('KLS04','Kelas IV'),('KLS05','Kelas V'),('KLS06','Kelas VI');

SELECT username, PASSWORD, Y.id_position AS id, name_position 
FROM POSITION Y
INNER JOIN USER X ON X.`id_position` = Y.id_position
WHERE username = 'kepsek';

SELECT * FROM POSITION WHERE name_position='Guru Kelas'

SELECT id_master, Y.id_user, username, id_kelas
FROM USER Y
LEFT JOIN master_level X ON X.id_master = Y.id_user WHERE X.id_user ='USR0001' ORDER BY id_master


selec
SELECT * FROM POSITION Y
INNER JOIN USER X ON X.`id_position` = Y.id_position
WHERE username = 'admin';

SELECT * FROM kompt_dasar
SELECT * FROM mapel
SELECT id_mapel, nama_mapel, kelompok, pengetahuan, keterampilan FROM mapel

SELECT X.id_mapel, Y.id_mapel, nama_mapel, id_kd, nomor_kd
FROM mapel Y
RIGHT JOIN kompt_dasar X ON X.id_kd = Y.id_mapel WHERE Y.id_mapel ='MPL02' ORDER BY X.id_mapel 

SELECT * FROM kompt_dasar Y INNER JOIN mapel X ORDER BY X.id_mapel

SELECT DISTINCT Y.id_kd, nom, nomor_kd, nama_mapel, deskripsi FROM kompt_dasar Y INNER JOIN mapel X ORDER BY nama_mapel

SELECT DISTINCT username, X.id_position FROM USER X INNER JOIN POSITION Y WHERE X.id_position ='PS03' ORDER BY username ASC

SELECT * FROM USER
SELECT * FROM POSITION
SELECT * FROM data_siswa
SELECT * FROM master_level
SELECT X.id_user, username FROM master_level X 
INNER JOIN USER Y WHERE X.id_user = 'USR0002' LIMIT 1,1

SELECT DISTINCT X.id_position, name_position, username, kelas FROM POSITION X
INNER JOIN kelas Y
INNER JOIN USER Z WHERE X.id_position = 'PS03' ORDER BY X.id_position

SELECT * FROM POSITION
SELECT * FROM master_level
SELECT * FROM kelas
SELECT * FROM USER

SET @no:=0;
SELECT DISTINCT @no:=@no+1 AS NO, id_user, X.id_position, name_position 
FROM USER X 
INNER JOIN POSITION Y ON Y.id_position = X.id_position ORDER BY NO ASC

SELECT * FROM master_level INNER JOIN USER

SELECT DISTINCT id_master, X.id_position, id_kelas, name_position
FROM master_level X 
INNER JOIN POSITION Y ON Y.id_position = X.`id_position`
INNER JOIN USER Z ON Z.id_user = X.`id_position`

//tampil kelas
SELECT * FROM kelas

SELECT id_master, Z.id_position, name_position, A.id_user, username, Y.id_kelas, kelas
FROM master_level X
INNER JOIN kelas Y ON Y.id_kelas = X.`id_kelas`
INNER JOIN POSITION Z ON Z.id_position = X.id_position
INNER JOIN USER A ON A.id_user = X.id_user

SELECT * FROM POSITION
SELECT * FROM USER

//untuk mendapakan id_user berdasarkan id_posisi dan kelasnya
SELECT * FROM USER X
INNER JOIN POSITION Y ON Y.`id_position` = X.`id_position`

SELECT * FROM data_level_siswa
SELECT * FROM master_level
SELECT * FROM data_siswa
SELECT * FROM mapel
SELECT * FROM master_level
SELECT * FROM USER WHERE id_position = 'PS03'
SELECT X.id_user, username, email, Z.id_position, Y.id_kelas
FROM USER X 
INNER JOIN master_level Z ON Z.id_master = Y.id_kelas
INNER JOIN kelas Y ON Y.id_kelas = X.id_user
SHOW TABLES
SELECT * FROM data_siswa
SELECT id_user, username, X.id_position, name_position, Z.id_kelas, kelas
FROM USER X
INNER JOIN POSITION Y ON Y.id_position = X.id_position
INNER JOIN kelas Z ON Z.id_kelas = X.id_user

SELECT * FROM kelas

SELECT id_level_siswa, X.id_siswa, nisn, nis, nama_siswa, Z.id_kelas, kelas,
jk, tempat_lahir, tanggal_lahir, agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu 
FROM data_level_siswa X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas

SELECT nisn, nis, nama_siswa, jk, kelas
FROM data_level_siswa X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas

SELECT id_level_siswa, X.id_siswa, nisn, nis, nama_siswa, Z.id_kelas, kelas,
jk, tempat_lahir, tanggal_lahir, agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu 
FROM data_level_siswa X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas WHERE kelas = 'Kelas III'

SELECT * FROM data_level_siswa X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas

SELECT * FROM jurnal_spiritual
SELECT * FROM jurnal_sosial

SHOW TABLES
SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM semester

//master_level hanya boleh untuk POSITION dengan id_position = PS03
SELECT * FROM master_level

//untuk menampilkan data_siswa perkelas sesuai dengan semesternya
SELECT nisn, nis, nama_siswa, C.id_kelas, kelas, Y.id_semester, semester,
jk, tempat_lahir, tanggal_lahir, agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu
FROM data_level_siswa X
INNER JOIN data_level_semester Y ON Y.id_level_siswa = X.id_level_siswa
INNER JOIN data_siswa Z ON Z.id_siswa = X.id_siswa
INNER JOIN kelas C ON C.id_kelas = X.id_kelas
INNER JOIN semester B ON B.id_semester = Y.id_semester WHERE kelas = 'Kelas II'

SELECT * FROM siswa_kelas_semester WHERE kelas = 'Kelas III' AND semester = 'Semester 1'
SELECT COUNT(nisn) AS nisn FROM siswa_kelas_semester WHERE kelas = 'Kelas III'
SELECT COUNT(id_position) AS id FROM master_level WHERE id_position = 'PS03'

//nampilin views TABLE JOIN tanpa id
SELECT nisn, nis, nama_siswa, kelas, semester,
jk, tempat_lahir, tanggal_lahir, agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu
FROM data_level_siswa X
INNER JOIN data_level_semester Y ON Y.id_level_siswa = X.id_level_siswa
INNER JOIN data_siswa Z ON Z.id_siswa = X.id_siswa
INNER JOIN kelas C ON C.id_kelas = X.id_kelas
INNER JOIN semester B ON B.id_semester = Y.id_semester

SELECT COUNT(id_jurnal_sp) AS id_jurnal_sp FROM jurnal_spiritual
SELECT * FROM sikap_spiritual
SELECT * FROM jurnal_spiritual
SELECT * FROM jurnal_sosial
SELECT * FROM data_siswa WHERE nama_siswa = 'Siswa 8'
SELECT * FROM sikap_spiritual

//menampilkan kolom tabel
SHOW COLUMNS FROM sikap_spiritual FROM pelangi_bangsa
SHOW FIELDS FROM pelangi_bangsa.data_siswa
SHOW FIELDS FROM pelangi_bangsa.jurnal_spiritual

SHOW COLUMNS FROM pelangi_bangsa.`data_siswa`

SELECT * FROM mapel WHERE id_mapel = 'MPL02'
DELETE FROM mapel WHERE id_mapel = 'MPL05'
SELECT * FROM kd_pengetahuan WHERE id_mapel ='MPL05'
SELECT * FROM kd_keterampilan 
SELECT * FROM kd_pengetahuan WHERE id_mapel = 'MPL01'
SELECT * FROM mapel
SHOW TABLES
SELECT * FROM prestasi
SELECT * FROM ekstrakurikuler
SELECT * FROM kesehatan
SELECT * FROM jurnal_sosial
SELECT * FROM jurnal_spiritual
SELECT * FROM sikap_spiritual

UPDATE mapel SET nama_mapel = 'Bahasa indonesia', kelompok ='B' WHERE id_mapel='MPL02'

SELECT COUNT(id_siswa) AS siswa FROM data_siswa
SELECT * FROM data_siswa
SHOW TABLES

SELECT * FROM siswa_kelas_semester WHERE kelas = 'Kelas I'

SHOW FIELDS FROM pelangi_bangsa.data_sekolah
SELECT * FROM data_sekolah
SELECT * FROM semester
SELECT * FROM USER
SELECT * FROM sikap_sosial
SELECT * FROM sikap_spiritual
SELECT * FROM jurnal_spiritual WHERE id_jurnal_sp = 'SPR003'
SELECT * FROM jurnal_sosial
SELECT * FROM siswa_kelas_semester
SELECT * FROM data_sekolah
SHOW FIELDS FROM pelangi_bangsa.data_sekolah
SHOW FIELDS FROM pelangi_bangsa.data_siswa


SHOW FIELDS FROM pelangi_bangsa.data_level_semester

SELECT * FROM master_level
SELECT * FROM siswa_kelas_semester
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM kd_pengetahuan WHERE id_mapel ='MPL01'
SELECT * FROM mapel
SELECT id_siswa FROM data_siswa
SELECT id_siswa, id_mapel  
FROM data_siswa 
INNER JOIN mapel 
WHERE id_siswa = 'SIS0000001' AND WHERE id_mapel = 'MPL01' ORDER BY id_siswa

SELECT DISTINCT Y.id_mapel, id_kd, deskripsi
FROM mapel X
INNER JOIN kd_pengetahuan Y WHERE Y.id_mapel = 'MPL01' ORDER BY id_kd

SET @id:=0;
SELECT DISTINCT @id:=@id+1 AS NO, id_siswa, X.id_mapel, nama_mapel, id_kd, nomor_kd, deskripsi
FROM data_siswa Z
INNER JOIN mapel X
INNER JOIN kd_pengetahuan Y 

SELECT id_siswa, id_mapel, id_kd, nomor_kd, deskripsi
FROM kd_pengetahuan 
INNER JOIN data_siswa 
WHERE id_siswa = 'SIS0000001' AND id_mapel = 'MPL05' ORDER BY id_kd

//untuk menampilkan JOIN tabel penilaian mapel siswa sesuai kd yg ada
SET @tgs:=80;

SELECT DISTINCT B.id_siswa, nama_siswa, X.id_mapel, nama_mapel, B.id_kd, nomor_kd, deskripsi, B.id_tema, nilai, id_nilai
FROM kd_pengetahuan X
INNER JOIN data_siswa Y 
INNER JOIN mapel Z ON Z.id_mapel = X.id_mapel 
INNER JOIN tema A 
INNER JOIN nilai_pengetahuan B
WHERE X.id_mapel = 'MPL01' AND Y.id_siswa = 'SIS0000001' AND X.id_kd = 'KD003' ORDER BY id_tema

WHERE id_siswa = 'SIS0000001' AND X.id_mapel = 'MPL02'

SELECT * FROM kd_pengetahuan
SELECT * FROM nilai_pengetahuan
SELECT * FROM tema

SELECT DISTINCT Y.id_siswa, nama_siswa, X.id_mapel, nama_mapel, X.id_kd, nomor_kd, deskripsi
FROM kd_pengetahuan X
INNER JOIN data_siswa Y 
INNER JOIN mapel Z ON Z.id_mapel = X.id_mapel 
INNER JOIN tema A 
WHERE X.id_mapel = 'MPL01' AND Y.id_siswa = 'SIS0000001'

SELECT * FROM nilai_pengetahuan
SHOW FIELDS FROM pelangi_bangsa.kd_pengetahuan
SELECT * FROM test
SELECT * FROM tema
ALTER TABLE test ADD Tema1 VARCHAR(225)

SELECT * FROM jurnal_spiritual
SELECT * FROM master_level

SHOW FIELDS FROM pelangi_bangsa.nilai_raport_ki3
SELECT * FROM nilai_ki3
SELECT * FROM siswa_kelas_semester
SELECT * FROM data_siswa
SELECT * FROM mapel
SELECT id_nilairaport, X.id_siswa, id_mapel, nilai, predikat, deskripsi 
FROM nilai_raport_ki3 X
INNER JOIN data_siswa Y 

SELECT * FROM nilai_raport_ki4 WHERE 

SELECT * FROM nilai_raport_ki3 X INNER JOIN data_siswa Y
SELECT * FROM nilai_raport_ki3 X INNER JOIN data_siswa Y WHERE X.id_siswa = 'SIS0000001' ORDER BY Y.id_siswa

SELECT DISTINCT nama_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki4 Z
INNER JOIN data_siswa X ON X.id_siswa = Z.id_siswa
INNER JOIN mapel Y ON Y.id_mapel = Z.id_mapel
WHERE Z.id_siswa = 'SIS0000002' ORDER BY Z.id_mapel

SELECT * FROM data_level_siswa
SELECT * FROM nilai_raport_ki4


SHOW FIELDS FROM pelangi_bangsa.sikap_spiritual 
SELECT * FROM USER
SELECT * FROM POSITION
SELECT * FROM kd_pengetahuan
SELECT * FROM nilai_ki3
SELECT * FROM nilai_raport_ki3
SELECT * FROM test
SELECT * FROM nilai_raport_spiritual
SELECT * FROM ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM kesehatan
SELECT * FROM prestasi
SELECT * FROM per_ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM per_prestasi

SELECT id_mapel, deskripsi, Tema_1, Tema_2, Tema_3, Tema_4 
FROM kd_pengetahuan X
RIGHT JOIN nilai_ki3 Y ON Y.id_nilai = X.id_kd
WHERE id_mapel = 'MPL02' ORDER BY id_mapel

SELECT * FROM data_siswa WHERE nama_siswa LIKE 'siswa 2' OR id_siswa LIKE '%03%';

SELECT * FROM siswa_kelas_semester WHERE kelas = 'Kelas II' AND nama_siswa LIKE '%siswa%' ORDER BY kelas;

SELECT * FROM siswa_kelas_semester 
SELECT * FROM data_siswa

SELECT * FROM data_level_siswa
SELECT * FROM USER
SELECT DISTINCT id_user, username, X.id_position, name_position, email 
FROM USER X
INNER JOIN POSITION Y ON Y.id_position = X.id_position
ORDER BY X.id_position

SELECT * FROM ekstrakurikuler
SELECT * FROM nilai_raport_sosial
SELECT * FROM POSITION


SELECT COUNT(predikat) AS hasil FROM test WHERE predikat = 'PB';

SELECT DISTINCT * 
FROM USER X
INNER JOIN POSITION Y ON Y.id_position = X.id_position

SELECT * FROM siswa_kelas_semester
SELECT * FROM data_level_semester
SELECT * FROM data_level_siswa WHERE id_kelas = 'KLS01'
SELECT * FROM data_siswa

//copyan views siswa_kelas_semester
SELECT Z.id_siswa, nama_siswa, C.id_kelas, semester
FROM data_level_siswa X
INNER JOIN data_level_semester Y ON Y.id_level_siswa = X.id_level_siswa
INNER JOIN data_siswa Z ON Z.id_siswa = X.id_siswa
INNER JOIN kelas C ON C.id_kelas = X.id_kelas
INNER JOIN semester B ON B.id_semester = Y.id_semester

SELECT * FROM simple_siswa_kelas_semester

SELECT X.id_siswa
FROM data_siswa X
LEFT JOIN data_level_siswa Y ON Y.id_siswa = X.id_siswa

SELECT * FROM per_ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM per_prestasi
SELECT * FROM kelompok_mapel

SELECT * FROM data_siswa
SELECT * FROM data_level_siswa

SELECT id_level_siswa, Y.id_siswa, id_kelas
FROM data_level_siswa X
RIGHT JOIN data_siswa  Y ON Y.id_siswa = X.id_siswa GROUP BY Y.id_siswa 

SELECT * FROM mapel
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_ki3

SELECT id_siswa, id_mapel, nama_mapel
FROM data_siswa 
INNER JOIN mapel WHERE id_siswa = 'SIS0000001'
SELECT * FROM nilai_raport_ki3

SELECT id_nilairaport, Z.id_siswa, Y.id_mapel, Y.nama_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki3 X
RIGHT JOIN mapel Y ON y.id_mapel = X.id_mapel
INNER JOIN data_siswa Z WHERE Z.id_siswa = 'SIS0000001'

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001'

SELECT id_raportkd, Z.id_siswa, X.id_mapel, X.nama_mapel, Y.id_kd, Y.nomor_kd, Y.deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas, nilai
FROM nilai_raportkd_ki3 B
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_pengetahuan Y ON Y.id_mapel = X.id_mapel 
INNER JOIN data_siswa Z
WHERE Y.id_mapel = 'MPL01' AND Z.id_siswa = 'SIS0000001' 
ORDER BY id_kd

SELECT* FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL01' AND id_siswa = 'SIS0000001'

SELECT id_nilairaport, Z.id_siswa, Y.id_mapel, Y.nama_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki4 X
RIGHT JOIN mapel Y ON y.id_mapel = X.id_mapel
INNER JOIN data_siswa Z WHERE id_siswa = 'SIS0000001'

SELECT * FROM nilai_akhir_raport_ki4 WHERE id_siswa = 'SIS0000001'

SELECT id_raportkd, Z.id_siswa, X.id_mapel, X.nama_mapel, Y.id_kd, Y.nomor_kd, Y.deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas, nilai
FROM nilai_raportkd_ki4 B
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_keterampilan Y ON Y.id_mapel = X.id_mapel 
INNER JOIN data_siswa Z
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL02' AND id_siswa = 'SIS0000001' GROUP BY id_kd
SELECT * FROM nilai_raportkd_ki3 
SELECT pengetahuan FROM mapel WHERE id_mapel ='MPL01'

//untuk menghitung nilai akhir_kd
SELECT id_kd,tugas1,tugas2,tugas3,tugas4,tugas5,@tgs := (tugas1+tugas2+tugas3+tugas4+tugas5) AS rt_tugas,
ph1,ph2,ph3,ph4, @ph :=(ph1+ph2+ph3+ph4) AS rt_ph, pts,pas, @nilai:= (((@tgs+@ph)*2)+pts+pas)/5 AS nilai,
ROUND((@nilai - 75)/3) AS hasil 
FROM nilai_raportkd_ki3 
WHERE id_mapel = 'MPL04'
//CLOSE

SELECT id_kd, nomor_kd,tugas1,tugas2,tugas3,tugas4,tugas5,@tgs := (tugas1+tugas2+tugas3+tugas4+tugas5) AS rt_tugas,
ph1,ph2,ph3,ph4, @ph :=(ph1+ph2+ph3+ph4) AS rt_ph, pts,pas, @nil:=(((@tgs+@ph)*2)+pts+pas)/5 AS nilai,
ROUND((@nil - 75)/3) AS hasil_kd FROM nilai_raportkd_ki3 WHERE id_mapel = 'MPL03'

SELECT COUNT(id_raportkd) AS id FROM nilai_akhir_raportkd_ki3

SELECT * FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL04' AND id_siswa = 'SIS0000001' AND id_kd = 'KD10' GROUP BY id_kd
SELECT * FROM nilai_raportkd_ki3
SET 
SELECT COUNT(id_kd) AS kd  FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL04' AND id_siswa = 'SIS0000001' GROUP BY id_kd 


SELECT id_kd,nomor_kd, deskripsi, tugas1,tugas2,tugas3,tugas4,tugas5,@tgs := (tugas1+tugas2+tugas3+tugas4+tugas5) AS rt_tugas,
ph1,ph2,ph3,ph4, @ph :=(ph1+ph2+ph3+ph4) AS rt_ph, pts,pas, @nilai:= (((@tgs+@ph)*2)+pts+pas)/5 AS nilai,
@data:= ROUND((@nilai - pengetahuan)/3) AS hasil, pengetahuan , MAX(@data) AS total
FROM nilai_raportkd_ki3 X
INNER JOIN mapel Y
WHERE X.id_mapel = 'MPL03' GROUP BY id_kd

SELECT * FROM mapel
SELECT * FROM nilai_raportkd_ki3 WHERE id_mapel = 'MPL04'
SELECT tugas1, tugas1, tugas3 FROM nilai_raportkd_ki3 WHERE id_mapel = 'MPL03' ORDER BY id_raportkd AND id_kd IS NULL
SELECT id_kd, id_siswa FROM nilai_raportkd_ki3
SELECT * FROM mapel WHERE id_mapel = 'MPL01'
SELECT DISTINCT * 
FROM nilai_raportkd_ki3 X
INNER JOIN mapel Y WHERE X.id_mapel = 'MPL04' GROUP BY id_kd
SELECT DISTINCT * FROM nilai_akhir_raportkd_ki3 GROUP BY id_kd
SELECT * FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL04' AND id_siswa = 'SIS0000001' GROUP BY id_kd IS NOT NULL

SELECT id_raportkd, Z.id_siswa, X.id_mapel, X.nama_mapel, Y.id_kd, Y.nomor_kd, Y.deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas, nilai
FROM nilai_raportkd_ki3 B
LEFT JOIN mapel X ON X.id_mapel = B.id_mapel
INNER JOIN kd_pengetahuan Y ON Y.id_mapel = X.id_mapel 
INNER JOIN data_siswa Z GROUP BY Y.id_kd IS NULL

SELECT * FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL04' GROUP BY id_kd

SELECT DISTINCT * FROM nilai_akhir_raportkd_ki3 ORDER BY id_raportkd
SELECT * FROM nilai_raportkd_ki3 WHERE id_mapel = 'MPL04' AND id_siswa = 'SIS0000001'

SELECT DISTINCT * FROM nilai_raportkd_ki3 WHERE id_ X
INNER JOIN kd_pengetahuan Y ORDER BY X.id_kd

SELECT * FROM nilai_raportkd_ki3 WHERE id_mapel 
SELECT * FROM nilai_akhir_raportkd_ki3
SELECT * FROM nilai_raport_sosial
SELECT * FROM nilai_raport_spiritual

//perhitungan sesuai rumus
SELECT id_raportkd, id_siswa, Y.id_mapel, id_kd, nomor_kd AS NO, deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas,
@tugas:= tugas1+tugas2+tugas3+tugas4+tugas5 AS _tugas_, @ph:= ph1+ph2+ph3+ph4 AS _ph_,
@kkm := ROUND((((@tugas + @ph)*2) + pts + pas)/5) AS tugas_ph_pts_pas,
ROUND((@kkm - pengetahuan)/ 3) AS ambil_nilai
FROM nilai_raportkd_ki3 X 
INNER JOIN mapel Y
WHERE Y.id_mapel = 'MPL05' AND id_siswa = 'SIS0000001' GROUP BY id_mapel
//CLOSE rumus

SELECT * FROM nilai_raportkd_ki3

SELECT DISTINCT id_raportkd, id_siswa, X.id_mapel, id_kd, nomor_kd, deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, 
ph1, ph2, ph3, ph4, pts, pas,
ROUND(((((((tugas1+tugas2+tugas3+tugas4+tugas5) + (ph1+ph2+ph3+ph4))*2) + pts + pas)/5) - pengetahuan)/3) AS nilai_kd
FROM nilai_raportkd_ki3 X
INNER JOIN mapel Y ON Y.id_mapel = X.id_mapel WHERE X.id_mapel = 'MPL04' AND id_siswa = 'SIS0000002'
ORDER BY id_kd

ORDER BY X.id_mapel
SELECT * FROM hitung_kd WHERE id_mapel = 'MPL04' AND id_siswa = 'SIS0000003'



SELECT id_kd, pengetahuan, tugas1 FROM mapel X 
INNER JOIN nilai_raportkd_ki3 Y
WHERE X.id_mapel = 'MPL03' AND id_siswa = 'SIS0000001'

SELECT DISTINCT 
ROUND(((((((tugas1+tugas2+tugas3+tugas4+tugas5) + (ph1+ph2+ph3+ph4))*2) + pts + pas)/5) - pengetahuan)/3) AS nilai_kd
FROM nilai_raportkd_ki3 X
INNER JOIN mapel Y ON Y.id_mapel = X.id_mapel WHERE X.id_mapel = 'MPL04' AND id_siswa = 'SIS0000001'

SELECT pengetahuan, keterampilan FROM mapel
SELECT * FROM nilai_pengetahuan
SELECT * FROM kd_pengetahuan
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM nilai_raportkd_ki4
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_raport_spiritual
SELECT * FROM agama
SELECT * FROM kd_agama
SELECT * FROM kd_pengetahuan
SELECT * FROM mapel



SELECT * FROM agama INNER JOIN mapel WHERE id_agama = 'agm05' GROUP BY id_agama

SELECT DISTINCT * FROM kd_agama X
INNER JOIN agama Y GROUP BY X.id_agama

SELECT * FROM nilai_akhir_raportkd_ki4 WHERE id_siswa = 'SIS0000001'

SELECT * FROM kd_agama
SELECT * FROM data_siswa
SELECT nama_mapel FROM mapel WHERE id_mapel = 'MPL01'

//VIEW untuk tampil DATA agama juga
SELECT id_raportkd, Z.id_siswa, X.id_mapel, X.nama_mapel, Z.id_agama, Y.id_kd, Y.nomor_kd, Y.deskripsi,
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas
FROM nilai_agamakd_ki4 B
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki4 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN data_siswa Z WHERE Z.id_siswa = 'SIS0000001' AND Z.id_agama = 'agm03' GROUP BY Z.id_agama
//CLOSE VIEW

SELECT * FROM data_siswa

SELECT * FROM kd_agama_ki4
SELECT * FROM agama
SELECT id_nilairaport, Z.id_siswa, Y.id_mapel, Y.nama_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki4 X
RIGHT JOIN mapel Y ON y.id_mapel = X.id_mapel
INNER JOIN data_siswa Z

SELECT * FROM nilai_agamakd_ki3
SELECT * FROM kd_agama_ki3
SELECT * FROM nilai_akhir_raportkd_ki3
SELECT * FROM nilai_raport_ki3

INSERT INTO virus(virus,sejarah)VALUES
('Kolera','Penyakit ini diketahui disebabkan oleh bakteri Vibrio'),
('FLU Spanyol','Virus ini diketahui muncul usai perang dunia I yaitu sekitar th 1918'),
('Cacar','Penyakit ini berasal dari virus Variola'),
('Variola','Virus ini adalah penyebab cacar yg diketahui dapat disebarkan melalui udara'),
('HIV','Virus ini dapat menimbulkan penyakit AIDS'),
('Ebola','Virus ganas ini menyebar melalui darah, cairan tubuh / jaringan tubuh manusia dan hewanyg terinfeksi'),
('CORONA','Kabarnya temuan para ilmuwan menunjukan kombinasi remdesivir dan chloroquine ketika diuji coba ke virus corona baru (2019-nCov) di laboraturiom sangat efektif untuk memerangi virus corona baru');

SELECT * FROM nilai_raport_ki3

SELECT * FROM data_siswa

SELECT * FROM virus
SELECT * FROM hitung_kd


SELECT DISTINCT id_raportkd, id_siswa, X.id_mapel, id_kd, nomor_kd, deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, 
ph1, ph2, ph3, ph4, pts, pas,
ROUND(((((((tugas1+tugas2+tugas3+tugas4+tugas5) + (ph1+ph2+ph3+ph4))*2) + pts + pas)/5) - pengetahuan)/3) AS nilai_kd
FROM nilai_raportkd_ki4 X
INNER JOIN mapel Y ON Y.id_mapel = X.id_mapel




//fix upload VIEW TABLE
SELECT id_raportkd, Z.id_siswa, X.id_mapel, X.nama_mapel, C.id_agama, Y.id_kd, Y.nomor_kd, Y.deskripsi,
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas
FROM nilai_agamakd_ki3 B
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel
INNER JOIN agama C ON C.id_agama = Y.id_agama
INNER JOIN data_siswa Z WHERE Z.id_siswa = 'SIS0000001' AND Y.id_agama = 'agm03' AND Y.id_mapel = 'MPL01' GROUP BY Y.id_kd
//CLOSE VIEW

SELECT * FROM kd_agama_ki3
SELECT * FROM nilai_agamakd_ki4
SELECT * FROM nilai_raportkd_ki3
nilai_
SELECT * FROM nilai_akhir_agamakd_ki4 WHERE id_siswa = 'SIS000001' AND id_agama = 'agm03' GROUP BY id_agama
SELECT * FROM nilai_akhir_agamakd_ki4
SELECT * FROM nilai_akhir_raport_ki3

SELECT DISTINCT id_raportkd, id_siswa, X.id_mapel, id_kd, nomor_kd, deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, 
ph1, ph2, ph3, ph4, pts, pas,
ROUND(((((((tugas1+tugas2+tugas3+tugas4+tugas5) + (ph1+ph2+ph3+ph4))*2) + pts + pas)/5) - pengetahuan)/3) AS nilai_kd
FROM nilai_agamakd_ki3 X
INNER JOIN mapel Y ON Y.id_mapel = X.id_mapel
SELECT * FROM data_siswa
SELECT DISTINCT * FROM data_siswa X INNER JOIN agama Y WHERE X.id_siswa = 'SIS0000002' GROUP BY X.id_siswa

SELECT * FROM nilai_akhir_raport_ki3
SELECT * FROM nilai_raport_ki4
SELECT * FROM nilai_agamakd_ki3
SELECT * FROM nilai_raport_ki3

SELECT * FROM hitung_kdagm_ki3
SELECT id_kd, nomor_kd, MAX(nilai_kd) FROM hitung_kdagm_ki3 WHERE id_siswa = 'SIS0000002' AND id_mapel = 'MPL01'

SELECT * FROM data_level_siswa
SELECT * FROM data_sekolah

SELECT * FROM nilai_raport_spiritual
SELECT * FROM sikap_spiritual

//untuk id_mapel MPL01 tidak digunakan lagi
SELECT * FROM hitung_kd WHERE id_mapel ='MPL04' AND id_siswa ='SIS0000001'
SELECT * FROM hitung_kdki4 WHERE id_mapel = 'MPL04' AND id_siswa = 'SIS0000001'
SELECT * FROM hitung_kdagm_ki3 WHERE id_mapel = 'MPL01' AND id_siswa = 'SIS0000001'
SELECT * FROM hitung_kdagm_ki4 WHERE id_mapel = 'MPL01' AND id_siswa = 'SIS0000001'

SELECT * FROM hitung_kd
SELECT id_mapel FROM mapel WHERE id_mapel = 'MPL01'
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_pengetahuan
SELECT * FROM nilai_raport_ki3
INSERT INTO nilai_raport_ki3(id_mapel) VALUE(CONCAT('winda', 'ayu')) WHERE id_siswa = 'windaayu';

SELECT MAX(nilai_kd) FROM hitung_kd WHERE id_siswa = 'SIS0000001'
SELECT * FROM hitung_kdki4
SELECT * FROM nilai_raportkd_ki4
//pengetahuan
SELECT Y.id_mapel, Y.pengetahuan FROM hitung_kd X
INNER JOIN mapel Y WHERE Y.id_mapel ='MPL04' AND id_siswa = 'SIS0000001'
//keterampilan
SELECT Y.id_mapel, Y.pengetahuan FROM hitung_kdki4 X
INNER JOIN mapel Y WHERE Y.id_mapel ='MPL02' AND id_siswa = 'SIS0000001'

SELECT Y.id_mapel, Y.pengetahuan FROM hitung_kdagm_ki3 X
INNER JOIN mapel Y WHERE Y.id_mapel ='MPL02' AND id_siswa = 'SIS0000001'

SELECT Y.id_mapel, Y.pengetahuan FROM hitung_kdagm_ki4 X
INNER JOIN mapel Y WHERE Y.id_mapel ='MPL02' AND id_siswa = 'SIS0000001'

SELECT * FROM nilai_akhir_raport_ki3 WHERE NULL id_siswa = 'SIS0000001'

SELECT DISTINCT id_nilairaport, Y.id_siswa, id_mapel, nama_mapel, nilai, predikat, deskripsi 
FROM nilai_akhir_raport_ki3 X
LEFT JOIN data_siswa Y WHERE Y.id_siswa = 'SIS0000002' ORDER BY Y.id_siswa AND id_nilairaport
ORDER BY id_mapel AND id_siswa WHERE id_siswa = 'SIS0000002' ORDER BY id_mapel AND id_mapel

SELECT MAX(nilai_kd) AS nilai FROM hitung_kd WHERE id_mapel = 'MPL04' AND id_siswa ='SIS0000001'

SELECT * FROM hitung_kd
SELECT * FROM data_level_siswa

SELECT id_raportkd, Z.id_siswa, X.id_mapel, X.nama_mapel, Y.id_kd, Y.nomor_kd, Y.deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas
FROM nilai_raportkd_ki3 B
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_pengetahuan Y ON Y.id_mapel = X.id_mapel 
INNER JOIN data_siswa Z

SELECT id_nilairaport, Z.id_siswa, Y.id_mapel, Y.nama_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki3 X
RIGHT JOIN mapel Y ON y.id_mapel = X.id_mapel
OUTER JOIN data_siswa Z ON Z.id_siswa = Z.id_siswa WHERE Z.id_siswa = 'SIS0000002' ORDER BY id_nilairaport

IS NOT NULL AND Y.id_mapel IS NOT NULL

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001' GROUP BY id_nilairaport

SELECT * FROM nilai_raport_ki3 
INNER JOIN nilai
WHERE id_siswa = 'SIS0000002'


SELECT id_nilairaport, X.id_siswa, Z.id_mapel, Z.nama_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki3 X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa
LEFT JOIN mapel Z ON Z.id_mapel = Z.id_mapel WHERE Y.id_siswa = 'SIS0000001' ORDER BY Z.id_mapel

SELECT id_nilairaport, Z.id_siswa, X.id_mapel, X.nama_mapel, nilai, predikat, deskripsi
FROM mapel X 
LEFT JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel
CROSS JOIN data_siswa Z WHERE Z.id_siswa = 'SIS0000003' ORDER BY Y.id_siswa
AND Y.id_mapel

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001' ORDER BY id_mapel

SELECT * FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000001' ORDER BY id_mapel

SELECT Y.id_mapel AS id_mapel, Y.pengetahuan AS pengetahuan, Y.id_mapel AS id_mapel 
FROM hitung_kd X INNER JOIN mapel Y WHERE Y.id_mapel ='MPL01' AND id_siswa = 'SIS0000001' GROUP BY id_mapel

SELECT Y.pengetahuan AS pengetahuan, Y.id_mapel AS id_mapel FROM hitung_kdki4 X 
INNER JOIN mapel Y WHERE Y.id_mapel ='MPL02' AND id_siswa = 'SIS0000001' GROUP BY id_mapel

SELECT * FROM nilai_raport_ki3
SELECT * FROM hitung_kdagm_ki3
SELECT * FROM data_siswa
SELECT * FROM nilai_raport_spiritual
SELECT * FROM nilai_akhir_raportkd_ki3
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM ekstrakurikuler
SELECT * FROM per_ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM data_level_siswa
SELECT * FROM kelas
SELECT * FROM data_level_semester
SELECT * FROM siswa_kelas_semester 
INNER JOIN data_siswa ORDER BY id_siswa

SELECT * FROM simple_siswa_kelas_semester
SELECT * FROM semester
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM mapel

SELECT nisn, nis, nama_siswa, jk, nama_mapel, nilai, predikat, deskripsi 
FROM data_siswa X
RIGHT JOIN nilai_raport_ki3 Y ON Y.id_siswa = X.id_siswa WHERE id_mapel = 'MPL04' ORDER BY id_mapel

SELECT * FROM nilai_raportkd_ki3 WHERE id_mapel 

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001' GROUP BY id_mapel ASC

SELECT * FROM nilai_raportkd_ki3 WHERE id_siswa = 'SIS0000001' AND id_mapel = 'MPL04' AND id_kd = 'KD010' 

SELECT * FROM nilai_raport_ki3 WHERE id_mapel = 'MPL02' AND id_siswa = 'SIS0000002'

SELECT * FROM nilai_akhir_raport_ki3
SELECT * FROM mapel
SELECT * FROM nilai_raport_ki3
SELECT * FROM hitung_kd
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM kd_pengetahuan
SELECT * FROM kd_keterampilan
SELECT * FROM kd_agama_ki3
SELECT * FROM kd_agama_ki4
SELECT * FROM nilai_agamakd_ki4
SELECT * FROM nilai_agamakd_ki3
SELECT * FROM hitung_kd WHERE id_mapel = 'MPL03' AND id_siswa = 'SIS0000001'
SELECT * FROM hitung_kdki4
SELECT * FROM hitung_kdagm_ki3
SELECT * FROM hitung_kdagm_ki4

SELECT * FROM data_siswa

//nilai_raport
SELECT Y.id_mapel, Y.nilai, Y.predikat, Y.deskripsi, Z.nilai, Z.predikat, Z.deskripsi 
FROM mapel X 
INNER JOIN data_siswa A
INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel
INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel
WHERE A.id_siswa = 'SIS0000001' GROUP BY id_mapel
//nilai_raport

SELECT * FROM jenis_kelamin
SELECT * FROM data_siswa
SELECT * FROM POSITION
SELECT * FROM USER
SELECT * FROM master_level
SELECT * FROM kelas
SELECT * FROM USER

SELECT X.id_user, username, email, PASSWORD, confirm_password , X.id_position, name_position ,X.id_kelas, kelas FROM master_level X
INNER JOIN USER Y ON Y.id_user = X.id_user 
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas
INNER JOIN POSITION A ON A.id_position = X.id_position
ORDER BY X.id_master

SELECT * FROM kelas

SELECT DISTINCT id_user, username, X.id_position AS id_pos, name_position, email 
FROM USER X 
INNER JOIN POSITION Y ON Y.id_position = X.id_position

SELECT DISTINCT id_user, username, X.id_position AS id_pos, name_position, email 
FROM USER X 
INNER JOIN POSITION Y ON Y.id_position = X.id_position

INSERT INTO master_level(id_master, id_user, id_position, id_kelas) 
	VALUES('MST0000008','USR0012','PS03','KLS04')
	
SELECT id_position FROM master_level GROUP BY id_position
SELECT * FROM USER

SELECT * FROM USER WHERE id_position = 'PS03'

SELECT * FROM master_level
SELECT * FROM data_siswa
SELECT * FROM kelas

SELECT DISTINCT id_user, username, nama_depan, nama_belakang, nip, niy, nuptk, X.id_position AS id_pos, name_position, email 
FROM USER X 
INNER JOIN POSITION Y ON Y.id_position = X.id_position

SELECT * FROM USER


SELECT * FROM data_siswa

SELECT X.id_position, name_position ,X.id_kelas, kelas 
FROM master_level X 
INNER JOIN USER Y ON Y.id_user = X.id_user 
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas 
INNER JOIN POSITION A ON A.id_position = X.id_position

SELECT * FROM per_ekstrakurikuler WHERE id_siswa = 'SIS0000002'

SELECT * FROM per_kesehatan
SELECT * FROM per_prestasi

SELECT * FROM data_level_siswa

SELECT * FROM data_siswa WHERE nama_siswa ='siswa 21'
SELECT * FROM data_siswa_keluar
SELECT * FROM data_level_siswa WHERE id_kelas = 'KLS01'
SELECT * FROM data_level_semester

SELECT * FROM data_level_siswa X
INNER JOIN data_level_semester Y WHERE id_siswa = 'SIS0000003' GROUP BY id_siswa
ORDER BY X.id_level_siswa

SELECT * FROM data_level_siswa WHERE id_siswa = 'SIS0000003'
SELECT * FROM siswa_kelas_semester

SELECT * FROM nilai_raport_ki4

SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester

SELECT * FROM data_siswa
SELECT * FROM kd_pengetahuan
SELECT * FROM kd_keterampilan
SELECT * FROM data_level_semester
SELECT * FROM siswa_kelas_semester

SELECT X.id_siswa, nisn, nis, nama_siswa, jk, tempat_lahir, tanggal_lahir, 
id_agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu,
jalan, desa_kelurahan, kecamatan, kabupaten_kota, provinsi, no_telp_hp, nama_wali, pekerjaan_wali, alamat_wali, no_telp_hp_wali,
X.id_kelas, kelas
FROM data_level_siswa X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa 
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas 
WHERE kelas = 'kelas I' ORDER BY Y.id_siswa

SELECT id_level_siswa, X.id_siswa, X.id_kelas, nisn, nis, nama_siswa, jk, id_level_siswa, kelas
FROM data_level_siswa X
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa 
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas
WHERE kelas = 'Kelas I' ORDER BY id_siswa

SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester

SELECT * FROM siswa_kelas

SELECT Y.id_siswa AS id_siswa, Y.id_mapel AS id_mapel, Y.nilai AS nilaiki3, Y.predikat AS predikatki3, Y.deskripsi AS deskripsiki3, Z.nilai AS nilaiki4, 
Z.predikat AS predikatki4, Z.deskripsi AS deskripsiki4 
FROM mapel X 
INNER JOIN data_siswa A 
INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel 
WHERE Y.id_siswa = 'SIS0000003' AND Z.id_siswa = 'SIS0000003' GROUP BY id_mapel

SELECT * FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000001'

SELECT A.id_siswa AS id_siswa, Y.id_mapel AS id_mapel, Y.nama_mapel, Y.nilai AS nilaiki3, Y.predikat AS predikatki3, Y.deskripsi AS deskripsiki3, 
Z.nilai AS nilaiki4, Z.predikat AS predikatki4, Z.deskripsi AS deskripsiki4 FROM mapel X 
INNER JOIN data_siswa A INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel 
WHERE Y.id_siswa = 'SIS0000002' AND Z.id_siswa = 'SIS0000002' GROUP BY id_mapel

SELECT * FROM kd_pengetahuan
SELECT * FROM kd_agama_ki3
SELECT * FROM nilai_agamakd_ki3
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM nilai_raport_ki3
SELECT * FROM kd_agama_ki3 WHERE id_agama = 'agm03' AND id_kelas = 'KLS01' AND id_semester = 'SMT01'
SELECT * FROM kelas
SELECT * FROM data_level_siswa
SELECT * FROM kelas
SELECT * FROM semester
SELECT * FROM hitung_kd
SELECT * FROM nilai_akhir_raport_ki3
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001' GROUP BY id_mapel ASC

SELECT * FROM hitung_kd WHERE id_mapel = 'MPL02' AND id_siswa = 'SIS0000001'
SELECT * FROM kd_pengetahuan X
INNER JOIN kelas Y 
INNER JOIN semester Z
WHERE id_mapel = 'MPL02' AND X.id_kelas = 'KLS01' AND Y.id_kelas = 'KLS01' AND X.id_semester = 'SM02' AND Z.id_semester = 'SM02' GROUP BY X.id_kd

SELECT * FROM nilai_akhir_raportkd_ki3 WHERE id_mapel = 'MPL02' AND id_siswa = 'SIS0000002' AND id_kelas = 'KLS03' GROUP BY id_kd

SELECT * FROM siswa_kelas_semester WHERE kelas = 'Kelas I' AND semester = 'Semester 1'

1. tabel yang ditambah id_kelas dan id_semester
- SELECT * FROM kd_pengetahuan = inputpengetahuan/input ki3_mapel
- SELECT * FROM kd_agama_ki3 = inputpengetahuan/input ki3_PABP
- SELECT * FROM nilai_raportkd_ki3 AND VIEW SELECT * FROM nilai_akhir_raport_ki3
	= Penilaian / nilai / 'Kelas I' /' Semester 1' / 'Siswa 1'
- SELECT * FROM 

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_kelas = 'KLS01'
SELECT * FROM nilai_raport_ki3

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM02' GROUP BY id_mapel ASC

SELECT * FROM hitung_kd 
WHERE id_mapel = 'MPL02' 
AND id_siswa = 'SIS0000001' 
AND id_kelas = 'KLS01' 
AND id_semester = 'SM02' ORDER BY id_mapel ASC

SELECT Y.pengetahuan AS pengetahuan, Y.id_mapel AS id_mapel, id_kelas, id_semester
FROM hitung_kd X
INNER JOIN mapel Y 
WHERE Y.id_mapel ='MPL02' 
AND id_siswa = 'SIS0000001' 
AND id_kelas = 'KLS01' 
AND id_semester = 'SM02'

SELECT * FROM nilai_agamakd_ki3
SELECT * FROM hitung_kdagm_ki3

SELECT * FROM nilai_agamakd_ki3
SELECT * FROM kd_agama_ki3

SELECT id_raportkd, Z.id_siswa AS id_siswa , X.id_mapel AS id_mapel, B.id_kelas AS id_kelas, B.id_semester AS id_semester, 
X.nama_mapel AS nama_mapel, C.id_agama AS id_agama, Y.id_kd AS id_kd, 
Y.nomor_kd AS nomor_kd, Y.deskripsi AS deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas 
FROM nilai_agamakd_ki3 B 
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN agama C ON C.id_agama = Y.id_agama 
INNER JOIN data_siswa Z 
WHERE Z.id_siswa = 'SIS0000003' 
AND Y.id_agama = 'agm03' 
AND Y.id_mapel = 'MPL01' 
AND B.id_kelas = 'KLS01' 
AND B.id_semester = 'SM01'
AND Y.id_kelas = 'KLS01' 
AND Y.id_semester = 'SM01'
GROUP BY Y.id_kd

SELECT Y.pengetahuan AS pengetahuan, Y.id_mapel AS id_mapel, id_kelas, id_semester 
FROM hitung_kd X INNER JOIN mapel Y 
WHERE Y.id_mapel ='MPL01' 
AND id_siswa = 'SIS0000001' 
AND id_kelas = 'KLS01' 
AND id_semester = 'SM01'

SELECT Y.pengetahuan AS pengetahuan, Y.id_mapel AS id_mapel , id_kelas , id_semester 
FROM hitung_kdagm_ki3 X INNER JOIN mapel Y 
WHERE Y.id_mapel ='MPL01' 
AND id_siswa = 'SIS0000001' 
AND id_kelas = 'KLS01' 
AND id_semester = 'SM01'

SELECT * FROM hitung_kdagm_ki3

SELECT id_raportkd, Z.id_siswa AS id_siswa , Y.id_mapel AS id_mapel, Y.id_kelas AS id_kelas, Y.id_semester AS id_semester,
X.nama_mapel AS nama_mapel, C.id_agama AS id_agama, Y.id_kd AS id_kd, Y.nomor_kd AS nomor_kd, Y.deskripsi AS deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas 
FROM nilai_agamakd_ki3 B 
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel 
RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN agama C ON C.id_agama = Y.id_agama 
INNER JOIN data_siswa Z 
WHERE Z.id_siswa = 'SIS0000001' 
AND Y.id_agama = 'agm01' 
AND Y.id_mapel = 'MPL01' 
AND Y.id_kelas = 'KLS01'
AND Y.id_semester = 'SM02'
GROUP BY Y.id_kd

SELECT * FROM nilai_agamakd_ki3
SELECT * FROM kd_agama_ki3

SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM siswa_kelas_semester WHERE kelas = 'Kelas I' AND semester = 'Semester 2'

SELECT * FROM siswa_kelas_semester
SELECT * FROM nilai_raport_ki3

SELECT Y.id_siswa, id_kelas, id_semester, nisn, nis, nama_siswa, jk, nama_mapel, nilai, predikat, deskripsi 
FROM data_siswa X 
RIGHT JOIN nilai_raport_ki3 Y ON Y.id_siswa = X.id_siswa 
WHERE X.id_siswa = 'SIS0000003' 
ORDER BY id_mapel

SELECT * FROM kd_pengetahuan

SELECT * FROM kd_keterampilan
SELECT * FROM nilai_akhir_raport_ki4
SELECT * FROM nilai_akhir_raportkd_ki4
SELECT * FROM nilai_raportkd_ki4
SELECT * FROM nilai_raport_ki4
SELECT * FROM hitung_kdki4

SELECT Y.keterampilan AS keterampilan, Y.id_mapel AS id_mapel, id_kelas , id_semester
FROM hitung_kdki4 X 
INNER JOIN mapel Y 
WHERE Y.id_mapel ='MPL02' 
AND id_siswa = 'SIS0000001'

SELECT * FROM kd_pengetahuan X 
INNER JOIN kelas Y 
INNER JOIN semester Z 
WHERE X.id_kelas = 'KLS01' AND Y.id_kelas = 'KLS01' 
AND X.id_semester = 'SM01' AND Z.id_semester = 'SM01' 
ORDER BY X.id_kd

SELECT * FROM kd_pengetahuan

SELECT * FROM kd_keterampilan X
INNER JOIN kelas Y
INNER JOIN semester Z
WHERE X.id_kelas = 'KLS01' AND Y.id_kelas = 'KLS01'
AND X.id_semester = 'SM01' AND Z.id_semester = 'SM01'
ORDER BY X.id_kd

SELECT * FROM kd_keterampilan

SELECT * FROM nilai_raport_ki3
SELECT * FROM kd_agama_ki3
SELECT * FROM hitung_kd
SELECT * FROM hitung_kdagm_ki3
SELECT * FROM nilai_agamakd_ki3
SELECT * FROM nilai_raport_ki4
SELECT * FROM kd_agama_ki4
SELECT * FROM hitung_kdki4
SELECT * FROM hitung_kdagm_ki4
SELECT * FROM nilai_agamakd_ki4

SELECT id_raportkd, Z.id_siswa AS id_siswa , X.id_mapel AS id_mapel, Y.id_kelas AS id_kelas, Y.id_semester AS id_semester,
X.nama_mapel AS nama_mapel, 
C.id_agama AS id_agama, Y.id_kd AS id_kd, Y.nomor_kd AS nomor_kd, 
Y.deskripsi AS deskripsi, tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas 
FROM nilai_agamakd_ki4 B RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki4 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN agama C ON C.id_agama = Y.id_agama 
INNER JOIN data_siswa Z WHERE Z.id_siswa = 'SIS0000001' 
AND Y.id_agama = 'agm01' 
AND Y.id_mapel = 'MPL01' 
AND Y.id_kelas = 'KLS01'
AND Y.id_semester = 'SM02'
GROUP BY Y.id_kd

SELECT Y.pengetahuan AS pengetahuan, Y.id_mapel AS id_mapel , id_kelas , id_semester 
FROM hitung_kdagm_ki3 X 
INNER JOIN mapel Y 
WHERE Y.id_mapel ='MPL01' 
AND id_siswa = 'SIS0000002' 
AND id_kelas = 'KLS01' 
AND id_semester = 'SM01'

SELECT Y.keterampilan AS keterampilan, Y.id_mapel AS id_mapel, id_kelas, id_semester
FROM hitung_kdagm_ki4 X 
INNER JOIN mapel Y 
WHERE Y.id_mapel = 'MPL01' 
AND id_siswa = 'SIS0000001'
AND id_kelas = 'KLS01'
AND id_semester = 'SM01'

SELECT * FROM sikap_spiritual
SELECT * FROM nilai_raport_spiritual

SELECT * FROM sikap_sosial
SELECT * FROM nilai_raport_sosial

SELECT * FROM kd_pengetahuan
SELECT * FROM nilai_raportkd_ki3
SELECT * FROM nilai_raport_ki3 
SELECT * FROM kd_agama_ki3

SELECT * FROM kd_keterampilan
SELECT * FROM nilai_raportkd_ki4
SELECT * FROM nilai_raport_ki4
SELECT * FROM kd_agama_ki4

SELECT id_siswa, nisn, nis, nama_siswa, jk, tempat_lahir, tanggal_lahir, agama, pend_sebelumnya, alamat_serta_didik, 
nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu, jalan, desa_kelurahan, kecamatan, kabupaten_kota, provinsi, no_telp_hp,
nama_wali, pekerjaan_wali, no_telp_hp_wali, X.id_agama
FROM data_siswa X
INNER JOIN agama Y ON Y.id_agama = X.id_agama GROUP BY id_siswa

SELECT * FROM view_data_siswa

SELECT * FROM siswa_kelas_semester X
INNER JOIN agama Y ON Y.id_agama = X.id_agama
GROUP BY X.id_siswa

SELECT * FROM data_siswa

SELECT * FROM data_level_siswa

SELECT * FROM master_level

SELECT * FROM ekstrakurikuler
SELECT * FROM per_ekstrakurikuler
SELECT * FROM kesehatan
SELECT * FROM per_kesehatan
SELECT * FROM prestasi
SELECT * FROM per_prestasi

SELECT * FROM tinggi_berat_badan
SELECT * FROM ketidakhadiran

SELECT * FROM hitung_kdagm_ki3

SELECT id_raportkd, Z.id_siswa AS id_siswa , nama_siswa, X.id_mapel AS id_mapel, X.nama_mapel AS nama_mapel, C.id_agama AS id_agama,
Y.id_kd AS id_kd, Y.nomor_kd AS nomor_kd, Y.deskripsi AS deskripsi,
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas 
FROM nilai_agamakd_ki3 B 
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN agama C ON C.id_agama = Y.id_agama 
INNER JOIN data_siswa Z 
WHERE Z.id_siswa = 'SIS0000001' 
AND Y.id_agama = 'agm03' 
GROUP BY Z.id_agama

SELECT id_raportkd, Z.id_siswa AS id_siswa , nama_siswa,X.id_mapel AS id_mapel, X.nama_mapel AS nama_mapel, C.id_agama AS id_agama, 
Y.id_kd AS id_kd, Y.nomor_kd AS nomor_kd, Y.deskripsi AS deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas 
FROM nilai_agamakd_ki4 B 
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki4 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN agama C ON C.id_agama = Y.id_agama 
INNER JOIN data_siswa Z 
WHERE Z.id_siswa = 'SIS0000001' 
AND Y.id_agama = 'agm03' 
GROUP BY Z.id_agama

SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_akhir_raport_ki3

SELECT * FROM nilai_ki3
SELECT * FROM saran
SELECT * FROM catatan
SELECT * FROM nilai_raport_ki3

SELECT * FROM POSITION
SELECT * FROM master_level GROUP BY id_position
SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM siswa_kelas ORDER BY id_siswa
SELECT * FROM data_siswa_keluar

SELECT * FROM USER
SELECT * FROM USER WHERE id_position = 'PS03'
SELECT * FROM siswa_kelas

SELECT * FROM siswa_kelas_semester
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_agamakd_ki3
SELECT * FROM nilai_raportkd_ki3

SELECT * FROM nilai_raport_ki4
SELECT * FROM nilai_agamakd_ki4
SELECT * FROM nilai_raportkd_ki4

SELECT * FROM simple_siswa_kelas_semester

SELECT * FROM nilai_raport_spiritual
SELECT * FROM nilai_raport_sosial

SELECT * FROM per_ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM per_prestasi

SELECT * FROM tinggi_berat_badan
SELECT * FROM ketidakhadiran

SELECT * FROM saran
SELECT * FROM catatan

SELECT * FROM data_siswa

SELECT DISTINCT `x`.`id_raportkd` AS `id_raportkd`,
`x`.`id_siswa` AS `id_siswa`,
`x`.`id_mapel` AS `id_mapel`,
`x`.`id_kelas` AS `id_kelas`,
`x`.`id_semester` AS `id_semester`,
`x`.`id_kd` AS `id_kd`,
`x`.`nomor_kd` AS `nomor_kd`,
`x`.`deskripsi` AS `deskripsi`,
`x`.`tugas1` AS `tugas1`,
`x`.`tugas2` AS `tugas2`,
`x`.`tugas3` AS `tugas3`,
`x`.`tugas4` AS `tugas4`,
`x`.`tugas5` AS `tugas5`,
`x`.`ph1` AS `ph1`,
`x`.`ph2` AS `ph2`,
`x`.`ph3` AS `ph3`,
`x`.`ph4` AS `ph4`,
`x`.`pts` AS `pts`,
`x`.`pas` AS `pas`,
ROUND((((((((((((`x`.`tugas1` + `x`.`tugas2`) + `x`.`tugas3`) + `x`.`tugas4`) 
+ `x`.`tugas5`) + (((`x`.`ph1` + `x`.`ph2`) + `x`.`ph3`) + `x`.`ph4`)) * 2) 
+ `x`.`pts`) + `x`.`pas`) / 5) - `y`.`pengetahuan`) / 3),0) AS `nilai_kd` 
FROM (`nilai_raportkd_ki3` `x` JOIN `mapel` `y` ON((`y`.`id_mapel` = `x`.`id_mapel`)));

SELECT * FROM hitung_kd

SELECT * FROM USER;

SELECT * FROM nilai_pengetahuan
SELECT * FROM nilai_keterampilan
SELECT * FROM POSITION

SELECT * FROM nilai_raport_ki3 WHERE id_mapel = 'MPL01'

SELECT * FROM nilai_akhir_raportkd_ki3 ORDER BY id_siswa`nilai_akhir_raportkd_ki3`

FROM ((`kd_pengetahuan` `y`
    LEFT JOIN (`mapel` `x`
               LEFT JOIN `nilai_raportkd_ki3` `b`
                 ON ((`x`.`id_mapel` = `b`.`id_mapel`)))
      ON ((`y`.`id_mapel` = `x`.`id_mapel`)))
   JOIN `data_siswa` `z`))$$
`b`.`id_raportkd` AS `id_raportkd`,
  `z`.`id_siswa`    AS `id_siswa`,
  `x`.`id_mapel`    AS `id_mapel`,
  `y`.`id_kelas`    AS `id_kelas`,
  `y`.`id_semester` AS `id_semester`,
  `x`.`nama_mapel`  AS `nama_mapel`,
  `y`.`id_kd`       AS `id_kd`,
  `y`.`nomor_kd`    AS `nomor_kd`,
  `y`.`deskripsi`   AS `deskripsi`,
  `b`.`tugas1`      AS `tugas1`,
  `b`.`tugas2`      AS `tugas2`,
  `b`.`tugas3`      AS `tugas3`,
  `b`.`tugas4`      AS `tugas4`,
  `b`.`tugas5`      AS `tugas5`,
  `b`.`ph1`         AS `ph1`,
  `b`.`ph2`         AS `ph2`,
  `b`.`ph3`         AS `ph3`,
  `b`.`ph4`         AS `ph4`,
  `b`.`pts`         AS `pts`,
  `b`.`pas`         AS `pas`
  
SELECT id_raportkd, B.id_siswa, X.id_mapel, Z.id_kelas, Z.id_semester, Y.nama_mapel, Z.id_kd, Z.nomor_kd, Z.deskripsi
FROM kd_pengetahuan X
LEFT JOIN mapel Y ON Y.id_mapel = X.id_mapel
LEFT JOIN nilai_raportkd_ki3 Z ON Z.id_raportkd = X.id_kd
INNER JOIN data_siswa B

   
SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM kelas
SELECT * FROM data_level_semester
SELECT * FROM semester
SELECT * FROM mapel
SELECT * FROM kd_pengetahuan
SELECT * FROM kd_keterampilan
SELECT * FROM roles_mapel


/*insert into roles_mapel(id_roles_mpl, id_kelas, id_semester, id_mapel) 
value
('ROMPL0000000101','KLS06','SM02','MPL01'),
('ROMPL0000000102','KLS06','SM02','MPL02'),
('ROMPL0000000103','KLS06','SM02','MPL03'),
('ROMPL0000000104','KLS06','SM02','MPL04'),
('ROMPL0000000105','KLS06','SM02','MPL05'),
('ROMPL0000000106','KLS06','SM02','MPL06'),
('ROMPL0000000107','KLS06','SM02','MPL07'),
('ROMPL0000000108','KLS06','SM02','MPL08'),
('ROMPL0000000109','KLS06','SM02','MPL09');*/

SELECT id_roles_mpl, y.id_kelas, a.id_semester, b.id_mapel, nama_mapel, kelompok, singkat_mapel, pengetahuan, keterampilan, tema
FROM roles_mapel X
INNER JOIN kelas Y ON y.id_kelas = x.id_kelas
INNER JOIN semester a ON a.id_semester = x.id_semester 
INNER JOIN mapel b ON b.id_mapel = x.id_mapel
WHERE y.id_kelas = 'KLS02' AND a.id_semester = 'SM02'

SELECT * FROM tema_db
SELECT * FROM sub_tema
SELECT * FROM roles_tema
SELECT * FROM roles_mapel
SELECT * FROM kd_pengetahuan
SELECT * FROM kd_keterampilan
SELECT * FROM roles_kd_tema_ki3
SELECT * FROM roles_kd_tema_ki4

/*insert into roles_tema(id_roles_tema, id_tema, id_subtema, cek) value
('ROLT01','T01','TS01',''),
('ROLT02','T01','TS02',''),
('ROLT03','T01','TS03',''),
('ROLT04','T01','TS04',''),
('ROLT05','T02','TS01',''),
('ROLT06','T02','TS02',''),
('ROLT07','T02','TS03',''),
('ROLT08','T02','TS04',''),
('ROLT09','T03','TS01',''),
('ROLT10','T03','TS02',''),
('ROLT11','T03','TS03',''),
('ROLT12','T03','TS04',''),
('ROLT13','T04','TS01',''),
('ROLT14','T04','TS02',''),
('ROLT15','T04','TS03',''),
('ROLT16','T04','TS04','');*/

SELECT * FROM kd_pengetahuan

SELECT * FROM roles_mapel WHERE id_kelas = 'KLS06' AND id_semester = 'SM02'

SELECT * FROM roles_mapel ORDER BY id_roles_mpl ASC

SELECT x.id_mapel, nama_mapel, singkat_mapel, kelompok, pengetahuan, keterampilan, y.id_kelas, y.id_semester 
FROM mapel X 
INNER JOIN roles_mapel Y ON x.id_mapel = x.id_mapel 
WHERE y.id_kelas = 'KLS02' 
AND y.id_semester = 'SM01' 
GROUP BY y.id_mapel

SELECT x.id_mapel, x.nama_mapel, x.singkat_mapel, y.id_kelas, y.id_semester 
FROM mapel X 
INNER JOIN roles_mapel Y ON x.id_mapel = x.id_mapel 
WHERE y.id_kelas = 'KLS02' 
AND Y.id_semester = 'Sm01' 
GROUP BY X.id_mapel

//ini yang di display di CODE
SELECT y.id_mapel, nama_mapel, singkat_mapel, kelompok, pengetahuan, keterampilan, x.id_kelas, x.id_semester 
FROM roles_mapel X
INNER JOIN mapel Y ON y.id_mapel = x.id_mapel
WHERE id_kelas ='KLS02'
AND id_semester = 'SM01'
GROUP BY y.id_mapel
//tutup

SELECT x.id_mapel, x.nama_mapel, x.singkat_mapel, y.id_kelas, y.id_semester 
FROM mapel X 
INNER JOIN roles_mapel Y ON x.id_mapel = x.id_mapel 
WHERE y.id_kelas = 'KLS02' 
AND Y.id_semester = 'SM01' 
GROUP BY X.id_mapel

//ini yang di display di CODE KI-3 dan KI-4
SELECT y.id_mapel, nama_mapel, singkat_mapel, x.id_kelas, x.id_semester 
FROM roles_mapel X
INNER JOIN mapel Y ON y.id_mapel = x.id_mapel
WHERE id_kelas ='KLS02'
AND id_semester = 'SM01'
GROUP BY y.id_mapel
//tutup

SELECT x.id_mapel, x.nama_mapel, x.singkat_mapel, y.id_kelas, y.id_semester 
FROM mapel X 
INNER JOIN roles_mapel Y ON x.id_mapel = x.id_mapel 
WHERE y.id_kelas = '".$dtsq1['id_kelas']."' 
AND Y.id_semester = '".$dtsq2['id_semester']."' 
GROUP BY X.id_mapel

SELECT x.id_mapel, x.nama_mapel, x.singkat_mapel, y.id_kelas, y.id_semester 
FROM mapel X 
INNER JOIN roles_mapel Y ON x.id_mapel = x.id_mapel 
WHERE y.id_kelas = '".$dtsq1['id_kelas']."' 
AND Y.id_semester = '".$dtsq2['id_semester']."' 
GROUP BY X.id_mapel

SELECT * FROM nilai_raport_ki3

//QUERY NEW
SELECT * FROM ekstrakurikuler
SELECT id_muatan FROM tb_muatan_nilai WHERE id_muatan BETWEEN '1' AND '12' ORDER BY id_muatan

SELECT * FROM tb_muatan_nilai GROUP BY id_ekstra ASC

SELECT * FROM ekstrakurikuler X
INNER JOIN tb_muatan_nilai Y ON Y.id_ekstra = X.id_ekstra
WHERE X.id_ekstra = 'EKS001'


SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM siswa_kelas_semester WHERE kelas = 'Kelas II' AND semester = 'Semester 1'

SELECT * FROM nilai_raportkd_ki3
SELECT * FROM kd_pengetahuan WHERE id_mapel = 'MPL02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT * FROM nilai_raport_ki3

SELECT * FROM mapel

SELECT * FROM kd_pengetahuan WHERE id_mapel = 'MPL03' AND id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT * FROM kd_keterampilan WHERE id_mapel = 'MPL03' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

//VIEW kkm pengetahuan
SELECT y.id_mapel, singkat_mapel AS mapel, pengetahuan AS KKM, 
@rang := 100 - pengetahuan AS rang, 
@interv := IF(pengetahuan="","",ROUND(@rang/3)) AS interv,
@sbaik := IF(pengetahuan="","",pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(pengetahuan="","",pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(pengetahuan="","",pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan="","",pengetahuan) AS pbimbingan
FROM mapel X  
INNER JOIN kd_pengetahuan Y ON y.id_mapel = x.id_mapel
WHERE y.id_mapel = 'MPL02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

//VIEW kkm keterampilan
SELECT y.id_mapel, pengetahuan AS p, keterampilan AS k, 
@rang := 100 - keterampilan AS rang, 
@interv := IF(keterampilan="","",ROUND(@rang/3)) AS interv,
@sbaik := IF(keterampilan="","",pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(keterampilan="","",pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(keterampilan="","",pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan="","",pengetahuan) AS pbimbingan
FROM mapel X  
INNER JOIN kd_keterampilan Y ON y.id_mapel = x.id_mapel
WHERE y.id_mapel = 'MPL02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT @p:= pengetahuan, 
(SELECT @p)
FROM mapel;

SELECT * FROM mapel
SELECT * FROM kd_pengetahuan

SELECT y.id_mapel, pengetahuan ,deskripsi, 
@rang := 100 - pengetahuan AS rang, 
@interv := IF(pengetahuan="","",ROUND(@rang/3)) AS interv,
@sbaik := IF(pengetahuan="","",pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(pengetahuan="","",pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(pengetahuan="","",pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan="","",pengetahuan) AS pbimbingan
FROM mapel X  
INNER JOIN kd_pengetahuan Y ON y.id_mapel = x.id_mapel
WHERE y.id_mapel = 'MPL02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT * FROM nilai_raport_ki3

SELECT deskripsi FROM kd_pengetahuan WHERE MATCH(deskripsi) AGAINST('MPL02');
SELECT * FROM nilai_raportkd_ki3 WHERE MATCH(tugas1, tugas2) AGAINST('SIS0000001');

SELECT * FROM nilai_akhir_raportkd_ki3
SELECT * FROM nilai_raport_ki3

SELECT id_mapel ,pengetahuan , 
@rang := 100 - pengetahuan AS rang, 
@interv := IF(pengetahuan='','',ROUND(@rang/3)) AS interv,
@sbaik := IF(pengetahuan='','',pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(pengetahuan='','',pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(pengetahuan='','',pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan='','',pengetahuan) AS pbimbingan
FROM mapel WHERE id_mapel = 'MPL02'

SELECT * FROM nilai_raport_ki3

SELECT * FROM kd_pengetahuan WHERE id_mapel = 'MPL04' AND id_kelas = 'KLS01' AND id_semester ='SM01'

SELECT * FROM kd_keterampilan WHERE id_mapel = 'MPL04' AND id_kelas = 'KLS01' AND id_semester ='SM01'

SELECT id_raportkd, Z.id_siswa AS id_siswa, nama_siswa, X.id_mapel AS id_mapel, X.nama_mapel AS nama_mapel, 
C.id_agama AS id_agama, Y.id_kd AS id_kd, Y.nomor_kd AS nomor_kd, Y.deskripsi AS deskripsi, 
tugas1, tugas2, tugas3, tugas4, tugas5, ph1, ph2, ph3, ph4, pts, pas 
FROM nilai_agamakd_ki3 B 
RIGHT JOIN mapel X ON X.id_mapel = B.id_mapel
RIGHT JOIN kd_agama_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN agama C ON C.id_agama = Y.id_agama 
INNER JOIN data_siswa Z 
WHERE Z.id_siswa = 'SIS0000001' 
AND Y.id_agama = 'agm01' 
GROUP BY Z.id_agama

SELECT * FROM data_siswa X
INNER JOIN agama Y ON y.id_agama = x.id_agama

SELECT * FROM kd_agama_ki3 WHERE id_agama = 'agm01' AND id_kelas ='KLS0' AND id_semester = 'SM02'

SELECT * FROM data_siswa X
INNER JOIN kd_agama_ki3 Y ON y.id_agama = x.id_agama WHERE x.id_siswa ='SIS0000001' AND id_kelas = 'KLS02' AND id_semester = 'SM01'


//VIEW kd_agama_ki3
SELECT y.id_mapel, singkat_mapel AS mapel, agama, nomor_kd,pengetahuan AS KKM, 
@rang := 100 - pengetahuan AS rang, 
@interv := IF(pengetahuan="","",ROUND(@rang/3)) AS interv,
@sbaik := IF(pengetahuan="","",pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(pengetahuan="","",pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(pengetahuan="","",pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan="","",pengetahuan) AS pbimbingan
FROM mapel X  
INNER JOIN kd_agama_ki3 Y ON y.id_mapel = x.id_mapel INNER JOIN agama Z ON z.id_agama = y.id_agama
WHERE y.id_mapel = 'MPL01' AND y.id_agama = 'agm02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

//VIEW kd_agama_ki4
SELECT y.id_mapel, singkat_mapel AS mapel, agama, nomor_kd,pengetahuan AS KKM, 
@rang := 100 - pengetahuan AS rang, 
@interv := IF(pengetahuan="","",ROUND(@rang/3)) AS interv,
@sbaik := IF(pengetahuan="","",pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(pengetahuan="","",pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(pengetahuan="","",pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan="","",pengetahuan) AS pbimbingan
FROM mapel X  
INNER JOIN kd_agama_ki4 Y ON y.id_mapel = x.id_mapel INNER JOIN agama Z ON z.id_agama = y.id_agama
WHERE y.id_mapel = 'MPL01' AND y.id_agama = 'agm02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'


SELECT Y.id_mapel AS id_mapel, Y.nama_mapel AS nama_mapel, Y.nilai AS nilaiki3, Y.predikat AS predikatki3, 
Y.deskripsi AS deskripsiki3, Z.nilai AS nilaiki4, Z.predikat AS predikatki4, Z.deskripsi AS deskripsiki4 
FROM mapel X 
INNER JOIN data_siswa A 
INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel 
WHERE Y.id_siswa = 'SIS0000001' 
AND Z.id_siswa = 'SIS0000001'
GROUP BY id_mapel

SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_raport_ki4
SELECT * FROM nilai_agama_ki3
SELECT * FROM nilai_agama_ki4

SELECT * FROM nilai_raportkd_ki3
 
SELECT id_siswa, x.id_mapel, id_kelas, id_semester, singkat_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki3 X
INNER JOIN mapel Y ON y.id_mapel = x.id_mapel
WHERE id_siswa = 'SIS0000001' AND x.id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM siswa_kelas_semester

SELECT x.id_siswa, x.id_kelas, y.id_semester 
FROM data_level_siswa X
INNER JOIN data_level_semester Y ON y.id_semester = x.id_siswa
INNER JOIN data_siswa Z ON z.id_siswa = z.id_siswa

SELECT * FROM ekstrakurikuler

SELECT * FROM ekstrakurikuler WHERE id_ekstra BETWEEN 'EKS014' AND 'EKS022'
SELECT * FROM ekstrakurikuler WHERE id_ekstra NOT BETWEEN 'EKS001' AND 'EKS013'

SELECT * FROM tb_muatan_nilai

EKS012 12 Seni Tari
EKS004 4 Catur

SELECT * FROM ekstrakurikuler WHERE id_ekstra BETWEEN 'EKS001' AND 'EKS013'

SELECT * FROM mapel
INNER JOIN roles_mapel WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT y.id_mapel, nama_mapel, singkat_mapel, kelompok, pengetahuan, keterampilan, x.id_kelas, x.id_semester 
FROM roles_mapel X 
INNER JOIN mapel Y ON y.id_mapel = x.id_mapel 
WHERE id_kelas ='KLS01' 
AND id_semester = 'SM01' 
GROUP BY y.id_mapel

SELECT * FROM show_mapel_perkelas WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_mapel ASC

SELECT * FROM nilai_akhir_raport_ki3 WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_mapel ASC

SELECT
  `x`.`id_nilairaport` AS `id_nilairaport`,
  `z`.`id_siswa`       AS `id_siswa`,
  `x`.`id_kelas`       AS `id_kelas`,
  `x`.`id_semester`    AS `id_semester`,
  `y`.`id_mapel`       AS `id_mapel`,
  `y`.`nama_mapel`     AS `nama_mapel`,
  `x`.`nilai`          AS `nilai`,
  `x`.`predikat`       AS `predikat`,
  `x`.`deskripsi`      AS `deskripsi`
FROM ((`mapel` `y`
    LEFT JOIN `nilai_raport_ki3` `x`
      ON (`y`.`id_mapel` = `x`.`id_mapel`))
   JOIN `data_siswa` `z`))
   
SELECT id_siswa,id_kelas, id_semester FROM nilai_raport_ki3

SELECT * FROM per_ekstrakurikuler

SELECT * FROM tb_ekskul_wajib
SELECT * FROM tb_ekskul_pil1
SELECT * FROM tb_ekskul_pil2
SELECT * FROM tb_ekskul_pil3
SELECT * FROM tb_muatan_nilai

SELECT id_siswa, x.id_mapel, id_kelas, id_semester, singkat_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki3 X INNER JOIN mapel Y ON y.id_mapel = x.id_mapel WHERE id_siswa = 'SIS0000001' AND x.id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT id_siswa, id_kelas, id_semester FROM nilai_raport_ki3 WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT id_siswa, x.id_mapel, id_kelas, id_semester, singkat_mapel, nilai, predikat, deskripsi
FROM nilai_raport_ki3 X 
INNER JOIN mapel Y ON y.id_mapel = x.id_mapel 
WHERE id_siswa = 'SIS0000001' 
AND x.id_kelas = 'KLS01' 
AND id_semester = 'SM01'
SELECT * FROM nilai_raport_ki3

SELECT y.id_nilairaport AS id_ki3, y.id_siswa AS siswak3, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS dekk3,
z.id_nilairaport AS id_ki4, z.id_siswa AS siswak4, x.id_mapel AS mapelk4, z.id_kelas AS kelask4, z.id_semester AS semesterk4, singkat_mapel AS singkatk4, z.nilai AS nilaik4, z.predikat AS predikatk4, z.deskripsi AS deskk4
FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel
INNER JOIN nilai_raport_ki4 Z ON z.id_mapel = x.id_mapel
WHERE y.id_siswa = 'SIS0000001' 
AND y.id_kelas = 'KLS01' 
AND y.id_semester = 'SM01'

//ambil siswa
SELECT DISTINCT x.id_siswa AS siswak3, x.id_kelas AS kelask3, x.id_semester AS semesterk3, 
y.id_siswa AS siswak4, y.id_kelas AS kelask4, y.id_semester AS semesterk4 
FROM nilai_raport_ki3 X
INNER JOIN nilai_raport_ki4 Y ON y.id_siswa = x.id_siswa
WHERE x.id_kelas = 'KLS01' AND x.id_semester = 'SM01'

//ambil ki-3
SELECT y.id_nilairaport AS id_ki3, y.id_siswa AS siswak3, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, 
singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS dekk3
FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel
WHERE y.id_siswa = 'SIS0000001' 
AND y.id_kelas = 'KLS01' 
AND y.id_semester = 'SM01'

SELECT SUM(nilai) FROM nilai_raport_ki3

SELECT ROUND(SUM(nilai)/COUNT(nilai)) FROM nilai_raport_ki3

SELECT id, NAME, score, FIND_IN_SET( score, (SELECT GROUP_CONCAT( score ORDER BY score DESC ) FROM scores )) AS rank
FROM scores

SELECT id_siswa, nilai FIND_IN_SET(nilai, (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki3)) AS rank
FROM nilai_raport_ki3

SELECT id_mapel, nilai FROM nilai_raport_ki3
SELECT COUNT(nilai) FROM nilai_raport_ki3

SELECT y.id_nilairaport AS id_ki3, a.id_siswa AS siswak3, nama_siswa, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS dekk3,
z.id_nilairaport AS id_ki4, a.id_siswa AS siswak4, x.id_mapel AS mapelk4, z.id_kelas AS kelask4, z.id_semester AS semesterk4, singkat_mapel AS singkatk4, z.nilai AS nilaik4, z.predikat AS predikatk4, z.deskripsi AS deskk4
FROM data_siswa a
INNER JOIN mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel
INNER JOIN nilai_raport_ki4 Z ON z.id_mapel = x.id_mapel
WHERE a.id_siswa = 'SIS0000001'
AND y.id_kelas = 'KLS01'
AND y.id_semester = 'SM01'

SELECT x.id_siswa, x.id_kelas, x.id_semester 
FROM nilai_raport_ki3 X
INNER JOIN nilai_raport_ki4 Y ON y.id_siswa = x.id_siswa
WHERE x.id_siswa = 'SIS0000001'
AND x.id_kelas = 'KLS01'
AND x.id_semester = 'SM01'

SELECT y.id_siswa, y.id_kelas, y.id_semester, SUM(y.nilai)/COUNT(y.nilai) AS nilaik3, SUM(z.nilai)/COUNT(z.nilai) AS nilaik4 
FROM nilai_raport_ki3 Y 
INNER JOIN nilai_raport_ki4 Z ON z.id_mapel = y.id_mapel
WHERE y.id_siswa = 'SIS0000001'
AND y.id_kelas = 'KLS01'
AND y.id_semester = 'SM01'

SELECT y.id_nilairaport AS id_ki3, y.id_siswa AS siswak3, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS deskk3 
FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel WHERE y.id_siswa = 'SIS0000001' AND y.id_kelas = 'KLS01' AND y.id_semester = 'SM01'

SELECT x.id_mapel, y.id_siswa, nilai, singkat_mapel
FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel

SELECT id_siswa, id_kelas, id_semester, SUM(nilai) AS nil
FROM nilai_raport_ki3 GROUP BY id_siswa ASC
WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_siswa ASC

SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel, SUM(nilai) AS nil 
FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel GROUP BY y.id_siswa ASC
WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_siswa

SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel
ORDER BY y.id_siswa ASC

SELECT y.id_nilairaport AS id_ki3, y.id_siswa AS siswak3, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS deskk3 
FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel ORDER BY y.id_siswa ASC
WHERE y.id_siswa = 'SIS0000001' AND y.id_kelas = 'KLS01' AND y.id_semester = 'SM01' ORDER BY id_siswa

SELECT y.id_nilairaport AS id_ki3, y.id_siswa AS siswak3, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS deskk3 FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel WHERE y.id_siswa = 'SIS0000001' AND y.id_kelas = 'KLS01' AND y.id_semester = 'SM01' ORDER BY siswak3 ASC

SELECT y.id_nilairaport AS id_ki3, y.id_siswa AS siswak3, x.id_mapel AS mapelk3, y.id_kelas AS kelask3, y.id_semester AS semesterk3, singkat_mapel AS singkatk3, y.nilai AS nilaik3, y.predikat AS predikatk3, y.deskripsi AS deskk3 FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel ORDER BY siswak3 ASC

SELECT * FROM show_mapel_perkelas GROUP BY id_mapel

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata
FROM nilai_raport_ki3 X
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa
GROUP BY x.id_siswa ASC

SELECT * FROM mapel X
INNER JOIN roles_mapel Y ON y.id_mapel = x.id_mapel
WHERE x.id_mapel = 'MPL02' AND id_kelas ='KLS01' AND id_semester = 'SM01'

SELECT * FROM mapel X
INNER JOIN kd_pengetahuan Y ON y.id_mapel = x.id_mapel
WHERE x.id_mapel = 'MPL02' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT * FROM mapel X
INNER JOIN kd_agama_ki3 Y ON y.id_mapel = x.id_mapel
WHERE y.id_agama = 'agm01' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT * FROM agama

SELECT * FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa 
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa
WHERE y.id_kelas = 'KLS01' AND y.id_semester ='SM01'
GROUP BY y.id_mapel


SELECT SUM(nilai) FROM nilai_raport_ki3 GROUP BY id_siswa ASC


SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) 
AS rata_rata FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa GROUP BY x.id_siswa ASC

//nilaiki3
SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel,
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
GROUP BY x.id_siswa ASC

SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel 
WHERE y.id_siswa = 'SIS0000001' ORDER BY y.id_siswa ASC

//nilaiki4
SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel,
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata
FROM data_siswa X
INNER JOIN nilai_raport_ki4 Y ON y.id_siswa = x.id_siswa
GROUP BY x.id_siswa ASC 

SELECT x.id_siswa, nama_siswa, SUM(y.nilai) AS jumlah, COUNT(y.id_mapel) AS total_mapel,
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON Z.id_siswa = x.id_siswa
GROUP BY x.id_siswa AND y.id_mapel ASC

SELECT * FROM show_mapel_perkelas
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester WHERE kelas = 'kelas I'

SELECT * FROM data_siswa
INNER JOIN kelas
INNER JOIN semester

SELECT * FROM data_level_siswa WHERE id_kelas = 'KLS01'

SELECT * FROM siswa_kelas_semester
WHERE kelas = 'Kelas I' GROUP BY id_siswa
 AND semester = 'Semeser 2'

FROM ((((`data_level_siswa` `x`
      JOIN `data_level_semester` `y`
        ON (`y`.`id_level_siswa` = `x`.`id_level_siswa`))
     JOIN `data_siswa` `z`
       ON (`z`.`id_siswa` = `x`.`id_siswa`))
    JOIN `kelas` `c`
      ON (`c`.`id_kelas` = `x`.`id_kelas`))
   JOIN `semester` `b`
     ON (`b`.`id_semester` = `y`.`id_semester`)))$$

SELECT x.id_siswa, id_kelas, id_semester, nama_siswa FROM data_level_siswa X
INNER JOIN data_level_semester Y ON y.id_level_siswa = x.id_level_siswa
INNER JOIN data_siswa Z ON z.id_siswa = x.id_siswa
WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'
GROUP BY x.id_siswa

INNER JOIN data_siswa
INNER JOIN kelas
INNER JOIN semester

SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
FROM mapel X INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel 
WHERE y.id_siswa = 'SIS0000001' ORDER BY y.id_siswa ASC

SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
FROM mapel X INNER JOIN nilai_raport_ki4 Y ON y.id_mapel = x.id_mapel 
WHERE y.id_siswa = 'SIS0000001' ORDER BY y.id_siswa ASC

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata 
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT x.id_siswa, nama_siswa, 
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata_ki3, 
ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS rata_rata_ki4,
@rt:= ROUND((SUM(y.nilai)/7) + (SUM(z.nilai)/7)) AS jml,
@rt/2 AS rata_rata
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa
WHERE y.id_kelas = 'KLS01' AND z.id_kelas = 'KLS01'
AND z.id_semester = 'SM01' AND z.id_semester = 'SM01'
GROUP BY x.id_siswa ASC

SELECT x.id_siswa, nama_siswa, 
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata_ki3, 
ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS rata_rata_ki4
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa
WHERE y.id_kelas = 'KLS01' AND z.id_kelas = 'KLS01'
AND z.id_semester = 'SM01' AND z.id_semester = 'SM01'
GROUP BY x.id_siswa ASC

SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester

SELECT * FROM nilai_raport_ki3
SELECT * FROM siswa_kelas_semester

SELECT * FROM data_sekolah

SELECT * FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000001'

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata 
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT id, NAME, score, FIND_IN_SET( score, (SELECT GROUP_CONCAT( score ORDER BY score DESC ) FROM scores )) AS rank
FROM scores

SELECT id_siswa, id_mapel, nilai, FIND_IN_SET(nilai, (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki3)) AS Rank
FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000001'

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki3 X)) AS rank 
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT * FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000009'

SELECT * FROM nilai_raport_ki4 WHERE id_siswa = 'SIS0000009'


SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki4 X)) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki4 X)) AS rank
FROM nilai_raport_ki4 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT x.id_mapel, COUNT(x.id_mapel) AS jumlah FROM mapel X
INNER JOIN nilai_raport_ki3 Y ON y.id_mapel = x.id_mapel
GROUP BY x.id_mapel

SELECT * FROM nilai_raport_ki3

SELECT x.id_siswa, nama_siswa, 
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata_ki3, 
ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS rata_rata_ki4
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa
WHERE y.id_kelas = 'KLS01' AND z.id_kelas = 'KLS01'
AND z.id_semester = 'SM01' AND z.id_semester = 'SM01'
GROUP BY x.id_siswa ASC

SELECT * FROM satuan_kkm

SELECT Y.id_mapel AS id_mapel, Y.nama_mapel AS nama_mapel, Y.nilai AS nilaiki3, Y.predikat AS predikatki3, 
Y.deskripsi AS deskripsiki3, Z.nilai AS nilaiki4, Z.predikat AS predikatki4, Z.deskripsi AS deskripsiki4 
FROM mapel X 
INNER JOIN data_siswa A 
INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel 
INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel 
WHERE Y.id_siswa = 'SIS0000001' 
AND Z.id_siswa = 'SIS0000001' 
GROUP BY id_mapel

SELECT Y.id_mapel AS id_mapel, Y.nama_mapel AS nama_mapel, pengetahuan, keterampilan,Y.nilai AS nilaiki3, Y.predikat AS predikatki3, 
Y.deskripsi AS deskripsiki3, Z.nilai AS nilaiki4, Z.predikat AS predikatki4, Z.deskripsi AS deskripsiki4 
FROM mapel X 
INNER JOIN data_siswa A 
INNER JOIN nilai_raport_ki3 Y ON Y.id_mapel = X.id_mapel
INNER JOIN nilai_raport_ki4 Z ON Z.id_mapel = X.id_mapel
WHERE Y.id_siswa = 'SIS0000001' 
AND Z.id_siswa = 'SIS0000001' 
GROUP BY id_mapel

SELECT * FROM data_siswa

//hasil penilaian akhir ada di tabel sebagai berikut
//penilaian
SELECT * FROM nilai_raport_ki3
SELECT * FROM nilai_raport_ki4
SELECT * FROM nilai_raport_spiritual
SELECT * FROM nilai_raport_sosial
//perkembangan
SELECT * FROM per_ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM per_prestasi
SELECT * FROM tinggi_berat_badan
SELECT * FROM ketidakhadiran
//catatan
SELECT * FROM catatan`nilai_raport_ki3`

SELECT s.id_siswa AS ida, x.id_siswa AS idb, y.id_siswa AS idc, a.id_siswa AS idd, b.id_siswa AS ide, c.id_siswa AS idf, d.id_siswa AS idg, 
e.id_siswa AS idh, f.id_siswa AS idi, g.id_siswa AS idj 
FROM data_siswa s
INNER JOIN nilai_raport_ki3 X
INNER JOIN nilai_raport_ki4 Y
INNER JOIN nilai_raport_spiritual a
INNER JOIN nilai_raport_sosial b
INNER JOIN per_ekstrakurikuler c
INNER JOIN per_kesehatan d
INNER JOIN per_prestasi e
INNER JOIN tinggi_berat_badan f
INNER JOIN ketidakhadiran g


SELECT b.id_siswa, x.kegiatan, x.keterangan, a.kegiatan, a.keterangan, z.kegiatan, z.keterangan, y.kegiatan, y.keterangan
FROM data_siswa b
INNER JOIN tb_ekskul_pil1 a ON a.id_siswa = b.id_siswa
INNER JOIN tb_ekskul_pil2 z ON z.id_siswa = b.id_siswa
INNER JOIN tb_ekskul_pil3 Y ON y.id_siswa = b.id_siswa
INNER JOIN tb_ekskul_wajib X ON x.id_siswa = b.id_siswa
WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'
GROUP BY b.id_siswa ASC

SELECT * FROM tb_ekskul_pil1

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki4 X)) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT x.id_siswa, nama_siswa, SUM(z.nilai) AS jumlah, COUNT(z.id_mapel) AS total_mapel, 
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(y.nilai)/COUNT(y.id_mapel)), (SELECT GROUP_CONCAT(y.nilai ORDER BY y.nilai DESC) FROM nilai_raport_ki3 Y INNER JOIN nilai_raport_ki4 Z)) AS rank
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa 
WHERE y.id_kelas = 'KLS01' 
AND y.id_semester = 'SM01' 
GROUP BY x.id_siswa DESC

SELECT * FROM nilai_raport_ki3  GROUP BY id_mapel AND id_siswa


SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) FROM nilai_raport_ki3 X)) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa DESC

SET 
SELECT x.id_siswa, nama_siswa, id_kelas, id_semester ,SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(nilai, (SELECT GROUP_CONCAT(nilai ORDER BY id_mapel ASC) 
FROM nilai_raport_ki3)) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'Sm01' 
GROUP BY x.id_siswa ASC

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT GROUP_CONCAT(nilai ORDER BY id_mapel DESC) 
FROM nilai_raport_ki4)) AS rank
FROM nilai_raport_ki4 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa DESC

SELECT x.id_siswa, nama_siswa, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(ROUND(SUM(nilai)/COUNT(id_mapel)), (SELECT DISTINCT GROUP_CONCAT(nilai ORDER BY n DESC) 
FROM nilai_raport_ki3)) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa DESC

SELECT x.id_siswa, nama_siswa,
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata_ki3, 
ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS rata_rata_ki4,
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) + ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS jumlah,
ROUND((ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) + ROUND(SUM(z.nilai)/COUNT(z.id_mapel)))/2) AS rata_rata,
FIND_IN_SET(y.nilai, (SELECT DISTINCT GROUP_CONCAT(y.nilai ORDER BY z.id_mapel ASC) 
FROM nilai_raport_ki3 Y INNER JOIN nilai_raport_ki4 z USING(id_mapel))) AS rank
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa
WHERE y.id_kelas = 'KLS01' AND z.id_kelas = 'KLS01'
AND z.id_semester = 'SM01' AND z.id_semester = 'SM01'
GROUP BY id_siswa ASC

SELECT x.id_siswa, nama_siswa, y.id_kelas, y.id_semester,
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) AS rata_rata_ki3, 
ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS rata_rata_ki4,
ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) + ROUND(SUM(z.nilai)/COUNT(z.id_mapel)) AS jumlah,
ROUND((ROUND(SUM(y.nilai)/COUNT(y.id_mapel)) + ROUND(SUM(z.nilai)/COUNT(z.id_mapel)))/2) AS rata_rata
FROM data_siswa X
INNER JOIN nilai_raport_ki3 Y ON y.id_siswa = x.id_siswa
INNER JOIN nilai_raport_ki4 Z ON z.id_siswa = x.id_siswa
WHERE y.id_kelas = 'KLS01' AND z.id_kelas = 'KLS01'
AND z.id_semester = 'SM01' AND z.id_semester = 'SM01'
GROUP BY id_siswa ASC

SELECT id_siswa, nama_siswa, id_kelas, id_semester, rata_rata_ki3, rata_rata_ki4, jumlah, rata_rata, 
FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)) AS rank
FROM gabunganki3_ki4 
WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'
GROUP BY id_siswa DESC
/*buka query deskripsi saran*/
SELECT x.id_siswa, nama_siswa, x.id_kelas, x.id_semester, CONCAT('(1) Dari aspek pengetahuan dan keterampilan Ananda ',nama_siswa,' memperoleh nilai rata-rata : ', 
rata_rata, ', dan ananda',
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
' dan Selamat Ananda ',nama_siswa,' telah memperoleh ranking : ', FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)),' dalam kelas.'
) AS deskripsi, x.tahun_ajaran_awal, x.tahun_ajaran_akhir 
FROM gabunganki3_ki4 X
INNER JOIN per_prestasi Y ON y.id_kelas = x.id_kelas
INNER JOIN ketidakhadiran a ON a.id_kelas = x.id_kelas
INNER JOIN nilai_raport_spiritual h ON h.id_kelas = x.id_kelas
INNER JOIN nilai_raport_sosial i ON i.id_kelas = x.id_kelas
WHERE x.id_kelas = 'KLS01' AND x.id_semester = 'SM01'
GROUP BY x.id_siswa DESC
/*tutup query deskripsi saran*/

SELECT * FROM gabunganki3_ki4
SELECT * FROM 
SELECT * FROM tb_ekskul_wajib
SELECT * FROM nilai_raport_ki3
/*Buka query sikap*/
SELECT h.id_siswa, h.nilai AS nilai_sprit, i.nilai AS nilai_sosial,
CONCAT('Ananda ',h.id_siswa,' mendapatkan',
IF(h.nilai || i.nilai = 'A',' Nilai yang sangat baik untuk dipertahankan',
IF(h.nilai || i.nilai = 'B',' Nilai yang baik untuk dikembangkan',
IF(h.nilai || i.nilai = 'C',' Nilai yang harus diditingkatkan','Bimbingan lebih'))),' sesuai dengan pencapaian nilai sikap spiritual dan sosial.'
) AS predikat
FROM nilai_raport_spiritual h
INNER JOIN nilai_raport_sosial i ON i.id_kelas = h.id_kelas
GROUP BY h.id_siswa ASC
/*tutup query sikap*/

SELECT * FROM nilai_raport_spiritual
SELECT * FROM nilai_raport_sosial
SELECT * FROM mapel
SELECT id_siswa, x.id_mapel, IF(y.id_mapel = x.id_mapel,'Data sudah ada', 'data belum ada') AS hasil
FROM roles_mapel X 
INNER JOIN nilai_raport_ki3 Y
WHERE y.id_kelas = 'KLS01' AND y.id_semester = 'SM01' 
GROUP BY x.id_mapel ASC

SELECT * FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000001'
SELECT * FROM roles_mapel WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT MIN(pengetahuan) AS pengetahuan, MIN(keterampilan) AS keterampilan,
ROUND((MIN(pengetahuan)+ MIN(keterampilan))/2) AS kkm_min
FROM mapel

SELECT * FROM per_ekstrakurikuler

SELECT * FROM tb_ekskul_wajib WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM02'
SELECT * FROM tb_ekskul_pil1
SELECT * FROM tb_ekskul_pil2
SELECT * FROM tb_ekskul_pil3

SELECT * FROM per_prestasi
SELECT * FROM saran
SELECT * FROM tinggi_berat_badan
SELECT * FROM ketidakhadiran

SELECT * FROM DATA
SELECT id_siswa, 
FROM nilai_raport_ki3 WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_siswa


SELECT @sis:= id_siswa AS sis, @jml:= SUM(nilai) AS jml,COUNT(id_mapel), 
ROUND(@jml/COUNT(id_mapel))
FROM nilai_raport_ki3 WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' 
GROUP BY id_siswa DESC

SELECT id_siswa,nilai,
FIND_IN_SET(SUM(nilai), (SELECT GROUP_CONCAT(nilai ORDER BY id_mapel DESC) 
FROM nilai_raport_ki3)) AS rank
FROM nilai_raport_ki3 WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_siswa DESC


SELECT @i:=0, @j:=0, @sebelum:=0;
SELECT @j:=@j+1 AS NO, nis, nama, nilai, rangking 
FROM (SELECT n.nis, s.nama, n.nilai, IF(@sebelum<>n.nilai,@i:=@i+1,@i) AS rangking, 
@sebelum:=n.nilai 
FROM nilai n INNER JOIN siswa s ON n.nis=s.nis 
WHERE idtes = 't001' 
AND id_kelas = 'k001' 
ORDER BY n.nilai DESC, n.nis) X 
ORDER BY nis

SET @i:=0, @j:=0, @sblm:=0;
SELECT @j:=@j+1 AS NO, x.id_siswa, nama_siswa, @jml:=SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
@row:=ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
IF(@sblm<>@row:=@row,@i:=@i+1,@jml) AS rank
FROM nilai_raport_ki3 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM01' 
GROUP BY x.id_siswa ASC

SELECT y.id_siswa, x.id_mapel, nilai, singkat_mapel 
FROM mapel X INNER JOIN nilai_raport_ki4 Y ON y.id_mapel = x.id_mapel 
WHERE id_siswa = 'SIS0000008' AND id_kelas = 'KLS01' AND id_semester = 'SM01'
ORDER BY y.id_siswa ASC

SELECT * FROM show_mapel_perkelas WHERE id_kelas = 'KLS01' AND id_semester = 'SM01' GROUP BY id_mapel ASC

SELECT * FROM data_sekolah
SELECT * FROM ketidakhadiran
SELECT * FROM data_siswa

SELECT * FROM per_ekstrakurikuler

/*perubahan view gabunganki3_ki4*/
/*query setelah berubah*/
SELECT `x`.`id_siswa` AS `id_siswa`,`x`.`nama_siswa` AS `nama_siswa`,y.id_kelas, y.id_semester,
`y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) AS `rata_rata_ki3`,
ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `rata_rata_ki4`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `jumlah`,
ROUND(((ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0)) / 2),0) AS `rata_rata` 
FROM ((`data_siswa` `x` 
JOIN `nilai_raport_ki3` `y` ON(`y`.`id_siswa` = `x`.`id_siswa`)) 
JOIN `nilai_raport_ki4` `z` ON(`z`.`id_siswa` = `x`.`id_siswa`))
GROUP BY `y`.`id_nilairaport` ASC 

/*query sebelum berubah*/
SELECT `x`.`id_siswa` AS `id_siswa`,`x`.`nama_siswa` AS `nama_siswa`,`y`.`id_kelas` AS `id_kelas`,`y`.`id_semester` AS `id_semester`,
`y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) AS `rata_rata_ki3`,
ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `rata_rata_ki4`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `jumlah`,
ROUND(((ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0)) / 2),0) AS `rata_rata` 
FROM ((`data_siswa` `x` 
JOIN `nilai_raport_ki3` `y` ON(`y`.`id_siswa` = `x`.`id_siswa`)) 
JOIN `nilai_raport_ki4` `z` ON(`z`.`id_siswa` = `x`.`id_siswa`))
GROUP BY `x`.`id_siswa`
/*tutup perubahan gabunganki3_ki4*/

SELECT id_siswa, nama_siswa, id_kelas, id_semester, 
ROUND(SUM(rata_rata_ki3)/COUNT(rata_rata),0) AS rataki3, 
ROUND(SUM(rata_rata_ki4)/COUNT(rata_rata),0) AS rataki4,
ROUND(SUM(rata_rata_ki3)/COUNT(rata_rata),0)+ ROUND(SUM(rata_rata_ki4)/COUNT(rata_rata),0) AS jumlah,
ROUND((ROUND(SUM(rata_rata_ki3)/COUNT(rata_rata),0)+ ROUND(SUM(rata_rata_ki4)/COUNT(rata_rata),0))/2,0) AS rata_rata, 
COUNT(rata_rata),
FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)) AS rank
FROM gabunganki3_ki4 
WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'
GROUP BY id_siswa DESC //

SELECT x.id_siswa, nama_siswa, id_kelas, id_semester, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(nilai, (SELECT GROUP_CONCAT(nilai ORDER BY id_mapel ASC) 
FROM nilai_raport_ki4)) AS rank
FROM nilai_raport_ki4 X 
INNER JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM02' 
GROUP BY x.id_siswa ASC

SELECT * FROM gabunganki3_ki4
GROUP BY 

SELECT `x`.`id_siswa` AS `id_siswa`,`x`.`nama_siswa` AS `nama_siswa`,y.id_kelas, y.id_semester,
`y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) AS `rata_rata_ki3`,
ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `rata_rata_ki4`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `jumlah`,
ROUND((ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0)) / 2,0) AS `rata_rata` 
FROM ((`data_siswa` `x` 
JOIN `nilai_raport_ki3` `y` ON(`y`.`id_siswa` = `x`.`id_siswa`)) 
JOIN `nilai_raport_ki4` `z` ON(`z`.`id_siswa` = `x`.`id_siswa`))
WHERE y.id_kelas = 'KLS01' AND y.id_semester = 'SM01'
GROUP BY `x`.`id_siswa` ASC


SELECT y.id_nilairaport, `x`.`id_siswa` AS `id_siswa`,`x`.`nama_siswa` AS `nama_siswa`,`y`.`id_kelas` AS `id_kelas`,`y`.`id_semester` AS `id_semester`,
`y`.`tahun_ajaran_awal` AS `tahun_ajaran_awal`,`y`.`tahun_ajaran_akhir` AS `tahun_ajaran_akhir`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) AS `rata_rata_ki3`,
ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `rata_rata_ki4`,
ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0) AS `jumlah`,
ROUND(((ROUND(SUM(`y`.`nilai`) / COUNT(`y`.`id_mapel`),0) + ROUND(SUM(`z`.`nilai`) / COUNT(`z`.`id_mapel`),0)) / 2),0) AS `rata_rata` 
FROM ((`data_siswa` `x` 
JOIN `nilai_raport_ki3` `y` ON(`y`.`id_siswa` = `x`.`id_siswa`)) 
JOIN `nilai_raport_ki4` `z` ON(`z`.`id_siswa` = `x`.`id_siswa`))
GROUP BY `y`.`id_semester`

SELECT x.id_siswa, nama_siswa, id_kelas, id_semester, SUM(nilai) AS jumlah, COUNT(id_mapel) AS total_mapel, 
ROUND(SUM(nilai)/COUNT(id_mapel)) AS rata_rata,
FIND_IN_SET(nilai, (SELECT GROUP_CONCAT(nilai ORDER BY nilai DESC) 
FROM nilai_raport_ki3)) AS rank
FROM nilai_raport_ki3 X 
RIGHT JOIN data_siswa Y ON y.id_siswa = x.id_siswa 
WHERE id_kelas = 'KLS01' 
AND id_semester = 'SM02' 
GROUP BY x.id_siswa DESC

SELECT * FROM kelas

SELECT * FROM nilai_raport_spiritual
SELECT * FROM nilai_raport_sosial
SELECT * FROM per_ekstrakurikuler WHERE id_siswa = 'SIS0000001' AND id_semester = 'SM02' AND id_kelas = 'KLS01'
SELECT * FROM tb_ekskul_wajib
SELECT * FROM tb_ekskul_pil1
SELECT * FROM tb_ekskul_pil2
SELECT * FROM tb_ekskul_pil3
SELECT * FROM master_level
SELECT * FROM data_siswa
SELECT * FROM tinggi_berat_badan
SELECT * FROM ketidakhadiran
SELECT * FROM per_kesehatan WHERE id_siswa = 'SIS0000001' AND id_semester = 'SM01' AND id_kelas = 'KLS01'
SELECT * FROM per_prestasi WHERE id_siswa = 'SIS0000001' AND id_semester = 'SM01' AND id_kelas = 'KLS01'

SELECT * FROM nilai_raport_ki4 WHERE id_siswa = 'SIS0000001' AND id_semester = 'SM02' AND id_kelas = 'KLS01'

SELECT * FROM per_ekstrakurikuler

SELECT * FROM siswa_kelas_semester WHERE semester = 'Semester 1' AND kelas = 'Kelas I'
GROUP BY id_siswa ASC

SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester WHERE id_semester = 'SM01'

//VIEW TABLE untuk ekskul
SELECT * FROM tb_ekskul_wajib WHERE id_kelas = 'KLS01' AND id_semester = 'SM02'
SELECT * FROM tb_ekskul_pil1 WHERE id_kelas = 'KLS01' AND id_semester = 'SM02'
SELECT * FROM tb_ekskul_pil2 WHERE id_kelas = 'KLS01' AND id_semester = 'SM02'
SELECT * FROM tb_ekskul_pil3 WHERE id_kelas = 'KLS01' AND id_semester = 'SM02'

SELECT * FROM nilai_raport_ki3 WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT * FROM nilai_raport_ki4 WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT * FROM nilai_raport_spiritual WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM02'
SELECT * FROM nilai_raport_sosial WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT * FROM per_ekstrakurikuler
SELECT * FROM per_kesehatan
SELECT * FROM per_prestasi
SELECT * FROM ketidakhadiran
SELECT * FROM tinggi_berat_badan

SELECT * FROM siswa_kelas_semester WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT * FROM simple_siswa_kelas_semester WHERE id_siswa = 'SIS0000001' AND id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT x.id_siswa, nama_siswa, id_kelas, id_semester FROM data_siswa X 
INNER JOIN data_level_siswa Y ON y.id_siswa = x.id_siswa
INNER JOIN data_level_semester Z ON z.id_siswa = x.id_siswa

SELECT * FROM data_level_semester

SELECT * FROM siswa_kelas
SELECT * FROM data_siswa_kelas_semester GROUP BY id_siswa

SELECT x.id_siswa, y.id_siswa,x.nama_siswa ,IF(x.id_siswa = y.id_siswa ,'Data ada dikelas','Data tida dikelas') AS statusnya
FROM data_siswa X
INNER JOIN data_siswa_kelas_semester Y ON y.id_siswa = x.id_siswa
GROUP BY x.id_siswa

SELECT x.id_siswa AS id_siswa, x.nisn AS nisn, x.nis AS nis, x.nama_siswa AS nama_siswa,
x.id_agama AS id_agama, y.id_kelas AS id_kelas, y.id_level_siswa AS id_level_siswa, a.kelas AS kelas, 
z.id_semester AS id_semester, b.semester AS semester
FROM data_siswa X
INNER JOIN data_level_siswa Y ON  y.id_siswa = x.id_siswa
INNER JOIN kelas a ON a.id_kelas = y.id_kelas
INNER JOIN data_level_semester Z ON z.id_level_siswa = y.id_level_siswa
INNER JOIN semester b ON b.id_semester = z.id_semester
GROUP BY x.id_siswa ASC


SELECT x.id_siswa, nama_siswa, y.id_kelas, kelas
FROM data_siswa X
INNER JOIN data_level_siswa Y ON y.id_siswa = x.id_siswa
INNER JOIN kelas a ON a.id_kelas = y.id_kelas

SELECT x.id_siswa, nama_siswa, y.id_kelas, kelas FROM data_siswa X 
INNER JOIN data_level_siswa Y ON y.id_siswa = x.id_siswa INNER JOIN kelas a ON a.id_kelas = y.id_kelas

SELECT x.id_siswa, id_level_siswa,nama_siswa, y.id_kelas, kelas FROM data_siswa X 
INNER JOIN data_level_siswa Y ON y.id_siswa = x.id_siswa 
INNER JOIN kelas a ON a.id_kelas = y.id_kelas WHERE y.id_kelas = 'KLS01'

SELECT data_level_semester z ON
INNER JOIN semester b ON b.id_semester = b.id_semester
GROUP BY y.id_level_siswa ASC

SELECT * FROM data_siswa_ 

SELECT * FROM USER
SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM data_siswa_kelas_semester_2
SELECT * FROM siswa_kelas WHERE id_kelas = 'KLS01'

keluar

SELECT * FROM data_siswa
SELECT * FROM data_level_siswa
SELECT * FROM data_level_semester
SELECT * FROM data_siswa_kelas_semester_2 
WHERE id_semester = 'SM01'
GROUP BY id_siswa

SELECT * FROM siswa_kelas_semester

SELECT id_level_siswa, X.id_siswa AS id_siswa, X.id_kelas, nisn, nis, nama_siswa, jk, id_level_siswa, kelas 
FROM data_level_siswa X 
INNER JOIN data_siswa Y ON Y.id_siswa = X.id_siswa 
INNER JOIN kelas Z ON Z.id_kelas = X.id_kelas 
WHERE x.id_kelas = 'KLS01' ORDER BY id_siswa

SELECT * FROM mapel
SELECT * FROM roles_mapel WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'
SELECT * FROM show_mapel_perkelas WHERE id_kelas = 'KLS01' AND id_semester = 'SM01'

SELECT * FROM POSITION
SELECT * FROM master_level
SELECT * FROM USER

SELECT x.id_siswa, nama_siswa, x.id_kelas, x.id_semester, CONCAT('(1) Dari aspek pengetahuan dan keterampilan Ananda ',nama_siswa,
IF(rata_rata >= 100,' memiliki pengetahuan dan keterampilan sangat baik, Untuk itu selamat dan terus kembangkan potensi yang ananda miliki. ',
IF(rata_rata >= 90,' memiliki pengetahuan dan keterampilan baik, Untuk itu selamat dan terus kembangkan potensi yang ananda miliki. ',
IF(rata_rata >= 80,' memiliki pengetahuan dan keterampilan cukup baik, untuk itu perlu peningkatan dan konsistensi dalam belajar. ',
' perlu peningkatan dan konsitensi dalam belajar agar memperoleh pengetahuan dan keterampilan yang cukup baik. '))),
'(2) Di Bidang sikap ',
IF(h.nilai || i.nilai = 'A','spiritual dan sosial ananda berhasil meraih nilai yang sangat baik, Untuk itu selamat dan terus kembangkan sikap spiritual dan sosial yang ananda miliki. ',
IF(h.nilai || i.nilai = 'B','spiritual dan sosial ananda memiliki potensi yang baik untuk di kembangkan.',
IF(h.nilai || i.nilai = 'C','spiritual dan sosial ananda memiliki potensi yang harus terus ada peningkatan.',
' spiritual dan sosial ananda perlu ada bimbingan dalam meraih nilai sikap yang lebih baik. '))),
' dan Selamat ananda ',nama_siswa,' telah memperoleh ranking ', 
FIND_IN_SET(rata_rata, (SELECT GROUP_CONCAT(rata_rata ORDER BY rata_rata DESC) 
FROM gabunganki3_ki4)),' di kelas.'
) AS deskripsi, x.tahun_ajaran_awal, x.tahun_ajaran_akhir  
FROM gabunganki3_ki4 X
INNER JOIN per_prestasi Y ON y.id_kelas = x.id_kelas
INNER JOIN ketidakhadiran a ON a.id_kelas = x.id_kelas
INNER JOIN nilai_raport_spiritual h ON h.id_kelas = x.id_kelas
INNER JOIN nilai_raport_sosial i ON i.id_kelas = x.id_kelas
WHERE x.id_siswa = 'SIS0000001' 
AND x.id_kelas = 'KLS01' 
AND x.id_semester = 'SM01' 
AND x.tahun_ajaran_awal = '2020' 
AND x.tahun_ajaran_akhir = '2021'
GROUP BY x.id_siswa DESC


SELECT * FROM kd_pengetahuan

SELECT * FROM mapel

SELECT * FROM kd_pengetahuan 
WHERE id_mapel = 'MPL07' 
AND id_kelas = 'KLS03' 
AND id_semester = 'SM01'

SELECT id_mapel, nama_mapel ,pengetahuan , 
@rang := 100 - pengetahuan AS rang, 
@interv := IF(pengetahuan='','',ROUND(@rang/3)) AS interv,
@sbaik := IF(pengetahuan='','',pengetahuan+(@interv*3)) AS sbaik,
@baik := IF(pengetahuan='','',pengetahuan+(@interv*2)) AS baik,
@cbaik := IF(pengetahuan='','',pengetahuan+@interv) AS cbaik,
@pbimbingan := IF(pengetahuan='','',pengetahuan) AS pbimbingan
FROM mapel WHERE id_mapel = 'MPL07'

SELECT * FROM data_siswa

SELECT * FROM data_siswa_keluar X
INNER JOIN kelas Y ON y.id_kelas = x.id_kelas
INNER JOIN semester Z ON z.id_semester = x.id_semester

SELECT * FROM data_siswa_keluar X INNER JOIN kelas Y ON y.id_kelas = x.id_kelas
INNER JOIN semester Z ON z.id_semester = x.id_semester WHERE id_siswa_keluar = 'KEL0000001'