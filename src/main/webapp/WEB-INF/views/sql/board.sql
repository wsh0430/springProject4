-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.41 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- springproject4 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `springproject4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `springproject4`;

-- 테이블 springproject4.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) NOT NULL,
  `member_nickname` varchar(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `view_count` int DEFAULT '0',
  `like_count` int DEFAULT '0',
  `comment_count` int DEFAULT '0',
  `report_count` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `delete_check` tinyint DEFAULT '0',
  `hide_check` tinyint DEFAULT '0',
  `item_int1` int DEFAULT NULL,
  `item_int2` int DEFAULT NULL,
  `item_int3` int DEFAULT NULL,
  `item_varchar` varchar(100) DEFAULT NULL,
  `item_varchar2` varchar(100) DEFAULT NULL,
  `item_varchar3` varchar(100) DEFAULT NULL,
  `item_text` text,
  `item_datetime1` datetime DEFAULT NULL,
  `item_datetime2` datetime DEFAULT NULL,
  `item_tinyint` tinyint DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `board_ibfk_1` (`member_id`),
  KEY `board_ibfk_2` (`category_name`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `board_ibfk_2` FOREIGN KEY (`category_name`) REFERENCES `category` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
