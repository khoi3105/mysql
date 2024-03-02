-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.1.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mymusic
CREATE DATABASE IF NOT EXISTS `mymusic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mymusic`;

-- Dumping structure for table mymusic.bannhac
CREATE TABLE IF NOT EXISTS `bannhac` (
  `idBannhac` int NOT NULL AUTO_INCREMENT,
  `tenBannhac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `idNhacsi` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`idBannhac`),
  UNIQUE KEY `tenBannhac_idNhacsi` (`tenBannhac`,`idNhacsi`),
  KEY `idNhacsi` (`idNhacsi`),
  CONSTRAINT `bannhac_ibfk_1` FOREIGN KEY (`idNhacsi`) REFERENCES `nhacsi` (`idNhacsi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mymusic.bannhac: ~8 rows (approximately)
DELETE FROM `bannhac`;
INSERT INTO `bannhac` (`idBannhac`, `tenBannhac`, `idNhacsi`) VALUES
	(1, 'Du kích Sông Thao', 1),
	(7, 'Nhạc rừng', 3),
	(6, 'Tiến về Hà Nội', 2),
	(8, 'Tiếng hát giữa rừng Pắc Bó', 4),
	(3, 'Tình ca', 3),
	(2, 'Trường ca Sông Lô', 2),
	(5, 'Việt Nam quê hương tôi', 1),
	(4, 'Xa khơi', 5);

-- Dumping structure for table mymusic.banthuam
CREATE TABLE IF NOT EXISTS `banthuam` (
  `idBanthuam` int NOT NULL AUTO_INCREMENT,
  `idBannhac` int NOT NULL DEFAULT '0',
  `idCasi` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idBanthuam`),
  UNIQUE KEY `idBannhac_idCasi` (`idBannhac`,`idCasi`),
  KEY `idCasi` (`idCasi`),
  CONSTRAINT `banthuam_ibfk_1` FOREIGN KEY (`idCasi`) REFERENCES `casi` (`idCasi`),
  CONSTRAINT `banthuam_ibfk_2` FOREIGN KEY (`idBannhac`) REFERENCES `bannhac` (`idBannhac`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mymusic.banthuam: ~10 rows (approximately)
DELETE FROM `banthuam`;
INSERT INTO `banthuam` (`idBanthuam`, `idBannhac`, `idCasi`) VALUES
	(1, 1, 5),
	(9, 2, 1),
	(2, 2, 2),
	(3, 3, 1),
	(4, 4, 3),
	(5, 5, 4),
	(10, 6, 4),
	(6, 6, 5),
	(7, 7, 4),
	(8, 8, 2);

-- Dumping structure for table mymusic.casi
CREATE TABLE IF NOT EXISTS `casi` (
  `idCasi` int NOT NULL AUTO_INCREMENT,
  `tenCasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idCasi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mymusic.casi: ~5 rows (approximately)
DELETE FROM `casi`;
INSERT INTO `casi` (`idCasi`, `tenCasi`) VALUES
	(1, 'Trần Khánh'),
	(2, 'Lê Dung'),
	(3, 'Tân Nhân'),
	(4, 'Quốc Hưởng'),
	(5, 'Doãn Tần');

-- Dumping structure for table mymusic.nhacsi
CREATE TABLE IF NOT EXISTS `nhacsi` (
  `idNhacsi` int NOT NULL AUTO_INCREMENT,
  `tenNhacsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idNhacsi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table mymusic.nhacsi: ~5 rows (approximately)
DELETE FROM `nhacsi`;
INSERT INTO `nhacsi` (`idNhacsi`, `tenNhacsi`) VALUES
	(1, 'Đỗ Nhuận'),
	(2, 'Văn Cao'),
	(3, 'Hoàng Việt'),
	(4, 'Nguyễn Tài Tuệ'),
	(5, 'Tân Nhân');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
