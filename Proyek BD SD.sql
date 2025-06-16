-- USERS
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_username VARCHAR(50) UNIQUE,
  user_password VARCHAR(100),
  user_role VARCHAR(20) check user_role in('Admin','Siswa','Guru','Wali') -- 'admin', 'siswa', 'guru', 'wali_kelas'
);

-- GURU
CREATE TABLE guru (
guru_id integer,
  guru_nama VARCHAR(100) not null,
  guru_tgl_lahir Date not null,
  primary KEY (guru_id) REFERENCES user(user_id)
);

--WALI
create table wali(
	wali_id integer primary key references guru(guru_id)
);

-- SISWA
CREATE TABLE siswa (
  siswa_nama VARCHAR(100),
  siswa_nis VARCHAR(20) UNIQUE,
  siswa_tgl_lahir DATE,
  siswa_id integer,
  FOREIGN KEY (kelas_id) REFERENCES kelas(id_kelas)
  primary KEY (siswa_id) REFERENCES user(user_id)
);

-- PENGAJARAN
create table pengajaran(
	guru_id integer primary key references guru(guru_id),
	siswa_id integer primary key references siswa(siswa_id)
);

-- KELAS
CREATE TABLE kelas (
  id_kelas SERIAL PRIMARY KEY,
  nama_kelas VARCHAR(20),
  wali_kelas_id INT,
  FOREIGN KEY (wali_kelas_id) REFERENCES guru(id_guru)
);

-- MATA PELAJARAN
CREATE TABLE mata_pelajaran (
  id_pelajaran SERIAL PRIMARY KEY,
  nama_pelajaran VARCHAR(100)
);

-- JADWAL
CREATE TABLE jadwal_kelas (
  id_jadwal SERIAL PRIMARY KEY,
  hari VARCHAR(10),
  jam_mulai TIME,
  jam_selesai TIME,
  guru_id INT,
  pelajaran_id INT,
  kelas_id INT,
  FOREIGN KEY (guru_id) REFERENCES guru(id_guru),
  FOREIGN KEY (pelajaran_id) REFERENCES mata_pelajaran(id_pelajaran),
  FOREIGN KEY (kelas_id) REFERENCES kelas(id_kelas)
);

-- NILAI
CREATE TABLE nilai (
  id_nilai SERIAL PRIMARY KEY,
  siswa_id INT,
  pelajaran_id INT,
  nilai NUMERIC(5,2),
  FOREIGN KEY (siswa_id) REFERENCES siswa(id_siswa),
  FOREIGN KEY (pelajaran_id) REFERENCES mata_pelajaran(id_pelajaran)
);
