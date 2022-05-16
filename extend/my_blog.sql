/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : my_blog

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 09/05/2022 00:49:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
                            `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                            `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                            `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                            `c_id` int UNSIGNED NOT NULL DEFAULT 0,
                            `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                            `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            `article_date` date NULL DEFAULT NULL,
                            `click` int UNSIGNED NOT NULL DEFAULT 0,
                            `status` tinyint UNSIGNED NOT NULL DEFAULT 1,
                            `sort` int UNSIGNED NOT NULL DEFAULT 0,
                            `c_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                            `u_time` datetime NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE,
                            INDEX `c_id`(`c_id`) USING BTREE,
                            INDEX `article_time`(`article_date`) USING BTREE,
                            INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '拍摄拍摄拍摄拍摄', '上传后被自动压缩的渣渣单反技术。。。&nbsp;上传后被自动压缩的渣渣单反技术。。。&nbsp;上传后被自动压缩的渣渣单反技术。。。&nbsp;上传后被自动压缩的渣渣单反技术。。。&nbsp;', 1, 'https://img0.baidu.com/it/u=182576380,2185454077&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500', '<p>上传后被自动压缩的渣渣单反技术。。。</p>\n<p><br>\n</p>\n<p><img title=\"1427902367814495.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902367814495.jpg\"></p>\n<p><img title=\"1427902367315933.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902367315933.jpg\"></p>\n<p><img title=\"1427902374170569.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902374170569.jpg\"></p>\n<p><img title=\"1427902397611704.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902397611704.jpg\"></p>\n<p><img title=\"1427902412572555.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902412572555.jpg\"></p>\n<p><img title=\"1427902441422753.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902441422753.jpg\"></p>\n<p><img title=\"1427902451479323.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902451479323.jpg\"></p>\n<p><img title=\"1427902454389255.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902454389255.jpg\"></p>\n<p><img title=\"1427902482911435.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902482911435.jpg\"></p>\n<p><img title=\"1427902506716897.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902506716897.jpg\"></p>\n<p><img title=\"1427902507253880.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902507253880.jpg\"></p>\n<p><img title=\"1427902529509986.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902529509986.jpg\"></p>\n<p><img title=\"1427902542409474.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902542409474.jpg\"></p>\n<p><img title=\"1427902546110449.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902546110449.jpg\"></p>\n<p><img title=\"1427902582635897.jpg\" src=\"https://blog.wangjianbo.cn/Public/Uploads/ueditor/20150401/1427902582635897.jpg\"></p>\n<p>&nbsp;</p>', '2015-03-28', 0, 1, 0, '2022-05-07 22:16:04', NULL);
INSERT INTO `article` VALUES (2, '白马王子', '啊发生的发生的分\n阿萨德发撒旦发射点发射点发射得分\n阿萨德发生地方', 1, '/upload/20220506\\1651852534FglIUK.jpg', '啊发生的发生的分\n<div>阿萨德发撒旦发射点发射点发射得分</div>\n<div>阿萨德发生地方</div>', '2022-05-08', 0, 1, 0, '2022-05-08 15:55:46', NULL);
INSERT INTO `article` VALUES (5, '阿萨德发生地方', '发生的发大水发大水发大水\n', 1, '', '<p>发生的发大水发大水发大水<img alt=\"cheeky\" src=\"http://127.0.0.1:8787/ckeditor/plugins/smiley/images/tongue_smile.png\" style=\"height:23px; width:23px\" title=\"cheeky\"></p>', '2022-05-07', 0, 1, 1, '2022-05-08 15:47:50', NULL);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
                           `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                           `title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                           `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                           `target` tinyint UNSIGNED NOT NULL DEFAULT 0,
                           `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                           `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                           `status` tinyint UNSIGNED NOT NULL DEFAULT 1,
                           `c_time` datetime NULL DEFAULT NULL,
                           `u_time` datetime NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE,
                           INDEX `type`(`target`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (2, 'AAAAAAAAAAA', 'http://127.0.0.1:8787/info/1', 2, 'dfsgsdfgsdfgsdfg', '/upload/20220508/xKd1652024132QeRfcF.jpg', 1, '2022-05-08 23:16:09', '2022-05-09 00:14:32');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
                             `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                             `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                             `status` tinyint UNSIGNED NOT NULL DEFAULT 1,
                             `c_time` datetime NULL DEFAULT NULL,
                             `u_time` datetime NULL DEFAULT NULL,
                             PRIMARY KEY (`id`) USING BTREE,
                             INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '生活', 1, '2022-04-16 20:54:11', NULL);
INSERT INTO `category` VALUES (2, '技术', 1, '2022-04-16 20:54:11', NULL);
INSERT INTO `category` VALUES (3, '折腾', 1, '2022-04-16 20:54:11', NULL);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
                            `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                            `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                            `content` json NULL,
                            `status` tinyint UNSIGNED NOT NULL DEFAULT 1,
                            `c_time` datetime NULL DEFAULT NULL,
                            `u_time` datetime NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `type`(`type`) USING BTREE,
                            INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (1, 'logo', '{\"file\": \"\", \"site_blog_logo\": \"\", \"site_admin_logo\": \"/upload/20220507\\\\1651932349NfWlXG.jpg\"}', 1, '2022-05-07 22:05:28', NULL);
INSERT INTO `options` VALUES (2, 'upload', '{\"upload_type\": \"local\", \"upload_allow_ext\": \"xbm,tif,pjp,svgz,jpg,jpeg,ico,tiff,gif,svg,jfif,webp,png,bmp,pjpeg,avif\", \"upload_allow_size\": 10485760}', 1, '2022-05-07 22:05:44', NULL);
INSERT INTO `options` VALUES (3, 'about', '{\"content\": \"<img src=\\\"/upload/20220507\\\\1651937211NDEeyK.jpeg\\\">\\n<div>大事发生地方</div>\", \"about_me\": \"<img src=\\\"/upload/20220507\\\\1651937211NDEeyK.jpeg\\\">\\n<div>大事发生地方</div>\", \"about_me_desc\": \"阿的所发生的发色的发是\"}', 1, '2022-05-07 23:24:40', '2022-05-08 23:49:00');
INSERT INTO `options` VALUES (4, 'site', '{\"file\": \"\", \"site_ico\": \"\", \"site_icp\": \"闽ICP-XXXXXX\", \"site_name\": \"我的博客\", \"site_tongji\": \"\", \"site_keywords\": \"博客,blog\", \"site_description\": \"这是一个简单的Blog程序，欢迎你来到这里。\"}', 1, '2022-05-07 23:27:46', '2022-05-08 23:54:32');

-- ----------------------------
-- Table structure for system_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin`  (
                                 `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                 `password` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                 `salt` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                                 `date_v` date NULL DEFAULT NULL,
                                 `status` tinyint UNSIGNED NOT NULL DEFAULT 1,
                                 `c_time` datetime NULL DEFAULT NULL,
                                 `u_time` datetime NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE,
                                 UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES (1, 'admin', '$2y$10$H8top1hE8Be6nQznxZ40t.72qRjuHy48.f7R9/QD54wV.pqW3WpSW', 'adasde', '2022-04-29', 1, '2022-04-29 16:28:04', NULL);

SET FOREIGN_KEY_CHECKS = 1;
