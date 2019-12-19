-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2019 pada 06.46
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pengiriman_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_paket`
--

CREATE TABLE `tb_jenis_paket` (
  `id_paket` int(5) NOT NULL,
  `paket_type` varchar(8) NOT NULL,
  `asuransi` int(3) NOT NULL,
  `biaya` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penerima_barang`
--

CREATE TABLE `tb_penerima_barang` (
  `no_resi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_asal` varchar(15) NOT NULL,
  `id_petugas` varchar(6) NOT NULL,
  `penerima` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` int(12) NOT NULL,
  `no_pengirim` varchar(7) NOT NULL,
  `jumlah_item` int(3) NOT NULL,
  `isi_paket` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengirim`
--

CREATE TABLE `tb_pengirim` (
  `no_pengirim` varchar(7) NOT NULL,
  `nama_pengirim` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` varchar(15) NOT NULL,
  `provinsi` varchar(15) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `daerah` varchar(15) NOT NULL,
  `telepon` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengiriman_barang`
--

CREATE TABLE `tb_pengiriman_barang` (
  `no_resi` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kota_tujuan` varchar(15) NOT NULL,
  `id_petugas` varchar(6) NOT NULL,
  `no_pengirim` varchar(7) NOT NULL,
  `penerima` varchar(25) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `paket_type` varchar(15) NOT NULL,
  `berat` int(3) NOT NULL,
  `biaya` int(3) NOT NULL,
  `asuransi` int(3) NOT NULL,
  `isi_paket` varchar(20) NOT NULL,
  `total` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` varchar(6) NOT NULL,
  `nama_petugas` varchar(25) NOT NULL,
  `jabatan` varchar(5) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telepon` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_jenis_paket`
--
ALTER TABLE `tb_jenis_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `tb_penerima_barang`
--
ALTER TABLE `tb_penerima_barang`
  ADD PRIMARY KEY (`no_resi`);

--
-- Indeks untuk tabel `tb_pengirim`
--
ALTER TABLE `tb_pengirim`
  ADD PRIMARY KEY (`no_pengirim`);

--
-- Indeks untuk tabel `tb_pengiriman_barang`
--
ALTER TABLE `tb_pengiriman_barang`
  ADD PRIMARY KEY (`no_resi`),
  ADD UNIQUE KEY `id_petugas` (`id_petugas`),
  ADD UNIQUE KEY `no_pengirim` (`no_pengirim`),
  ADD UNIQUE KEY `no_resi_2` (`no_resi`),
  ADD KEY `no_resi` (`no_resi`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_jenis_paket`
--
ALTER TABLE `tb_jenis_paket`
  MODIFY `id_paket` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_penerima_barang`
--
ALTER TABLE `tb_penerima_barang`
  ADD CONSTRAINT `tb_penerima_barang_ibfk_1` FOREIGN KEY (`no_resi`) REFERENCES `tb_pengiriman_barang` (`no_resi`);

--
-- Ketidakleluasaan untuk tabel `tb_pengiriman_barang`
--
ALTER TABLE `tb_pengiriman_barang`
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_1` FOREIGN KEY (`no_pengirim`) REFERENCES `tb_pengirim` (`no_pengirim`),
  ADD CONSTRAINT `tb_pengiriman_barang_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
