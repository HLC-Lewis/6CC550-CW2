-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.4.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for family_board
CREATE DATABASE IF NOT EXISTS `family_board` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `family_board`;

-- Dumping structure for table family_board.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT 'TASK',
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table family_board.tasks: ~11 rows (approximately)
INSERT INTO `tasks` (`id`, `type`, `title`, `details`, `created_at`, `created_by`) VALUES
	(1, 'TASK', 'EXAMPLE TASK', 'Example task', '2024-08-06 11:21:19', 'Admin'),
	(2, 'EVENT', 'EXAMPLE EVENT', 'Example event', '2024-08-06 11:21:19', 'Admin'),
	(3, 'NOTE', 'EXAMPLE SHARED NOTE', 'Example shared note', '2024-08-06 11:21:19', 'Admin'),
	(4, 'TASK', 'EXAMPLE TASK', 'Example task', '2024-08-06 11:21:19', 'Admin'),
	(5, 'EVENT', 'EXAMPLE EVENT', 'Example event', '2024-08-06 11:21:19', 'Admin'),
	(6, 'NOTE', 'Family Meeting', 'Meeting agenda...', '2024-08-06 11:27:54', 'Mrs. Beecham'),
	(7, 'EVENT', 'Lisa\'s Football Game', 'Date and location of the game', '2024-08-06 11:27:54', 'Lisa'),
	(8, 'NOTE', 'Weekly Shopping List Update', 'Groceries, fresh...', '2024-08-06 11:27:54', 'Mrs. Beecham'),
	(9, 'TASK', 'Household Chores', 'Hoovering\nWashing Up\nLaundry\nPolishing', '2024-08-06 11:27:54', 'Anna'),
	(10, 'NOTE', 'Holiday Shopping List', 'Sunglasses\nSun cream', '2024-08-06 11:42:18', 'Mr. Beecham'),
	(11, 'EVENT', 'Football game', 'Details of a football game event would go here...', '2024-08-07 17:17:43', 'Lewis');

-- Dumping structure for table family_board.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table family_board.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
	(0, 'Beecham Admin', '$2b$10$7KbKP2X6H1B2rR5Bt/sFhuqFlBNS4ZTuwZt.O7TxVgOIr2aH3lROm', '2024-08-06 11:51:29');

-- Dumping structure for table family_board.user_tasks
CREATE TABLE IF NOT EXISTS `user_tasks` (
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `user_tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table family_board.user_tasks: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
