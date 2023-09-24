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

 Date: 24/09/2023 23:21:02
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

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
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假原由',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假日期',
  `day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假天数',
  `userId` int(11) NULL DEFAULT NULL COMMENT '请假用户ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '请假审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES (1, '回家相亲', '2023-08-31', '7', 6, '审核通过', '可以可以');
INSERT INTO `audit` VALUES (3, '回家钓鱼', '2023-08-31', '3', 7, '审核不通过', '好好学习');

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
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图书介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'java基础', '25', '张三', '人民邮电出版社', '1693054319525', 9, NULL);
INSERT INTO `book` VALUES (2, 'java进阶', '30', '李四', '清华大学出版社', '1693055819266', 8, NULL);
INSERT INTO `book` VALUES (3, 'python基础', '45', '张三丰', '人民邮电出版社', '1693054486459', 8, NULL);
INSERT INTO `book` VALUES (4, 'python进阶', '55', '张无忌', '人民邮电出版社', '1693054720938', 9, NULL);
INSERT INTO `book` VALUES (6, 'Vue2基础', '20', '鱿鱼须', '清华大学出版社', '1693056305737', 13, NULL);
INSERT INTO `book` VALUES (8, 'qqqqqqqqqqqq', 'qqqqqqqqqqqqqqq', 'qqqqqqq', 'qqqqqqqqqqqqqqq', NULL, 13, NULL);
INSERT INTO `book` VALUES (9, '猫和老鼠', '126', 'tom 和 jerry', '猫和老鼠出版社', '1695048809508', 19, '<p><img src=\"http://localhost:9528/api/files/1695568087912\" alt=\"图片描述1695568087912\" data-href=\"http%3A%2F%2Flocalhost%3A9528%2Fapi%2Ffiles%2F1695568087912\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>');
INSERT INTO `book` VALUES (10, '测试富文本', '测试富文本', '测试富文本', '测试富文本', '1695567090888', 8, '<h1 id=\"cedjx\">测试富文本</h1><p>测试富文本</p><pre><code class=\"JavaScript\">&lt;el-table-column label=\"图书介绍\"&gt;\n  &lt;template slot-scope=\"scope\"&gt;\n    &lt;el-button type=\"success\" @click=\"viewEditor(scope.row.content)\"&gt;点击查看&lt;/el-button&gt;\n  &lt;/template&gt;\n&lt;/el-table-column&gt;</code></pre><p><img src=\"http://localhost:9528/api/files/1695567952312\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '酒店名称',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入住价格',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '酒店图片',
  `num` int(10) NULL DEFAULT NULL COMMENT '剩余间数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '酒店信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (9, '经济大床房', '150', '1693745237514', 9);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (42, '删除图书信息', '2023-09-07 10:22:36', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (43, '新增或编辑图书信息', '2023-09-07 10:26:37', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (44, '登录该系统', '2023-09-07 10:55:31', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (45, '登录该系统', '2023-09-07 10:55:51', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (46, '登录该系统', '2023-09-07 11:04:42', '张三', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (47, '登录该系统', '2023-09-07 11:07:16', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (48, '登录该系统', '2023-09-07 11:10:00', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (49, '登录该系统', '2023-09-08 15:46:03', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (50, '公告管理的新增或编辑', '2023-09-08 16:08:12', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (51, '公告管理的新增或编辑', '2023-09-08 16:09:35', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (52, '公告管理的新增或编辑', '2023-09-08 16:09:57', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (53, '公告管理的新增或编辑', '2023-09-08 16:10:09', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (54, '公告管理的新增或编辑', '2023-09-08 16:10:21', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (55, '公告管理的新增或编辑', '2023-09-08 16:10:32', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (56, '公告管理的删除', '2023-09-08 16:10:34', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (57, '公告管理的新增或编辑', '2023-09-08 16:10:51', '李四', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (58, '登录该系统', '2023-09-11 17:33:33', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (59, '登录该系统', '2023-09-11 17:33:14', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (60, '登录该系统', '2023-09-11 17:33:33', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (61, '登录该系统', '2023-09-11 17:33:46', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (62, '登录该系统', '2023-09-11 17:33:52', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (63, '登录该系统', '2023-09-11 17:34:49', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (64, '登录该系统', '2023-09-11 17:34:53', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (65, '登录该系统', '2023-09-18 22:47:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (66, '分类管理的新增或编辑', '2023-09-18 22:53:11', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (67, '文件上传', '2023-09-18 22:53:29', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (68, '新增或编辑图书信息', '2023-09-18 22:53:57', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (69, '登录该系统', '2023-09-23 22:30:43', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (70, '登录该系统', '2023-09-24 22:50:52', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (71, '登录该系统', '2023-09-24 22:51:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (72, '文件上传', '2023-09-24 22:51:30', '', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (73, '新增或编辑图书信息', '2023-09-24 22:51:45', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (74, '新增或编辑图书信息', '2023-09-24 23:05:55', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (75, '新增或编辑图书信息', '2023-09-24 23:08:10', 'admin', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (19, '测试公告1112222', '1111111222222', '2023-09-08 16:09:57');
INSERT INTO `notice` VALUES (20, '测试33333', '333333333', '2023-09-08 16:10:09');
INSERT INTO `notice` VALUES (22, '测试555', '测试555', '2023-09-08 16:10:32');
INSERT INTO `notice` VALUES (23, '测试666666', '666666666', '2023-09-08 16:10:51');

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `hotelId` int(10) NULL DEFAULT NULL COMMENT '酒店ID',
  `userId` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '预订时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '预订信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES (9, 9, 7, '2023-09-03 20:47:39');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (8, '技术类图书', '这是关于技术类图书的描述');
INSERT INTO `type` VALUES (9, '生活类图书', '描述描述');
INSERT INTO `type` VALUES (13, '情感类图书', '这是关于情感类图书的描述');
INSERT INTO `type` VALUES (19, '故事类图书', '这是关于故事类图书的描述');

SET FOREIGN_KEY_CHECKS = 1;
