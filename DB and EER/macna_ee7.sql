-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.34 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table macna_ee7.brand: ~5 rows (approximately)
DELETE FROM `brand`;
INSERT INTO `brand` (`id`, `name`, `category_id`) VALUES
	(1, 'Aera', 4),
	(2, 'Moose', 2),
	(3, 'Vantage', 2),
	(4, 'SELENA', 1),
	(5, 'Kidis', 3);

-- Dumping data for table macna_ee7.cart: ~0 rows (approximately)
DELETE FROM `cart`;

-- Dumping data for table macna_ee7.category: ~0 rows (approximately)
DELETE FROM `category`;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Womens Wear'),
	(2, 'Mens Wear'),
	(3, 'Kids Wear'),
	(4, 'Women Tops');

-- Dumping data for table macna_ee7.city: ~0 rows (approximately)
DELETE FROM `city`;

-- Dumping data for table macna_ee7.color: ~0 rows (approximately)
DELETE FROM `color`;
INSERT INTO `color` (`id`, `name`) VALUES
	(1, 'Blue'),
	(2, 'Black'),
	(3, 'White');

-- Dumping data for table macna_ee7.country: ~0 rows (approximately)
DELETE FROM `country`;

-- Dumping data for table macna_ee7.material: ~0 rows (approximately)
DELETE FROM `material`;
INSERT INTO `material` (`id`, `name`) VALUES
	(1, 'Leather'),
	(2, 'Silk'),
	(3, 'Crocadile');

-- Dumping data for table macna_ee7.orders: ~0 rows (approximately)
DELETE FROM `orders`;

-- Dumping data for table macna_ee7.order_item: ~0 rows (approximately)
DELETE FROM `order_item`;

-- Dumping data for table macna_ee7.order_status: ~0 rows (approximately)
DELETE FROM `order_status`;

-- Dumping data for table macna_ee7.payment_method: ~0 rows (approximately)
DELETE FROM `payment_method`;

-- Dumping data for table macna_ee7.product: ~0 rows (approximately)
DELETE FROM `product`;
INSERT INTO `product` (`id`, `title`, `description`, `price`, `qty`, `color_id`, `date_time`, `size_id`, `user_id`, `material_id`, `brand_id`, `product_status_id`) VALUES
	(1, 'Strap Long Dress', 'The model\'s measurements are Bust: 35, Waist: 27, Hips: 36, and Height: 5’10". She is wearing a UK 10 | M size.', 1000, 5, 2, '2024-09-11 05:34:29', 3, 2, 2, 4, 0);

-- Dumping data for table macna_ee7.product_status: ~2 rows (approximately)
DELETE FROM `product_status`;
INSERT INTO `product_status` (`id`, `name`) VALUES
	(1, 'available'),
	(2, 'unavailable');

-- Dumping data for table macna_ee7.review: ~0 rows (approximately)
DELETE FROM `review`;

-- Dumping data for table macna_ee7.size: ~0 rows (approximately)
DELETE FROM `size`;
INSERT INTO `size` (`id`, `value`) VALUES
	(1, 'S'),
	(2, 'M'),
	(3, 'L'),
	(4, 'XL'),
	(5, 'XXL'),
	(6, 'XXXL');

-- Dumping data for table macna_ee7.user: ~2 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification_code`) VALUES
	(1, 'Ishara', 'Bandara', 'lakshithahitibandara@gmail.com', '11010001', 'verified'),
	(2, 'Isharax9', 'business ', 'isharax9@gmail.com', 'Itzzmac141', 'verified'),
	(3, 'Ishara', 'Bandara', 'lakshithahitibandara1@gmail.com', '11010001', '277672'),
	(4, 'test', '1', 'cohoc71764@esterace.com', '11010001', 'verified');

-- Dumping data for table macna_ee7.wishlist: ~0 rows (approximately)
DELETE FROM `wishlist`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
