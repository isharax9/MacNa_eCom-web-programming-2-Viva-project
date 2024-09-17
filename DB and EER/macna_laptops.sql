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

-- Dumping data for table macna_laptops.address: ~2 rows (approximately)
DELETE FROM `address`;
INSERT INTO `address` (`id`, `first_name`, `last_name`, `line1`, `line2`, `postal_code`, `city_id`, `mobile`, `user_id`) VALUES
	(1, 'Ishara', 'Bandara', '200/3,', 'Ambalanpitiya', '60000', 1, '0710351156', 2),
	(4, 'Tharaka', 'Lakshan', 'No.7', 'Colombo', '00500', 4, '0761234567', 3);

-- Dumping data for table macna_laptops.cart: ~2 rows (approximately)
DELETE FROM `cart`;
INSERT INTO `cart` (`id`, `user_id`, `product_id`, `qty`) VALUES
	(32, 2, 1, 2),
	(33, 2, 3, 1);

-- Dumping data for table macna_laptops.category: ~8 rows (approximately)
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
	(6, 'Gold');

-- Dumping data for table macna_laptops.model: ~9 rows (approximately)
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
	(12, 'Laptop', 3),
	(13, 'Gaming Laptop', 4);

-- Dumping data for table macna_laptops.orders: ~15 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `date_time`, `user_id`, `address_id`) VALUES
	(1, '2024-09-13 11:05:39', 2, 1),
	(2, '2024-09-13 11:22:42', 3, 4),
	(3, '2024-09-13 11:39:49', 2, 1),
	(4, '2024-09-13 11:40:19', 2, 1),
	(5, '2024-09-13 11:41:14', 3, 4),
	(6, '2024-09-14 00:06:24', 2, 1),
	(7, '2024-09-14 02:29:30', 2, 1),
	(8, '2024-09-14 02:31:41', 2, 1),
	(9, '2024-09-14 02:42:02', 2, 1),
	(10, '2024-09-14 02:45:53', 2, 1),
	(11, '2024-09-14 02:56:56', 2, 1),
	(12, '2024-09-14 04:30:00', 2, 1),
	(13, '2024-09-14 13:58:36', 2, 1),
	(14, '2024-09-14 18:01:36', 2, 1),
	(15, '2024-09-14 18:02:18', 2, 1),
	(16, '2024-09-15 11:10:04', 2, 1);

-- Dumping data for table macna_laptops.order_item: ~18 rows (approximately)
DELETE FROM `order_item`;
INSERT INTO `order_item` (`id`, `product_id`, `qty`, `order_status_id`, `orders_id`) VALUES
	(1, 2, 1, 1, 1),
	(2, 4, 1, 1, 1),
	(3, 5, 1, 1, 1),
	(4, 1, 1, 1, 2),
	(5, 4, 1, 1, 2),
	(6, 5, 1, 1, 2),
	(7, 3, 1, 1, 3),
	(8, 2, 1, 1, 3),
	(9, 4, 1, 1, 3),
	(10, 1, 2, 1, 3),
	(11, 1, 2, 1, 5),
	(12, 4, 1, 1, 6),
	(13, 12, 1, 5, 7),
	(14, 12, 1, 5, 8),
	(15, 1, 1, 5, 9),
	(16, 7, 1, 5, 10),
	(17, 12, 1, 5, 11),
	(18, 1, 1, 5, 12),
	(19, 4, 1, 5, 13),
	(20, 2, 1, 5, 13),
	(21, 5, 1, 5, 14),
	(22, 1, 2, 5, 16);

-- Dumping data for table macna_laptops.order_status: ~4 rows (approximately)
DELETE FROM `order_status`;
INSERT INTO `order_status` (`id`, `name`) VALUES
	(1, 'Paid'),
	(2, 'Processing'),
	(3, 'Shipped'),
	(4, 'Delivered'),
	(5, 'Pending');

-- Dumping data for table macna_laptops.product: ~9 rows (approximately)
DELETE FROM `product`;
INSERT INTO `product` (`id`, `model_id`, `title`, `description`, `price`, `qty`, `storage_id`, `color_id`, `user_id`, `date_time`, `product_status_id`, `product_condition_id`) VALUES
	(1, 3, 'Lenovo Legion 9 16IRX9 i9-14900HX RTX 4090 24GB Vram with AI Boost', 'Lenovo Legion 9 16IRX9 i9-14900HX RTX 4090\r\nIntelÂ® Coreâ¢ i9-14900HX, 24Cores 5.8GHz 36MB\r\n64GB DDR5 5600Mhz\r\n2TB NVME GEN4 M.2 SSD (1TB +1TB)\r\n"16" 3.2K (3200x2000) Mini LED 1200nits Anti-glare, 100%\r\nDCI-P3, 100% AdobeÂ® RGB, 100% sRGB, 165Hz, "\r\nNVIDIA RTX 4090 16GB GDDR6, 2040MHz, TGP 175W, 686 AI TOPS\r\nPer-key RGB Backlit Keyboard\r\n2.6 kg, 99.9 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed', 9850, 2, 5, 1, 2, '2024-09-12 01:57:47', 1, 1),
	(2, 3, 'Lenovo YOGA Book 9 13IMU9 Ultra 7 14TH GEN with AI Boost', 'IntelÂ® AI Boost integrated in IntelÂ® Coreâ¢ Ultra processor, up to 11 TOPS\r\n\r\nLenovo YOGA Book 9 13IMU9 Ultra 7 14TH GEN with AI Boost\r\nIntelÂ® Coreâ¢ Ultra 7 155U (12M Cache, up to 4.80Hz)\r\n16GB LPDDR5x-7467 (Onboard)\r\n1TB NVME GEN4 M.2 SSD\r\n2x13.3" 2.8K OGM Touch OLED 400 Nits, DisplayHDRâ¢ True Black 500\r\nIntegrated Shared Intel Graphics\r\nYoga Book 9 Bluetooth Keyboard (Non-Backlit)\r\n1.34kg, 80WHrs\r\nFree Lenovo 600 Bluetooth Silent Mouse, Folio Stand\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed', 7450, 3, 4, 3, 2, '2024-09-12 02:13:06', 1, 1),
	(3, 3, 'LENOVO Legion SLIM 5 16AHP9 Ryzen 7 8000 Series RTX 4060', 'LENOVO Legion SLIM 5 16AHP9 Ryzen 7 8000 Series RTX 4060\r\nAMD Ryzenâ¢ 7 8845HS (8C / 16T, 3.8 / 5.1GHz)\r\n16GB DDR5 5600MHZ (16GB X 1)\r\n1TB GEN4 NVME M.2 SSD\r\n16" WQXGA (2560x1600) IPS 100% sRGB, 165Hz G-SYNC\r\nNVIDIA GeForce RTX 4060 8GB GDDR6 (Boost Clock 2370MHz, TGP 140W)\r\n4-Zone RGB Backlit keyboard\r\n2.3 kg, 80 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\n32GB Ram Upgrade : 21,500/=\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 4900, 10, 4, 3, 2, '2024-09-12 10:03:59', 1, 1),
	(4, 3, 'Lenovo LOQ 15IRX9 i7 14th GEN HX + RTX 4060 8GB Display Item', 'Lenovo LOQ 15IRX9 i7 14th GEN HX + RTX 4060 8GB\r\nIntelÂ® Coreâ¢ i7 processor 14700HX 20 Cores (33M Cache, up to 5.50 GHz)\r\n16GB DDR5 4800Mhz (16GB X 1)\r\n1TB SSD NVMe GEN4\r\n15.6" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNCÂ®\r\nNVIDIAÂ® GeForce RTXâ¢ 4060 8GB GDDR6 TGP 115W\r\n4-Zone RGB Backlit Keyboard\r\n2.38 kg, 60 WHr\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\nFree Lenovo Backpack\r\n\r\nRam upgrade to 32GB - 22,000/=\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported\r\n', 3990, 2, 4, 1, 2, '2024-09-12 10:08:37', 1, 1),
	(5, 3, 'LENOVO Legion PRO 5 16ARX8 Ryzen 9 RTX 4070 8GB Brand New', 'LENOVO Legion PRO 5 16ARX8 Ryzen 9 RTX 4070\r\nAMD Ryzenâ¢ 9 7945HX (16C / 32T, 2.5 / 5.4GHz)\r\n32GB DDR5 5200MHZ (16GB X 2)\r\n1TB GEN4 NVME M.2 SSD\r\n16" WQXGA (2560x1600) IPS 500nits 100% sRGB, 240Hz\r\nNVIDIA GeForce RTX 4070 8GB GDDR6 (Boost Clock 2175MHz, TGP 140W)\r\n4-Zone RGB Backlit keyboard\r\n2.5 kg, 80 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 7100, 3, 5, 1, 2, '2024-09-12 10:13:00', 1, 1),
	(6, 12, 'LENOVO IDEAPAD PRO 5 16IMH9 ULTRA 7 H OLED with ARC Graphics', 'LENOVO IDEAPAD PRO 5 16IMH9 ULTRA 7 H OLED with ARC Graphics\r\nIntel AI Boost integrated Core Ultra 7 155H, 16C (6P + 8E + 2LPE) / 22T, Max Turbo up to 4.8GHz, 24MB\r\n16GB LPDDR5x 7467Mhz\r\n512GB M.2 NVME GEN4 SSD\r\n16" (2048x1280) OLED, 120HZ\r\nIntel Arc Graphics\r\nWhite Backlit Keyboard\r\n1.91 kg, 84 WHr\r\nFree Lenovo Backpack\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\n\r\nStandard Ports\r\n1x USB-A (USB 5Gbps / USB 3.2 Gen 1)\r\n1x USB-A (USB 5Gbps / USB 3.2 Gen 1), Always On\r\n1x USB-C (USB 20Gbps / USB 3.2 Gen 2Ã2), with USB PD 3.0 and DisplayPort 2.1\r\n1x USB-C (Thunderbolt 4 / USB4 40Gbps), with USB PD 3.0 and DisplayPort 2.1\r\n1x HDMI 2.1, up to 4K/60Hz\r\n1x Headphone / microphone combo jack (3.5mm)\r\n1x SD card reader', 3790, 8, 3, 3, 2, '2024-09-12 10:17:50', 1, 1),
	(7, 13, 'ASUS ROG Strix SCAR 16 (2024) G634JZR i9 14TH GEN RTX 4080', 'Dominate the Windows 11 Home battlefield with the ROG Strix SCAR 16.â¯Get the drop on the competition with a lightning-fast and crystal-clear 16-inch 2.5K 240Hz Nebula HDR display Mini LED panel with over 2000 dimming zones. Powered by IntelÂ® Coreâ¢ i9 Processor 14900HX and up to NVIDIAÂ® GeForce RTXâ¢ 4080 Laptop GPU with a max TGP of 175W, the SCAR 16 easily handles even the most demanding games. It also comes with a dedicated MUX Switch with support for NVIDIA Advanced Optimus, enabling you to easily harness the true power of your GPU when gaming. With support for up to 64GB of DDR5 RAM and up to 2TB of PCIe Gen4x4 storage, the SCAR 16 can easily game, stream, and create content all at the same time without breaking a sweat. For the ultimate gaming laptop, look no further than the Strix SCAR 16.\r\n\r\nASUS ROG Strix SCAR 16 (2024) G634JZR i9 14TH GEN RTX 4080\r\nIntel Core i9 14900HX (36MB Cache, up to 5.8 GHz, 24 cores, 32 Threads)\r\n32GB DDR5 5600MHZ (16GB x2 )\r\n2TB PCIeÂ® 4.0 NVMeâ¢ M.2 Performance SSD (1TB + 1TB)\r\n16-inch QHD+ 16:10 (2560 x 1600, WQXGA) 240Hz ROG Nebula HDR Display, G-Sync and Pantone Validated\r\nNVIDIA GeForce RTX 4080 -12GB GDDR6\r\n"MUX Switch + NVIDIAÂ® Advanced Optimus\r\nROG Boost: 2330MHz* at 175W (2280MHz Boost Clock+50MHz OC, 150W+25W Dynamic Boost)"\r\n2.65 kg , 90WHrs\r\nROG Gaming Back pack, ROG Impact Gaming Mouse\r\n2 Years Company Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\nOffice Home and Student\r\n\r\nRAM Upgrade to 64GB (4800MHZ - 5200MHZ) - 50,000', 15890, 3, 5, 1, 2, '2024-09-12 17:03:47', 1, 1),
	(8, 13, 'ASUS TianXuan 5 PRO (TUF) F16 FX607 i9 14TH GEN RTX 4060 8GB', 'Available Color : Eclipse Grey\r\n\r\nASUS TianXuan 5 PRO (TUF) F16 FX607 i9 14TH GEN RTX 4060 8GB\r\nIntel Core i9 14900HX (36MB Cache, up to 5.8 GHz, 24 cores, 32 Threads)\r\n16GB DDR5 4800MHz (16GB x 1)\r\n1TB M.2 NVMeâ¢ï¸ PCIeÂ®ï¸ 4.0 SSD\r\n16" WQXGA (2560x1600) 165Hz IPS\r\nNVIDIAÂ®ï¸ GeForce RTX 4060 8GB GDDR6\r\nBacklit Chiclet Keyboard 1-Zone RGB\r\n2.2kg, 90WHrs\r\nFree ASUS Backpack\r\n1 Year Nanotek warranty\r\nNo Os\r\n\r\nRam upgrade to 32GB - 22,000/=\r\nRam upgrade to 64GB - 60,000/=\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 5750, 7, 4, 1, 2, '2024-09-12 17:18:22', 1, 2),
	(9, 2, 'Asus Vivobook 15 X1504Z i5 12th GEN Brand New Condition with warrenty', 'Asus Vivobook 15 X1504Z i5 12th GEN\r\nIntelÂ®ï¸ Coreâ¢ï¸ i5-1235U (12M Cache, up to 4.44GHz)\r\n8GB DDR4 3200MHZ (Onboard)\r\n512GB NVME M.2 SSD\r\n15.6" FHD (1920x1080) IPS-Level\r\nIntel Iris XE Graphics\r\nBacklit keyboard, Fingerprint Reader\r\n1.7 kg , 42WHrs\r\nFree Asus Back pack\r\n1 Years Nanotek Warranty\r\nNo OS\r\n\r\nRam upgrade to 16GB - 7,500/=\r\nRam upgrade to 32GB - 22,000/=', 1940, 2, 3, 5, 2, '2024-09-12 17:21:30', 1, 1),
	(10, 13, 'ASUS ROG ZEPHYRUS G16 GU605MI ULTRA 9 14TH GEN RTX 4070 8GB OLED', 'Available Color : Eclipse Gray\r\n\r\nASUS ROG ZEPHYRUS G16 GU605MI ULTRA 9 14TH GEN RTX 4070 8GB OLED\r\nIntelÂ® Coreâ¢ Ultra 9-185H (24M Cache, up to 5.10Hz, 16 Cores 22 Threads) with Intel AI Boost NPU\r\n16GB LPDDR5X 7467MT/S\r\n1TB M.2 GEN4 NVME SSD\r\n16-inch , QHD+ 16:10 (2560 x 1600, WQXGA) OLED 240HZ G-Sync Supported\r\nNVIDIAÂ®ï¸ GeForce RTX 4070 8GB GDDR6\r\nBacklit Chiclet Keyboard 1-Zone RGB, FHD IR Camera for Windows Hello\r\n1.85 kg, 90WHrs\r\nFree ASUS Backpack\r\n1 Year Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 6500, 13, 4, 5, 2, '2024-09-12 17:28:23', 1, 1),
	(11, 2, 'ASUS ZENBOOK 14 Q415MA ULTRA 5 14TH GEN OLED | Best Laptop ', 'Available Color : Abyss Blue\r\n\r\nASUS ZENBOOK 14 Q415MA ULTRA 5 14TH GEN OLED\r\nIntelÂ® Coreâ¢ Ultra 5 125H (18M Cache, up to 4.50 GHz)\r\n8GB LPDDR5X 4800MHZ\r\n512GB GEN4 NVME M.2 SSD\r\n14.0-inch, FHD (1920 x 1200) OLED Touch Screen, 500 Nits 100% Color Gamut\r\nIntelÂ® Arcâ¢ Graphics\r\nBacklit Keyboard, FHD camera with IR function to support Windows Hello\r\n1.28kg , 75WHrs\r\nFree ASUS Backpack\r\n1 Year Nanotek Warranty\r\nGeniune Windows 11 Home 64Bit Pre-installed', 2640, 8, 3, 1, 2, '2024-09-12 17:32:15', 1, 1),
	(12, 2, 'Asus VivoBook S 16 Flip Core i9 2-IN-1 TP3604VA | Best for Business members ', 'Asus VivoBook S 16 Flip Core i9 2-IN-1 TP3604VA\r\nIntelÂ® Coreâ¢ i9-13900H (24M Cache, up to 5.40Hz, 14 Cores 20 Threads)\r\n16GB DDR4 3200Mhz\r\n16" IPS WUXGA (1920x1200) 300-Nits Touchscreen\r\nIntel Iris XE Graphics\r\n1TB NVMe PCIe Gen4x4 SSD\r\nBacklit Keyboard\r\n1.9 Kg , 50Whr\r\nFree Nanotek Laptop Backpack\r\n1 Year Nanotek Warranty\r\nGenuine Windows 11 Home 64Bit Pre-installed\r\n\r\nRam upgrade to 32GB - 15,000/=', 3990, 6, 4, 1, 2, '2024-09-13 07:08:52', 1, 1),
	(13, 6, 'GIGABYTE G5 MF5 2023 I7 13TH GEN RTX 4050 6GB', 'GIGABYTE G5 MF5 2024 I7 13TH GEN RTX 4050 6GB\r\nIntelÂ® Coreâ¢ i7-13620H 10 Core (24M Cache, up to 4.90 GHz)\r\n16GB DDR5 4800Mhz RAM\r\n512GB GEN4 NVME M.2 SSD\r\n15.6" 1080P 144Hz 45% NTSC\r\nNVIDIAÂ® GeForce RTX 4050 6GB GDDR6\r\nBacklit Keyboard with 15 Preset Colors\r\n2.08 kg, 54 WHr\r\nFree Nanotek Laptop Backpack\r\n2 Years Company warranty\r\nDOS\r\n\r\n32GB Ram Upgrade : 22,000/=\r\n\r\nStorage upgrades (Additional Slot Available)\r\nM.2 NVME Supported', 335000, 4, 3, 1, 7, '2024-09-15 11:04:52', 1, 3);

-- Dumping data for table macna_laptops.product_condition: ~2 rows (approximately)
DELETE FROM `product_condition`;
INSERT INTO `product_condition` (`id`, `name`) VALUES
	(1, 'Brand New'),
	(2, 'Used'),
	(3, 'Damaged');

-- Dumping data for table macna_laptops.product_status: ~2 rows (approximately)
DELETE FROM `product_status`;
INSERT INTO `product_status` (`id`, `name`) VALUES
	(1, 'In Stock'),
	(2, 'Out Stock'),
	(3, 'Pre Order');

-- Dumping data for table macna_laptops.storage: ~8 rows (approximately)
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

-- Dumping data for table macna_laptops.user: ~3 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`) VALUES
	(2, 'Ishara', 'Bandara', 'lakshithahitibandara@gmail.com', '11010001', 'verified'),
	(3, 'Tharaka', 'Lakshan', 'tharaka@gmail.com', '11010001', 'verified'),
	(7, 'John', 'Watson', 'ihpossibleideas@gmail.com', '11010001', 'verified');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
