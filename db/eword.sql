/*
 Navicat Premium Data Transfer

 Source Server         : 47.111.22.103
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 47.111.22.103:3306
 Source Schema         : eword

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/10/2019 21:54:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `cls` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `type` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES (2, 'admin', '', '', 'admin2019', 0);
INSERT INTO `account` VALUES (96, 'a', '20195101', '初12班', 'a', 1);
INSERT INTO `account` VALUES (147, 'b', '20190102', '初12班', 'b', 1);
INSERT INTO `account` VALUES (151, 'c', '20190103', '初12班', 'c', 1);
INSERT INTO `account` VALUES (152, 'd', '20191009', '六1班', 'd', 1);
INSERT INTO `account` VALUES (153, 'e', '20191009', '六1班', 'e', 1);
INSERT INTO `account` VALUES (154, 'f', '20191009', '六1班', 'f', 1);
INSERT INTO `account` VALUES (155, 'g', '20191009', '六1班', 'g', 1);
INSERT INTO `account` VALUES (156, 'h', '20191009', '六1班', 'h', 1);
INSERT INTO `account` VALUES (157, 'i', '20191009', '六1班', 'i', 1);
INSERT INTO `account` VALUES (158, 'j', '20191009', '六1班', 'j', 1);
COMMIT;

-- ----------------------------
-- Table structure for error
-- ----------------------------
DROP TABLE IF EXISTS `error`;
CREATE TABLE `error` (
  `id` int(11) NOT NULL,
  `err_name` varchar(255) DEFAULT NULL,
  `err_code` int(255) DEFAULT NULL,
  `err_type` int(255) DEFAULT NULL,
  `err_msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of error
-- ----------------------------
BEGIN;
INSERT INTO `error` VALUES (1, 'DATA_SUCC', 0, 0, NULL);
INSERT INTO `error` VALUES (2, 'USER_EXIST', 1, 101, '插入用户已存在');
INSERT INTO `error` VALUES (3, 'DATA_SUCC', 0, 100, '更新数据成功');
INSERT INTO `error` VALUES (4, 'DATA_SUCC', 0, 101, '插入数据成功');
INSERT INTO `error` VALUES (5, 'WORD_EXIST', 2, 101, '插入单词已存在');
COMMIT;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `createdate` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `imgfile` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of log
-- ----------------------------
BEGIN;
INSERT INTO `log` VALUES (56, '20195101-20191008015525', '2019-10-08 01:55:25', '20195101', 'upload/upload_0e70ca144dfd3ff62f3a7eebf3fe3b7d.jpg');
INSERT INTO `log` VALUES (57, '20195101-20191008125831', '2019-10-08 12:58:31', '20195101', 'upload/upload_b7ca2c807610c5f397f1d366bf10076a.jpg');
INSERT INTO `log` VALUES (58, '20195101-20191008131731', '2019-10-08 13:17:31', '20195101', 'upload/upload_b5b7aad0c12fd0e2282e0a2c3fab5a0f.jpg');
INSERT INTO `log` VALUES (59, '20191009-20191009145748', '2019-10-09 14:57:48', '20191009', 'upload/upload_aad6ee3e0b21d9cbdcf3a6769b9319ac.jpg');
INSERT INTO `log` VALUES (60, '20191009-20191009151446', '2019-10-09 15:14:46', '20191009', 'upload/upload_2feb142fa7f0e9220cc2e6d13a3c79f6.jpg');
INSERT INTO `log` VALUES (61, '20191009-20191009151858', '2019-10-09 15:18:58', '20191009', 'upload/upload_8d70b620942a840fce573778f88991c2.jpg');
INSERT INTO `log` VALUES (62, '20190103-20191009152352', '2019-10-09 15:23:52', '20190103', 'upload/upload_62adf555fcb4362bc6cb3c60f6a2e7e5.jpg');
INSERT INTO `log` VALUES (63, '20190103-20191009152354', '2019-10-09 15:23:54', '20190103', 'upload/upload_e5142c0a3c366d52374ae7435f55ff0b.jpg');
INSERT INTO `log` VALUES (64, '20191009-20191010061949', '2019-10-10 06:19:49', '20191009', 'upload/upload_4b3754b5542c0296ee6368c8f97abe1b.jpg');
INSERT INTO `log` VALUES (65, '20191009-20191010182128', '2019-10-10 18:21:28', '20191009', 'upload/upload_15f69dea90b6fa018de71a77951ea51b.jpg');
INSERT INTO `log` VALUES (66, '20190103-20191010222235', '2019-10-10 22:22:35', '20190103', 'upload/upload_6d8d66097c7197a7ebb70884ad601ac3.jpg');
COMMIT;

-- ----------------------------
-- Table structure for log_detail
-- ----------------------------
DROP TABLE IF EXISTS `log_detail`;
CREATE TABLE `log_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `createtime` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `item_id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `item_lv` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `data` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `log_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2091 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of log_detail
-- ----------------------------
BEGIN;
INSERT INTO `log_detail` VALUES (1462, 'select', '2019-10-08 09:55:06', '1', '1', 'Tomato', 56);
INSERT INTO `log_detail` VALUES (1463, 'add', '2019-10-08 09:55:06', '1-1', '2', '', 56);
INSERT INTO `log_detail` VALUES (1464, 'select', '2019-10-08 09:55:08', '1-1', '2', 'Ice-cream', 56);
INSERT INTO `log_detail` VALUES (1465, 'add', '2019-10-08 09:55:08', '1-2', '2', '', 56);
INSERT INTO `log_detail` VALUES (1466, 'add', '2019-10-08 09:55:09', '1-3', '2', '', 56);
INSERT INTO `log_detail` VALUES (1467, 'select', '2019-10-08 09:55:10', '1-2', '2', 'Hamburger', 56);
INSERT INTO `log_detail` VALUES (1468, 'select', '2019-10-08 09:55:11', '1-3', '2', 'Salad', 56);
INSERT INTO `log_detail` VALUES (1469, 'add', '2019-10-08 09:55:12', '1-2-1', '3', '', 56);
INSERT INTO `log_detail` VALUES (1470, 'select', '2019-10-08 09:55:13', '1-2-1', '3', 'Banana', 56);
INSERT INTO `log_detail` VALUES (1471, 'add', '2019-10-08 09:55:14', '1-2-2', '3', '', 56);
INSERT INTO `log_detail` VALUES (1472, 'select', '2019-10-08 09:55:16', '1-2-2', '3', 'Pewf', 56);
INSERT INTO `log_detail` VALUES (1473, 'add', '2019-10-08 09:55:20', '1-2-1-1', '4', '', 56);
INSERT INTO `log_detail` VALUES (1474, 'select', '2019-10-08 09:55:21', '1-2-1-1', '4', 'Iceeee', 56);
INSERT INTO `log_detail` VALUES (1475, 'select', '2019-10-08 20:57:52', '1', '1', 'Banana', 57);
INSERT INTO `log_detail` VALUES (1476, 'add', '2019-10-08 20:57:52', '1-1', '2', '', 57);
INSERT INTO `log_detail` VALUES (1477, 'select', '2019-10-08 20:57:54', '1-1', '2', 'Beef', 57);
INSERT INTO `log_detail` VALUES (1478, 'add', '2019-10-08 20:57:54', '1-2', '2', '', 57);
INSERT INTO `log_detail` VALUES (1479, 'select', '2019-10-08 20:57:56', '1-2', '2', 'Breakfast', 57);
INSERT INTO `log_detail` VALUES (1480, 'add', '2019-10-08 20:57:57', '1-1-1', '3', '', 57);
INSERT INTO `log_detail` VALUES (1481, 'select', '2019-10-08 20:57:58', '1-1-1', '3', 'Bread', 57);
INSERT INTO `log_detail` VALUES (1482, 'add', '2019-10-08 20:57:59', '1-1-1-1', '4', '', 57);
INSERT INTO `log_detail` VALUES (1483, 'select', '2019-10-08 20:58:01', '1-1-1-1', '4', 'Chicken', 57);
INSERT INTO `log_detail` VALUES (1484, 'add', '2019-10-08 20:58:01', '1-2-1', '3', '', 57);
INSERT INTO `log_detail` VALUES (1485, 'select', '2019-10-08 20:58:03', '1-2-1', '3', 'Dinner', 57);
INSERT INTO `log_detail` VALUES (1486, 'change', '2019-10-08 20:58:05', '1-1', '2', 'Salad', 57);
INSERT INTO `log_detail` VALUES (1487, 'add', '2019-10-08 20:58:06', '1-1-2', '3', '', 57);
INSERT INTO `log_detail` VALUES (1488, 'select', '2019-10-08 20:58:09', '1-1-2', '3', 'Pork', 57);
INSERT INTO `log_detail` VALUES (1489, 'add', '2019-10-08 20:58:10', '1-1-2-1', '4', '', 57);
INSERT INTO `log_detail` VALUES (1490, 'select', '2019-10-08 20:58:12', '1-1-2-1', '4', 'Tomato', 57);
INSERT INTO `log_detail` VALUES (1491, 'add', '2019-10-08 20:58:12', '1-1-2-2', '4', '', 57);
INSERT INTO `log_detail` VALUES (1492, 'select', '2019-10-08 20:58:16', '1-1-2-2', '4', 'Sandwich', 57);
INSERT INTO `log_detail` VALUES (1493, 'add', '2019-10-08 20:58:18', '1-2-2', '3', '', 57);
INSERT INTO `log_detail` VALUES (1494, 'select', '2019-10-08 20:58:22', '1-2-2', '3', 'Yogurt', 57);
INSERT INTO `log_detail` VALUES (1495, 'add', '2019-10-08 20:58:25', '1-1-2-2-1', '5', '', 57);
INSERT INTO `log_detail` VALUES (1496, 'select', '2019-10-08 20:58:27', '1-1-2-2-1', '5', 'Meat', 57);
INSERT INTO `log_detail` VALUES (1497, 'select', '2019-10-08 21:17:04', '1', '1', 'French fries', 58);
INSERT INTO `log_detail` VALUES (1498, 'add', '2019-10-08 21:17:05', '1-1', '2', '', 58);
INSERT INTO `log_detail` VALUES (1499, 'select', '2019-10-08 21:17:07', '1-1', '2', 'Fat', 58);
INSERT INTO `log_detail` VALUES (1500, 'add', '2019-10-08 21:17:08', '1-2', '2', '', 58);
INSERT INTO `log_detail` VALUES (1501, 'select', '2019-10-08 21:17:10', '1-2', '2', 'Fish', 58);
INSERT INTO `log_detail` VALUES (1502, 'add', '2019-10-08 21:17:11', '1-3', '2', '', 58);
INSERT INTO `log_detail` VALUES (1503, 'select', '2019-10-08 21:17:13', '1-3', '2', 'Hamburger', 58);
INSERT INTO `log_detail` VALUES (1504, 'del', '2019-10-08 21:17:14', '1-1', '2', 'Fat', 58);
INSERT INTO `log_detail` VALUES (1505, 'add', '2019-10-08 21:17:15', '1-1-1', '3', '', 58);
INSERT INTO `log_detail` VALUES (1506, 'select', '2019-10-08 21:17:17', '1-1-1', '3', 'Grape', 58);
INSERT INTO `log_detail` VALUES (1507, 'add', '2019-10-08 21:17:18', '1-1-2', '3', '', 58);
INSERT INTO `log_detail` VALUES (1508, 'select', '2019-10-08 21:17:20', '1-1-2', '3', 'Juice', 58);
INSERT INTO `log_detail` VALUES (1509, 'add', '2019-10-08 21:17:22', '1-1-3', '3', '', 58);
INSERT INTO `log_detail` VALUES (1510, 'select', '2019-10-08 21:17:24', '1-1-3', '3', 'Food', 58);
INSERT INTO `log_detail` VALUES (1511, 'add', '2019-10-09 22:57:34', '1-1', '2', '', 59);
INSERT INTO `log_detail` VALUES (1512, 'select', '2019-10-09 23:04:50', '1', '1', 'Food', 60);
INSERT INTO `log_detail` VALUES (1513, 'add', '2019-10-09 23:04:57', '1-1', '2', '', 60);
INSERT INTO `log_detail` VALUES (1514, 'select', '2019-10-09 23:05:04', '1-1', '2', 'Fruit', 60);
INSERT INTO `log_detail` VALUES (1515, 'add', '2019-10-09 23:05:06', '1-1-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1516, 'add', '2019-10-09 23:05:07', '1-1-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1517, 'add', '2019-10-09 23:05:07', '1-1-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1518, 'add', '2019-10-09 23:05:07', '1-1-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1519, 'select', '2019-10-09 23:05:11', '1-1-1', '3', 'Apple', 60);
INSERT INTO `log_detail` VALUES (1520, 'select', '2019-10-09 23:05:20', '1-1-2', '3', 'Banana', 60);
INSERT INTO `log_detail` VALUES (1521, 'select', '2019-10-09 23:05:26', '1-1-3', '3', 'Cherry', 60);
INSERT INTO `log_detail` VALUES (1522, 'select', '2019-10-09 23:05:33', '1-1-4', '3', 'Grape', 60);
INSERT INTO `log_detail` VALUES (1523, 'add', '2019-10-09 23:05:35', '1-1-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1524, 'add', '2019-10-09 23:05:35', '1-1-6', '3', '', 60);
INSERT INTO `log_detail` VALUES (1525, 'select', '2019-10-09 23:05:42', '1-1-5', '3', 'Lemon', 60);
INSERT INTO `log_detail` VALUES (1526, 'select', '2019-10-09 23:05:53', '1-1-6', '3', 'Pear', 60);
INSERT INTO `log_detail` VALUES (1527, 'add', '2019-10-09 23:05:55', '1-1-7', '3', '', 60);
INSERT INTO `log_detail` VALUES (1528, 'select', '2019-10-09 23:06:00', '1-1-7', '3', 'Watermelon', 60);
INSERT INTO `log_detail` VALUES (1529, 'add', '2019-10-09 23:06:01', '1-1-8', '3', '', 60);
INSERT INTO `log_detail` VALUES (1530, 'select', '2019-10-09 23:06:09', '1-1-8', '3', 'Strawberry', 60);
INSERT INTO `log_detail` VALUES (1531, 'add', '2019-10-09 23:06:10', '1-1-9', '3', '', 60);
INSERT INTO `log_detail` VALUES (1532, 'add', '2019-10-09 23:06:10', '1-1-10', '3', '', 60);
INSERT INTO `log_detail` VALUES (1533, 'del', '2019-10-09 23:06:39', '1-1-10', '3', '', 60);
INSERT INTO `log_detail` VALUES (1534, 'del', '2019-10-09 23:06:40', '1-1-9', '3', '', 60);
INSERT INTO `log_detail` VALUES (1535, 'add', '2019-10-09 23:06:41', '1-2', '2', '', 60);
INSERT INTO `log_detail` VALUES (1536, 'select', '2019-10-09 23:06:48', '1-2', '2', 'Meal', 60);
INSERT INTO `log_detail` VALUES (1537, 'add', '2019-10-09 23:06:50', '1-2-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1538, 'add', '2019-10-09 23:06:51', '1-2-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1539, 'select', '2019-10-09 23:06:54', '1-2-1', '3', 'Breakfast', 60);
INSERT INTO `log_detail` VALUES (1540, 'select', '2019-10-09 23:07:02', '1-2-2', '3', 'Lunch', 60);
INSERT INTO `log_detail` VALUES (1541, 'add', '2019-10-09 23:07:03', '1-2-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1542, 'select', '2019-10-09 23:07:07', '1-2-3', '3', 'Dinner', 60);
INSERT INTO `log_detail` VALUES (1543, 'add', '2019-10-09 23:07:09', '1-2-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1544, 'select', '2019-10-09 23:07:15', '1-2-4', '3', 'Dessert', 60);
INSERT INTO `log_detail` VALUES (1545, 'add', '2019-10-09 23:07:17', '1-2-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1546, 'del', '2019-10-09 23:07:29', '1-2-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1547, 'add', '2019-10-09 23:07:30', '1-3', '2', '', 60);
INSERT INTO `log_detail` VALUES (1548, 'select', '2019-10-09 23:07:56', '1-3', '2', 'Vegetable', 60);
INSERT INTO `log_detail` VALUES (1549, 'add', '2019-10-09 23:07:57', '1-3-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1550, 'add', '2019-10-09 23:07:57', '1-3-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1551, 'add', '2019-10-09 23:07:59', '1-3-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1552, 'add', '2019-10-09 23:07:59', '1-3-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1553, 'select', '2019-10-09 23:08:05', '1-3-1', '3', 'Tomato', 60);
INSERT INTO `log_detail` VALUES (1554, 'select', '2019-10-09 23:08:17', '1-3-2', '3', 'Potato', 60);
INSERT INTO `log_detail` VALUES (1555, 'select', '2019-10-09 23:08:40', '1-3-3', '3', 'Carrot', 60);
INSERT INTO `log_detail` VALUES (1556, 'select', '2019-10-09 23:08:45', '1-3-4', '3', 'Cabbage', 60);
INSERT INTO `log_detail` VALUES (1557, 'add', '2019-10-09 23:08:48', '1-4', '2', '', 60);
INSERT INTO `log_detail` VALUES (1558, 'select', '2019-10-09 23:08:53', '1-4', '2', 'Meat', 60);
INSERT INTO `log_detail` VALUES (1559, 'add', '2019-10-09 23:08:54', '1-4-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1560, 'add', '2019-10-09 23:08:55', '1-4-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1561, 'add', '2019-10-09 23:08:55', '1-4-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1562, 'select', '2019-10-09 23:09:01', '1-4-1', '3', 'Egg', 60);
INSERT INTO `log_detail` VALUES (1563, 'select', '2019-10-09 23:09:08', '1-4-2', '3', 'Fish', 60);
INSERT INTO `log_detail` VALUES (1564, 'select', '2019-10-09 23:09:16', '1-4-3', '3', 'Beef', 60);
INSERT INTO `log_detail` VALUES (1565, 'add', '2019-10-09 23:09:17', '1-4-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1566, 'add', '2019-10-09 23:09:18', '1-4-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1567, 'add', '2019-10-09 23:09:33', '1-3-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1568, 'select', '2019-10-09 23:09:43', '1-3-5', '3', 'Onion', 60);
INSERT INTO `log_detail` VALUES (1569, 'select', '2019-10-09 23:09:47', '1-4-4', '3', 'Porridge', 60);
INSERT INTO `log_detail` VALUES (1570, 'add', '2019-10-09 23:10:11', '1-3-6', '3', '', 60);
INSERT INTO `log_detail` VALUES (1571, 'select', '2019-10-09 23:10:16', '1-3-6', '3', 'Lettuce', 60);
INSERT INTO `log_detail` VALUES (1572, 'add', '2019-10-09 23:10:18', '1-5', '2', '', 60);
INSERT INTO `log_detail` VALUES (1573, 'select', '2019-10-09 23:10:30', '1-5', '2', 'Drink', 60);
INSERT INTO `log_detail` VALUES (1574, 'add', '2019-10-09 23:10:31', '1-5-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1575, 'add', '2019-10-09 23:10:32', '1-5-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1576, 'add', '2019-10-09 23:10:34', '1-5-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1577, 'select', '2019-10-09 23:10:49', '1-5-1', '3', 'Juice', 60);
INSERT INTO `log_detail` VALUES (1578, 'select', '2019-10-09 23:10:53', '1-5-2', '3', 'Lemonade', 60);
INSERT INTO `log_detail` VALUES (1579, 'select', '2019-10-09 23:10:57', '1-5-3', '3', 'Milk', 60);
INSERT INTO `log_detail` VALUES (1580, 'add', '2019-10-09 23:10:58', '1-5-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1581, 'add', '2019-10-09 23:11:00', '1-5-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1582, 'select', '2019-10-09 23:11:05', '1-5-4', '3', 'Coffee', 60);
INSERT INTO `log_detail` VALUES (1583, 'select', '2019-10-09 23:11:24', '1-4-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1584, 'add', '2019-10-09 23:11:25', '1-4-6', '3', '', 60);
INSERT INTO `log_detail` VALUES (1585, 'change', '2019-10-09 23:11:32', '1-4-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1586, 'add', '2019-10-09 23:11:37', '1-4-7', '3', '', 60);
INSERT INTO `log_detail` VALUES (1587, 'select', '2019-10-09 23:11:43', '1-4-6', '3', 'Pork', 60);
INSERT INTO `log_detail` VALUES (1588, 'select', '2019-10-09 23:11:48', '1-4-7', '3', 'Chicken', 60);
INSERT INTO `log_detail` VALUES (1589, 'select', '2019-10-09 23:11:56', '1-5-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1590, 'add', '2019-10-09 23:12:01', '1-6', '2', '', 60);
INSERT INTO `log_detail` VALUES (1591, 'add', '2019-10-09 23:12:08', '1-5-6', '3', '', 60);
INSERT INTO `log_detail` VALUES (1592, 'select', '2019-10-09 23:12:12', '1-5-6', '3', 'Yogurt', 60);
INSERT INTO `log_detail` VALUES (1593, 'add', '2019-10-09 23:12:35', '1-4-8', '3', '', 60);
INSERT INTO `log_detail` VALUES (1594, 'select', '2019-10-09 23:12:38', '1-4-8', '3', 'Mutton', 60);
INSERT INTO `log_detail` VALUES (1595, 'select', '2019-10-09 23:12:46', '1-6', '2', '', 60);
INSERT INTO `log_detail` VALUES (1596, 'add', '2019-10-09 23:12:48', '1-6-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1597, 'add', '2019-10-09 23:12:49', '1-6-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1598, 'select', '2019-10-09 23:12:59', '1-6-1', '3', 'Ice-cream', 60);
INSERT INTO `log_detail` VALUES (1599, 'select', '2019-10-09 23:13:03', '1-6-2', '3', 'Hamburger', 60);
INSERT INTO `log_detail` VALUES (1600, 'add', '2019-10-09 23:13:05', '1-6-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1601, 'add', '2019-10-09 23:13:07', '1-6-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1602, 'select', '2019-10-09 23:13:11', '1-6-3', '3', 'French fries', 60);
INSERT INTO `log_detail` VALUES (1603, 'select', '2019-10-09 23:13:24', '1-6-4', '3', 'Fat', 60);
INSERT INTO `log_detail` VALUES (1604, 'add', '2019-10-09 23:13:27', '1-7', '2', '', 60);
INSERT INTO `log_detail` VALUES (1605, 'select', '2019-10-09 23:13:31', '1-7', '2', 'Healthy', 60);
INSERT INTO `log_detail` VALUES (1606, 'add', '2019-10-09 23:13:33', '1-7-1', '3', '', 60);
INSERT INTO `log_detail` VALUES (1607, 'add', '2019-10-09 23:13:36', '1-7-2', '3', '', 60);
INSERT INTO `log_detail` VALUES (1608, 'add', '2019-10-09 23:13:36', '1-7-3', '3', '', 60);
INSERT INTO `log_detail` VALUES (1609, 'select', '2019-10-09 23:13:43', '1-7-1', '3', 'Dumpling', 60);
INSERT INTO `log_detail` VALUES (1610, 'select', '2019-10-09 23:13:48', '1-7-2', '3', 'Noodle', 60);
INSERT INTO `log_detail` VALUES (1611, 'select', '2019-10-09 23:13:50', '1-7-3', '3', 'Porridge', 60);
INSERT INTO `log_detail` VALUES (1612, 'add', '2019-10-09 23:13:51', '1-7-4', '3', '', 60);
INSERT INTO `log_detail` VALUES (1613, 'add', '2019-10-09 23:13:52', '1-7-5', '3', '', 60);
INSERT INTO `log_detail` VALUES (1614, 'select', '2019-10-09 23:13:55', '1-7-4', '3', 'Rice', 60);
INSERT INTO `log_detail` VALUES (1615, 'select', '2019-10-09 23:14:00', '1-7-5', '3', 'Salad', 60);
INSERT INTO `log_detail` VALUES (1616, 'add', '2019-10-09 23:14:01', '1-7-6', '3', '', 60);
INSERT INTO `log_detail` VALUES (1617, 'select', '2019-10-09 23:14:04', '1-7-6', '3', 'Sandwich', 60);
INSERT INTO `log_detail` VALUES (1618, 'add', '2019-10-09 23:03:53', '1-1', '2', '', 61);
INSERT INTO `log_detail` VALUES (1619, 'select', '2019-10-09 23:04:05', '1', '1', 'Healthy', 61);
INSERT INTO `log_detail` VALUES (1620, 'add', '2019-10-09 23:04:07', '1-2', '2', '', 61);
INSERT INTO `log_detail` VALUES (1621, 'add', '2019-10-09 23:04:13', '1-1-1', '3', '', 61);
INSERT INTO `log_detail` VALUES (1622, 'add', '2019-10-09 23:04:17', '1-1-2', '3', '', 61);
INSERT INTO `log_detail` VALUES (1623, 'select', '2019-10-09 23:04:26', '1-1', '2', 'Food', 61);
INSERT INTO `log_detail` VALUES (1624, 'select', '2019-10-09 23:05:00', '1-2', '2', 'Breakfast', 61);
INSERT INTO `log_detail` VALUES (1625, 'add', '2019-10-09 23:05:02', '1-2-1', '3', '', 61);
INSERT INTO `log_detail` VALUES (1626, 'select', '2019-10-09 23:05:14', '1-2-1', '3', 'Lunch', 61);
INSERT INTO `log_detail` VALUES (1627, 'add', '2019-10-09 23:05:16', '1-2-1-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1628, 'select', '2019-10-09 23:05:29', '1-2-1-1', '4', 'Dinner', 61);
INSERT INTO `log_detail` VALUES (1629, 'add', '2019-10-09 23:05:37', '1-1-1-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1630, 'select', '2019-10-09 23:05:47', '1-1-1', '3', 'Drink', 61);
INSERT INTO `log_detail` VALUES (1631, 'select', '2019-10-09 23:06:02', '1-1-2', '3', 'Fruit', 61);
INSERT INTO `log_detail` VALUES (1632, 'add', '2019-10-09 23:06:04', '1-1-3', '3', '', 61);
INSERT INTO `log_detail` VALUES (1633, 'select', '2019-10-09 23:06:51', '1-1-3', '3', 'Vegetable', 61);
INSERT INTO `log_detail` VALUES (1634, 'add', '2019-10-09 23:06:55', '1-1-4', '3', '', 61);
INSERT INTO `log_detail` VALUES (1635, 'select', '2019-10-09 23:07:08', '1-1-4', '3', 'Meat', 61);
INSERT INTO `log_detail` VALUES (1636, 'add', '2019-10-09 23:07:18', '1-1-2-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1637, 'add', '2019-10-09 23:07:20', '1-1-2-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1638, 'select', '2019-10-09 23:07:27', '1-1-2-1', '4', 'Apple', 61);
INSERT INTO `log_detail` VALUES (1639, 'select', '2019-10-09 23:07:36', '1-1-2-2', '4', 'Banana', 61);
INSERT INTO `log_detail` VALUES (1640, 'add', '2019-10-09 23:07:38', '1-1-4-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1641, 'select', '2019-10-09 23:07:43', '1-1-4-1', '4', 'Beef', 61);
INSERT INTO `log_detail` VALUES (1642, 'add', '2019-10-09 23:07:50', '1-1-2-3', '4', '', 61);
INSERT INTO `log_detail` VALUES (1643, 'select', '2019-10-09 23:07:58', '1-1-2-3', '4', 'Cherry', 61);
INSERT INTO `log_detail` VALUES (1644, 'add', '2019-10-09 23:08:00', '1-1-2-4', '4', '', 61);
INSERT INTO `log_detail` VALUES (1645, 'select', '2019-10-09 23:08:11', '1-1-2-4', '4', 'Fish', 61);
INSERT INTO `log_detail` VALUES (1646, 'change', '2019-10-09 23:08:24', '1-1-2-4', '4', 'Lemonade', 61);
INSERT INTO `log_detail` VALUES (1647, 'change', '2019-10-09 23:08:28', '1-1-2-4', '4', 'Juice', 61);
INSERT INTO `log_detail` VALUES (1648, 'del', '2019-10-09 23:08:34', '1-1-2-4', '4', 'Juice', 61);
INSERT INTO `log_detail` VALUES (1649, 'add', '2019-10-09 23:08:36', '1-1-2-4', '4', '', 61);
INSERT INTO `log_detail` VALUES (1650, 'select', '2019-10-09 23:08:45', '1-1-2-4', '4', 'Lemon', 61);
INSERT INTO `log_detail` VALUES (1651, 'add', '2019-10-09 23:08:47', '1-1-3-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1652, 'select', '2019-10-09 23:08:53', '1-1-3-1', '4', 'Cabbage', 61);
INSERT INTO `log_detail` VALUES (1653, 'add', '2019-10-09 23:08:59', '1-1-3-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1654, 'select', '2019-10-09 23:09:04', '1-1-3-2', '4', 'Carrot', 61);
INSERT INTO `log_detail` VALUES (1655, 'add', '2019-10-09 23:09:06', '1-1-3-3', '4', '', 61);
INSERT INTO `log_detail` VALUES (1656, 'select', '2019-10-09 23:09:23', '1-1-3-3', '4', 'Lettuce', 61);
INSERT INTO `log_detail` VALUES (1657, 'add', '2019-10-09 23:09:24', '1-1-3-4', '4', '', 61);
INSERT INTO `log_detail` VALUES (1658, 'select', '2019-10-09 23:09:34', '1-1-3-4', '4', 'Onion', 61);
INSERT INTO `log_detail` VALUES (1659, 'add', '2019-10-09 23:09:36', '1-1-3-5', '4', '', 61);
INSERT INTO `log_detail` VALUES (1660, 'select', '2019-10-09 23:09:46', '1-1-3-5', '4', 'Potato', 61);
INSERT INTO `log_detail` VALUES (1661, 'add', '2019-10-09 23:09:48', '1-1-3-6', '4', '', 61);
INSERT INTO `log_detail` VALUES (1662, 'select', '2019-10-09 23:09:54', '1-1-3-6', '4', 'Salad', 61);
INSERT INTO `log_detail` VALUES (1663, 'add', '2019-10-09 23:10:00', '1-1-4-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1664, 'select', '2019-10-09 23:10:11', '1-1-4-2', '4', 'Fish', 61);
INSERT INTO `log_detail` VALUES (1665, 'add', '2019-10-09 23:10:13', '1-1-4-3', '4', '', 61);
INSERT INTO `log_detail` VALUES (1666, 'select', '2019-10-09 23:10:40', '1-1-4-3', '4', 'Mutton', 61);
INSERT INTO `log_detail` VALUES (1667, 'add', '2019-10-09 23:10:59', '1-1-4-4', '4', '', 61);
INSERT INTO `log_detail` VALUES (1668, 'select', '2019-10-09 23:11:07', '1-1-4-4', '4', 'Pork', 61);
INSERT INTO `log_detail` VALUES (1669, 'add', '2019-10-09 23:11:17', '1-2-2', '3', '', 61);
INSERT INTO `log_detail` VALUES (1670, 'add', '2019-10-09 23:11:27', '1-2-2-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1671, 'change', '2019-10-09 23:12:01', '1-2-1', '3', 'Pear', 61);
INSERT INTO `log_detail` VALUES (1672, 'del', '2019-10-09 23:12:03', '1-2', '2', 'Breakfast', 61);
INSERT INTO `log_detail` VALUES (1673, 'add', '2019-10-09 23:12:11', '1-2', '2', '', 61);
INSERT INTO `log_detail` VALUES (1674, 'select', '2019-10-09 23:12:26', '1-2', '2', 'Meal', 61);
INSERT INTO `log_detail` VALUES (1675, 'add', '2019-10-09 23:12:28', '1-2-1', '3', '', 61);
INSERT INTO `log_detail` VALUES (1676, 'add', '2019-10-09 23:12:30', '1-2-2', '3', '', 61);
INSERT INTO `log_detail` VALUES (1677, 'add', '2019-10-09 23:12:32', '1-2-3', '3', '', 61);
INSERT INTO `log_detail` VALUES (1678, 'add', '2019-10-09 23:12:35', '1-2-4', '3', '', 61);
INSERT INTO `log_detail` VALUES (1679, 'select', '2019-10-09 23:12:41', '1-2-1', '3', 'Breakfast', 61);
INSERT INTO `log_detail` VALUES (1680, 'select', '2019-10-09 23:12:54', '1-2-2', '3', 'Lunch', 61);
INSERT INTO `log_detail` VALUES (1681, 'select', '2019-10-09 23:13:09', '1-2-3', '3', 'Dinner', 61);
INSERT INTO `log_detail` VALUES (1682, 'select', '2019-10-09 23:13:20', '1-2-4', '3', 'Dessert', 61);
INSERT INTO `log_detail` VALUES (1683, 'add', '2019-10-09 23:13:22', '1-2-1-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1684, 'select', '2019-10-09 23:13:34', '1-1-1-1', '4', 'Lemonade', 61);
INSERT INTO `log_detail` VALUES (1685, 'add', '2019-10-09 23:13:36', '1-1-1-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1686, 'select', '2019-10-09 23:13:43', '1-1-1-2', '4', 'Juice', 61);
INSERT INTO `log_detail` VALUES (1687, 'add', '2019-10-09 23:13:44', '1-1-1-3', '4', '', 61);
INSERT INTO `log_detail` VALUES (1688, 'select', '2019-10-09 23:13:52', '1-1-1-3', '4', 'Milk', 61);
INSERT INTO `log_detail` VALUES (1689, 'add', '2019-10-09 23:14:03', '1-1-2-5', '4', '', 61);
INSERT INTO `log_detail` VALUES (1690, 'select', '2019-10-09 23:14:10', '1-1-2-5', '4', 'Grape', 61);
INSERT INTO `log_detail` VALUES (1691, 'add', '2019-10-09 23:14:20', '1-1-2-6', '4', '', 61);
INSERT INTO `log_detail` VALUES (1692, 'select', '2019-10-09 23:14:29', '1-1-2-6', '4', 'Strawberry', 61);
INSERT INTO `log_detail` VALUES (1693, 'add', '2019-10-09 23:14:31', '1-1-2-7', '4', '', 61);
INSERT INTO `log_detail` VALUES (1694, 'select', '2019-10-09 23:14:36', '1-1-2-7', '4', 'Watermelon', 61);
INSERT INTO `log_detail` VALUES (1695, 'add', '2019-10-09 23:14:38', '1-1-3-7', '4', '', 61);
INSERT INTO `log_detail` VALUES (1696, 'select', '2019-10-09 23:14:45', '1-1-3-7', '4', 'Tomato', 61);
INSERT INTO `log_detail` VALUES (1697, 'add', '2019-10-09 23:14:50', '1-1-1-4', '4', '', 61);
INSERT INTO `log_detail` VALUES (1698, 'select', '2019-10-09 23:14:56', '1-1-1-4', '4', 'Coffee', 61);
INSERT INTO `log_detail` VALUES (1699, 'add', '2019-10-09 23:15:01', '1-1-4-5', '4', '', 61);
INSERT INTO `log_detail` VALUES (1700, 'select', '2019-10-09 23:15:06', '1-1-4-5', '4', 'Chicken', 61);
INSERT INTO `log_detail` VALUES (1701, 'add', '2019-10-09 23:15:17', '1-1-2-8', '4', '', 61);
INSERT INTO `log_detail` VALUES (1702, 'select', '2019-10-09 23:15:24', '1-1-2-8', '4', 'Pear', 61);
INSERT INTO `log_detail` VALUES (1703, 'add', '2019-10-09 23:15:48', '1-1-4-6', '4', '', 61);
INSERT INTO `log_detail` VALUES (1704, 'select', '2019-10-09 23:15:55', '1-1-4-6', '4', 'Egg', 61);
INSERT INTO `log_detail` VALUES (1705, 'add', '2019-10-09 23:15:58', '1-2-1-1-1', '5', '', 61);
INSERT INTO `log_detail` VALUES (1706, 'select', '2019-10-09 23:16:04', '1-2-1-1', '4', 'Bread', 61);
INSERT INTO `log_detail` VALUES (1707, 'add', '2019-10-09 23:16:06', '1-2-1-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1708, 'select', '2019-10-09 23:16:11', '1-2-1-2', '4', 'Butter', 61);
INSERT INTO `log_detail` VALUES (1709, 'select', '2019-10-09 23:16:23', '1-2-1-1-1', '5', 'Dumpling', 61);
INSERT INTO `log_detail` VALUES (1710, 'del', '2019-10-09 23:16:24', '1-2-1-2', '4', 'Butter', 61);
INSERT INTO `log_detail` VALUES (1711, 'change', '2019-10-09 23:16:30', '1-2-1-1-1', '5', 'Sandwich', 61);
INSERT INTO `log_detail` VALUES (1712, 'add', '2019-10-09 23:16:33', '1-2-1-1-2', '5', '', 61);
INSERT INTO `log_detail` VALUES (1713, 'del', '2019-10-09 23:16:36', '1-2-1-1-2', '5', '', 61);
INSERT INTO `log_detail` VALUES (1714, 'add', '2019-10-09 23:16:37', '1-2-1-1-1-1', '6', '', 61);
INSERT INTO `log_detail` VALUES (1715, 'select', '2019-10-09 23:16:44', '1-2-1-1-1-1', '6', 'Butter', 61);
INSERT INTO `log_detail` VALUES (1716, 'add', '2019-10-09 23:16:48', '1-2-1-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1717, 'add', '2019-10-09 23:16:49', '1-2-1-2-1', '5', '', 61);
INSERT INTO `log_detail` VALUES (1718, 'select', '2019-10-09 23:16:58', '1-2-1-2', '4', 'Porridge', 61);
INSERT INTO `log_detail` VALUES (1719, 'add', '2019-10-09 23:17:06', '1-2-2-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1720, 'select', '2019-10-09 23:17:15', '1-2-2-1', '4', 'Rice', 61);
INSERT INTO `log_detail` VALUES (1721, 'add', '2019-10-09 23:17:18', '1-2-2-2', '4', '', 61);
INSERT INTO `log_detail` VALUES (1722, 'select', '2019-10-09 23:17:27', '1-2-2-2', '4', 'Hamburger', 61);
INSERT INTO `log_detail` VALUES (1723, 'add', '2019-10-09 23:17:29', '1-2-2-1-1', '5', '', 61);
INSERT INTO `log_detail` VALUES (1724, 'select', '2019-10-09 23:17:36', '1-2-2-1-1', '5', 'Noodle', 61);
INSERT INTO `log_detail` VALUES (1725, 'add', '2019-10-09 23:17:41', '1-2-2-2-1', '5', '', 61);
INSERT INTO `log_detail` VALUES (1726, 'select', '2019-10-09 23:17:46', '1-2-2-2-1', '5', 'French fries', 61);
INSERT INTO `log_detail` VALUES (1727, 'add', '2019-10-09 23:17:50', '1-2-3-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1728, 'select', '2019-10-09 23:17:58', '1-2-3-1', '4', 'Dumpling', 61);
INSERT INTO `log_detail` VALUES (1729, 'add', '2019-10-09 23:18:01', '1-2-4-1', '4', '', 61);
INSERT INTO `log_detail` VALUES (1730, 'select', '2019-10-09 23:18:09', '1-2-4-1', '4', 'Ice-cream', 61);
INSERT INTO `log_detail` VALUES (1731, 'add', '2019-10-09 23:18:17', '1-1-1-5', '4', '', 61);
INSERT INTO `log_detail` VALUES (1732, 'select', '2019-10-09 23:18:23', '1-1-1-5', '4', 'Yogurt', 61);
INSERT INTO `log_detail` VALUES (1733, 'add', '2019-10-09 23:18:32', '1-2-1-1-1-1-1', '7', '', 61);
INSERT INTO `log_detail` VALUES (1734, 'select', '2019-10-09 23:18:38', '1-2-1-1-1-1-1', '7', 'Cheese', 61);
INSERT INTO `log_detail` VALUES (1735, 'del', '2019-10-09 23:18:42', '1-2-1-2-1', '5', '', 61);
INSERT INTO `log_detail` VALUES (1736, 'add', '2019-10-09 23:03:48', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1737, 'select', '2019-10-09 23:04:25', '1', '1', 'Apple', 62);
INSERT INTO `log_detail` VALUES (1738, 'select', '2019-10-09 23:04:32', '1-1', '2', 'Bread', 62);
INSERT INTO `log_detail` VALUES (1739, 'add', '2019-10-09 23:04:37', '1-1-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1740, 'add', '2019-10-09 23:04:38', '1-1-1-1', '4', '', 62);
INSERT INTO `log_detail` VALUES (1741, 'select', '2019-10-09 23:04:57', '1-1-1', '3', 'Cabbage', 62);
INSERT INTO `log_detail` VALUES (1742, 'add', '2019-10-09 23:05:06', '1-1-1-1-1', '5', '', 62);
INSERT INTO `log_detail` VALUES (1743, 'select', '2019-10-09 23:05:11', '1-1-1-1', '4', 'Cheese', 62);
INSERT INTO `log_detail` VALUES (1744, 'add', '2019-10-09 23:05:16', '1-1-1-1-1-1', '6', '', 62);
INSERT INTO `log_detail` VALUES (1745, 'select', '2019-10-09 23:05:22', '1-1-1-1-1', '5', 'Banana', 62);
INSERT INTO `log_detail` VALUES (1746, 'add', '2019-10-09 23:05:39', '1-1-1-1-1-1-1', '7', '', 62);
INSERT INTO `log_detail` VALUES (1747, 'select', '2019-10-09 23:05:49', '1-1-1-1-1-1', '6', 'Dessert', 62);
INSERT INTO `log_detail` VALUES (1748, 'change', '2019-10-09 23:06:25', '1', '1', 'Hamburger', 62);
INSERT INTO `log_detail` VALUES (1749, 'change', '2019-10-09 23:06:32', '1', '1', 'Fish', 62);
INSERT INTO `log_detail` VALUES (1750, 'change', '2019-10-09 23:06:38', '1', '1', 'French fries', 62);
INSERT INTO `log_detail` VALUES (1751, 'change', '2019-10-09 23:06:45', '1', '1', 'Fish', 62);
INSERT INTO `log_detail` VALUES (1752, 'change', '2019-10-09 23:06:57', '1', '1', 'French fries', 62);
INSERT INTO `log_detail` VALUES (1753, 'change', '2019-10-09 23:07:04', '1', '1', 'Fish', 62);
INSERT INTO `log_detail` VALUES (1754, 'del', '2019-10-09 23:07:04', '1-1', '2', 'Breakfast', 62);
INSERT INTO `log_detail` VALUES (1755, 'add', '2019-10-09 23:07:08', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1756, 'add', '2019-10-09 23:07:23', '1-2', '2', '', 62);
INSERT INTO `log_detail` VALUES (1757, 'change', '2019-10-09 23:07:28', '1', '1', 'Drink', 62);
INSERT INTO `log_detail` VALUES (1758, 'del', '2019-10-09 23:07:30', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1759, 'del', '2019-10-09 23:07:31', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1760, 'change', '2019-10-09 23:07:39', '1', '1', 'Food', 62);
INSERT INTO `log_detail` VALUES (1761, 'add', '2019-10-09 23:07:41', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1762, 'add', '2019-10-09 23:07:45', '1-2', '2', '', 62);
INSERT INTO `log_detail` VALUES (1763, 'del', '2019-10-09 23:08:04', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1764, 'del', '2019-10-09 23:08:06', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1765, 'add', '2019-10-09 23:08:14', '1-1', '2', '', 62);
INSERT INTO `log_detail` VALUES (1766, 'add', '2019-10-09 23:08:17', '1-2', '2', '', 62);
INSERT INTO `log_detail` VALUES (1767, 'select', '2019-10-09 23:08:33', '1-1', '2', 'Fruit', 62);
INSERT INTO `log_detail` VALUES (1768, 'add', '2019-10-09 23:08:40', '1-1-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1769, 'add', '2019-10-09 23:08:45', '1-1-1-1', '4', '', 62);
INSERT INTO `log_detail` VALUES (1770, 'del', '2019-10-09 23:08:48', '1-1-1-1', '4', '', 62);
INSERT INTO `log_detail` VALUES (1771, 'add', '2019-10-09 23:08:50', '1-1-2', '3', '', 62);
INSERT INTO `log_detail` VALUES (1772, 'add', '2019-10-09 23:08:51', '1-1-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1773, 'select', '2019-10-09 23:09:03', '1-1-1', '3', 'Banana', 62);
INSERT INTO `log_detail` VALUES (1774, 'select', '2019-10-09 23:09:09', '1-1-2', '3', 'Banana', 62);
INSERT INTO `log_detail` VALUES (1775, 'select', '2019-10-09 23:09:31', '1-1-3', '3', 'Beef', 62);
INSERT INTO `log_detail` VALUES (1776, 'change', '2019-10-09 23:09:44', '1-1-3', '3', 'Dinner', 62);
INSERT INTO `log_detail` VALUES (1777, 'select', '2019-10-09 23:10:04', '1-2', '2', 'Dumpling', 62);
INSERT INTO `log_detail` VALUES (1778, 'change', '2019-10-09 23:10:11', '1-2', '2', 'Dessert', 62);
INSERT INTO `log_detail` VALUES (1779, 'add', '2019-10-09 23:10:13', '1-3', '2', '', 62);
INSERT INTO `log_detail` VALUES (1780, 'add', '2019-10-09 23:10:17', '1-4', '2', '', 62);
INSERT INTO `log_detail` VALUES (1781, 'select', '2019-10-09 23:10:26', '1-3', '2', 'Drink', 62);
INSERT INTO `log_detail` VALUES (1782, 'change', '2019-10-09 23:10:45', '1-1-3', '3', 'Lettuce', 62);
INSERT INTO `log_detail` VALUES (1783, 'change', '2019-10-09 23:10:49', '1-1-3', '3', 'Juice', 62);
INSERT INTO `log_detail` VALUES (1784, 'change', '2019-10-09 23:10:56', '1-1-3', '3', 'Lemonade', 62);
INSERT INTO `log_detail` VALUES (1785, 'change', '2019-10-09 23:11:00', '1-1-3', '3', 'Juice', 62);
INSERT INTO `log_detail` VALUES (1786, 'change', '2019-10-09 23:11:06', '1-1-3', '3', 'Lemonade', 62);
INSERT INTO `log_detail` VALUES (1787, 'change', '2019-10-09 23:11:10', '1-1-3', '3', 'Juice', 62);
INSERT INTO `log_detail` VALUES (1788, 'change', '2019-10-09 23:11:15', '1-1-3', '3', 'Lemonade', 62);
INSERT INTO `log_detail` VALUES (1789, 'change', '2019-10-09 23:11:24', '1-1-3', '3', 'Juice', 62);
INSERT INTO `log_detail` VALUES (1790, 'change', '2019-10-09 23:11:36', '1-1-3', '3', 'Lemonade', 62);
INSERT INTO `log_detail` VALUES (1791, 'change', '2019-10-09 23:11:57', '1-1-3', '3', 'Onion', 62);
INSERT INTO `log_detail` VALUES (1792, 'select', '2019-10-09 23:12:06', '1-4', '2', 'Watermelon', 62);
INSERT INTO `log_detail` VALUES (1793, 'change', '2019-10-09 23:12:10', '1-4', '2', 'Vegetable', 62);
INSERT INTO `log_detail` VALUES (1794, 'add', '2019-10-09 23:12:13', '1-2-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1795, 'add', '2019-10-09 23:12:19', '1-2-2', '3', '', 62);
INSERT INTO `log_detail` VALUES (1796, 'add', '2019-10-09 23:12:20', '1-3-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1797, 'add', '2019-10-09 23:12:21', '1-2-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1798, 'add', '2019-10-09 23:12:22', '1-2-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1799, 'select', '2019-10-09 23:12:34', '1-2-1', '3', 'Cheese', 62);
INSERT INTO `log_detail` VALUES (1800, 'select', '2019-10-09 23:12:53', '1-2-2', '3', 'Ice-cream', 62);
INSERT INTO `log_detail` VALUES (1801, 'select', '2019-10-09 23:13:14', '1-2-3', '3', 'Sandwich', 62);
INSERT INTO `log_detail` VALUES (1802, 'change', '2019-10-09 23:13:20', '1-2-3', '3', 'Salad', 62);
INSERT INTO `log_detail` VALUES (1803, 'select', '2019-10-09 23:13:24', '1-2-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1804, 'add', '2019-10-09 23:13:31', '1-2-5', '3', '', 62);
INSERT INTO `log_detail` VALUES (1805, 'del', '2019-10-09 23:13:34', '1-2-4', '3', 'null', 62);
INSERT INTO `log_detail` VALUES (1806, 'add', '2019-10-09 23:13:35', '1-2-5', '3', '', 62);
INSERT INTO `log_detail` VALUES (1807, 'select', '2019-10-09 23:13:45', '1-2-4', '3', 'Yogurt', 62);
INSERT INTO `log_detail` VALUES (1808, 'select', '2019-10-09 23:13:54', '1-2-5', '3', 'Watermelon', 62);
INSERT INTO `log_detail` VALUES (1809, 'change', '2019-10-09 23:13:56', '1-1-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1810, 'del', '2019-10-09 23:13:58', '1-1-3', '3', 'null', 62);
INSERT INTO `log_detail` VALUES (1811, 'add', '2019-10-09 23:14:00', '1-1-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1812, 'add', '2019-10-09 23:14:01', '1-1-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1813, 'add', '2019-10-09 23:14:05', '1-1-5', '3', '', 62);
INSERT INTO `log_detail` VALUES (1814, 'select', '2019-10-09 23:14:12', '1-1-3', '3', 'Strawberry', 62);
INSERT INTO `log_detail` VALUES (1815, 'select', '2019-10-09 23:14:17', '1-1-4', '3', 'Cherry', 62);
INSERT INTO `log_detail` VALUES (1816, 'add', '2019-10-09 23:14:23', '1-1-6', '3', '', 62);
INSERT INTO `log_detail` VALUES (1817, 'add', '2019-10-09 23:14:24', '1-1-7', '3', '', 62);
INSERT INTO `log_detail` VALUES (1818, 'add', '2019-10-09 23:14:25', '1-1-8', '3', '', 62);
INSERT INTO `log_detail` VALUES (1819, 'select', '2019-10-09 23:14:33', '1-1-5', '3', 'Grape', 62);
INSERT INTO `log_detail` VALUES (1820, 'select', '2019-10-09 23:14:45', '1-1-6', '3', 'Pear', 62);
INSERT INTO `log_detail` VALUES (1821, 'select', '2019-10-09 23:14:56', '1-1-7', '3', 'Lemon', 62);
INSERT INTO `log_detail` VALUES (1822, 'select', '2019-10-09 23:15:10', '1-1-8', '3', 'Bread', 62);
INSERT INTO `log_detail` VALUES (1823, 'del', '2019-10-09 23:15:15', '1-2-5', '3', 'Watermelon', 62);
INSERT INTO `log_detail` VALUES (1824, 'add', '2019-10-09 23:15:17', '1-1-9', '3', '', 62);
INSERT INTO `log_detail` VALUES (1825, 'change', '2019-10-09 23:15:29', '1-1-8', '3', 'Porridge', 62);
INSERT INTO `log_detail` VALUES (1826, 'del', '2019-10-09 23:15:32', '1-1-8', '3', 'Pork', 62);
INSERT INTO `log_detail` VALUES (1827, 'add', '2019-10-09 23:15:37', '1-5', '2', '', 62);
INSERT INTO `log_detail` VALUES (1828, 'select', '2019-10-09 23:15:47', '1-5', '2', 'Meat', 62);
INSERT INTO `log_detail` VALUES (1829, 'add', '2019-10-09 23:15:48', '1-5-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1830, 'add', '2019-10-09 23:15:52', '1-4-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1831, 'add', '2019-10-09 23:15:53', '1-4-2', '3', '', 62);
INSERT INTO `log_detail` VALUES (1832, 'add', '2019-10-09 23:15:55', '1-4-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1833, 'add', '2019-10-09 23:15:57', '1-3-2', '3', '', 62);
INSERT INTO `log_detail` VALUES (1834, 'add', '2019-10-09 23:15:58', '1-3-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1835, 'add', '2019-10-09 23:15:59', '1-3-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1836, 'select', '2019-10-09 23:16:13', '1-3-2', '3', 'Coffee', 62);
INSERT INTO `log_detail` VALUES (1837, 'select', '2019-10-09 23:16:24', '1-3-1', '3', 'Lemonade', 62);
INSERT INTO `log_detail` VALUES (1838, 'change', '2019-10-09 23:16:28', '1-3-1', '3', 'Juice', 62);
INSERT INTO `log_detail` VALUES (1839, 'select', '2019-10-09 23:16:49', '1-3-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1840, 'change', '2019-10-09 23:16:59', '1-2-1', '3', 'Breakfast', 62);
INSERT INTO `log_detail` VALUES (1841, 'select', '2019-10-09 23:17:02', '1-1-8', '3', 'Watermelon', 62);
INSERT INTO `log_detail` VALUES (1842, 'del', '2019-10-09 23:17:12', '1-3-3', '3', 'null', 62);
INSERT INTO `log_detail` VALUES (1843, 'add', '2019-10-09 23:17:14', '1-3-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1844, 'select', '2019-10-09 23:17:21', '1-3-3', '3', 'Onion', 62);
INSERT INTO `log_detail` VALUES (1845, 'del', '2019-10-09 23:17:23', '1-3-3', '3', 'Onion', 62);
INSERT INTO `log_detail` VALUES (1846, 'del', '2019-10-09 23:17:24', '1-3-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1847, 'add', '2019-10-09 23:17:39', '1-4-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1848, 'add', '2019-10-09 23:17:40', '1-4-5', '3', '', 62);
INSERT INTO `log_detail` VALUES (1849, 'add', '2019-10-09 23:17:41', '1-4-6', '3', '', 62);
INSERT INTO `log_detail` VALUES (1850, 'select', '2019-10-09 23:17:47', '1-4-1', '3', 'Cabbage', 62);
INSERT INTO `log_detail` VALUES (1851, 'select', '2019-10-09 23:17:51', '1-4-2', '3', 'Chicken', 62);
INSERT INTO `log_detail` VALUES (1852, 'change', '2019-10-09 23:17:54', '1-4-2', '3', 'Carrot', 62);
INSERT INTO `log_detail` VALUES (1853, 'select', '2019-10-09 23:18:22', '1-4-3', '3', 'Lettuce', 62);
INSERT INTO `log_detail` VALUES (1854, 'add', '2019-10-09 23:18:22', '1-6', '2', '', 62);
INSERT INTO `log_detail` VALUES (1855, 'add', '2019-10-09 23:18:25', '1-7', '2', '', 62);
INSERT INTO `log_detail` VALUES (1856, 'add', '2019-10-09 23:18:35', '1-3-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1857, 'del', '2019-10-09 23:18:37', '1-3-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1858, 'select', '2019-10-09 23:19:11', '1-4-4', '3', 'Tomato', 62);
INSERT INTO `log_detail` VALUES (1859, 'select', '2019-10-09 23:19:17', '1-4-5', '3', 'Onion', 62);
INSERT INTO `log_detail` VALUES (1860, 'select', '2019-10-09 23:19:21', '1-4-6', '3', 'Rice', 62);
INSERT INTO `log_detail` VALUES (1861, 'add', '2019-10-09 23:19:23', '1-4-7', '3', '', 62);
INSERT INTO `log_detail` VALUES (1862, 'add', '2019-10-09 23:19:27', '1-4-8', '3', '', 62);
INSERT INTO `log_detail` VALUES (1863, 'select', '2019-10-09 23:19:49', '1-4-7', '3', 'Milk', 62);
INSERT INTO `log_detail` VALUES (1864, 'del', '2019-10-09 23:19:56', '1-4-7', '3', 'Milk', 62);
INSERT INTO `log_detail` VALUES (1865, 'add', '2019-10-09 23:19:58', '1-2-5', '3', '', 62);
INSERT INTO `log_detail` VALUES (1866, 'add', '2019-10-09 23:20:02', '1-2-6', '3', '', 62);
INSERT INTO `log_detail` VALUES (1867, 'select', '2019-10-09 23:20:07', '1-2-5', '3', 'Milk', 62);
INSERT INTO `log_detail` VALUES (1868, 'del', '2019-10-09 23:20:09', '1-2-6', '3', '', 62);
INSERT INTO `log_detail` VALUES (1869, 'select', '2019-10-09 23:20:19', '1-5-1', '3', 'Beef', 62);
INSERT INTO `log_detail` VALUES (1870, 'add', '2019-10-09 23:20:21', '1-5-2', '3', '', 62);
INSERT INTO `log_detail` VALUES (1871, 'add', '2019-10-09 23:20:22', '1-5-3', '3', '', 62);
INSERT INTO `log_detail` VALUES (1872, 'add', '2019-10-09 23:20:23', '1-5-4', '3', '', 62);
INSERT INTO `log_detail` VALUES (1873, 'select', '2019-10-09 23:20:31', '1-5-2', '3', 'Chicken', 62);
INSERT INTO `log_detail` VALUES (1874, 'select', '2019-10-09 23:20:35', '1-5-3', '3', 'Dinner', 62);
INSERT INTO `log_detail` VALUES (1875, 'change', '2019-10-09 23:20:39', '1-5-3', '3', 'Chicken', 62);
INSERT INTO `log_detail` VALUES (1876, 'select', '2019-10-09 23:20:47', '1-5-4', '3', 'Hamburger', 62);
INSERT INTO `log_detail` VALUES (1877, 'change', '2019-10-09 23:20:51', '1-5-4', '3', 'Fish', 62);
INSERT INTO `log_detail` VALUES (1878, 'add', '2019-10-09 23:20:52', '1-5-5', '3', '', 62);
INSERT INTO `log_detail` VALUES (1879, 'add', '2019-10-09 23:20:53', '1-5-6', '3', '', 62);
INSERT INTO `log_detail` VALUES (1880, 'select', '2019-10-09 23:21:03', '1-5-5', '3', 'Pork', 62);
INSERT INTO `log_detail` VALUES (1881, 'select', '2019-10-09 23:21:09', '1-5-6', '3', 'Mutton', 62);
INSERT INTO `log_detail` VALUES (1882, 'add', '2019-10-09 23:21:10', '1-5-7', '3', '', 62);
INSERT INTO `log_detail` VALUES (1883, 'add', '2019-10-09 23:21:14', '1-5-8', '3', '', 62);
INSERT INTO `log_detail` VALUES (1884, 'select', '2019-10-09 23:21:22', '1-5-7', '3', 'French fries', 62);
INSERT INTO `log_detail` VALUES (1885, 'del', '2019-10-09 23:21:24', '1-5-7', '3', 'French fries', 62);
INSERT INTO `log_detail` VALUES (1886, 'del', '2019-10-09 23:21:25', '1-5-7', '3', '', 62);
INSERT INTO `log_detail` VALUES (1887, 'select', '2019-10-09 23:21:33', '1-6', '2', 'Healthy', 62);
INSERT INTO `log_detail` VALUES (1888, 'select', '2019-10-09 23:21:38', '1-7', '2', '', 62);
INSERT INTO `log_detail` VALUES (1889, 'add', '2019-10-09 23:21:39', '1-7-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1890, 'del', '2019-10-09 23:21:41', '1-7', '2', 'null', 62);
INSERT INTO `log_detail` VALUES (1891, 'add', '2019-10-09 23:21:44', '1-7', '2', '', 62);
INSERT INTO `log_detail` VALUES (1892, 'change', '2019-10-09 23:21:56', '1-6', '2', 'Unhealthy', 62);
INSERT INTO `log_detail` VALUES (1893, 'select', '2019-10-09 23:22:04', '1-7', '2', 'Egg', 62);
INSERT INTO `log_detail` VALUES (1894, 'add', '2019-10-09 23:22:04', '1-7-1', '3', '', 62);
INSERT INTO `log_detail` VALUES (1895, 'del', '2019-10-09 23:22:07', '1-7', '2', 'Egg', 62);
INSERT INTO `log_detail` VALUES (1896, 'add', '2019-10-09 23:22:11', '1-7', '2', '', 62);
INSERT INTO `log_detail` VALUES (1897, 'add', '2019-10-09 23:03:48', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1898, 'select', '2019-10-09 23:04:25', '1', '1', 'Apple', 63);
INSERT INTO `log_detail` VALUES (1899, 'select', '2019-10-09 23:04:32', '1-1', '2', 'Bread', 63);
INSERT INTO `log_detail` VALUES (1900, 'add', '2019-10-09 23:04:37', '1-1-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (1901, 'add', '2019-10-09 23:04:38', '1-1-1-1', '4', '', 63);
INSERT INTO `log_detail` VALUES (1902, 'select', '2019-10-09 23:04:57', '1-1-1', '3', 'Cabbage', 63);
INSERT INTO `log_detail` VALUES (1903, 'add', '2019-10-09 23:05:06', '1-1-1-1-1', '5', '', 63);
INSERT INTO `log_detail` VALUES (1904, 'select', '2019-10-09 23:05:11', '1-1-1-1', '4', 'Cheese', 63);
INSERT INTO `log_detail` VALUES (1905, 'add', '2019-10-09 23:05:16', '1-1-1-1-1-1', '6', '', 63);
INSERT INTO `log_detail` VALUES (1906, 'select', '2019-10-09 23:05:22', '1-1-1-1-1', '5', 'Banana', 63);
INSERT INTO `log_detail` VALUES (1907, 'add', '2019-10-09 23:05:39', '1-1-1-1-1-1-1', '7', '', 63);
INSERT INTO `log_detail` VALUES (1908, 'select', '2019-10-09 23:05:49', '1-1-1-1-1-1', '6', 'Dessert', 63);
INSERT INTO `log_detail` VALUES (1909, 'change', '2019-10-09 23:06:25', '1', '1', 'Hamburger', 63);
INSERT INTO `log_detail` VALUES (1910, 'change', '2019-10-09 23:06:32', '1', '1', 'Fish', 63);
INSERT INTO `log_detail` VALUES (1911, 'change', '2019-10-09 23:06:38', '1', '1', 'French fries', 63);
INSERT INTO `log_detail` VALUES (1912, 'change', '2019-10-09 23:06:45', '1', '1', 'Fish', 63);
INSERT INTO `log_detail` VALUES (1913, 'change', '2019-10-09 23:06:57', '1', '1', 'French fries', 63);
INSERT INTO `log_detail` VALUES (1914, 'change', '2019-10-09 23:07:04', '1', '1', 'Fish', 63);
INSERT INTO `log_detail` VALUES (1915, 'del', '2019-10-09 23:07:04', '1-1', '2', 'Breakfast', 63);
INSERT INTO `log_detail` VALUES (1916, 'add', '2019-10-09 23:07:08', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1917, 'add', '2019-10-09 23:07:23', '1-2', '2', '', 63);
INSERT INTO `log_detail` VALUES (1918, 'change', '2019-10-09 23:07:28', '1', '1', 'Drink', 63);
INSERT INTO `log_detail` VALUES (1919, 'del', '2019-10-09 23:07:30', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1920, 'del', '2019-10-09 23:07:31', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1921, 'change', '2019-10-09 23:07:39', '1', '1', 'Food', 63);
INSERT INTO `log_detail` VALUES (1922, 'add', '2019-10-09 23:07:41', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1923, 'add', '2019-10-09 23:07:45', '1-2', '2', '', 63);
INSERT INTO `log_detail` VALUES (1924, 'del', '2019-10-09 23:08:04', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1925, 'del', '2019-10-09 23:08:06', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1926, 'add', '2019-10-09 23:08:14', '1-1', '2', '', 63);
INSERT INTO `log_detail` VALUES (1927, 'add', '2019-10-09 23:08:17', '1-2', '2', '', 63);
INSERT INTO `log_detail` VALUES (1928, 'select', '2019-10-09 23:08:33', '1-1', '2', 'Fruit', 63);
INSERT INTO `log_detail` VALUES (1929, 'add', '2019-10-09 23:08:40', '1-1-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (1930, 'add', '2019-10-09 23:08:45', '1-1-1-1', '4', '', 63);
INSERT INTO `log_detail` VALUES (1931, 'del', '2019-10-09 23:08:48', '1-1-1-1', '4', '', 63);
INSERT INTO `log_detail` VALUES (1932, 'add', '2019-10-09 23:08:50', '1-1-2', '3', '', 63);
INSERT INTO `log_detail` VALUES (1933, 'add', '2019-10-09 23:08:51', '1-1-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (1934, 'select', '2019-10-09 23:09:03', '1-1-1', '3', 'Banana', 63);
INSERT INTO `log_detail` VALUES (1935, 'select', '2019-10-09 23:09:09', '1-1-2', '3', 'Banana', 63);
INSERT INTO `log_detail` VALUES (1936, 'select', '2019-10-09 23:09:31', '1-1-3', '3', 'Beef', 63);
INSERT INTO `log_detail` VALUES (1937, 'change', '2019-10-09 23:09:44', '1-1-3', '3', 'Dinner', 63);
INSERT INTO `log_detail` VALUES (1938, 'select', '2019-10-09 23:10:04', '1-2', '2', 'Dumpling', 63);
INSERT INTO `log_detail` VALUES (1939, 'change', '2019-10-09 23:10:11', '1-2', '2', 'Dessert', 63);
INSERT INTO `log_detail` VALUES (1940, 'add', '2019-10-09 23:10:13', '1-3', '2', '', 63);
INSERT INTO `log_detail` VALUES (1941, 'add', '2019-10-09 23:10:17', '1-4', '2', '', 63);
INSERT INTO `log_detail` VALUES (1942, 'select', '2019-10-09 23:10:26', '1-3', '2', 'Drink', 63);
INSERT INTO `log_detail` VALUES (1943, 'change', '2019-10-09 23:10:45', '1-1-3', '3', 'Lettuce', 63);
INSERT INTO `log_detail` VALUES (1944, 'change', '2019-10-09 23:10:49', '1-1-3', '3', 'Juice', 63);
INSERT INTO `log_detail` VALUES (1945, 'change', '2019-10-09 23:10:56', '1-1-3', '3', 'Lemonade', 63);
INSERT INTO `log_detail` VALUES (1946, 'change', '2019-10-09 23:11:00', '1-1-3', '3', 'Juice', 63);
INSERT INTO `log_detail` VALUES (1947, 'change', '2019-10-09 23:11:06', '1-1-3', '3', 'Lemonade', 63);
INSERT INTO `log_detail` VALUES (1948, 'change', '2019-10-09 23:11:10', '1-1-3', '3', 'Juice', 63);
INSERT INTO `log_detail` VALUES (1949, 'change', '2019-10-09 23:11:15', '1-1-3', '3', 'Lemonade', 63);
INSERT INTO `log_detail` VALUES (1950, 'change', '2019-10-09 23:11:24', '1-1-3', '3', 'Juice', 63);
INSERT INTO `log_detail` VALUES (1951, 'change', '2019-10-09 23:11:36', '1-1-3', '3', 'Lemonade', 63);
INSERT INTO `log_detail` VALUES (1952, 'change', '2019-10-09 23:11:57', '1-1-3', '3', 'Onion', 63);
INSERT INTO `log_detail` VALUES (1953, 'select', '2019-10-09 23:12:06', '1-4', '2', 'Watermelon', 63);
INSERT INTO `log_detail` VALUES (1954, 'change', '2019-10-09 23:12:10', '1-4', '2', 'Vegetable', 63);
INSERT INTO `log_detail` VALUES (1955, 'add', '2019-10-09 23:12:13', '1-2-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (1956, 'add', '2019-10-09 23:12:19', '1-2-2', '3', '', 63);
INSERT INTO `log_detail` VALUES (1957, 'add', '2019-10-09 23:12:20', '1-3-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (1958, 'add', '2019-10-09 23:12:21', '1-2-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (1959, 'add', '2019-10-09 23:12:22', '1-2-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (1960, 'select', '2019-10-09 23:12:34', '1-2-1', '3', 'Cheese', 63);
INSERT INTO `log_detail` VALUES (1961, 'select', '2019-10-09 23:12:53', '1-2-2', '3', 'Ice-cream', 63);
INSERT INTO `log_detail` VALUES (1962, 'select', '2019-10-09 23:13:14', '1-2-3', '3', 'Sandwich', 63);
INSERT INTO `log_detail` VALUES (1963, 'change', '2019-10-09 23:13:20', '1-2-3', '3', 'Salad', 63);
INSERT INTO `log_detail` VALUES (1964, 'select', '2019-10-09 23:13:24', '1-2-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (1965, 'add', '2019-10-09 23:13:31', '1-2-5', '3', '', 63);
INSERT INTO `log_detail` VALUES (1966, 'del', '2019-10-09 23:13:34', '1-2-4', '3', 'null', 63);
INSERT INTO `log_detail` VALUES (1967, 'add', '2019-10-09 23:13:35', '1-2-5', '3', '', 63);
INSERT INTO `log_detail` VALUES (1968, 'select', '2019-10-09 23:13:45', '1-2-4', '3', 'Yogurt', 63);
INSERT INTO `log_detail` VALUES (1969, 'select', '2019-10-09 23:13:54', '1-2-5', '3', 'Watermelon', 63);
INSERT INTO `log_detail` VALUES (1970, 'change', '2019-10-09 23:13:56', '1-1-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (1971, 'del', '2019-10-09 23:13:58', '1-1-3', '3', 'null', 63);
INSERT INTO `log_detail` VALUES (1972, 'add', '2019-10-09 23:14:00', '1-1-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (1973, 'add', '2019-10-09 23:14:01', '1-1-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (1974, 'add', '2019-10-09 23:14:05', '1-1-5', '3', '', 63);
INSERT INTO `log_detail` VALUES (1975, 'select', '2019-10-09 23:14:12', '1-1-3', '3', 'Strawberry', 63);
INSERT INTO `log_detail` VALUES (1976, 'select', '2019-10-09 23:14:17', '1-1-4', '3', 'Cherry', 63);
INSERT INTO `log_detail` VALUES (1977, 'add', '2019-10-09 23:14:23', '1-1-6', '3', '', 63);
INSERT INTO `log_detail` VALUES (1978, 'add', '2019-10-09 23:14:24', '1-1-7', '3', '', 63);
INSERT INTO `log_detail` VALUES (1979, 'add', '2019-10-09 23:14:25', '1-1-8', '3', '', 63);
INSERT INTO `log_detail` VALUES (1980, 'select', '2019-10-09 23:14:33', '1-1-5', '3', 'Grape', 63);
INSERT INTO `log_detail` VALUES (1981, 'select', '2019-10-09 23:14:45', '1-1-6', '3', 'Pear', 63);
INSERT INTO `log_detail` VALUES (1982, 'select', '2019-10-09 23:14:56', '1-1-7', '3', 'Lemon', 63);
INSERT INTO `log_detail` VALUES (1983, 'select', '2019-10-09 23:15:10', '1-1-8', '3', 'Bread', 63);
INSERT INTO `log_detail` VALUES (1984, 'del', '2019-10-09 23:15:15', '1-2-5', '3', 'Watermelon', 63);
INSERT INTO `log_detail` VALUES (1985, 'add', '2019-10-09 23:15:17', '1-1-9', '3', '', 63);
INSERT INTO `log_detail` VALUES (1986, 'change', '2019-10-09 23:15:29', '1-1-8', '3', 'Porridge', 63);
INSERT INTO `log_detail` VALUES (1987, 'del', '2019-10-09 23:15:32', '1-1-8', '3', 'Pork', 63);
INSERT INTO `log_detail` VALUES (1988, 'add', '2019-10-09 23:15:37', '1-5', '2', '', 63);
INSERT INTO `log_detail` VALUES (1989, 'select', '2019-10-09 23:15:47', '1-5', '2', 'Meat', 63);
INSERT INTO `log_detail` VALUES (1990, 'add', '2019-10-09 23:15:48', '1-5-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (1991, 'add', '2019-10-09 23:15:52', '1-4-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (1992, 'add', '2019-10-09 23:15:53', '1-4-2', '3', '', 63);
INSERT INTO `log_detail` VALUES (1993, 'add', '2019-10-09 23:15:55', '1-4-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (1994, 'add', '2019-10-09 23:15:57', '1-3-2', '3', '', 63);
INSERT INTO `log_detail` VALUES (1995, 'add', '2019-10-09 23:15:58', '1-3-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (1996, 'add', '2019-10-09 23:15:59', '1-3-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (1997, 'select', '2019-10-09 23:16:13', '1-3-2', '3', 'Coffee', 63);
INSERT INTO `log_detail` VALUES (1998, 'select', '2019-10-09 23:16:24', '1-3-1', '3', 'Lemonade', 63);
INSERT INTO `log_detail` VALUES (1999, 'change', '2019-10-09 23:16:28', '1-3-1', '3', 'Juice', 63);
INSERT INTO `log_detail` VALUES (2000, 'select', '2019-10-09 23:16:49', '1-3-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (2001, 'change', '2019-10-09 23:16:59', '1-2-1', '3', 'Breakfast', 63);
INSERT INTO `log_detail` VALUES (2002, 'select', '2019-10-09 23:17:02', '1-1-8', '3', 'Watermelon', 63);
INSERT INTO `log_detail` VALUES (2003, 'del', '2019-10-09 23:17:12', '1-3-3', '3', 'null', 63);
INSERT INTO `log_detail` VALUES (2004, 'add', '2019-10-09 23:17:14', '1-3-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (2005, 'select', '2019-10-09 23:17:21', '1-3-3', '3', 'Onion', 63);
INSERT INTO `log_detail` VALUES (2006, 'del', '2019-10-09 23:17:23', '1-3-3', '3', 'Onion', 63);
INSERT INTO `log_detail` VALUES (2007, 'del', '2019-10-09 23:17:24', '1-3-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (2008, 'add', '2019-10-09 23:17:39', '1-4-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (2009, 'add', '2019-10-09 23:17:40', '1-4-5', '3', '', 63);
INSERT INTO `log_detail` VALUES (2010, 'add', '2019-10-09 23:17:41', '1-4-6', '3', '', 63);
INSERT INTO `log_detail` VALUES (2011, 'select', '2019-10-09 23:17:47', '1-4-1', '3', 'Cabbage', 63);
INSERT INTO `log_detail` VALUES (2012, 'select', '2019-10-09 23:17:51', '1-4-2', '3', 'Chicken', 63);
INSERT INTO `log_detail` VALUES (2013, 'change', '2019-10-09 23:17:54', '1-4-2', '3', 'Carrot', 63);
INSERT INTO `log_detail` VALUES (2014, 'select', '2019-10-09 23:18:22', '1-4-3', '3', 'Lettuce', 63);
INSERT INTO `log_detail` VALUES (2015, 'add', '2019-10-09 23:18:22', '1-6', '2', '', 63);
INSERT INTO `log_detail` VALUES (2016, 'add', '2019-10-09 23:18:25', '1-7', '2', '', 63);
INSERT INTO `log_detail` VALUES (2017, 'add', '2019-10-09 23:18:35', '1-3-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (2018, 'del', '2019-10-09 23:18:37', '1-3-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (2019, 'select', '2019-10-09 23:19:11', '1-4-4', '3', 'Tomato', 63);
INSERT INTO `log_detail` VALUES (2020, 'select', '2019-10-09 23:19:17', '1-4-5', '3', 'Onion', 63);
INSERT INTO `log_detail` VALUES (2021, 'select', '2019-10-09 23:19:21', '1-4-6', '3', 'Rice', 63);
INSERT INTO `log_detail` VALUES (2022, 'add', '2019-10-09 23:19:23', '1-4-7', '3', '', 63);
INSERT INTO `log_detail` VALUES (2023, 'add', '2019-10-09 23:19:27', '1-4-8', '3', '', 63);
INSERT INTO `log_detail` VALUES (2024, 'select', '2019-10-09 23:19:49', '1-4-7', '3', 'Milk', 63);
INSERT INTO `log_detail` VALUES (2025, 'del', '2019-10-09 23:19:56', '1-4-7', '3', 'Milk', 63);
INSERT INTO `log_detail` VALUES (2026, 'add', '2019-10-09 23:19:58', '1-2-5', '3', '', 63);
INSERT INTO `log_detail` VALUES (2027, 'add', '2019-10-09 23:20:02', '1-2-6', '3', '', 63);
INSERT INTO `log_detail` VALUES (2028, 'select', '2019-10-09 23:20:07', '1-2-5', '3', 'Milk', 63);
INSERT INTO `log_detail` VALUES (2029, 'del', '2019-10-09 23:20:09', '1-2-6', '3', '', 63);
INSERT INTO `log_detail` VALUES (2030, 'select', '2019-10-09 23:20:19', '1-5-1', '3', 'Beef', 63);
INSERT INTO `log_detail` VALUES (2031, 'add', '2019-10-09 23:20:21', '1-5-2', '3', '', 63);
INSERT INTO `log_detail` VALUES (2032, 'add', '2019-10-09 23:20:22', '1-5-3', '3', '', 63);
INSERT INTO `log_detail` VALUES (2033, 'add', '2019-10-09 23:20:23', '1-5-4', '3', '', 63);
INSERT INTO `log_detail` VALUES (2034, 'select', '2019-10-09 23:20:31', '1-5-2', '3', 'Chicken', 63);
INSERT INTO `log_detail` VALUES (2035, 'select', '2019-10-09 23:20:35', '1-5-3', '3', 'Dinner', 63);
INSERT INTO `log_detail` VALUES (2036, 'change', '2019-10-09 23:20:39', '1-5-3', '3', 'Chicken', 63);
INSERT INTO `log_detail` VALUES (2037, 'select', '2019-10-09 23:20:47', '1-5-4', '3', 'Hamburger', 63);
INSERT INTO `log_detail` VALUES (2038, 'change', '2019-10-09 23:20:51', '1-5-4', '3', 'Fish', 63);
INSERT INTO `log_detail` VALUES (2039, 'add', '2019-10-09 23:20:52', '1-5-5', '3', '', 63);
INSERT INTO `log_detail` VALUES (2040, 'add', '2019-10-09 23:20:53', '1-5-6', '3', '', 63);
INSERT INTO `log_detail` VALUES (2041, 'select', '2019-10-09 23:21:03', '1-5-5', '3', 'Pork', 63);
INSERT INTO `log_detail` VALUES (2042, 'select', '2019-10-09 23:21:09', '1-5-6', '3', 'Mutton', 63);
INSERT INTO `log_detail` VALUES (2043, 'add', '2019-10-09 23:21:10', '1-5-7', '3', '', 63);
INSERT INTO `log_detail` VALUES (2044, 'add', '2019-10-09 23:21:14', '1-5-8', '3', '', 63);
INSERT INTO `log_detail` VALUES (2045, 'select', '2019-10-09 23:21:22', '1-5-7', '3', 'French fries', 63);
INSERT INTO `log_detail` VALUES (2046, 'del', '2019-10-09 23:21:24', '1-5-7', '3', 'French fries', 63);
INSERT INTO `log_detail` VALUES (2047, 'del', '2019-10-09 23:21:25', '1-5-7', '3', '', 63);
INSERT INTO `log_detail` VALUES (2048, 'select', '2019-10-09 23:21:33', '1-6', '2', 'Healthy', 63);
INSERT INTO `log_detail` VALUES (2049, 'select', '2019-10-09 23:21:38', '1-7', '2', '', 63);
INSERT INTO `log_detail` VALUES (2050, 'add', '2019-10-09 23:21:39', '1-7-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (2051, 'del', '2019-10-09 23:21:41', '1-7', '2', 'null', 63);
INSERT INTO `log_detail` VALUES (2052, 'add', '2019-10-09 23:21:44', '1-7', '2', '', 63);
INSERT INTO `log_detail` VALUES (2053, 'change', '2019-10-09 23:21:56', '1-6', '2', 'Unhealthy', 63);
INSERT INTO `log_detail` VALUES (2054, 'select', '2019-10-09 23:22:04', '1-7', '2', 'Egg', 63);
INSERT INTO `log_detail` VALUES (2055, 'add', '2019-10-09 23:22:04', '1-7-1', '3', '', 63);
INSERT INTO `log_detail` VALUES (2056, 'del', '2019-10-09 23:22:07', '1-7', '2', 'Egg', 63);
INSERT INTO `log_detail` VALUES (2057, 'add', '2019-10-09 23:22:11', '1-7', '2', '', 63);
INSERT INTO `log_detail` VALUES (2058, 'select', '2019-10-10 14:17:34', '1', '1', 'Healthy', 64);
INSERT INTO `log_detail` VALUES (2059, 'add', '2019-10-10 14:17:36', '1-1', '2', '', 64);
INSERT INTO `log_detail` VALUES (2060, 'add', '2019-10-10 14:17:37', '1-1-1', '3', '', 64);
INSERT INTO `log_detail` VALUES (2061, 'select', '2019-10-10 14:17:46', '1-1', '2', 'Apple', 64);
INSERT INTO `log_detail` VALUES (2062, 'add', '2019-10-10 14:17:53', '1-1-2', '3', '', 64);
INSERT INTO `log_detail` VALUES (2063, 'add', '2019-10-10 14:17:55', '1-2', '2', '', 64);
INSERT INTO `log_detail` VALUES (2064, 'select', '2019-10-10 14:18:30', '1-2', '2', 'Banana', 64);
INSERT INTO `log_detail` VALUES (2065, 'select', '2019-10-10 18:20:47', '1', '1', 'Pewf', 65);
INSERT INTO `log_detail` VALUES (2066, 'add', '2019-10-10 18:20:48', '1-1', '2', '', 65);
INSERT INTO `log_detail` VALUES (2067, 'add', '2019-10-10 18:20:48', '1-2', '2', '', 65);
INSERT INTO `log_detail` VALUES (2068, 'add', '2019-10-10 18:20:49', '1-3', '2', '', 65);
INSERT INTO `log_detail` VALUES (2069, 'add', '2019-10-10 18:20:50', '1-1-1', '3', '', 65);
INSERT INTO `log_detail` VALUES (2070, 'select', '2019-10-10 18:20:53', '1-1', '2', 'Banana', 65);
INSERT INTO `log_detail` VALUES (2071, 'select', '2019-10-10 18:20:55', '1-2', '2', 'Ice-cream', 65);
INSERT INTO `log_detail` VALUES (2072, 'select', '2019-10-10 18:20:59', '1-3', '2', 'Salad', 65);
INSERT INTO `log_detail` VALUES (2073, 'add', '2019-10-10 18:21:00', '1-3-1', '3', '', 65);
INSERT INTO `log_detail` VALUES (2074, 'select', '2019-10-10 18:21:04', '1-3-1', '3', 'Hamburger', 65);
INSERT INTO `log_detail` VALUES (2075, 'select', '2019-10-10 18:21:08', '1-1-1', '3', 'Iceeee', 65);
INSERT INTO `log_detail` VALUES (2076, 'add', '2019-10-10 18:21:21', '1-4', '2', '', 65);
INSERT INTO `log_detail` VALUES (2077, 'select', '2019-10-10 18:21:24', '1-4', '2', 'Tomato', 65);
INSERT INTO `log_detail` VALUES (2078, 'select', '2019-10-10 22:22:11', '1', '1', 'Banana', 66);
INSERT INTO `log_detail` VALUES (2079, 'add', '2019-10-10 22:22:11', '1-1', '2', '', 66);
INSERT INTO `log_detail` VALUES (2080, 'select', '2019-10-10 22:22:14', '1-1', '2', 'Hamburger', 66);
INSERT INTO `log_detail` VALUES (2081, 'add', '2019-10-10 22:22:16', '1-2', '2', '', 66);
INSERT INTO `log_detail` VALUES (2082, 'select', '2019-10-10 22:22:18', '1-2', '2', 'Ice-cream', 66);
INSERT INTO `log_detail` VALUES (2083, 'add', '2019-10-10 22:22:19', '1-3', '2', '', 66);
INSERT INTO `log_detail` VALUES (2084, 'select', '2019-10-10 22:22:21', '1-3', '2', 'Pewf', 66);
INSERT INTO `log_detail` VALUES (2085, 'add', '2019-10-10 22:22:22', '1-4', '2', '', 66);
INSERT INTO `log_detail` VALUES (2086, 'add', '2019-10-10 22:22:22', '1-5', '2', '', 66);
INSERT INTO `log_detail` VALUES (2087, 'select', '2019-10-10 22:22:25', '1-4', '2', 'Iceeee', 66);
INSERT INTO `log_detail` VALUES (2088, 'select', '2019-10-10 22:22:28', '1-5', '2', 'Salad', 66);
INSERT INTO `log_detail` VALUES (2089, 'add', '2019-10-10 22:22:29', '1-6', '2', '', 66);
INSERT INTO `log_detail` VALUES (2090, 'select', '2019-10-10 22:22:34', '1-6', '2', 'Tomato', 66);
COMMIT;

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) DEFAULT NULL,
  `symb` varchar(50) DEFAULT NULL,
  `mean` varchar(10) DEFAULT NULL,
  `imgw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of word
-- ----------------------------
BEGIN;
INSERT INTO `word` VALUES (52, 'Banana', NULL, NULL, NULL);
INSERT INTO `word` VALUES (53, 'Hamburger', NULL, NULL, NULL);
INSERT INTO `word` VALUES (54, 'Tomato', NULL, NULL, NULL);
INSERT INTO `word` VALUES (55, 'Ice-cream', NULL, NULL, NULL);
INSERT INTO `word` VALUES (56, 'Salad', NULL, NULL, NULL);
INSERT INTO `word` VALUES (57, 'Strawberry', NULL, NULL, NULL);
INSERT INTO `word` VALUES (58, 'Pear', NULL, NULL, NULL);
INSERT INTO `word` VALUES (59, 'Milk', NULL, NULL, NULL);
INSERT INTO `word` VALUES (60, 'Bread', NULL, NULL, NULL);
INSERT INTO `word` VALUES (61, 'Dinner', NULL, NULL, NULL);
INSERT INTO `word` VALUES (62, 'Food', NULL, NULL, NULL);
INSERT INTO `word` VALUES (63, 'Vegetable', NULL, NULL, NULL);
INSERT INTO `word` VALUES (64, 'Fruit', NULL, NULL, NULL);
INSERT INTO `word` VALUES (65, 'Apple', NULL, NULL, NULL);
INSERT INTO `word` VALUES (66, 'Egg', NULL, NULL, NULL);
INSERT INTO `word` VALUES (67, 'Carrot', NULL, NULL, NULL);
INSERT INTO `word` VALUES (68, 'Rice', NULL, NULL, NULL);
INSERT INTO `word` VALUES (69, 'Chicken', NULL, NULL, NULL);
INSERT INTO `word` VALUES (70, 'Breakfast', NULL, NULL, NULL);
INSERT INTO `word` VALUES (71, 'Healthy', NULL, NULL, NULL);
INSERT INTO `word` VALUES (72, 'Fat', NULL, NULL, NULL);
INSERT INTO `word` VALUES (73, 'Lunch', NULL, NULL, NULL);
INSERT INTO `word` VALUES (74, 'French fries', NULL, NULL, NULL);
INSERT INTO `word` VALUES (75, 'Sandwich', NULL, NULL, NULL);
INSERT INTO `word` VALUES (76, 'Watermelon', NULL, NULL, NULL);
INSERT INTO `word` VALUES (77, 'Meat', NULL, NULL, NULL);
INSERT INTO `word` VALUES (78, 'Grape', NULL, NULL, NULL);
INSERT INTO `word` VALUES (79, 'Cherry', NULL, NULL, NULL);
INSERT INTO `word` VALUES (80, 'Lemon', NULL, NULL, NULL);
INSERT INTO `word` VALUES (81, 'Lemonade', NULL, NULL, NULL);
INSERT INTO `word` VALUES (82, 'Butter', NULL, NULL, NULL);
INSERT INTO `word` VALUES (83, 'Unhealthy', NULL, NULL, NULL);
INSERT INTO `word` VALUES (84, 'Noodle', NULL, NULL, NULL);
INSERT INTO `word` VALUES (85, 'Mutton', NULL, NULL, NULL);
INSERT INTO `word` VALUES (86, 'Beef', NULL, NULL, NULL);
INSERT INTO `word` VALUES (87, 'Cabbage', NULL, NULL, NULL);
INSERT INTO `word` VALUES (88, 'Potato', NULL, NULL, NULL);
INSERT INTO `word` VALUES (89, 'Pork', NULL, NULL, NULL);
INSERT INTO `word` VALUES (90, 'Dumpling', NULL, NULL, NULL);
INSERT INTO `word` VALUES (91, 'Porridge', NULL, NULL, NULL);
INSERT INTO `word` VALUES (92, 'Onion', NULL, NULL, NULL);
INSERT INTO `word` VALUES (93, 'Cheese', NULL, NULL, NULL);
INSERT INTO `word` VALUES (94, 'Lettuce', NULL, NULL, NULL);
INSERT INTO `word` VALUES (95, 'Fish', NULL, NULL, NULL);
INSERT INTO `word` VALUES (96, 'Dessert', NULL, NULL, NULL);
INSERT INTO `word` VALUES (97, 'Juice', NULL, NULL, NULL);
INSERT INTO `word` VALUES (98, 'Drink', NULL, NULL, NULL);
INSERT INTO `word` VALUES (99, 'Yogurt', NULL, NULL, NULL);
INSERT INTO `word` VALUES (100, 'Coffee', NULL, NULL, NULL);
INSERT INTO `word` VALUES (101, 'Meal', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- View structure for v_test_count
-- ----------------------------
DROP VIEW IF EXISTS `v_test_count`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_test_count` AS select count(0) AS `count`,`log`.`code` AS `code` from `log` group by `log`.`code`;

-- ----------------------------
-- Procedure structure for DEBUG_MSG
-- ----------------------------
DROP PROCEDURE IF EXISTS `DEBUG_MSG`;
delimiter ;;
CREATE PROCEDURE `eword`.`DEBUG_MSG`(msg VARCHAR(21812))
BEGIN
    select concat("** ", msg) AS '** DEBUG:';
END
;;
delimiter ;

-- ----------------------------
-- Function structure for FN_USER_COUNT
-- ----------------------------
DROP FUNCTION IF EXISTS `FN_USER_COUNT`;
delimiter ;;
CREATE FUNCTION `eword`.`FN_USER_COUNT`(`usr` varchar(100))
 RETURNS int(11)
BEGIN
	DECLARE count BIGINT UNSIGNED ;
	
	select COUNT(id) into count from account a where a.usr = usr;
	
	return count;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for FN_USER_EXIST
-- ----------------------------
DROP FUNCTION IF EXISTS `FN_USER_EXIST`;
delimiter ;;
CREATE FUNCTION `eword`.`FN_USER_EXIST`(`user` varchar(100))
 RETURNS int(11)
BEGIN
	DECLARE count BIGINT UNSIGNED ;
	DECLARE uid BIGINT UNSIGNED ;
	
	select count(usr),max(id) into  count,uid from account a where a.usr = user;
	
	if count>0 then 
		return uid;
	else
		return 0;
	end if;
	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for FN_WORD_COUNT
-- ----------------------------
DROP FUNCTION IF EXISTS `FN_WORD_COUNT`;
delimiter ;;
CREATE FUNCTION `eword`.`FN_WORD_COUNT`(`word` varchar(100))
 RETURNS int(11)
BEGIN
	DECLARE count BIGINT UNSIGNED ;
	
	select COUNT(id) into count from word a where a.word = word;
	
	return count;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for FN_WORD_EXIST
-- ----------------------------
DROP FUNCTION IF EXISTS `FN_WORD_EXIST`;
delimiter ;;
CREATE FUNCTION `eword`.`FN_WORD_EXIST`(`word` varchar(100))
 RETURNS int(11)
BEGIN
	DECLARE count BIGINT UNSIGNED ;
	DECLARE uid BIGINT UNSIGNED ;
	
	select count(word),max(id) into  count,uid from word a where a.word = word;
	
	if count>0 then 
		return uid;
	else
		return 0;
	end if;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LOG_SAVE
-- ----------------------------
DROP PROCEDURE IF EXISTS `LOG_SAVE`;
delimiter ;;
CREATE PROCEDURE `eword`.`LOG_SAVE`(IN `data` varchar(20000))
BEGIN
    DECLARE code varchar(100) default null;
    DECLARE imgfile varchar(255) default null;
    DECLARE log varchar(20000) default null;

    DECLARE log_id        BIGINT UNSIGNED;
    DECLARE title   varchar(100) default null;
    DECLARE createdate   varchar(20) default null;

    DECLARE json_items  BIGINT UNSIGNED ;
    DECLARE _index      BIGINT UNSIGNED DEFAULT 0;

                DECLARE item_id     varchar(50) default null;
                DECLARE item_lv     varchar(10) default null;
                DECLARE act         varchar(10) default null;
                DECLARE params      varchar(50) default null;
                DECLARE createtime  varchar(50) default null;

    set code = JSON_UNQUOTE(JSON_EXTRACT(data,'$.code'));
                set imgfile = JSON_UNQUOTE(JSON_EXTRACT(data,'$.file'));
                set log = JSON_UNQUOTE(JSON_EXTRACT(data,'$.log'));
                set json_items = JSON_LENGTH(log);

                set title = concat(code,'-',DATE_FORMAT(NOW(),'%Y%m%d%H%i%s'));
                set createdate = NOW();
                insert into log(`title`,`createdate`,`code`,`imgfile`) values(title,createdate,code,imgfile);
                set log_id = LAST_INSERT_ID();

                while `_index` < `json_items` do
                        set item_id = JSON_UNQUOTE(json_extract(`log`, concat('$[', `_index`, '].id')));
                        set item_lv = JSON_UNQUOTE(json_extract(`log`, concat('$[', `_index`, '].level')));
                        set act = JSON_UNQUOTE(json_extract(`log`, concat('$[', `_index`, '].act')));
                        set params = JSON_UNQUOTE(json_extract(`log`, concat('$[',`_index`, '].params')));
                        set createtime = JSON_UNQUOTE(json_extract(`log`, concat('$[', `_index`, '].time')));

                        insert into log_detail(`act`,`createtime`,`item_id`,`item_lv`,`data`,`log_id`) values(act,createtime,item_id,item_lv,params,log_id);

                        set `_index` := `_index` + 1;

                end while;

                select e.err_code,e.err_name from error e where e.err_code =0 and e.err_type=0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for TEST_LIST
-- ----------------------------
DROP PROCEDURE IF EXISTS `TEST_LIST`;
delimiter ;;
CREATE PROCEDURE `eword`.`TEST_LIST`()
BEGIN
		select t.id, t.usr, t.code, t.cls, if( c.count is null, 0,c.count) as count from account t 
		left join v_test_count c on t.code = c.code where t.type<>0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for USER_DELETE
-- ----------------------------
DROP PROCEDURE IF EXISTS `USER_DELETE`;
delimiter ;;
CREATE PROCEDURE `eword`.`USER_DELETE`(IN `data` varchar(20000))
BEGIN
		DECLARE uid     BIGINT UNSIGNED;
		set uid  = CONVERT(JSON_EXTRACT(data, '$.id'),UNSIGNED);
		delete from account where `id` = uid;
		select * from account where type=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for USER_IMPORT
-- ----------------------------
DROP PROCEDURE IF EXISTS `USER_IMPORT`;
delimiter ;;
CREATE PROCEDURE `eword`.`USER_IMPORT`(IN `data` varchar(20000))
BEGIN
    DECLARE userlist varchar(20000) default null;
		
    DECLARE usr    varchar(20) default null;
    DECLARE code   varchar(20) default null;
		DECLARE cls    varchar(20) default null;
		DECLARE pwd    varchar(20) default null;
		
		DECLARE tmp         int;
    DECLARE json_items  BIGINT UNSIGNED ;
    DECLARE _index      BIGINT UNSIGNED DEFAULT 0;

    set userlist = JSON_UNQUOTE(JSON_EXTRACT(data,'$.user'));
    set json_items = JSON_LENGTH(userlist);
		
    while `_index` < `json_items` do
       set usr  = JSON_UNQUOTE(json_extract(`userlist`, concat('$[', `_index`, '].user')));
       set code = JSON_UNQUOTE(json_extract(`userlist`, concat('$[', `_index`, '].code')));
       set cls  = JSON_UNQUOTE(json_extract(`userlist`, concat('$[', `_index`, '].class')));
       set pwd  = JSON_UNQUOTE(json_extract(`userlist`, concat('$[', `_index`, '].pwd')));
			 
			 set tmp = FN_USER_EXIST(usr);
-- 			 call DEBUG_MSG(tmp);
			 if tmp > 0 then 
					update account e set `usr`=usr, `code`=code, 	`cls`=cls, `pwd`=pwd  where e.id=tmp;
			 else
					insert into account(`usr`,`code`,`cls`,`pwd`,`type`) values(usr,code,cls,pwd,1);
			 end if;
			 
       set `_index` := `_index` + 1;
    end while;
    select * from account e where e.type=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for USER_UPDATE
-- ----------------------------
DROP PROCEDURE IF EXISTS `USER_UPDATE`;
delimiter ;;
CREATE PROCEDURE `eword`.`USER_UPDATE`(IN `data` varchar(20000))
BEGIN
		DECLARE id     BIGINT UNSIGNED;
    DECLARE usr    varchar(20) default null;
    DECLARE code   varchar(20) default null;
		DECLARE cls    varchar(20) default null;
		DECLARE pwd    varchar(20) default null;
		
		DECLARE tmp         int;
		DECLARE ret         int;
    DECLARE json_items  BIGINT UNSIGNED ;
    DECLARE _index      BIGINT UNSIGNED DEFAULT 0;

		set id  = CONVERT(JSON_EXTRACT(data, '$.id'),UNSIGNED);
    set usr = JSON_UNQUOTE(JSON_EXTRACT(data,'$.usr'));
		set code = JSON_UNQUOTE(JSON_EXTRACT(data,'$.code'));
		set cls = JSON_UNQUOTE(JSON_EXTRACT(data,'$.cls'));
		set pwd = JSON_UNQUOTE(JSON_EXTRACT(data,'$.pwd'));
		
		set tmp = FN_USER_EXIST(usr);
		set ret = FN_USER_COUNT(usr);
		
-- 		call DEBUG_MSG(ret);
-- 		call DEBUG_MSG(tmp);
-- 		call DEBUG_MSG(id);
		
		if (tmp >= 0 and id<>0 and ret<1) then -- 更新用户
			 update account e set `usr`=usr, `code`=code, 	`cls`=cls, `pwd`=pwd  where e.id=id;
			 select e.err_code,e.err_name,e.err_msg from error e where e.err_code =0 and e.err_type=100;
	  elseif (tmp > 0 and id<>0 and ret=1 and tmp=id) then -- 更新自己
			 update account e set `usr`=usr, `code`=code, 	`cls`=cls, `pwd`=pwd  where e.id=id;
			 select e.err_code,e.err_name,e.err_msg from error e where e.err_code =0 and e.err_type=100;
	  elseif (tmp > 0 and id<>0 and ret=1 and tmp<>id) then -- 更新用户名已存在
		   select e.err_code,e.err_name,e.err_msg from error e where e.err_code =1;
    elseif (tmp > 0 and id=0) then -- 插入时用户已存在
		   select e.err_code,e.err_name,e.err_msg from error e where e.err_code =1;
	  elseif (tmp = 0 and id=0) then -- 插入用户不存在
			 insert into account(`usr`,`code`,`cls`,`pwd`,`type`) values(usr,code,cls,pwd,1);
			 select e.err_code,e.err_name,e.err_msg from error e where e.err_code =0 and e.err_type=101;
	  end if;
    
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WORD_DELETE
-- ----------------------------
DROP PROCEDURE IF EXISTS `WORD_DELETE`;
delimiter ;;
CREATE PROCEDURE `eword`.`WORD_DELETE`(IN `data` varchar(20000))
BEGIN
		DECLARE uid     BIGINT UNSIGNED;
		set uid  = CONVERT(JSON_EXTRACT(data, '$.id'),UNSIGNED);
		delete from word where `id` = uid;
		select * from word;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WORD_IMPORT
-- ----------------------------
DROP PROCEDURE IF EXISTS `WORD_IMPORT`;
delimiter ;;
CREATE PROCEDURE `eword`.`WORD_IMPORT`(IN `data` varchar(20000))
BEGIN
    DECLARE wordlist varchar(20000) default null;
		
    DECLARE word    varchar(50) default null;
    DECLARE symb    varchar(50) default null;
		DECLARE mean    varchar(255) default null;
		DECLARE imgw    varchar(255) default null;
		
		DECLARE tmp         int;
    DECLARE json_items  BIGINT UNSIGNED ;
    DECLARE _index      BIGINT UNSIGNED DEFAULT 0;

    set wordlist = JSON_UNQUOTE(JSON_EXTRACT(data,'$.word'));
    set json_items = JSON_LENGTH(wordlist);
		
    while `_index` < `json_items` do
       set word  = JSON_UNQUOTE(json_extract(`wordlist`, concat('$[', `_index`, '].word')));
       set symb  = JSON_UNQUOTE(json_extract(`wordlist`, concat('$[', `_index`, '].symb')));
       set mean  = JSON_UNQUOTE(json_extract(`wordlist`, concat('$[', `_index`, '].mean')));
       set imgw  = JSON_UNQUOTE(json_extract(`wordlist`, concat('$[', `_index`, '].imgw')));
			 
			 set tmp = FN_WORD_EXIST(word);
-- 			 call DEBUG_MSG(tmp);
			 if tmp > 0 then 
					update word e set `word`=word, `symb`=symb,	`mean`=mean, `imgw`=imgw  where e.id=tmp;
			 else
					insert into word(`word`,`symb`,`mean`,`imgw`) values(word,symb,mean,imgw);
			 end if;
			 
       set `_index` := `_index` + 1;
    end while;
    select * from word;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WORD_UPDATE
-- ----------------------------
DROP PROCEDURE IF EXISTS `WORD_UPDATE`;
delimiter ;;
CREATE PROCEDURE `eword`.`WORD_UPDATE`(IN `data` varchar(20000))
BEGIN
		DECLARE id     BIGINT UNSIGNED;
    DECLARE word    varchar(50) default null;
    DECLARE symb   varchar(50) default null;
		DECLARE mean    varchar(255) default null;
		DECLARE imgw    varchar(255) default null;
		
		DECLARE tmp         int;
		DECLARE ret         int;
    DECLARE json_items  BIGINT UNSIGNED ;
    DECLARE _index      BIGINT UNSIGNED DEFAULT 0;

		set id  = CONVERT(JSON_EXTRACT(data, '$.id'),UNSIGNED);
    set word = JSON_UNQUOTE(JSON_EXTRACT(data,'$.word'));
		set symb = JSON_UNQUOTE(JSON_EXTRACT(data,'$.symb'));
		set mean = JSON_UNQUOTE(JSON_EXTRACT(data,'$.mean'));
		set imgw = JSON_UNQUOTE(JSON_EXTRACT(data,'$.imgw'));
		
		set tmp = FN_WORD_EXIST(word);
		set ret = FN_WORD_COUNT(word);
		
-- 		call DEBUG_MSG(ret);
-- 		call DEBUG_MSG(tmp);
-- 		call DEBUG_MSG(id);
		
		if (tmp >= 0 and id<>0 and ret<1) then -- 更新用户
			 update word e set `word`=word, `symb`=symb, 	`mean`=mean, `imgw`=imgw  where e.id=id;
			 select e.err_code,e.err_name,e.err_msg from error e where e.err_code =0 and e.err_type=100;
	  elseif (tmp > 0 and id<>0 and ret=1 and tmp=id) then -- 更新自己
			 update word e set `word`=word, `symb`=symb, 	`mean`=mean, `imgw`=imgw  where e.id=id;
			 select e.err_code,e.err_name,e.err_msg from error e where e.err_code =0 and e.err_type=100;
	  elseif (tmp > 0 and id<>0 and ret=1 and tmp<>id) then -- 更新单词已存在
		   select e.err_code,e.err_name,e.err_msg from error e where e.err_code =2;
    elseif (tmp > 0 and id=0) then -- 插入时单词已存在
		   select e.err_code,e.err_name,e.err_msg from error e where e.err_code =2;
	  elseif (tmp = 0 and id=0) then -- 插入单词不存在
			 insert into word(`word`,`symb`,`mean`,`imgw`) values(word,symb,mean,imgw);
			 select e.err_code,e.err_name,e.err_msg from error e where e.err_code =0 and e.err_type=101;
	  end if;
    
    
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
