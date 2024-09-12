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

-- Dumping data for table macna_laptops.address: ~0 rows (approximately)
DELETE FROM `address`;

-- Dumping data for table macna_laptops.cart: ~0 rows (approximately)
DELETE FROM `cart`;

-- Dumping data for table macna_laptops.category: ~9 rows (approximately)
DELETE FROM `category`;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Apple'),
	(2, 'MSI'),
	(3, 'Lenovo'),
	(4, 'Asus'),
	(5, 'Intel'),
	(6, 'AMD'),
	(7, 'NVIDIA'),
	(8, 'Gigabyte'),
	(9, 'Corsair');

-- Dumping data for table macna_laptops.city: ~4 rows (approximately)
DELETE FROM `city`;
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Kurunegala'),
	(2, 'Kandy'),
	(3, 'Galle'),
	(4, 'Colombo');

-- Dumping data for table macna_laptops.color: ~6 rows (approximately)
DELETE FROM `color`;
INSERT INTO `color` (`id`, `name`) VALUES
	(1, 'Black'),
	(2, 'Pink'),
	(3, 'White'),
	(4, 'Red'),
	(5, 'Blue'),
	(6, 'None');

-- Dumping data for table macna_laptops.model: ~11 rows (approximately)
DELETE FROM `model`;
INSERT INTO `model` (`id`, `name`, `category_id`) VALUES
	(1, 'Laptop', 1),
	(2, 'Laptop', 4),
	(3, 'Gaming Laptop', 3),
	(4, 'Gaming Laptop', 2),
	(5, 'Ram', 9),
	(6, 'Ram', 8),
	(7, 'CPU', 6),
	(8, 'CPU', 5),
	(9, 'GPU', 6),
	(11, 'Gaming Laptop', 2),
	(12, 'Laptop', 3);

-- Dumping data for table macna_laptops.orders: ~0 rows (approximately)
DELETE FROM `orders`;

-- Dumping data for table macna_laptops.order_item: ~0 rows (approximately)
DELETE FROM `order_item`;

-- Dumping data for table macna_laptops.order_status: ~4 rows (approximately)
DELETE FROM `order_status`;
INSERT INTO `order_status` (`id`, `name`) VALUES
	(1, 'Paid'),
	(2, 'Processing'),
	(3, 'Shipped'),
	(4, 'Delivered');

-- Dumping data for table macna_laptops.product: ~6 rows (approximately)
DELETE FROM `product`;
INSERT INTO `product` (`id`, `model_id`, `title`, `description`, `price`, `qty`, `storage_id`, `color_id`, `user_id`, `date_time`, `product_status_id`, `product_condition_id`) VALUES
	(1, 3, 'Lenovo Legion 9 16IRX9 i9-14900HX RTX 4090 24GB Vram with AI Boost', 'Lenovo Legion 9 16IRX9 i9-14900HX RTX 4090\r\nIntelÂ® Coreâ¢ i9-14900HX, 24Cores 5.8GHz 36MB\r\n64GB DDR5 5600Mhz\r\n2TB NVME GEN4 M.2 SSD (1TB +1TB)\r\n"16" 3.2K (3200x2000) Mini LED 1200nits Anti-glare, 100%\r\nDCI-P3, 100% AdobeÂ® RGB, 100% sRGB, 165Hz, "\r\nNVIDIA RTX 4090 16GB GDDR6, 2040MHz, TGP 175W, 686 AI TOPS\r\nPer-key RGB Backlit Keyboard\r\n2.6 kg, 99.9 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed', 985000, 3, 5, 1, 2, '2024-09-12 01:57:47', 1, 1),
	(2, 3, 'Lenovo YOGA Book 9 13IMU9 Ultra 7 14TH GEN with AI Boost', 'IntelÂ® AI Boost integrated in IntelÂ® Coreâ¢ Ultra processor, up to 11 TOPS\r\n\r\nLenovo YOGA Book 9 13IMU9 Ultra 7 14TH GEN with AI Boost\r\nIntelÂ® Coreâ¢ Ultra 7 155U (12M Cache, up to 4.80Hz)\r\n16GB LPDDR5x-7467 (Onboard)\r\n1TB NVME GEN4 M.2 SSD\r\n2x13.3" 2.8K OGM Touch OLED 400 Nits, DisplayHDRâ¢ True Black 500\r\nIntegrated Shared Intel Graphics\r\nYoga Book 9 Bluetooth Keyboard (Non-Backlit)\r\n1.34kg, 80WHrs\r\nFree Lenovo 600 Bluetooth Silent Mouse, Folio Stand\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed', 745000, 6, 4, 3, 2, '2024-09-12 02:13:06', 1, 1),
	(3, 3, 'LENOVO Legion SLIM 5 16AHP9 Ryzen 7 8000 Series RTX 4060', 'LENOVO Legion SLIM 5 16AHP9 Ryzen 7 8000 Series RTX 4060\r\nAMD Ryzenâ¢ 7 8845HS (8C / 16T, 3.8 / 5.1GHz)\r\n16GB DDR5 5600MHZ (16GB X 1)\r\n1TB GEN4 NVME M.2 SSD\r\n16" WQXGA (2560x1600) IPS 100% sRGB, 165Hz G-SYNC\r\nNVIDIA GeForce RTX 4060 8GB GDDR6 (Boost Clock 2370MHz, TGP 140W)\r\n4-Zone RGB Backlit keyboard\r\n2.3 kg, 80 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\n32GB Ram Upgrade : 21,500/=\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 490000, 11, 4, 3, 2, '2024-09-12 10:03:59', 1, 1),
	(4, 3, 'Lenovo LOQ 15IRX9 i7 14th GEN HX + RTX 4060 8GB Display Item', 'Lenovo LOQ 15IRX9 i7 14th GEN HX + RTX 4060 8GB\r\nIntelÂ® Coreâ¢ i7 processor 14700HX 20 Cores (33M Cache, up to 5.50 GHz)\r\n16GB DDR5 4800Mhz (16GB X 1)\r\n1TB SSD NVMe GEN4\r\n15.6" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNCÂ®\r\nNVIDIAÂ® GeForce RTXâ¢ 4060 8GB GDDR6 TGP 115W\r\n4-Zone RGB Backlit Keyboard\r\n2.38 kg, 60 WHr\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\nFree Lenovo Backpack\r\n\r\nRam upgrade to 32GB - 22,000/=\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported\r\n', 399000, 7, 4, 1, 2, '2024-09-12 10:08:37', 1, 1),
	(5, 3, 'LENOVO Legion PRO 5 16ARX8 Ryzen 9 RTX 4070 8GB Brand New', 'LENOVO Legion PRO 5 16ARX8 Ryzen 9 RTX 4070\r\nAMD Ryzenâ¢ 9 7945HX (16C / 32T, 2.5 / 5.4GHz)\r\n32GB DDR5 5200MHZ (16GB X 2)\r\n1TB GEN4 NVME M.2 SSD\r\n16" WQXGA (2560x1600) IPS 500nits 100% sRGB, 240Hz\r\nNVIDIA GeForce RTX 4070 8GB GDDR6 (Boost Clock 2175MHz, TGP 140W)\r\n4-Zone RGB Backlit keyboard\r\n2.5 kg, 80 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 710000, 6, 5, 1, 2, '2024-09-12 10:13:00', 1, 1),
	(6, 12, 'LENOVO IDEAPAD PRO 5 16IMH9 ULTRA 7 H OLED with ARC Graphics', 'LENOVO IDEAPAD PRO 5 16IMH9 ULTRA 7 H OLED with ARC Graphics\r\nIntel AI Boost integrated Core Ultra 7 155H, 16C (6P + 8E + 2LPE) / 22T, Max Turbo up to 4.8GHz, 24MB\r\n16GB LPDDR5x 7467Mhz\r\n512GB M.2 NVME GEN4 SSD\r\n16" (2048x1280) OLED, 120HZ\r\nIntel Arc Graphics\r\nWhite Backlit Keyboard\r\n1.91 kg, 84 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\n\r\nStandard Ports\r\n1x USB-A (USB 5Gbps / USB 3.2 Gen 1)\r\n1x USB-A (USB 5Gbps / USB 3.2 Gen 1), Always On\r\n1x USB-C (USB 20Gbps / USB 3.2 Gen 2Ã2), with USB PD 3.0 and DisplayPort 2.1\r\n1x USB-C (Thunderbolt 4 / USB4 40Gbps), with USB PD 3.0 and DisplayPort 2.1\r\n1x HDMI 2.1, up to 4K/60Hz\r\n1x Headphone / microphone combo jack (3.5mm)\r\n1x SD card reader', 379000, 8, 3, 3, 2, '2024-09-12 10:17:50', 1, 1);

-- Dumping data for table macna_laptops.product_condition: ~3 rows (approximately)
DELETE FROM `product_condition`;
INSERT INTO `product_condition` (`id`, `name`) VALUES
	(1, 'Brand New'),
	(2, 'Used'),
	(3, 'Damaged');

-- Dumping data for table macna_laptops.product_status: ~3 rows (approximately)
DELETE FROM `product_status`;
INSERT INTO `product_status` (`id`, `name`) VALUES
	(1, 'In Stock'),
	(2, 'Out Stock'),
	(3, 'Pre Order');

-- Dumping data for table macna_laptops.storage: ~9 rows (approximately)
DELETE FROM `storage`;
INSERT INTO `storage` (`id`, `value`) VALUES
	(1, '128GB'),
	(2, '256GB'),
	(3, '512GB'),
	(4, '1TB'),
	(5, '2Tb'),
	(6, '8GB RAM'),
	(7, '16GB RAM'),
	(8, '32GB RAM'),
	(9, '64GB RAM');

-- Dumping data for table macna_laptops.user: ~2 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`) VALUES
	(2, 'Ishara', 'Bandara', 'lakshithahitibandara@gmail.com', '11010001', 'verified'),
	(3, 'Tharaka', 'Lakshan', 'tharaka@gmail.com', '11010001', 'verified');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
