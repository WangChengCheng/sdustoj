/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : sdustoj

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 02/10/2017 17:48:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activation
-- ----------------------------
DROP TABLE IF EXISTS `activation`;
CREATE TABLE `activation`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_0e939a4f`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_8373b171`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_417f1b1c`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 202 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (97, 'Can add log entry', 33, 'add_logentry');
INSERT INTO `auth_permission` VALUES (98, 'Can change log entry', 33, 'change_logentry');
INSERT INTO `auth_permission` VALUES (99, 'Can delete log entry', 33, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (100, 'Can add permission', 34, 'add_permission');
INSERT INTO `auth_permission` VALUES (101, 'Can change permission', 34, 'change_permission');
INSERT INTO `auth_permission` VALUES (102, 'Can delete permission', 34, 'delete_permission');
INSERT INTO `auth_permission` VALUES (103, 'Can add group', 35, 'add_group');
INSERT INTO `auth_permission` VALUES (104, 'Can change group', 35, 'change_group');
INSERT INTO `auth_permission` VALUES (105, 'Can delete group', 35, 'delete_group');
INSERT INTO `auth_permission` VALUES (106, 'Can add user', 36, 'add_user');
INSERT INTO `auth_permission` VALUES (107, 'Can change user', 36, 'change_user');
INSERT INTO `auth_permission` VALUES (108, 'Can delete user', 36, 'delete_user');
INSERT INTO `auth_permission` VALUES (109, 'Can add content type', 37, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (110, 'Can change content type', 37, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (111, 'Can delete content type', 37, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (112, 'Can add session', 38, 'add_session');
INSERT INTO `auth_permission` VALUES (113, 'Can change session', 38, 'change_session');
INSERT INTO `auth_permission` VALUES (114, 'Can delete session', 38, 'delete_session');
INSERT INTO `auth_permission` VALUES (115, 'Can add activation', 39, 'add_activation');
INSERT INTO `auth_permission` VALUES (116, 'Can change activation', 39, 'change_activation');
INSERT INTO `auth_permission` VALUES (117, 'Can delete activation', 39, 'delete_activation');
INSERT INTO `auth_permission` VALUES (118, 'Can add collections', 40, 'add_collections');
INSERT INTO `auth_permission` VALUES (119, 'Can change collections', 40, 'change_collections');
INSERT INTO `auth_permission` VALUES (120, 'Can delete collections', 40, 'delete_collections');
INSERT INTO `auth_permission` VALUES (121, 'Can add collections problem', 41, 'add_collectionsproblem');
INSERT INTO `auth_permission` VALUES (122, 'Can change collections problem', 41, 'change_collectionsproblem');
INSERT INTO `auth_permission` VALUES (123, 'Can delete collections problem', 41, 'delete_collectionsproblem');
INSERT INTO `auth_permission` VALUES (124, 'Can add compileinfo', 42, 'add_compileinfo');
INSERT INTO `auth_permission` VALUES (125, 'Can change compileinfo', 42, 'change_compileinfo');
INSERT INTO `auth_permission` VALUES (126, 'Can delete compileinfo', 42, 'delete_compileinfo');
INSERT INTO `auth_permission` VALUES (127, 'Can add contest', 43, 'add_contest');
INSERT INTO `auth_permission` VALUES (128, 'Can change contest', 43, 'change_contest');
INSERT INTO `auth_permission` VALUES (129, 'Can delete contest', 43, 'delete_contest');
INSERT INTO `auth_permission` VALUES (130, 'Can add contest privilege', 44, 'add_contestprivilege');
INSERT INTO `auth_permission` VALUES (131, 'Can change contest privilege', 44, 'change_contestprivilege');
INSERT INTO `auth_permission` VALUES (132, 'Can delete contest privilege', 44, 'delete_contestprivilege');
INSERT INTO `auth_permission` VALUES (133, 'Can add contest problem', 45, 'add_contestproblem');
INSERT INTO `auth_permission` VALUES (134, 'Can change contest problem', 45, 'change_contestproblem');
INSERT INTO `auth_permission` VALUES (135, 'Can delete contest problem', 45, 'delete_contestproblem');
INSERT INTO `auth_permission` VALUES (136, 'Can add contest users', 46, 'add_contestusers');
INSERT INTO `auth_permission` VALUES (137, 'Can change contest users', 46, 'change_contestusers');
INSERT INTO `auth_permission` VALUES (138, 'Can delete contest users', 46, 'delete_contestusers');
INSERT INTO `auth_permission` VALUES (139, 'Can add django migrations', 47, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (140, 'Can change django migrations', 47, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (141, 'Can delete django migrations', 47, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (142, 'Can add loginlog', 48, 'add_loginlog');
INSERT INTO `auth_permission` VALUES (143, 'Can change loginlog', 48, 'change_loginlog');
INSERT INTO `auth_permission` VALUES (144, 'Can delete loginlog', 48, 'delete_loginlog');
INSERT INTO `auth_permission` VALUES (145, 'Can add mail', 49, 'add_mail');
INSERT INTO `auth_permission` VALUES (146, 'Can change mail', 49, 'change_mail');
INSERT INTO `auth_permission` VALUES (147, 'Can delete mail', 49, 'delete_mail');
INSERT INTO `auth_permission` VALUES (148, 'Can add news', 50, 'add_news');
INSERT INTO `auth_permission` VALUES (149, 'Can change news', 50, 'change_news');
INSERT INTO `auth_permission` VALUES (150, 'Can delete news', 50, 'delete_news');
INSERT INTO `auth_permission` VALUES (151, 'Can add online', 51, 'add_online');
INSERT INTO `auth_permission` VALUES (152, 'Can change online', 51, 'change_online');
INSERT INTO `auth_permission` VALUES (153, 'Can delete online', 51, 'delete_online');
INSERT INTO `auth_permission` VALUES (154, 'Can add privilege', 52, 'add_privilege');
INSERT INTO `auth_permission` VALUES (155, 'Can change privilege', 52, 'change_privilege');
INSERT INTO `auth_permission` VALUES (156, 'Can delete privilege', 52, 'delete_privilege');
INSERT INTO `auth_permission` VALUES (157, 'Can add problem', 53, 'add_problem');
INSERT INTO `auth_permission` VALUES (158, 'Can change problem', 53, 'change_problem');
INSERT INTO `auth_permission` VALUES (159, 'Can delete problem', 53, 'delete_problem');
INSERT INTO `auth_permission` VALUES (160, 'Can add reply', 54, 'add_reply');
INSERT INTO `auth_permission` VALUES (161, 'Can change reply', 54, 'change_reply');
INSERT INTO `auth_permission` VALUES (162, 'Can delete reply', 54, 'delete_reply');
INSERT INTO `auth_permission` VALUES (163, 'Can add runtimeinfo', 55, 'add_runtimeinfo');
INSERT INTO `auth_permission` VALUES (164, 'Can change runtimeinfo', 55, 'change_runtimeinfo');
INSERT INTO `auth_permission` VALUES (165, 'Can delete runtimeinfo', 55, 'delete_runtimeinfo');
INSERT INTO `auth_permission` VALUES (166, 'Can add sim', 56, 'add_sim');
INSERT INTO `auth_permission` VALUES (167, 'Can change sim', 56, 'change_sim');
INSERT INTO `auth_permission` VALUES (168, 'Can delete sim', 56, 'delete_sim');
INSERT INTO `auth_permission` VALUES (169, 'Can add solution', 57, 'add_solution');
INSERT INTO `auth_permission` VALUES (170, 'Can change solution', 57, 'change_solution');
INSERT INTO `auth_permission` VALUES (171, 'Can delete solution', 57, 'delete_solution');
INSERT INTO `auth_permission` VALUES (172, 'Can add source code', 58, 'add_sourcecode');
INSERT INTO `auth_permission` VALUES (173, 'Can change source code', 58, 'change_sourcecode');
INSERT INTO `auth_permission` VALUES (174, 'Can delete source code', 58, 'delete_sourcecode');
INSERT INTO `auth_permission` VALUES (175, 'Can add topic', 59, 'add_topic');
INSERT INTO `auth_permission` VALUES (176, 'Can change topic', 59, 'change_topic');
INSERT INTO `auth_permission` VALUES (177, 'Can delete topic', 59, 'delete_topic');
INSERT INTO `auth_permission` VALUES (178, 'Can add users', 60, 'add_users');
INSERT INTO `auth_permission` VALUES (179, 'Can change users', 60, 'change_users');
INSERT INTO `auth_permission` VALUES (180, 'Can delete users', 60, 'delete_users');
INSERT INTO `auth_permission` VALUES (181, 'Can add status', 61, 'add_status');
INSERT INTO `auth_permission` VALUES (182, 'Can change status', 61, 'change_status');
INSERT INTO `auth_permission` VALUES (183, 'Can delete status', 61, 'delete_status');
INSERT INTO `auth_permission` VALUES (184, 'Can add language', 62, 'add_language');
INSERT INTO `auth_permission` VALUES (185, 'Can change language', 62, 'change_language');
INSERT INTO `auth_permission` VALUES (186, 'Can delete language', 62, 'delete_language');
INSERT INTO `auth_permission` VALUES (187, 'Can add statusinfo', 63, 'add_statusinfo');
INSERT INTO `auth_permission` VALUES (188, 'Can change statusinfo', 63, 'change_statusinfo');
INSERT INTO `auth_permission` VALUES (189, 'Can delete statusinfo', 63, 'delete_statusinfo');
INSERT INTO `auth_permission` VALUES (190, 'Can add contestinfo', 64, 'add_contestinfo');
INSERT INTO `auth_permission` VALUES (191, 'Can change contestinfo', 64, 'change_contestinfo');
INSERT INTO `auth_permission` VALUES (192, 'Can delete contestinfo', 64, 'delete_contestinfo');
INSERT INTO `auth_permission` VALUES (193, 'Can add archive', 65, 'add_archive');
INSERT INTO `auth_permission` VALUES (194, 'Can change archive', 65, 'change_archive');
INSERT INTO `auth_permission` VALUES (195, 'Can delete archive', 65, 'delete_archive');
INSERT INTO `auth_permission` VALUES (196, 'Can add siminfo', 66, 'add_siminfo');
INSERT INTO `auth_permission` VALUES (197, 'Can change siminfo', 66, 'change_siminfo');
INSERT INTO `auth_permission` VALUES (198, 'Can delete siminfo', 66, 'delete_siminfo');
INSERT INTO `auth_permission` VALUES (199, 'Can add sim config', 67, 'add_simconfig');
INSERT INTO `auth_permission` VALUES (200, 'Can change sim config', 67, 'change_simconfig');
INSERT INTO `auth_permission` VALUES (201, 'Can delete sim config', 67, 'delete_simconfig');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_e8701ad4`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_0e939a4f`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_e8701ad4`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_8373b171`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` int(11) NOT NULL,
  `class_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `fk_class_major_1`(`major_code`) USING BTREE,
  INDEX `fk_class_grade_1`(`grade_id`) USING BTREE,
  INDEX `fk_class_college_1`(`college_id`) USING BTREE,
  CONSTRAINT `fk_class_college_1` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_class_grade_1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`grade_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_class_major_1` FOREIGN KEY (`major_code`) REFERENCES `major` (`major_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for class_contest
-- ----------------------------
DROP TABLE IF EXISTS `class_contest`;
CREATE TABLE `class_contest`  (
  `class_contest_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  PRIMARY KEY (`class_contest_id`) USING BTREE,
  INDEX `fk_class_contest_class_1`(`class_id`) USING BTREE,
  CONSTRAINT `fk_class_contest_class_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections`  (
  `col_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cnt` int(11) NOT NULL,
  `div` int(11) NOT NULL,
  PRIMARY KEY (`col_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collections_problem
-- ----------------------------
DROP TABLE IF EXISTS `collections_problem`;
CREATE TABLE `collections_problem`  (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `col_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `college_id` int(11) NOT NULL,
  `college_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `university_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`college_id`) USING BTREE,
  INDEX `fk_college_college_1`(`university_code`) USING BTREE,
  CONSTRAINT `fk_college_college_1` FOREIGN KEY (`university_code`) REFERENCES `university` (`university_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for compileinfo
-- ----------------------------
DROP TABLE IF EXISTS `compileinfo`;
CREATE TABLE `compileinfo`  (
  `solution_id` int(11) NOT NULL DEFAULT 0,
  `error` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`solution_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of compileinfo
-- ----------------------------
INSERT INTO `compileinfo` VALUES (73, 'main.c:1:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ at end of input\n');
INSERT INTO `compileinfo` VALUES (76, 'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n');
INSERT INTO `compileinfo` VALUES (77, 'main.cpp:3:1: error: stray ‘343’ in program\nmain.cpp:3:1: error: stray ‘200’ in program\nmain.cpp:3:1: error: stray ‘200’ in program\nmain.cpp:7:1: error: stray ‘343’ in program\nmain.cpp:7:1: error: stray ‘200’ in program\nmain.cpp:7:1: error: stray ‘200’ in program\n');
INSERT INTO `compileinfo` VALUES (87, 'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n');
INSERT INTO `compileinfo` VALUES (89, 'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n');
INSERT INTO `compileinfo` VALUES (94, 'main.c:1:20: fatal error: iostream: No such file or directory\ncompilation terminated.\n');
INSERT INTO `compileinfo` VALUES (100, 'main.c: In function ‘main’:\nmain.c:4:11: error: ‘true’ undeclared (first use in this function)\nmain.c:4:11: note: each undeclared identifier is reported only once for each function it appears in\n');
INSERT INTO `compileinfo` VALUES (107, 'main.c:2:6: warning: return type of ‘main’ is not ‘int’ [-Wmain]\nmain.c: In function ‘main’:\nmain.c:7:5: error: expected expression before ‘else’\nmain.c:4:15: warning: unused variable ‘n’ [-Wunused-variable]\nmain.c:4:13: warning: unused variable ‘b’ [-Wunused-variable]\nmain.c:4:11: warning: unused variable ‘i’ [-Wunused-variable]\nmain.c:4:9: warning: unused variable ‘a’ [-Wunused-variable]\n');

-- ----------------------------
-- Table structure for contest
-- ----------------------------
DROP TABLE IF EXISTS `contest`;
CREATE TABLE `contest`  (
  `contest_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `defunct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `points` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `langmask` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'bits for LANG to mask',
  `contest_mode` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`contest_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contest
-- ----------------------------
INSERT INTO `contest` VALUES (44, 'test', '2016-05-31 08:52:38', '2016-05-31 08:55:00', 'C', NULL, 0, 100, NULL);
INSERT INTO `contest` VALUES (40, '121212121', '2016-04-30 16:00:00', '2016-06-29 16:00:00', 'C', NULL, 0, 100, NULL);
INSERT INTO `contest` VALUES (41, '121212121test', '2016-04-30 16:00:00', '2016-06-29 16:00:00', 'C', NULL, 0, 100, NULL);
INSERT INTO `contest` VALUES (42, 'test12', '2016-04-30 16:00:00', '2016-06-29 16:00:00', 'C', NULL, 0, 100, NULL);
INSERT INTO `contest` VALUES (43, 'Just For Test', '2016-05-24 06:40:46', '2016-05-25 16:00:00', 'C', NULL, 0, 100, NULL);

-- ----------------------------
-- Table structure for contest_privilege
-- ----------------------------
DROP TABLE IF EXISTS `contest_privilege`;
CREATE TABLE `contest_privilege`  (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `private_id` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`privilege_id`) USING BTREE,
  UNIQUE INDEX `privilege_id_UNIQUE`(`privilege_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contest_privilege
-- ----------------------------
INSERT INTO `contest_privilege` VALUES (1, 'Public', '0');
INSERT INTO `contest_privilege` VALUES (2, 'Private', '1');

-- ----------------------------
-- Table structure for contest_problem
-- ----------------------------
DROP TABLE IF EXISTS `contest_problem`;
CREATE TABLE `contest_problem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `contest_id` int(11) NULL DEFAULT NULL,
  `title` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of contest_problem
-- ----------------------------
INSERT INTO `contest_problem` VALUES (35, 7, 29, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (36, 8, 29, '亲密数', 1);
INSERT INTO `contest_problem` VALUES (37, 7, 31, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (38, 7, 32, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (39, 8, 32, '亲密数', 1);
INSERT INTO `contest_problem` VALUES (40, 7, 37, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (41, 8, 37, '亲密数', 1);
INSERT INTO `contest_problem` VALUES (42, 7, 42, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (43, 7, 43, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (44, 8, 43, '亲密数', 1);
INSERT INTO `contest_problem` VALUES (45, 7, 44, 'a+b', 0);
INSERT INTO `contest_problem` VALUES (46, 8, 44, '亲密数', 1);

-- ----------------------------
-- Table structure for contest_users
-- ----------------------------
DROP TABLE IF EXISTS `contest_users`;
CREATE TABLE `contest_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contest_id` int(11) NULL DEFAULT NULL,
  `title` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contest_users
-- ----------------------------
INSERT INTO `contest_users` VALUES (18, 'admin', 27, '', 0);
INSERT INTO `contest_users` VALUES (19, 'admin', 28, '', 0);
INSERT INTO `contest_users` VALUES (20, 'admin', 29, '', 0);
INSERT INTO `contest_users` VALUES (21, 'admin', 30, '', 0);
INSERT INTO `contest_users` VALUES (22, 'admin', 31, '', 0);
INSERT INTO `contest_users` VALUES (23, 'admin', 32, '', 0);
INSERT INTO `contest_users` VALUES (24, 'admin', 33, '', 0);
INSERT INTO `contest_users` VALUES (25, 'admin', 34, '', 0);
INSERT INTO `contest_users` VALUES (26, 'admin', 35, '', 0);
INSERT INTO `contest_users` VALUES (27, 'admin', 36, '', 0);
INSERT INTO `contest_users` VALUES (28, 'admin', 37, '', 0);
INSERT INTO `contest_users` VALUES (29, 'admin', 38, '', 0);
INSERT INTO `contest_users` VALUES (30, 'admin', 39, '', 0);
INSERT INTO `contest_users` VALUES (31, 'admin', 40, '', 0);
INSERT INTO `contest_users` VALUES (32, 'admin', 41, '', 0);
INSERT INTO `contest_users` VALUES (33, 'admin', 42, '', 0);
INSERT INTO `contest_users` VALUES (34, 'admin', 43, '', 0);
INSERT INTO `contest_users` VALUES (35, 'test1', 43, '', 0);
INSERT INTO `contest_users` VALUES (36, 'admin', 44, '', 0);
INSERT INTO `contest_users` VALUES (37, 'test1', 44, '', 0);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`course_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NOT NULL,
  `object_id` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `object_repr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_417f1b1c`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_e8701ad4`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (33, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (34, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (35, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (36, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (37, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (38, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (39, 'sdustoj', 'activation');
INSERT INTO `django_content_type` VALUES (40, 'sdustoj', 'collections');
INSERT INTO `django_content_type` VALUES (41, 'sdustoj', 'collectionsproblem');
INSERT INTO `django_content_type` VALUES (42, 'sdustoj', 'compileinfo');
INSERT INTO `django_content_type` VALUES (43, 'sdustoj', 'contest');
INSERT INTO `django_content_type` VALUES (44, 'sdustoj', 'contestprivilege');
INSERT INTO `django_content_type` VALUES (45, 'sdustoj', 'contestproblem');
INSERT INTO `django_content_type` VALUES (46, 'sdustoj', 'contestusers');
INSERT INTO `django_content_type` VALUES (47, 'sdustoj', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (48, 'sdustoj', 'loginlog');
INSERT INTO `django_content_type` VALUES (49, 'sdustoj', 'mail');
INSERT INTO `django_content_type` VALUES (50, 'sdustoj', 'news');
INSERT INTO `django_content_type` VALUES (51, 'sdustoj', 'online');
INSERT INTO `django_content_type` VALUES (52, 'sdustoj', 'privilege');
INSERT INTO `django_content_type` VALUES (53, 'sdustoj', 'problem');
INSERT INTO `django_content_type` VALUES (54, 'sdustoj', 'reply');
INSERT INTO `django_content_type` VALUES (55, 'sdustoj', 'runtimeinfo');
INSERT INTO `django_content_type` VALUES (56, 'sdustoj', 'sim');
INSERT INTO `django_content_type` VALUES (57, 'sdustoj', 'solution');
INSERT INTO `django_content_type` VALUES (58, 'sdustoj', 'sourcecode');
INSERT INTO `django_content_type` VALUES (59, 'sdustoj', 'topic');
INSERT INTO `django_content_type` VALUES (60, 'sdustoj', 'users');
INSERT INTO `django_content_type` VALUES (61, 'sdustoj', 'status');
INSERT INTO `django_content_type` VALUES (62, 'sdustoj', 'language');
INSERT INTO `django_content_type` VALUES (63, 'sdustoj', 'statusinfo');
INSERT INTO `django_content_type` VALUES (64, 'sdustoj', 'contestinfo');
INSERT INTO `django_content_type` VALUES (65, 'sdustoj', 'archive');
INSERT INTO `django_content_type` VALUES (66, 'sdustoj', 'siminfo');
INSERT INTO `django_content_type` VALUES (67, 'sdustoj', 'simconfig');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `applied` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2016-06-05 02:36:54');
INSERT INTO `django_migrations` VALUES (12, 'sessions', '0001_initial', '2016-06-05 02:36:54');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `session_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `expire_date` datetime(0) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('258k2gpwpx8zkpua0fpbufhxr4p17t6c', 'ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==', '2016-05-07 16:36:09');
INSERT INTO `django_session` VALUES ('tci3usxs4u3jejelgmgvfg5ep7u8c9hy', 'YmMzNTc5NjhmYjM5ZDYyZWJiMzg5Y2EyZWRjZjdjZjFhZWZmZGM0Mzp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiI5NTIyIn0=', '2016-05-19 06:26:54');
INSERT INTO `django_session` VALUES ('t5oaren3ktn4kbgop5e3b7nedp9e6h4x', 'ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==', '2016-06-12 01:55:04');
INSERT INTO `django_session` VALUES ('7pl6oshqogbdzwpxgfnoj2gthvtoxa5j', 'ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==', '2016-06-21 06:15:14');
INSERT INTO `django_session` VALUES ('57x13gfrzpxqosn0zmh9knfpxstglhtu', 'ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==', '2016-06-16 10:49:58');
INSERT INTO `django_session` VALUES ('hu95x6241ki0qg04r1hadooj37fwquok', 'ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==', '2016-06-12 02:16:03');
INSERT INTO `django_session` VALUES ('nsg8vhqbnjbmnyyiqu33jewkuudvpwn1', 'ZDAyZGY5ZTM5Y2EwZjA0Mzc0ZGViMDFkNDMzODA3MjVmM2NhMzM5Mjp7Il9kamFuZ29fY2FwdGNoYV9rZXkiOiIifQ==', '2017-10-15 10:54:49');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `grade_id` int(11) NOT NULL,
  `start_time` date NOT NULL,
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) NULL DEFAULT NULL,
  `language_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `language_compile` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `language_ext` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`) USING BTREE,
  UNIQUE INDEX `language_id_UNIQUE`(`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (1, 0, 'C', 'gcc', 'c');
INSERT INTO `language` VALUES (2, 1, 'C++', 'g++', 'cpp');
INSERT INTO `language` VALUES (3, 2, 'Java', 'java', 'java');

-- ----------------------------
-- Table structure for loginlog
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES (132, 'admin', 'admin', '127.0.0.1', '2016-05-05 03:23:38');
INSERT INTO `loginlog` VALUES (133, 'admin', 'admin', '127.0.0.1', '2016-05-05 06:23:20');
INSERT INTO `loginlog` VALUES (134, 'admin', 'admin', '127.0.0.1', '2016-05-05 07:28:40');
INSERT INTO `loginlog` VALUES (135, 'admin', 'admin', '127.0.0.1', '2016-05-05 08:48:14');
INSERT INTO `loginlog` VALUES (136, 'admin', 'admin', '127.0.0.1', '2016-05-05 10:34:30');
INSERT INTO `loginlog` VALUES (137, 'admin', 'admin', '127.0.0.1', '2016-05-05 13:54:48');
INSERT INTO `loginlog` VALUES (138, 'admin', 'admin', '127.0.0.1', '2016-05-06 07:34:42');
INSERT INTO `loginlog` VALUES (139, 'admin', 'admin', '127.0.0.1', '2016-05-06 08:12:36');
INSERT INTO `loginlog` VALUES (140, 'admin', 'admin', '127.0.0.1', '2016-05-08 05:32:40');
INSERT INTO `loginlog` VALUES (141, 'admin', 'admin', '127.0.0.1', '2016-05-12 19:10:35');
INSERT INTO `loginlog` VALUES (142, 'admin', 'admin', '127.0.0.1', '2016-05-14 01:58:21');
INSERT INTO `loginlog` VALUES (143, 'admin', 'admin', '127.0.0.1', '2016-05-14 02:45:50');
INSERT INTO `loginlog` VALUES (144, 'admin', 'admin', '127.0.0.1', '2016-05-14 04:58:03');
INSERT INTO `loginlog` VALUES (145, 'admin', 'admin', '127.0.0.1', '2016-05-14 06:14:03');
INSERT INTO `loginlog` VALUES (146, 'admin', 'admin', '127.0.0.1', '2016-05-14 08:21:25');
INSERT INTO `loginlog` VALUES (147, 'admin', 'admin', '127.0.0.1', '2016-05-14 09:24:54');
INSERT INTO `loginlog` VALUES (148, 'admin', 'admin', '127.0.0.1', '2016-05-14 11:40:55');
INSERT INTO `loginlog` VALUES (149, 'admin', 'admin', '127.0.0.1', '2016-05-15 02:35:40');
INSERT INTO `loginlog` VALUES (150, 'admin', 'admin', '127.0.0.1', '2016-05-15 05:03:42');
INSERT INTO `loginlog` VALUES (151, 'admin', 'admin', '127.0.0.1', '2016-05-15 06:45:02');
INSERT INTO `loginlog` VALUES (152, 'admin', 'admin', '127.0.0.1', '2016-05-15 07:45:57');
INSERT INTO `loginlog` VALUES (153, 'admin', 'admin', '127.0.0.1', '2016-05-15 08:49:12');
INSERT INTO `loginlog` VALUES (154, 'admin', 'admin', '127.0.0.1', '2016-05-15 11:49:30');
INSERT INTO `loginlog` VALUES (155, 'test1', '123456', '127.0.0.1', '2016-05-16 07:07:57');
INSERT INTO `loginlog` VALUES (156, 'admin', 'admin', '127.0.0.1', '2016-05-16 07:10:05');
INSERT INTO `loginlog` VALUES (157, 'test1', '123456', '127.0.0.1', '2016-05-16 07:50:24');
INSERT INTO `loginlog` VALUES (158, 'admin', 'admin', '127.0.0.1', '2016-05-16 12:02:47');
INSERT INTO `loginlog` VALUES (159, 'test1', '123456', '127.0.0.1', '2016-05-16 12:06:36');
INSERT INTO `loginlog` VALUES (160, 'admin', 'admin', '127.0.0.1', '2016-05-16 12:08:37');
INSERT INTO `loginlog` VALUES (161, 'admin', 'admin', '127.0.0.1', '2016-05-17 08:12:45');
INSERT INTO `loginlog` VALUES (162, 'admin', 'admin', '127.0.0.1', '2016-05-18 02:05:27');
INSERT INTO `loginlog` VALUES (163, 'admin', 'admin', '127.0.0.1', '2016-05-18 03:10:47');
INSERT INTO `loginlog` VALUES (164, 'admin', 'admin', '127.0.0.1', '2016-05-18 06:14:59');
INSERT INTO `loginlog` VALUES (165, 'admin', 'admin', '127.0.0.1', '2016-05-18 11:07:38');
INSERT INTO `loginlog` VALUES (166, 'admin', 'admin', '127.0.0.1', '2016-05-18 12:15:09');
INSERT INTO `loginlog` VALUES (167, 'admin', 'admin', '127.0.0.1', '2016-05-18 13:18:32');
INSERT INTO `loginlog` VALUES (168, 'admin', 'admin', '127.0.0.1', '2016-05-19 01:50:45');
INSERT INTO `loginlog` VALUES (169, 'admin', 'admin', '127.0.0.1', '2016-05-19 03:38:49');
INSERT INTO `loginlog` VALUES (170, 'admin', 'admin', '127.0.0.1', '2016-05-19 07:29:06');
INSERT INTO `loginlog` VALUES (171, 'admin', 'admin', '127.0.0.1', '2016-05-19 08:36:00');
INSERT INTO `loginlog` VALUES (172, 'admin', 'admin', '127.0.0.1', '2016-05-19 10:14:38');
INSERT INTO `loginlog` VALUES (173, 'admin', 'admin', '127.0.0.1', '2016-05-20 01:56:32');
INSERT INTO `loginlog` VALUES (174, 'admin', 'admin', '127.0.0.1', '2016-05-20 05:00:09');
INSERT INTO `loginlog` VALUES (175, 'admin', 'admin', '127.0.0.1', '2016-05-21 02:27:46');
INSERT INTO `loginlog` VALUES (176, 'test1', '123456', '127.0.0.1', '2016-05-21 02:28:21');
INSERT INTO `loginlog` VALUES (177, 'admin', 'admin', '127.0.0.1', '2016-05-21 02:32:01');
INSERT INTO `loginlog` VALUES (178, 'admin', 'admin', '127.0.0.1', '2016-05-21 11:22:25');
INSERT INTO `loginlog` VALUES (179, 'admin', 'admin', '127.0.0.1', '2016-05-22 13:55:10');
INSERT INTO `loginlog` VALUES (180, 'test1', '123456', '127.0.0.1', '2016-04-23 16:36:09');
INSERT INTO `loginlog` VALUES (181, 'admin', 'admin', '127.0.0.1', '2016-05-24 09:05:18');
INSERT INTO `loginlog` VALUES (182, 'admin', 'admin', '127.0.0.1', '2016-05-24 10:07:20');
INSERT INTO `loginlog` VALUES (183, 'admin', 'admin', '127.0.0.1', '2016-05-24 12:41:45');
INSERT INTO `loginlog` VALUES (184, 'admin', 'admin', '127.0.0.1', '2016-05-24 14:02:50');
INSERT INTO `loginlog` VALUES (185, 'admin', 'admin', '127.0.0.1', '2016-05-24 15:11:06');
INSERT INTO `loginlog` VALUES (186, 'test1', '123456', '127.0.0.1', '2016-05-24 16:17:16');
INSERT INTO `loginlog` VALUES (187, 'admin', 'admin', '127.0.0.1', '2016-05-24 16:27:36');
INSERT INTO `loginlog` VALUES (188, 'admin', 'admin', '127.0.0.1', '2016-05-25 09:15:55');
INSERT INTO `loginlog` VALUES (189, 'admin', 'admin', '127.0.0.1', '2016-05-25 10:21:37');
INSERT INTO `loginlog` VALUES (190, 'admin', 'admin', '127.0.0.1', '2016-05-29 01:30:07');
INSERT INTO `loginlog` VALUES (191, 'admin', 'admin', '127.0.0.1', '2016-05-29 01:55:04');
INSERT INTO `loginlog` VALUES (192, 'admin', 'admin', '127.0.0.1', '2016-05-29 02:13:08');
INSERT INTO `loginlog` VALUES (193, 'admin', 'admin', '127.0.0.1', '2016-05-29 02:16:03');
INSERT INTO `loginlog` VALUES (194, 'admin', 'admin', '127.0.0.1', '2016-05-29 02:33:11');
INSERT INTO `loginlog` VALUES (195, 'admin', 'admin', '127.0.0.1', '2016-05-29 07:42:49');
INSERT INTO `loginlog` VALUES (196, 'admin', 'admin', '127.0.0.1', '2016-05-29 08:57:24');
INSERT INTO `loginlog` VALUES (197, 'admin', 'admin', '127.0.0.1', '2016-05-29 09:58:46');
INSERT INTO `loginlog` VALUES (198, 'admin', 'admin', '127.0.0.1', '2016-05-29 11:06:51');
INSERT INTO `loginlog` VALUES (199, 'admin', 'admin', '127.0.0.1', '2016-05-29 12:08:26');
INSERT INTO `loginlog` VALUES (200, 'admin', 'admin', '127.0.0.1', '2016-05-31 07:49:07');
INSERT INTO `loginlog` VALUES (201, 'admin', 'admin', '127.0.0.1', '2016-05-31 08:49:15');
INSERT INTO `loginlog` VALUES (202, 'admin', 'admin', '127.0.0.1', '2016-06-02 10:49:58');
INSERT INTO `loginlog` VALUES (203, 'admin', 'admin', '127.0.0.1', '2016-06-05 02:19:31');
INSERT INTO `loginlog` VALUES (204, 'admin', 'admin', '127.0.0.1', '2016-06-05 03:25:22');
INSERT INTO `loginlog` VALUES (205, 'admin', 'admin', '127.0.0.1', '2016-06-07 01:11:29');
INSERT INTO `loginlog` VALUES (206, 'admin', 'admin', '127.0.0.1', '2016-06-07 06:15:14');
INSERT INTO `loginlog` VALUES (207, 'admin', 'admin', '127.0.0.1', '2017-10-01 10:54:49');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail`  (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `from_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `new_mail` tinyint(1) NOT NULL DEFAULT 1,
  `reply` tinyint(4) NULL DEFAULT 0,
  `in_date` datetime(0) NULL DEFAULT NULL,
  `defunct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`mail_id`) USING BTREE,
  INDEX `uid`(`to_user`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`major_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `release` int(11) NULL DEFAULT 0,
  `type` int(11) NULL DEFAULT 0,
  `author` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for online
-- ----------------------------
DROP TABLE IF EXISTS `online`;
CREATE TABLE `online`  (
  `hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `refer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lastmove` int(10) NOT NULL,
  `firsttime` int(10) NULL DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`hash`) USING BTREE,
  UNIQUE INDEX `hash`(`hash`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege`  (
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rightstr` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `defunct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `problem_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `input` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `output` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sample_input` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sample_output` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `spj` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `hint` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_date` datetime(0) NULL DEFAULT NULL,
  `time_limit` int(11) NOT NULL DEFAULT 0,
  `memory_limit` int(11) NOT NULL DEFAULT 0,
  `defunct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `accepted` int(11) NULL DEFAULT 0,
  `submit` int(11) NULL DEFAULT 0,
  `solved` int(11) NULL DEFAULT 0,
  `fileupload` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N',
  PRIMARY KEY (`problem_id`) USING BTREE,
  UNIQUE INDEX `problem_id_UNIQUE`(`problem_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (7, 'a+b', '<p>a+b<br></p>', '<p>输入两个整数（int）<br></p>', '<p>输出答案 c<br></p>', '<p>1 1<br></p>', '<p>2<br></p>', '', '<p><br></p>', NULL, '2016-05-05 08:14:05', 1000, 12800, '', 210, 29, 0, 'Y');
INSERT INTO `problem` VALUES (8, '亲密数', '<p>如果a的所有正因子和等于b，b的所有正因子和等于a，因子包括1但不包括本身，且a不等于b，则称a，b为亲密数对。一般通过叠代编程求出相应的亲密数对。</p><p><br></p>', '<p>输入一个[0，3000]以内的数a<br></p>', '<p>输出a以内的所有亲密数对(若a以内不存这样的数对，则不输出)<br></p>', '<p>300<br></p>', '<p>220..284<br></p>', '', '<p><br></p>', NULL, '2016-05-14 02:04:39', 1000, 65535, '', 126, 19, 0, 'N');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `topic_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for runtimeinfo
-- ----------------------------
DROP TABLE IF EXISTS `runtimeinfo`;
CREATE TABLE `runtimeinfo`  (
  `solution_id` int(11) NOT NULL DEFAULT 0,
  `error` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`solution_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for semester
-- ----------------------------
DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester`  (
  `semester_id` int(11) NOT NULL,
  `semester_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`semester_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sim
-- ----------------------------
DROP TABLE IF EXISTS `sim`;
CREATE TABLE `sim`  (
  `s_id` int(11) NOT NULL,
  `sim_s_id` int(11) NOT NULL,
  `sim` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`, `sim_s_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of sim
-- ----------------------------
INSERT INTO `sim` VALUES (-1, -1, -1);
INSERT INTO `sim` VALUES (71, 70, 100);
INSERT INTO `sim` VALUES (72, 70, 100);
INSERT INTO `sim` VALUES (72, 71, 100);
INSERT INTO `sim` VALUES (75, 74, 100);
INSERT INTO `sim` VALUES (78, 74, 100);
INSERT INTO `sim` VALUES (78, 75, 100);
INSERT INTO `sim` VALUES (81, 70, 100);
INSERT INTO `sim` VALUES (81, 71, 100);
INSERT INTO `sim` VALUES (81, 72, 100);
INSERT INTO `sim` VALUES (84, 82, 100);
INSERT INTO `sim` VALUES (85, 82, 92);
INSERT INTO `sim` VALUES (85, 84, 92);
INSERT INTO `sim` VALUES (86, 74, 100);
INSERT INTO `sim` VALUES (86, 75, 100);
INSERT INTO `sim` VALUES (86, 78, 100);
INSERT INTO `sim` VALUES (88, 74, 100);
INSERT INTO `sim` VALUES (88, 75, 100);
INSERT INTO `sim` VALUES (88, 78, 100);
INSERT INTO `sim` VALUES (88, 86, 100);
INSERT INTO `sim` VALUES (90, 74, 100);
INSERT INTO `sim` VALUES (90, 75, 100);
INSERT INTO `sim` VALUES (90, 78, 100);
INSERT INTO `sim` VALUES (90, 86, 100);
INSERT INTO `sim` VALUES (90, 88, 100);
INSERT INTO `sim` VALUES (91, 74, 100);
INSERT INTO `sim` VALUES (91, 75, 100);
INSERT INTO `sim` VALUES (91, 78, 100);
INSERT INTO `sim` VALUES (91, 86, 100);
INSERT INTO `sim` VALUES (91, 88, 100);
INSERT INTO `sim` VALUES (91, 90, 100);
INSERT INTO `sim` VALUES (92, 74, 100);
INSERT INTO `sim` VALUES (92, 75, 100);
INSERT INTO `sim` VALUES (92, 78, 100);
INSERT INTO `sim` VALUES (92, 86, 100);
INSERT INTO `sim` VALUES (92, 88, 100);
INSERT INTO `sim` VALUES (92, 90, 100);
INSERT INTO `sim` VALUES (92, 91, 100);
INSERT INTO `sim` VALUES (95, 74, 71);
INSERT INTO `sim` VALUES (95, 75, 71);
INSERT INTO `sim` VALUES (95, 78, 71);
INSERT INTO `sim` VALUES (95, 86, 71);
INSERT INTO `sim` VALUES (95, 88, 71);
INSERT INTO `sim` VALUES (95, 90, 71);
INSERT INTO `sim` VALUES (95, 91, 71);
INSERT INTO `sim` VALUES (95, 92, 71);
INSERT INTO `sim` VALUES (98, 83, 100);
INSERT INTO `sim` VALUES (99, 82, 92);
INSERT INTO `sim` VALUES (99, 84, 92);
INSERT INTO `sim` VALUES (99, 85, 100);
INSERT INTO `sim` VALUES (97, 74, 100);
INSERT INTO `sim` VALUES (97, 75, 100);
INSERT INTO `sim` VALUES (97, 78, 100);
INSERT INTO `sim` VALUES (97, 86, 100);
INSERT INTO `sim` VALUES (97, 88, 100);
INSERT INTO `sim` VALUES (97, 90, 100);
INSERT INTO `sim` VALUES (97, 91, 100);
INSERT INTO `sim` VALUES (97, 92, 100);
INSERT INTO `sim` VALUES (97, 95, 87);
INSERT INTO `sim` VALUES (101, 82, 92);
INSERT INTO `sim` VALUES (101, 84, 92);
INSERT INTO `sim` VALUES (101, 85, 100);
INSERT INTO `sim` VALUES (101, 99, 100);
INSERT INTO `sim` VALUES (102, 101, 94);
INSERT INTO `sim` VALUES (102, 82, 100);
INSERT INTO `sim` VALUES (102, 84, 100);
INSERT INTO `sim` VALUES (102, 85, 94);
INSERT INTO `sim` VALUES (102, 99, 94);
INSERT INTO `sim` VALUES (103, 101, 94);
INSERT INTO `sim` VALUES (103, 102, 100);
INSERT INTO `sim` VALUES (103, 82, 100);
INSERT INTO `sim` VALUES (103, 84, 100);
INSERT INTO `sim` VALUES (103, 85, 94);
INSERT INTO `sim` VALUES (103, 99, 94);
INSERT INTO `sim` VALUES (105, 101, 94);
INSERT INTO `sim` VALUES (105, 102, 100);
INSERT INTO `sim` VALUES (105, 103, 100);
INSERT INTO `sim` VALUES (105, 82, 100);
INSERT INTO `sim` VALUES (105, 84, 100);
INSERT INTO `sim` VALUES (105, 85, 94);
INSERT INTO `sim` VALUES (105, 99, 94);
INSERT INTO `sim` VALUES (106, 83, 100);
INSERT INTO `sim` VALUES (106, 98, 100);
INSERT INTO `sim` VALUES (108, 84, 56);
INSERT INTO `sim` VALUES (108, 102, 56);
INSERT INTO `sim` VALUES (108, 103, 56);
INSERT INTO `sim` VALUES (108, 105, 56);
INSERT INTO `sim` VALUES (113, 99, 34);
INSERT INTO `sim` VALUES (108, 82, 56);
INSERT INTO `sim` VALUES (104, 79, 100);
INSERT INTO `sim` VALUES (104, 80, 100);
INSERT INTO `sim` VALUES (114, 113, 100);
INSERT INTO `sim` VALUES (113, 102, 38);
INSERT INTO `sim` VALUES (113, 103, 38);
INSERT INTO `sim` VALUES (113, 105, 38);
INSERT INTO `sim` VALUES (113, 85, 34);
INSERT INTO `sim` VALUES (114, 108, 42);
INSERT INTO `sim` VALUES (113, 84, 38);
INSERT INTO `sim` VALUES (113, 82, 38);
INSERT INTO `sim` VALUES (113, 108, 42);
INSERT INTO `sim` VALUES (112, 104, 100);
INSERT INTO `sim` VALUES (112, 79, 100);
INSERT INTO `sim` VALUES (112, 80, 100);
INSERT INTO `sim` VALUES (113, 101, 34);

-- ----------------------------
-- Table structure for sim_config
-- ----------------------------
DROP TABLE IF EXISTS `sim_config`;
CREATE TABLE `sim_config`  (
  `id` int(11) NOT NULL,
  `sim_enable` tinyint(4) NOT NULL DEFAULT 1,
  `sim_threshold` int(11) NOT NULL DEFAULT 30,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sim_config
-- ----------------------------
INSERT INTO `sim_config` VALUES (1, 1, 10);

-- ----------------------------
-- Table structure for solution
-- ----------------------------
DROP TABLE IF EXISTS `solution`;
CREATE TABLE `solution`  (
  `solution_id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL DEFAULT 0,
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-1',
  `time` int(11) NULL DEFAULT 0,
  `memory` int(11) NULL DEFAULT 0,
  `in_date` datetime(0) NULL,
  `result` smallint(6) NULL DEFAULT 0,
  `language` tinyint(4) NULL DEFAULT 0,
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.0.0.0',
  `contest_id` int(11) NULL DEFAULT NULL,
  `valid` tinyint(4) NULL DEFAULT -1,
  `num` tinyint(4) NULL DEFAULT -1,
  `code_length` int(11) NULL DEFAULT 0,
  `judgetime` datetime(0) NULL DEFAULT NULL,
  `is_sim` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`solution_id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  INDEX `pid`(`problem_id`) USING BTREE,
  INDEX `res`(`result`) USING BTREE,
  INDEX `cid`(`contest_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of solution
-- ----------------------------
INSERT INTO `solution` VALUES (71, 7, 'admin', 0, 276, '2016-05-05 11:16:30', 1, 0, '127.0.0.1', -1, NULL, NULL, 148, NULL, 1);
INSERT INTO `solution` VALUES (72, 7, 'admin', 0, 276, '2016-05-06 07:35:28', 1, 0, '127.0.0.1', -1, NULL, NULL, 148, NULL, 1);
INSERT INTO `solution` VALUES (70, 7, 'admin', 0, 276, '2016-05-05 10:37:51', 1, 0, '127.0.0.1', -1, NULL, NULL, 148, NULL, 0);
INSERT INTO `solution` VALUES (73, 7, 'admin', 0, 0, '2016-05-12 19:10:57', 7, 0, '127.0.0.1', -1, NULL, NULL, 3, NULL, 0);
INSERT INTO `solution` VALUES (74, 7, 'admin', 0, 476, '2016-05-14 05:02:21', 1, 1, '127.0.0.1', -1, NULL, NULL, 141, NULL, 0);
INSERT INTO `solution` VALUES (75, 7, 'admin', 0, 476, '2016-05-14 05:27:59', 1, 1, '127.0.0.1', -1, NULL, NULL, 141, NULL, 1);
INSERT INTO `solution` VALUES (76, 7, 'admin', 0, 0, '2016-05-14 05:28:22', 7, 0, '127.0.0.1', -1, NULL, NULL, 167, NULL, 0);
INSERT INTO `solution` VALUES (77, 7, 'admin', 0, 0, '2016-05-14 05:55:12', 7, 1, '127.0.0.1', -1, NULL, NULL, 167, NULL, 0);
INSERT INTO `solution` VALUES (78, 7, 'admin', 0, 476, '2016-05-14 05:56:48', 1, 1, '127.0.0.1', -1, NULL, NULL, 165, NULL, 1);
INSERT INTO `solution` VALUES (79, 7, 'admin', 84, 16676, '2016-05-14 06:14:28', 1, 2, '127.0.0.1', -1, NULL, NULL, 236, NULL, 0);
INSERT INTO `solution` VALUES (80, 7, 'admin', 64, 16688, '2016-05-14 06:15:43', 1, 2, '127.0.0.1', -1, NULL, NULL, 236, NULL, 0);
INSERT INTO `solution` VALUES (81, 7, 'admin', 0, 280, '2016-05-14 09:31:14', 1, 0, '127.0.0.1', 31, NULL, NULL, 148, NULL, 1);
INSERT INTO `solution` VALUES (82, 8, 'admin', 16, 284, '2016-05-14 11:54:14', 1, 0, '127.0.0.1', -1, NULL, NULL, 542, NULL, 0);
INSERT INTO `solution` VALUES (83, 8, 'admin', 16, 280, '2016-05-14 11:54:40', 1, 0, '127.0.0.1', -1, NULL, NULL, 582, NULL, 0);
INSERT INTO `solution` VALUES (84, 8, 'admin', 12, 284, '2016-05-14 11:55:57', 1, 0, '127.0.0.1', -1, NULL, NULL, 542, NULL, 1);
INSERT INTO `solution` VALUES (85, 8, 'admin', 16, 284, '2016-05-14 12:00:21', 1, 0, '127.0.0.1', -1, NULL, NULL, 596, NULL, 1);
INSERT INTO `solution` VALUES (86, 7, 'admin', 0, 476, '2016-05-15 07:41:11', 1, 1, '127.0.0.1', -1, NULL, NULL, 157, NULL, 1);
INSERT INTO `solution` VALUES (87, 7, 'test1', 0, 0, '2016-05-16 07:50:39', 7, 0, '127.0.0.1', -1, NULL, NULL, 157, NULL, 0);
INSERT INTO `solution` VALUES (88, 7, 'test1', 0, 480, '2016-05-16 07:51:32', 1, 1, '127.0.0.1', -1, NULL, NULL, 157, NULL, 1);
INSERT INTO `solution` VALUES (89, 7, 'admin', 0, 0, '2016-05-19 08:36:21', 7, 0, '127.0.0.1', -1, NULL, NULL, 157, NULL, 0);
INSERT INTO `solution` VALUES (90, 7, 'admin', 0, 476, '2016-05-19 08:38:29', 1, 1, '127.0.0.1', -1, NULL, NULL, 157, NULL, 1);
INSERT INTO `solution` VALUES (91, 7, 'admin', 0, 480, '2016-05-19 10:16:37', 1, 1, '127.0.0.1', -1, NULL, NULL, 157, NULL, 1);
INSERT INTO `solution` VALUES (92, 7, 'admin', 0, 476, '2016-05-20 01:56:51', 1, 1, '127.0.0.1', -1, NULL, NULL, 157, NULL, 1);
INSERT INTO `solution` VALUES (93, 7, 'test1', 1010, 0, '2016-04-23 16:39:07', 2, 1, '127.0.0.1', -1, NULL, NULL, 174, NULL, 0);
INSERT INTO `solution` VALUES (94, 7, 'test1', 0, 0, '2016-04-23 16:40:29', 7, 0, '127.0.0.1', -1, NULL, NULL, 188, NULL, 0);
INSERT INTO `solution` VALUES (95, 7, 'test1', 0, 476, '2016-04-23 16:41:04', 1, 1, '127.0.0.1', -1, NULL, NULL, 189, NULL, 1);
INSERT INTO `solution` VALUES (96, 7, 'test1', 0, 576, '2016-04-23 16:42:29', 1, 1, '127.0.0.1', -1, NULL, NULL, 160, NULL, 0);
INSERT INTO `solution` VALUES (97, 7, 'admin', 0, 480, '2016-05-24 14:03:47', 1, 1, '127.0.0.1', 42, NULL, NULL, 157, NULL, 1);
INSERT INTO `solution` VALUES (98, 8, 'admin', 16, 284, '2016-05-24 15:37:02', 1, 0, '127.0.0.1', 43, NULL, NULL, 582, NULL, 1);
INSERT INTO `solution` VALUES (99, 8, 'admin', 12, 284, '2016-05-24 15:52:09', 1, 0, '127.0.0.1', 43, NULL, NULL, 596, NULL, 1);
INSERT INTO `solution` VALUES (100, 8, 'admin', 0, 0, '2016-05-24 15:52:52', 7, 0, '127.0.0.1', 43, NULL, NULL, 66, NULL, 0);
INSERT INTO `solution` VALUES (101, 8, 'admin', 16, 280, '2016-05-24 15:53:46', 1, 0, '127.0.0.1', 43, NULL, NULL, 596, NULL, 1);
INSERT INTO `solution` VALUES (102, 8, 'admin', 16, 284, '2016-05-24 15:55:23', 1, 0, '127.0.0.1', -1, NULL, NULL, 542, NULL, 1);
INSERT INTO `solution` VALUES (103, 8, 'admin', 16, 284, '2016-05-24 16:03:57', 1, 0, '127.0.0.1', -1, NULL, NULL, 580, NULL, 1);
INSERT INTO `solution` VALUES (104, 7, 'admin', 96, 16700, '2016-05-24 16:05:21', 1, 2, '127.0.0.1', -1, NULL, NULL, 236, NULL, 1);
INSERT INTO `solution` VALUES (105, 8, 'test1', 16, 280, '2016-05-24 16:17:43', 1, 0, '127.0.0.1', 43, NULL, NULL, 542, NULL, 1);
INSERT INTO `solution` VALUES (106, 8, 'test1', 16, 284, '2016-05-24 16:18:28', 1, 0, '127.0.0.1', -1, NULL, NULL, 582, NULL, 1);
INSERT INTO `solution` VALUES (107, 8, 'test1', 0, 0, '2016-05-24 16:18:48', 7, 0, '127.0.0.1', -1, NULL, NULL, 499, NULL, 0);
INSERT INTO `solution` VALUES (108, 8, 'test1', 12, 284, '2016-05-24 16:20:35', 1, 0, '127.0.0.1', -1, NULL, NULL, 516, NULL, 1);
INSERT INTO `solution` VALUES (109, 8, 'test1', 0, 280, '2016-05-24 16:21:30', 4, 0, '127.0.0.1', -1, NULL, NULL, 455, NULL, 0);
INSERT INTO `solution` VALUES (110, 8, 'test1', 0, 280, '2016-05-24 16:24:48', 4, 0, '127.0.0.1', -1, NULL, NULL, 455, NULL, 0);
INSERT INTO `solution` VALUES (111, 8, 'test1', 0, 280, '2016-05-24 16:25:22', 4, 0, '127.0.0.1', -1, NULL, NULL, 455, NULL, 0);
INSERT INTO `solution` VALUES (112, 7, 'admin', 60, 16708, '2016-05-24 16:29:45', 1, 2, '127.0.0.1', 43, NULL, NULL, 254, NULL, 1);
INSERT INTO `solution` VALUES (113, 8, 'admin', 12, 260, '2016-05-24 16:31:26', 1, 0, '127.0.0.1', -1, NULL, NULL, 635, NULL, 1);
INSERT INTO `solution` VALUES (114, 8, 'admin', 12, 280, '2016-05-29 08:42:27', 1, 0, '127.0.0.1', -1, NULL, NULL, 695, NULL, 1);

-- ----------------------------
-- Table structure for source_code
-- ----------------------------
DROP TABLE IF EXISTS `source_code`;
CREATE TABLE `source_code`  (
  `solution_id` int(11) NOT NULL,
  `source` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`solution_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of source_code
-- ----------------------------
INSERT INTO `source_code` VALUES (67, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (68, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (69, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (70, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (71, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (72, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (73, 'aaa');
INSERT INTO `source_code` VALUES (74, '#include <iostream>\r\nusing namespace std;\r\nint main(void)\r\n{\r\n    int a, b;\r\n    cin >> a >> b;\r\n    cout << a + b << endl;\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (75, '#include <iostream>\r\nusing namespace std;\r\nint main(void)\r\n{\r\n    int a, b;\r\n    cin >> a >> b;\r\n    cout << a + b << endl;\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (76, '#include <iostream>\r\n\r\n　\r\n\r\nusing namespace std;\r\n\r\n　\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (77, '#include <iostream>\r\n\r\n　\r\n\r\nusing namespace std;\r\n\r\n　\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (78, '#include <iostream>\r\n\r\n\r\n\r\nusing namespace std;\r\n\r\n\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (79, 'import java.util.*;\r\npublic class Main\r\n{\r\n    public static void main(String args[])\r\n    {\r\n        Scanner cin = new Scanner(System.in);\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n        System.out.println(a + b);\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (80, 'import java.util.*;\r\npublic class Main\r\n{\r\n    public static void main(String args[])\r\n    {\r\n        Scanner cin = new Scanner(System.in);\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n        System.out.println(a + b);\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (81, '#include <stdio.h>\r\n\r\nint main()\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    while(scanf(\"%d %d\", &a, &b)!=EOF)\r\n\r\n    printf(\"%d\\n\", a + b);\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (82, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (83, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000)\r\n    {\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            int b=0,n=0;\r\n            int i=1,j=1;\r\n            while(i<=a/2)\r\n            {\r\n                if(a%i==0)b+=i;\r\n                i++;\r\n            }\r\n            while(j<=b/2)\r\n            {\r\n                if(b%j==0)n+=j;\r\n                j++;\r\n            }\r\n            if(a<b&&n==a)\r\n                printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else printf(\"input beyond the range!\");\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (84, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (85, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int var_a,var_i,var_b,var_n,var_range;\r\n    scanf(\"%d\",&var_range);\r\n    if(var_range<2||var_range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(var_a=1;var_a<=var_range;var_a++)\r\n        {\r\n            for(var_b=0,var_i=1;var_i<=var_a/2;var_i++)\r\n                if(!(var_a%var_i))var_b+=var_i;\r\n            for(var_n=0,var_i=1;var_i<=var_b/2;var_i++)\r\n                if(!(var_b%var_i))var_n+=var_i;\r\n            if(var_n==var_a&&var_a<var_b)\r\n                printf(\"%d..%d\\n\",var_a,var_b);\r\n        }\r\n    }\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (86, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (87, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (88, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (89, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (90, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (91, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (92, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (93, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n    while(true){\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;}\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (94, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n    cout << \"        \"<<endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (95, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n    cout << \"         \"<<endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (96, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    double a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (97, '#include <iostream>\r\n\r\nusing namespace std;\r\n\r\nint main(void)\r\n\r\n{\r\n\r\n    int a, b;\r\n\r\n    cin >> a >> b;\r\n\r\n    cout << a + b << endl;\r\n\r\n    return 0;\r\n\r\n}');
INSERT INTO `source_code` VALUES (98, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000)\r\n    {\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            int b=0,n=0;\r\n            int i=1,j=1;\r\n            while(i<=a/2)\r\n            {\r\n                if(a%i==0)b+=i;\r\n                i++;\r\n            }\r\n            while(j<=b/2)\r\n            {\r\n                if(b%j==0)n+=j;\r\n                j++;\r\n            }\r\n            if(a<b&&n==a)\r\n                printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else printf(\"input beyond the range!\");\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (99, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int var_a,var_i,var_b,var_n,var_range;\r\n    scanf(\"%d\",&var_range);\r\n    if(var_range<2||var_range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(var_a=1;var_a<=var_range;var_a++)\r\n        {\r\n            for(var_b=0,var_i=1;var_i<=var_a/2;var_i++)\r\n                if(!(var_a%var_i))var_b+=var_i;\r\n            for(var_n=0,var_i=1;var_i<=var_b/2;var_i++)\r\n                if(!(var_b%var_i))var_n+=var_i;\r\n            if(var_n==var_a&&var_a<var_b)\r\n                printf(\"%d..%d\\n\",var_a,var_b);\r\n        }\r\n    }\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (100, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    while(true){}\r\nreturn 0;\r\n}');
INSERT INTO `source_code` VALUES (101, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int var_a,var_i,var_b,var_n,var_range;\r\n    scanf(\"%d\",&var_range);\r\n    if(var_range<2||var_range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(var_a=1;var_a<=var_range;var_a++)\r\n        {\r\n            for(var_b=0,var_i=1;var_i<=var_a/2;var_i++)\r\n                if(!(var_a%var_i))var_b+=var_i;\r\n            for(var_n=0,var_i=1;var_i<=var_b/2;var_i++)\r\n                if(!(var_b%var_i))var_n+=var_i;\r\n            if(var_n==var_a&&var_a<var_b)\r\n                printf(\"%d..%d\\n\",var_a,var_b);\r\n        }\r\n    }\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (102, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (103, '﻿#include<stdio.h>\r\n\r\nvoid main()\r\n\r\n{\r\n\r\n    int a,i,b,n,range;\r\n\r\n    scanf(\"%d\",&range);\r\n\r\n    if(range<2||range>3000)\r\n\r\n        printf(\"input beyond the range!\");\r\n\r\n    else{\r\n\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n\r\n        {\r\n\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n\r\n               if(!(a%i))b+=i;\r\n\r\n               //计算b的各因子，各因子之和存于n\r\n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n\r\n               if(!(b%i))n+=i;\r\n\r\n               if(n==a&&a<b)\r\n\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n\r\n        }\r\n\r\n    }\r\n\r\n}');
INSERT INTO `source_code` VALUES (104, 'import java.util.*;\r\npublic class Main\r\n{\r\n    public static void main(String args[])\r\n    {\r\n        Scanner cin = new Scanner(System.in);\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n        System.out.println(a + b);\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (105, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,range;\r\n    scanf(\"%d\",&range);\r\n    if(range<2||range>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=range;a++) //穷举range以内的全部整数\r\n        {\r\n               for(b=0,i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n               if(!(a%i))b+=i;\r\n               //计算b的各因子，各因子之和存于n\r\n               for(n=0, i=1; i<=b/2; i++)\r\n               if(!(b%i))n+=i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n =a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (106, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000)\r\n    {\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            int b=0,n=0;\r\n            int i=1,j=1;\r\n            while(i<=a/2)\r\n            {\r\n                if(a%i==0)b+=i;\r\n                i++;\r\n            }\r\n            while(j<=b/2)\r\n            {\r\n                if(b%j==0)n+=j;\r\n                j++;\r\n            }\r\n            if(a<b&&n==a)\r\n                printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else printf(\"input beyond the range!\");\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (107, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,r;\r\n    scanf(\"%d\",&r);\r\n    if(r<2||r>3000)\r\n    else{\r\n        for(a=1;a<=r;a++)//穷举range以内的全部整数\r\n        {\r\n            b=0; n=0;\r\n            for(i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n            if(a%i==0)\r\n               b=b+i; //计算b的各因子，各因子之和存于n\r\n            for(i=1;i<=b/2;i++)\r\n               if(b%i==0)\r\n               n=n+i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n=a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (108, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,r;\r\n    scanf(\"%d\",&r);\r\n    if(r<2||r>3000)\r\n    printf(\"\");\r\n    else{\r\n        for(a=1;a<=r;a++)//穷举range以内的全部整数\r\n        {\r\n            b=0; n=0;\r\n            for(i=1;i<=a/2;i++) //计算数a的各因子，各因子之和存放于b\r\n            if(a%i==0)\r\n               b=b+i; //计算b的各因子，各因子之和存于n\r\n            for(i=1;i<=b/2;i++)\r\n               if(b%i==0)\r\n               n=n+i;\r\n               if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b); //若n=a，则a和b是一对亲密数，输出\r\n        }\r\n    }\r\n}');
INSERT INTO `source_code` VALUES (109, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int a,i,b,j,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000){\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            for(b=0,i=1;i<=a/2;i++)\r\n                if(!(a%i))b+=i;\r\n            for(j=0,i=1;i<=b/2;i++)\r\n                if(!(b%i))j=j+i+1-1;\r\n            if(j==a&&a>b)\r\n            printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else\r\n        printf(\"input beyond the range!\");\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (110, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int a,i,b,j,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000){\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            for(b=0,i=1;i<=a/2;i++)\r\n                if(!(a%i))b+=i;\r\n            for(j=0,i=1;i<=b/2;i++)\r\n                if(!(b%i))j=j+i+1-1;\r\n            if(j==a&&a>b)\r\n            printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else\r\n        printf(\"input beyond the range!\");\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (111, '﻿#include<stdio.h>\r\nint main()\r\n{\r\n    int a,i,b,j,range;\r\n    scanf(\"%d\",&range);\r\n    if(range>=2&&range<=3000){\r\n        for(a=1;a<=range;a++)\r\n        {\r\n            for(b=0,i=1;i<=a/2;i++)\r\n                if(!(a%i))b+=i;\r\n            for(j=0,i=1;i<=b/2;i++)\r\n                if(!(b%i))j=j+i+1-1;\r\n            if(j==a&&a>b)\r\n            printf(\"%d..%d\\n\",a,b);\r\n        }\r\n    }\r\n    else\r\n        printf(\"input beyond the range!\");\r\n    return 0;\r\n}');
INSERT INTO `source_code` VALUES (112, 'import java.util.*;\r\n\r\npublic class Main\r\n\r\n{\r\n\r\n    public static void main(String args[])\r\n\r\n    {\r\n\r\n        Scanner cin = new Scanner(System.in);\r\n\r\n        int a = cin.nextInt(), b = cin.nextInt();\r\n\r\n        System.out.println(a + b);\r\n\r\n    }\r\n\r\n}');
INSERT INTO `source_code` VALUES (113, '﻿#include<stdio.h>\r\nvoid main()\r\n{\r\n    int a,i,b,n,num;\r\n    scanf(\"%d\",&num);\r\n    if(num<2||num>3000)\r\n        printf(\"input beyond the range!\");\r\n    else{\r\n        for(a=1;a<=num;a++)\r\n        {\r\n            b=0;\r\n            i=1;\r\n            while(i<=a/2)\r\n            {\r\n               if(! (a%i))\r\n               {b+=i;}\r\n               i++;\r\n            }\r\n            n=0;\r\n            i=1;\r\n            while(i<=b/2)\r\n            {\r\n               if(!(b%i))\r\n               {n+=i;}\r\n               i++;\r\n            }\r\n            if(n==a&&a<b)\r\n               printf(\"%d..%d\\n\",a,b);\r\n        }//for\r\n    }//else\r\n}//main');
INSERT INTO `source_code` VALUES (114, '﻿#include<stdio.h>\r\n\r\nvoid main()\r\n\r\n{\r\n\r\n    int a,i,b,n,num;\r\n\r\n    scanf(\"%d\",&num);\r\n\r\n    if(num<2||num>3000)\r\n\r\n        printf(\"input beyond the range!\");\r\n\r\n    else{\r\n\r\n        for(a=1;a<=num;a++)\r\n\r\n        {\r\n\r\n            b=0;\r\n\r\n            i=1;\r\n\r\n            while(i<=a/2)\r\n\r\n            {\r\n\r\n               if(! (a%i))\r\n\r\n               {b+=i;}\r\n\r\n               i++;\r\n\r\n            }\r\n\r\n            n=0;\r\n\r\n            i=1;\r\n\r\n            while(i<=b/2)\r\n\r\n            {\r\n\r\n               if(!(b%i))\r\n\r\n               {n+=i;}\r\n\r\n               i++;\r\n\r\n            }\r\n\r\n            if(n==a&&a<b)\r\n\r\n               printf(\"%d..%d\\n\",a,b);\r\n\r\n        }//for\r\n\r\n    }//else\r\n\r\n}//main');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `status_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `status` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE,
  UNIQUE INDEX `status_id_UNIQUE`(`status_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 0, 'Waiting');
INSERT INTO `status` VALUES (2, 1, 'Accepted');
INSERT INTO `status` VALUES (3, 2, 'Time Limit Exceeded');
INSERT INTO `status` VALUES (4, 3, 'Memory Limit Exceeded');
INSERT INTO `status` VALUES (5, 4, 'Wrong Answer');
INSERT INTO `status` VALUES (6, 5, 'Runtime Error');
INSERT INTO `status` VALUES (7, 6, 'Output Limit');
INSERT INTO `status` VALUES (8, 7, 'Compile Error');
INSERT INTO `status` VALUES (9, 8, 'Presentation Error');
INSERT INTO `status` VALUES (10, 11, 'System Error');
INSERT INTO `status` VALUES (11, 12, 'Judging');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`student_num`) USING BTREE,
  INDEX `fk_student_class_1`(`class_id`) USING BTREE,
  CONSTRAINT `fk_student_class_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college_id` int(11) NULL DEFAULT NULL,
  `problem` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_num`) USING BTREE,
  INDEX `fk_teacher_college_1`(`college_id`) USING BTREE,
  CONSTRAINT `fk_teacher_college_1` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teaching_relation
-- ----------------------------
DROP TABLE IF EXISTS `teaching_relation`;
CREATE TABLE `teaching_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `course_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_teaching_relation_teacher_1`(`teacher_num`) USING BTREE,
  INDEX `fk_teaching_relation_class_1`(`class_id`) USING BTREE,
  INDEX `fk_teaching_relation_semester_1`(`semester_id`) USING BTREE,
  INDEX `fk_teaching_relation_course_1`(`course_code`) USING BTREE,
  CONSTRAINT `fk_teaching_relation_class_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_teaching_relation_course_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_teaching_relation_semester_1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_teaching_relation_teacher_1` FOREIGN KEY (`teacher_num`) REFERENCES `teacher` (`teacher_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varbinary(60) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `top_level` int(2) NOT NULL DEFAULT 0,
  `cid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `author_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `cid`(`cid`, `pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for university
-- ----------------------------
DROP TABLE IF EXISTS `university`;
CREATE TABLE `university`  (
  `university_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `university_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`university_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `submit` int(11) NULL DEFAULT 0,
  `solved` int(11) NULL DEFAULT 0,
  `defunct` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'C',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accesstime` datetime(0) NULL DEFAULT NULL,
  `volume` int(11) NOT NULL DEFAULT 1,
  `language` int(11) NOT NULL DEFAULT 1,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reg_time` datetime(0) NULL DEFAULT NULL,
  `nick` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `school` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `activated` int(11) NOT NULL DEFAULT 0,
  `accepted` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '', 35, 0, 'A', '127.0.0.1', NULL, 555, 555, 'admin', '2016-05-05 03:22:13', 'admin', '', 555, 245);
INSERT INTO `users` VALUES ('test1', '', 13, 0, 'C', '127.0.0.1', NULL, 555, 555, '123456', '2016-05-16 07:07:31', '测试用户', '', 555, 45);

-- ----------------------------
-- View structure for archive
-- ----------------------------
DROP VIEW IF EXISTS `archive`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `archive` AS select `so`.`user_id` AS `user_id`,`so`.`problem_id` AS `problem_id`,`so`.`solution_id` AS `solution_id`,`language`.`language_ext` AS `language_ext`,`status`.`status` AS `result`,`source_code`.`source` AS `code` from (((`solution` `so` left join `language` on((`so`.`language` = `language`.`language`))) left join `status` on((`so`.`result` = `status`.`result_id`))) left join `source_code` on((`so`.`solution_id` = `source_code`.`solution_id`)));

-- ----------------------------
-- View structure for contestinfo
-- ----------------------------
DROP VIEW IF EXISTS `contestinfo`;
CREATE ALGORITHM = UNDEFINED DEFINER = `sdustoj`@`%` SQL SECURITY DEFINER VIEW `contestinfo` AS select `contest`.`contest_id` AS `contest_id`,`contest`.`title` AS `title`,`contest`.`start_time` AS `start_time`,`contest`.`end_time` AS `end_time`,`contest`.`defunct` AS `defunct`,`contest`.`points` AS `points`,`contest`.`langmask` AS `langmask`,`contest`.`contest_mode` AS `contest_mode`,`contest_privilege`.`privilege` AS `privilege`,`language`.`language_name` AS `language` from ((`contest` left join `contest_privilege` on((`contest`.`private` = `contest_privilege`.`private_id`))) left join `language` on((`contest`.`langmask` = `language`.`language`)));

-- ----------------------------
-- View structure for sim_info
-- ----------------------------
DROP VIEW IF EXISTS `sim_info`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `sim_info` AS select `sim`.`s_id` AS `s_id`,`sim`.`sim_s_id` AS `sim_s_id`,`sim`.`sim` AS `sim`,`solution`.`user_id` AS `user_id` from (`sim` left join `solution` on((`sim`.`sim_s_id` = `solution`.`solution_id`)));

-- ----------------------------
-- View structure for statusinfo
-- ----------------------------
DROP VIEW IF EXISTS `statusinfo`;
CREATE ALGORITHM = UNDEFINED DEFINER = `sdustoj`@`%` SQL SECURITY DEFINER VIEW `statusinfo` AS select `so`.`solution_id` AS `solution_id`,`so`.`problem_id` AS `problem_id`,`so`.`user_id` AS `user_id`,`so`.`time` AS `time`,`so`.`memory` AS `memory`,`so`.`in_date` AS `in_date`,`so`.`language` AS `language`,`so`.`ip` AS `ip`,`so`.`contest_id` AS `contest_id`,`so`.`valid` AS `valid`,`so`.`num` AS `num`,`so`.`code_length` AS `code_length`,`so`.`judgetime` AS `judgetime`,`so`.`is_sim` AS `is_sim`,`status`.`status_id` AS `status_id`,`status`.`status` AS `status`,`language`.`language_name` AS `language_name` from ((`solution` `so` left join `status` on((`so`.`result` = `status`.`result_id`))) left join `language` on((`so`.`language` = `language`.`language`)));

SET FOREIGN_KEY_CHECKS = 1;
