/*
 Navicat Premium Data Transfer

 Source Server         : crowd
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : crowdfunding_db

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/09/2024 23:55:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (100, 'aa');
INSERT INTO `category` VALUES (101, 'Education');
INSERT INTO `category` VALUES (102, 'Animal Protection');
INSERT INTO `category` VALUES (103, 'Medical');
INSERT INTO `category` VALUES (104, 'Environment');
INSERT INTO `category` VALUES (105, 'Business Support');
INSERT INTO `category` VALUES (106, 'Scholarship');
INSERT INTO `category` VALUES (107, 'Library Renovation');
INSERT INTO `category` VALUES (108, 'Disaster Relief');
INSERT INTO `category` VALUES (109, 'Arts and Culture');
INSERT INTO `category` VALUES (110, 'Technology Advancement');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `FUNDRAISER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '筹款人 ID',
  `ORGANIZER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织者',
  `CAPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `TARGET_FUNDING` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标资金',
  `CURRENT_FUNDING` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前资金',
  `CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `ACTIVE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识',
  `CATEGORY_ID` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`FUNDRAISER_ID`) USING BTREE,
  INDEX `CATEGORY_ID`(`CATEGORY_ID`) USING BTREE,
  CONSTRAINT `CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES (1, 'Alice Johnson', 'Help Rebuild Local School', '5000', '1500', 'New York', '1', 100);
INSERT INTO `fundraiser` VALUES (2, 'Bob Smith', 'Support for Animal Shelter', '10000', '3200', 'Los Angeles', '1', 100);
INSERT INTO `fundraiser` VALUES (3, 'Catherine Lee', 'Medical Bills for John', '20000', '12000', 'Chicago', '1', 100);
INSERT INTO `fundraiser` VALUES (4, 'David Wong', 'Community Garden Initiative', '8000', '5600', 'San Francisco', '0', 100);
INSERT INTO `fundraiser` VALUES (5, 'Emily Davis', 'Food Drive for Homeless', '6000', '2500', 'Houston', '1', 100);
INSERT INTO `fundraiser` VALUES (6, 'Frank Martin', 'Support for Small Businesses', '15000', '4500', 'Miami', '1', 100);
INSERT INTO `fundraiser` VALUES (7, 'Grace Liu', 'Scholarship Fund for Students', '25000', '21000', 'Seattle', '1', 100);
INSERT INTO `fundraiser` VALUES (8, 'Henry Thomas', 'Library Renovation Project', '12000', '8000', 'Boston', '0', 100);
INSERT INTO `fundraiser` VALUES (9, 'Isabella Garcia', 'Disaster Relief Fund', '30000', '15000', 'Dallas', '1', 100);
INSERT INTO `fundraiser` VALUES (10, 'Jack Miller', 'Cancer Research Support', '50000', '40000', 'Phoenix', '1', 100);

SET FOREIGN_KEY_CHECKS = 1;
