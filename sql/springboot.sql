/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : springboot

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 27/08/2023 21:30:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '男', 25, '18888889999', 'ROLE_ADMIN');
INSERT INTO `admin` VALUES (2, '李老师', '123456', '女', 25, '18899998888', 'ROLE_TEACHER');
INSERT INTO `admin` VALUES (3, '张老师', '123456', '男', 18, '18269269000', 'ROLE_TEACHER');
INSERT INTO `admin` VALUES (4, '张三丰', '123456', '男', 18, '18269290000', 'ROLE_TEACHER');
INSERT INTO `admin` VALUES (6, '张三', '123456', '女', 18, '13111111111', 'ROLE_STUDENT');
INSERT INTO `admin` VALUES (7, '李四', '123456', '男', 18, '12346111111111', 'ROLE_STUDENT');
INSERT INTO `admin` VALUES (9, '张三三1', '111', '男', 144, '沙发上', 'ROLE_STUDENT');
INSERT INTO `admin` VALUES (10, '王五', '123456', '男', 19, '13111111111111', 'ROLE_STUDENT');
INSERT INTO `admin` VALUES (11, '赵六', '123456', NULL, NULL, NULL, 'ROLE_STUDENT');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书名称',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书价格',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书作者',
  `press` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书出版社',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书封面',
  `typeId` int(10) NULL DEFAULT NULL COMMENT '分类Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'java基础', '25', '张三', '人民邮电出版社', '1693054319525', 9);
INSERT INTO `book` VALUES (2, 'java进阶', '30', '李四', '清华大学出版社', '1693055819266', 8);
INSERT INTO `book` VALUES (3, 'python基础', '45', '张三丰', '人民邮电出版社', '1693054486459', 8);
INSERT INTO `book` VALUES (4, 'python进阶', '55', '张无忌', '人民邮电出版社', '1693054720938', 9);
INSERT INTO `book` VALUES (6, 'Vue2基础', '20', '鱿鱼须', '清华大学出版社', '1693056305737', 13);
INSERT INTO `book` VALUES (7, '测试', '11', '11', '11', '1693115300811', 8);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (8, '技术类图书', '这是关于技术类图书的描述');
INSERT INTO `type` VALUES (9, '生活类图书', '描述描述');
INSERT INTO `type` VALUES (13, '情感类图书', '这是关于情感类图书的描述');

SET FOREIGN_KEY_CHECKS = 1;
