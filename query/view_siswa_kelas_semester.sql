
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `pelangi_bangsa`.`siswa_kelas_semester` 
    AS
(SELECT nisn, nis, nama_siswa, kelas, semester,
jk, tempat_lahir, tanggal_lahir, agama, pend_sebelumnya, alamat_serta_didik, nama_ayah, nama_ibu, pekerjaan_ayah, pekerjaan_ibu
FROM data_level_siswa X
INNER JOIN data_level_semester Y ON Y.id_level_siswa = X.id_level_siswa
INNER JOIN data_siswa Z ON Z.id_siswa = X.id_siswa
INNER JOIN kelas C ON C.id_kelas = X.id_kelas
INNER JOIN semester B ON B.id_semester = Y.id_semester);
