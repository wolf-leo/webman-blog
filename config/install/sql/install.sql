/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : easyadmin

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-05-17 23:24:06
*/

SET
FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ea_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_cate`;
CREATE TABLE `ea_mall_cate`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title`       varchar(20) NOT NULL COMMENT '分类名',
    `image`       varchar(500) DEFAULT NULL COMMENT '分类图片',
    `sort`        int(11) DEFAULT '0' COMMENT '排序',
    `status`      tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
    `remark`      varchar(255) DEFAULT NULL COMMENT '备注说明',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of ea_mall_cate
-- ----------------------------
INSERT INTO `ea_mall_cate`
VALUES ('9', '手机', '/static/common/images/logo-1.png', '0', '1', '', '1589440437', '1589440437', null);

-- ----------------------------
-- Table structure for ea_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `ea_mall_goods`;
CREATE TABLE `ea_mall_goods`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `cate_id`        int(11) DEFAULT NULL COMMENT '分类ID',
    `title`          varchar(20) NOT NULL COMMENT '商品名称',
    `logo`           varchar(500)   DEFAULT NULL COMMENT '商品logo',
    `images`         text COMMENT '商品图片 以 | 做分割符号',
    `describe`       text COMMENT '商品描述',
    `market_price`   decimal(10, 2) DEFAULT '0.00' COMMENT '市场价',
    `discount_price` decimal(10, 2) DEFAULT '0.00' COMMENT '折扣价',
    `sales`          int(11) DEFAULT '0' COMMENT '销量',
    `virtual_sales`  int(11) DEFAULT '0' COMMENT '虚拟销量',
    `stock`          int(11) DEFAULT '0' COMMENT '库存',
    `total_stock`    int(11) DEFAULT '0' COMMENT '总库存',
    `sort`           int(11) DEFAULT '0' COMMENT '排序',
    `status`         tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
    `remark`         varchar(255)   DEFAULT NULL COMMENT '备注说明',
    `create_time`    int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time`    int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time`    int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`),
    KEY              `cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='商品列表';

-- ----------------------------
-- Records of ea_mall_goods
-- ----------------------------
INSERT INTO `ea_mall_goods`
VALUES ('8', '10', '落地-风扇', '/static/common/images/logo-1.png', '/static/common/images/logo-1.png|/static/common/images/logo-1.png|/static/common/images/logo-1.png|/static/common/images/logo-1.png',
        '<p>76654757</p>\n\n<p><img alt=\"\" src=\"/static/common/images/logo-1.png\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"/static/common/images/logo-1.png\" style=\"height:877px; width:790px\" /></p>\n', '599.00', '368.00', '0', '594', '0', '0', '675', '1', '', '1589454309', '1589567016', null);
INSERT INTO `ea_mall_goods`
VALUES ('9', '9', '电脑', '/static/common/images/logo-1.png', '/static/common/images/logo-1.png', '<p>477</p>\n', '0.00', '0.00', '0', '0', '115', '320', '0', '1', '', '1589465215', '1589476345', null);

-- ----------------------------
-- Table structure for ea_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_admin`;
CREATE TABLE `ea_system_admin`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `auth_ids`    varchar(255)         DEFAULT NULL COMMENT '角色权限ID',
    `head_img`    varchar(255)         DEFAULT NULL COMMENT '头像',
    `username`    varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
    `password`    char(40)    NOT NULL DEFAULT '' COMMENT '用户登录密码',
    `phone`       varchar(16)          DEFAULT NULL COMMENT '联系手机号',
    `remark`      varchar(255)         DEFAULT '' COMMENT '备注说明',
    `login_num`   bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
    `sort`        int(11) DEFAULT '0' COMMENT '排序',
    `status`      tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`) USING BTREE,
    KEY           `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of ea_system_admin
-- ----------------------------
INSERT INTO `ea_system_admin`
VALUES ('1', null, '/static/admin/images/head.jpg', 'admin', 'a33b679d5581a8692988ec9f92ad2d6a2259eaa7', 'admin', 'admin', '0', '0', '1', '1589454169', '1589476815', null);

-- ----------------------------
-- Table structure for ea_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_auth`;
CREATE TABLE `ea_system_auth`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title`       varchar(20) NOT NULL COMMENT '权限名称',
    `sort`        int(11) DEFAULT '0' COMMENT '排序',
    `status`      tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
    `remark`      varchar(255) DEFAULT NULL COMMENT '备注说明',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of ea_system_auth
-- ----------------------------
INSERT INTO `ea_system_auth`
VALUES ('1', '管理员', '1', '1', '测试管理员', '1588921753', '1589614331', null);
INSERT INTO `ea_system_auth`
VALUES ('6', '游客权限', '0', '1', '', '1588227513', '1589591751', '1589591751');

-- ----------------------------
-- Table structure for ea_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_auth_node`;
CREATE TABLE `ea_system_auth_node`
(
    `id`      bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `auth_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
    `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
    PRIMARY KEY (`id`),
    KEY       `index_system_auth_auth` (`auth_id`) USING BTREE,
    KEY       `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of ea_system_auth_node
-- ----------------------------
INSERT INTO `ea_system_auth_node`
VALUES ('1', '6', '1');
INSERT INTO `ea_system_auth_node`
VALUES ('2', '6', '2');
INSERT INTO `ea_system_auth_node`
VALUES ('3', '6', '9');
INSERT INTO `ea_system_auth_node`
VALUES ('4', '6', '12');
INSERT INTO `ea_system_auth_node`
VALUES ('5', '6', '18');
INSERT INTO `ea_system_auth_node`
VALUES ('6', '6', '19');
INSERT INTO `ea_system_auth_node`
VALUES ('7', '6', '21');
INSERT INTO `ea_system_auth_node`
VALUES ('8', '6', '22');
INSERT INTO `ea_system_auth_node`
VALUES ('9', '6', '29');
INSERT INTO `ea_system_auth_node`
VALUES ('10', '6', '30');
INSERT INTO `ea_system_auth_node`
VALUES ('11', '6', '38');
INSERT INTO `ea_system_auth_node`
VALUES ('12', '6', '39');
INSERT INTO `ea_system_auth_node`
VALUES ('13', '6', '45');
INSERT INTO `ea_system_auth_node`
VALUES ('14', '6', '46');
INSERT INTO `ea_system_auth_node`
VALUES ('15', '6', '52');
INSERT INTO `ea_system_auth_node`
VALUES ('16', '6', '53');

-- ----------------------------
-- Table structure for ea_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_config`;
CREATE TABLE `ea_system_config`
(
    `id`          int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name`        varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
    `group`       varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
    `value`       text COMMENT '变量值',
    `remark`      varchar(100)         DEFAULT '' COMMENT '备注信息',
    `sort`        int(10) DEFAULT '0',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    KEY           `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of ea_system_config
-- ----------------------------
INSERT INTO `ea_system_config`
VALUES ('41', 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('42', 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('55', 'upload_type', 'upload', 'local', '当前上传方式 （local,oss,cos）', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('56', 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('57', 'upload_allow_size', 'upload', '1024000', '允许上传的大小', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('59', 'upload_allow_type', 'upload', 'local,oss,cos', '可用的上传文件方式', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('60', 'oss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('61', 'oss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('62', 'oss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('63', 'oss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('64', 'oss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('65', 'logo_title', 'site', 'EasyAdmin', 'LOGO标题', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('66', 'logo_image', 'site', '/favicon.ico', 'logo图片', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('68', 'site_name', 'site', 'EasyAdmin后台系统', '站点名称', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('69', 'site_ico', 'site', '填你的', '浏览器图标', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('70', 'site_copyright', 'site', '填你的', '版权信息', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('71', 'site_beian', 'site', '填你的', '备案信息', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('72', 'site_version', 'site', '2.0.0', '版本信息', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('75', 'sms_type', 'sms', 'alisms', '短信类型', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('76', 'miniapp_appid', 'wechat', '填你的', '小程序公钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('77', 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('78', 'web_appid', 'wechat', '填你的', '公众号公钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('79', 'web_appsecret', 'wechat', '填你的', '公众号私钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('80', 'cos_secret_id', 'upload', '填你的', '腾讯云cos密钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('81', 'cos_secret_key', 'upload', '填你的', '腾讯云cos私钥', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('82', 'cos_region', 'upload', '填你的', '存储桶地域', '0', null, null);
INSERT INTO `ea_system_config`
VALUES ('83', 'cos_bucket', 'upload', '填你的', '存储桶名称', '0', null, null);

-- ----------------------------
-- Table structure for ea_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_menu`;
CREATE TABLE `ea_system_menu`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `pid`         bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
    `title`       varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
    `icon`        varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
    `href`        varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
    `params`      varchar(500)          DEFAULT '' COMMENT '链接参数',
    `target`      varchar(20)  NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
    `sort`        int(11) DEFAULT '0' COMMENT '菜单排序',
    `status`      tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
    `remark`      varchar(255)          DEFAULT NULL,
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`),
    KEY           `title` (`title`),
    KEY           `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of ea_system_menu
-- ----------------------------
INSERT INTO `ea_system_menu`
VALUES (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '_self', 0, 1, NULL, NULL, 1573120497, NULL);
INSERT INTO `ea_system_menu`
VALUES (228, 0, '系统管理', 'fa fa-cog', '', '', '_self', 0, 1, '', NULL, 1588999529, NULL);
INSERT INTO `ea_system_menu`
VALUES (234, 228, '菜单管理', 'fa fa-tree', 'system/menu/index', '', '_self', 10, 1, '', NULL, 1588228555, NULL);
INSERT INTO `ea_system_menu`
VALUES (244, 228, '管理员管理', 'fa fa-user', 'system/admin/index', '', '_self', 12, 1, '', 1573185011, 1588228573, NULL);
INSERT INTO `ea_system_menu`
VALUES (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system/auth/index', '', '_self', 11, 1, '', 1573435877, 1588228634, NULL);
INSERT INTO `ea_system_menu`
VALUES (246, 228, '节点管理', 'fa fa-list', 'system/node/index', '', '_self', 9, 1, '', 1573435919, 1588228648, NULL);
INSERT INTO `ea_system_menu`
VALUES (247, 228, '配置管理', 'fa fa-asterisk', 'system/config/index', '', '_self', 8, 1, '', 1573457448, 1588228566, NULL);
INSERT INTO `ea_system_menu`
VALUES (248, 228, '上传管理', 'fa fa-arrow-up', 'system/uploadfile/index', '', '_self', 0, 1, '', 1573542953, 1588228043, NULL);
INSERT INTO `ea_system_menu`
VALUES (249, 0, '商城管理', 'fa fa-list', '', '', '_self', 0, 0, '', 1589439884, 1700553987, NULL);
INSERT INTO `ea_system_menu`
VALUES (250, 249, '商品分类', 'fa fa-calendar-check-o', 'mall/cate/index', '', '_self', 0, 0, '', 1589439910, 1700553989, NULL);
INSERT INTO `ea_system_menu`
VALUES (251, 249, '商品管理', 'fa fa-list', 'mall/goods/index', '', '_self', 0, 0, '', 1589439931, 1700553988, NULL);
INSERT INTO `ea_system_menu`
VALUES (252, 228, '快捷入口', 'fa fa-list', 'system/quick/index', '', '_self', 0, 1, '', 1589623683, 1589623683, NULL);
INSERT INTO `ea_system_menu`
VALUES (253, 228, '日志管理', 'fa fa-connectdevelop', 'system/log/index', '', '_self', 0, 1, '', 1589623684, 1589623684, NULL);
INSERT INTO `ea_system_menu`
VALUES (254, 0, '博客管理', 'fa fa-list', '', '', '_self', 0, 1, '', 1700554023, 1700558030, NULL);
INSERT INTO `ea_system_menu`
VALUES (255, 254, '文章管理', 'fa fa-list', 'blog/article/index', '', '_self', 0, 1, '', 1700554056, 1700558117, NULL);
INSERT INTO `ea_system_menu`
VALUES (256, 254, '分类管理', 'fa fa-list', 'blog/category/index', '', '_self', 0, 1, '', 1700554074, 1700558018, NULL);
INSERT INTO `ea_system_menu`
VALUES (257, 254, '博客配置', 'fa fa-list', 'blog/options/config', '', '_self', 0, 1, '', 1700554094, 1700558280, NULL);
INSERT INTO `ea_system_menu`
VALUES (258, 254, '轮播图管理', 'fa fa-list', 'blog/banner/index', '', '_self', 0, 1, '', 1700556933, 1700558008, NULL);

-- ----------------------------
-- Table structure for ea_system_node
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_node`;
CREATE TABLE `ea_system_node`
(
    `id`          int(11) unsigned NOT NULL AUTO_INCREMENT,
    `node`        varchar(100) DEFAULT NULL COMMENT '节点代码',
    `title`       varchar(500) DEFAULT NULL COMMENT '节点标题',
    `type`        tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
    `is_auth`     tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
    `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY           `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of ea_system_node
-- ----------------------------
INSERT INTO `ea_system_node`
VALUES (1, 'system/admin', '管理员管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (2, 'system/admin/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (3, 'system/admin/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (4, 'system/admin/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (5, 'system/admin/password', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (6, 'system/admin/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (7, 'system/admin/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (8, 'system/admin/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (9, 'system/auth', '角色权限管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (10, 'system/auth/authorizes', '授权', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (11, 'system/auth/saveAuthorize', '授权保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (12, 'system/auth/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (13, 'system/auth/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (14, 'system/auth/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (15, 'system/auth/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (16, 'system/auth/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (17, 'system/auth/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (18, 'system/config', '系统配置管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (19, 'system/config/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (20, 'system/config/save', '保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (21, 'system/menu', '菜单管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (22, 'system/menu/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (23, 'system/menu/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (24, 'system/menu/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (25, 'system/menu/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (26, 'system/menu/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (27, 'system/menu/getMenuTips', '添加菜单提示', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (28, 'system/menu/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (29, 'system/node', '系统节点管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (30, 'system/node/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (31, 'system/node/refreshNode', '系统节点更新', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (32, 'system/node/clearNode', '清除失效节点', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (33, 'system/node/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (34, 'system/node/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (35, 'system/node/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (36, 'system/node/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (37, 'system/node/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (38, 'system/uploadfile', '上传文件管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (39, 'system/uploadfile/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (40, 'system/uploadfile/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (41, 'system/uploadfile/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (42, 'system/uploadfile/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (43, 'system/uploadfile/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (44, 'system/uploadfile/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (45, 'mall/cate', '商品分类管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (46, 'mall/cate/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (47, 'mall/cate/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (48, 'mall/cate/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (49, 'mall/cate/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (50, 'mall/cate/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (51, 'mall/cate/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (52, 'mall/goods', '商城商品管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (53, 'mall/goods/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (54, 'mall/goods/stock', '入库', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (55, 'mall/goods/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (56, 'mall/goods/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (57, 'mall/goods/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (58, 'mall/goods/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (59, 'mall/goods/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `ea_system_node`
VALUES (60, 'system/quick', '快捷入口管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (61, 'system/quick/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (62, 'system/quick/add', '添加', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (63, 'system/quick/edit', '编辑', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (64, 'system/quick/delete', '删除', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (65, 'system/quick/export', '导出', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (66, 'system/quick/modify', '属性修改', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (67, 'system/log', '操作日志管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (68, 'system/log/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `ea_system_node`
VALUES (69, 'system/config/add', '添加', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (70, 'system/config/edit', '编辑', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (71, 'system/config/delete', '删除', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (72, 'system/config/export', '导出', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (73, 'system/config/modify', '属性修改', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (74, 'system/log/export', '导出', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (75, 'system/log/add', '添加', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (76, 'system/log/edit', '编辑', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (77, 'system/log/delete', '删除', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (78, 'system/log/modify', '属性修改', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (79, 'blog/article', '文章列表', 1, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (80, 'blog/article/add', '添加', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (81, 'blog/article/edit', '编辑', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (82, 'blog/article/index', '列表', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (83, 'blog/article/delete', '删除', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (84, 'blog/article/export', '导出', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (85, 'blog/article/modify', '属性修改', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (86, 'blog/banner', '轮播图管理', 1, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (87, 'blog/banner/index', '列表', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (88, 'blog/banner/add', '添加', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (89, 'blog/banner/edit', '编辑', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (90, 'blog/banner/delete', '删除', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (91, 'blog/banner/export', '导出', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (92, 'blog/banner/modify', '属性修改', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (93, 'blog/category', '分类管理', 1, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (94, 'blog/category/index', '列表', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (95, 'blog/category/add', '添加', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (96, 'blog/category/edit', '编辑', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (97, 'blog/category/delete', '删除', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (98, 'blog/category/export', '导出', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (99, 'blog/category/modify', '属性修改', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (100, 'blog/options', '文章配置', 1, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (101, 'blog/options/config', '配置', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (102, 'blog/options/index', '列表', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (103, 'blog/options/add', '添加', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (104, 'blog/options/edit', '编辑', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (105, 'blog/options/delete', '删除', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (106, 'blog/options/export', '导出', 2, 1, 1700567706, 1700567706);
INSERT INTO `ea_system_node`
VALUES (107, 'blog/options/modify', '属性修改', 2, 1, 1700567706, 1700567706);

-- ----------------------------
-- Table structure for ea_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_quick`;
CREATE TABLE `ea_system_quick`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title`       varchar(20) NOT NULL COMMENT '快捷入口名称',
    `icon`        varchar(100) DEFAULT NULL COMMENT '图标',
    `href`        varchar(255) DEFAULT NULL COMMENT '快捷链接',
    `sort`        int(11) DEFAULT '0' COMMENT '排序',
    `status`      tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
    `remark`      varchar(255) DEFAULT NULL COMMENT '备注说明',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of ea_system_quick
-- ----------------------------
INSERT INTO `ea_system_quick`
VALUES (1, '管理员管理', 'fa fa-user', 'system/admin/index', 0, 1, '', 1589624097, 1589624792, NULL);
INSERT INTO `ea_system_quick`
VALUES (2, '角色管理', 'fa fa-bitbucket-square', 'system/auth/index', 0, 1, '', 1589624772, 1589624781, NULL);
INSERT INTO `ea_system_quick`
VALUES (3, '菜单管理', 'fa fa-tree', 'system/menu/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `ea_system_quick`
VALUES (6, '节点管理', 'fa fa-list', 'system/node/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `ea_system_quick`
VALUES (7, '配置管理', 'fa fa-asterisk', 'system/config/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `ea_system_quick`
VALUES (8, '上传管理', 'fa fa-arrow-up', 'system/uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `ea_system_quick`
VALUES (10, '博客配置', 'fa fa-calendar-check-o', 'blog/options/config', 0, 1, '', 1589624097, 1700567839, NULL);
INSERT INTO `ea_system_quick`
VALUES (11, '文章管理', 'fa fa-list', 'blog/article/index', 0, 1, '', 1589624772, 1700567820, NULL);

-- ----------------------------
-- Table structure for ea_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `ea_system_uploadfile`;
CREATE TABLE `ea_system_uploadfile`
(
    `id`            int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `upload_type`   varchar(20)  NOT NULL DEFAULT 'local' COMMENT '存储位置',
    `original_name` varchar(255)          DEFAULT '' COMMENT '文件原名',
    `url`           varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
    `image_width`   varchar(30)  NOT NULL DEFAULT '' COMMENT '宽度',
    `image_height`  varchar(30)  NOT NULL DEFAULT '' COMMENT '高度',
    `image_type`    varchar(30)  NOT NULL DEFAULT '' COMMENT '图片类型',
    `image_frames`  int(10) unsigned NOT NULL DEFAULT 0 COMMENT '图片帧数',
    `mime_type`     varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
    `file_size`     int(10) unsigned NOT NULL DEFAULT 0 COMMENT '文件大小',
    `file_ext`      varchar(100)          DEFAULT '',
    `sha1`          varchar(40)  NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
    `create_time`   int(10) DEFAULT NULL COMMENT '创建日期',
    `update_time`   int(10) DEFAULT NULL COMMENT '更新时间',
    `upload_time`   int(10) DEFAULT NULL COMMENT '上传时间',
    PRIMARY KEY (`id`),
    KEY             `upload_type` (`upload_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of ea_system_uploadfile
-- ----------------------------
INSERT INTO `ea_system_uploadfile`
VALUES ('286', 'oss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', 1573612437, null, null);
INSERT INTO `ea_system_uploadfile`
VALUES ('287', 'oss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', 1573612437, null, null);
INSERT INTO `ea_system_uploadfile`
VALUES ('288', 'oss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', 1573612437, null, null);
INSERT INTO `ea_system_uploadfile`
VALUES ('289', 'oss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', 1573612437, null, null);
INSERT INTO `ea_system_uploadfile`
VALUES ('290', 'oss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', 1573612437, null, null);
INSERT INTO `ea_system_uploadfile`
VALUES ('296', 'cos', 'image/jpeg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', 1573612437, null, null);

-- ----------------------------
-- blog
-- ----------------------------
DROP TABLE IF EXISTS `ea_article`;
CREATE TABLE `ea_article`
(
    `id`           bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title`        varchar(100) NOT NULL DEFAULT '',
    `desc`         varchar(255) NOT NULL DEFAULT '',
    `category_id`  int(10) unsigned NOT NULL DEFAULT '0',
    `img`          varchar(255) NOT NULL DEFAULT '',
    `content`      longtext,
    `article_date` date                  DEFAULT NULL,
    `click`        int(10) unsigned NOT NULL DEFAULT '0',
    `status`       tinyint(3) unsigned NOT NULL DEFAULT '1',
    `sort`         int(10) unsigned NOT NULL DEFAULT '0',
    `c_time`       datetime              DEFAULT NULL,
    `u_time`       datetime              DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    KEY            `category_id` (`category_id`) USING BTREE,
    KEY            `article_time` (`article_date`) USING BTREE,
    KEY            `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ea_banner`;
CREATE TABLE `ea_banner`
(
    `id`     int(10) unsigned NOT NULL AUTO_INCREMENT,
    `title`  varchar(75)  NOT NULL DEFAULT '',
    `link`   varchar(255) NOT NULL DEFAULT '',
    `target` tinyint(3) unsigned NOT NULL DEFAULT '0',
    `desc`   varchar(255) NOT NULL DEFAULT '',
    `img`    varchar(255) NOT NULL DEFAULT '',
    `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
    `c_time` datetime              DEFAULT NULL,
    `u_time` datetime              DEFAULT NULL,
    `sort`   int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE,
    KEY      `type` (`target`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ea_category`;
CREATE TABLE `ea_category`
(
    `id`     int(10) unsigned NOT NULL AUTO_INCREMENT,
    `title`  varchar(30) NOT NULL DEFAULT '',
    `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
    `c_time` datetime             DEFAULT NULL,
    `u_time` datetime             DEFAULT NULL,
    `sort`   int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE,
    KEY      `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ea_options`;
CREATE TABLE `ea_options`
(
    `id`      int(10) unsigned NOT NULL AUTO_INCREMENT,
    `type`    varchar(30) NOT NULL DEFAULT '',
    `content` json                 DEFAULT NULL,
    `status`  tinyint(3) unsigned NOT NULL DEFAULT '1',
    `c_time`  datetime             DEFAULT NULL,
    `u_time`  datetime             DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `type` (`type`) USING BTREE,
    KEY       `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `ea_category`
VALUES (1, '生活', 1, '2022-04-16 20:54:11', NULL, 0);
INSERT INTO `ea_category`
VALUES (2, '技术', 1, '2022-04-16 20:54:11', NULL, 0);
INSERT INTO `ea_category`
VALUES (3, '折腾', 1, '2022-04-16 20:54:11', NULL, 0);

INSERT INTO `ea_article`
VALUES (1, '蒹葭', '蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。\n蒹葭萋萋，白露未晞。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。\n蒹葭采采，白露未已。所谓伊人，在', 1, '/upload/20220517/dip1652765664FSjzHW.jpg', '蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。<br>\n蒹葭萋萋，白露未晞。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。<br>\n蒹葭采采，白露未已。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，宛在水中沚。<br>',
        '2022-05-08', 73, 1, 0, '2022-05-08 15:55:46', '2022-05-17 13:34:29');
INSERT INTO `ea_article`
VALUES (1, '蒹葭', '蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。\n蒹葭萋萋，白露未晞。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。\n蒹葭采采，白露未已。所谓伊人，在', 1, '/upload/20220517/dip1652765664FSjzHW.jpg', '蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。<br>\n蒹葭萋萋，白露未晞。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。<br>\n蒹葭采采，白露未已。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，宛在水中沚。<br>',
        '2022-05-08', 115, 1, 0, '2022-05-08 15:55:46', '2022-05-17 13:34:29');
INSERT INTO `ea_article`
VALUES (2, '中秋佳节', '月圆之夜，繁星点点，明亮的月光洒满了大地。此时，正是中秋佳节，一家人围坐在一起，欢声笑语，其乐融融。', 1, '/storage/20231121/qOu1700566945SUxvJW1.png',
        '<p class=\"\" style=\"margin-top: 14px; margin-bottom: 0px; font-size: 15px; text-wrap: wrap; box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">月圆之夜，繁星点点，明亮的月光洒满了大地。此时，正是中秋佳节，一家人围坐在一起，欢声笑语，其乐融融。</p><p class=\"\" style=\"margin-top: 14px; margin-bottom: 0px; font-size: 15px; text-wrap: wrap; box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">这个节日，充满了浓浓的人情味。远方的游子，无论身在何方，都会怀念家中的亲人。此刻，他们抬头望向同一轮明月，心中充满了对家人的思念和祝福。这种深深的情感，穿越时空，连接了千山万水。</p><p class=\"\" style=\"margin-top: 14px; margin-bottom: 0px; font-size: 15px; text-wrap: wrap; box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">中秋节也是孩子们的最爱。这一天，他们会拿着明亮的灯笼，走在乡间的小路上，脸上洋溢着纯真的笑容。对于他们来说，这个节日充满了神秘和乐趣。而对于父母来说，看到孩子们的快乐，心中也充满了满足和幸福。</p><p class=\"\" style=\"margin-top: 14px; margin-bottom: 0px; font-size: 15px; text-wrap: wrap; box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">这个节日，更是一个感恩的节日。我们要感谢父母的养育之恩，感谢亲人的关爱之情。在这个团圆的时刻，我们更要珍惜家人的陪伴，感恩生活的美好。</p><p class=\"\" style=\"margin-top: 14px; margin-bottom: 0px; font-size: 15px; text-wrap: wrap; box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">月饼是中秋节的象征，它代表着团圆和和谐。每一口月饼，都充满了甜蜜和幸福。在这个月圆之夜，让我们一起品尝美味的月饼，感受家的温暖和爱的力量。</p><p class=\"\" style=\"margin-top: 14px; margin-bottom: 0px; font-size: 15px; text-wrap: wrap; box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">中秋是一个充满温情和诗意的节日。在这个节日里，让我们一起赏月、吃饼、话家常，感受那份深深的亲情和爱意。愿我们每个人都能在这个团圆的节日里，找到自己的幸福和满足。</p><p style=\"text-wrap: wrap;\"><br/></p><p><br/></p>',
        '2022-05-17', 149, 1, 0, '2022-05-17 13:39:04', '2023-11-21 19:49:23');
INSERT INTO `ea_article`
VALUES (3, '人工智能', '人工智能（AI）已经成为当今科技领域的热门话题。这种技术以模拟人类智能的方式处理和解决问题，为我们的生活和工作带来了前所未有的便利。在这篇文章中，我们将探讨人工智能的技术前沿以及未来可能的发展趋势。一', 2, '/storage/20231121/FDj1700567014nqYdQJ1.png',
        '<p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">人工智能（AI）已经成为当今科技领域的热门话题。这种技术以模拟人类智能的方式处理和解决问题，为我们的生活和工作带来了前所未有的便利。在这篇文章中，我们将探讨人工智能的技术前沿以及未来可能的发展趋势。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">一、人工智能的技术前沿</p><ol style=\"box-sizing: border-box; padding: 0px 0px 0px 32px; -webkit-font-smoothing: antialiased; list-style-position: outside; list-style-image: none; font-family: -apple-system, BlinkMacSystemFont, \" class=\" list-paddingleft-2\"><li><p>深度学习</p></li></ol><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">深度学习是人工智能领域最引人注目的技术之一。它通过构建多层神经网络来模拟人脑神经元的工作方式，从而实现对图像、声音等复杂数据的处理和分析。深度学习在许多领域都有广泛的应用，例如人脸识别、语音识别、自动驾驶等。</p><ol start=\"2\" style=\"box-sizing: border-box; padding: 0px 0px 0px 32px; -webkit-font-smoothing: antialiased; list-style-position: outside; list-style-image: none; font-family: -apple-system, BlinkMacSystemFont, \" class=\" list-paddingleft-2\"><li><p>自然语言处理</p></li></ol><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">自然语言处理（NLP）是让计算机理解和生成人类语言的技术。通过机器学习和深度学习等技术，NLP 已经取得了显著的进步，让我们能够与计算机进行更自然的交互。例如，智能客服、机器翻译和情感分析等应用都得益于 NLP 的发展。</p><ol start=\"3\" style=\"box-sizing: border-box; padding: 0px 0px 0px 32px; -webkit-font-smoothing: antialiased; list-style-position: outside; list-style-image: none; font-family: -apple-system, BlinkMacSystemFont, \" class=\" list-paddingleft-2\"><li><p>计算机视觉</p></li></ol><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">计算机视觉是让计算机具备视觉感知能力的技术。通过图像处理和模式识别等技术，计算机能够识别和理解图像中的信息，并进行相应的处理。计算机视觉的应用非常广泛，例如自动驾驶、智能安防、医学影像分析等。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">二、人工智能的未来趋势</p><ol style=\"box-sizing: border-box; padding: 0px 0px 0px 32px; -webkit-font-smoothing: antialiased; list-style-position: outside; list-style-image: none; font-family: -apple-system, BlinkMacSystemFont, \" class=\" list-paddingleft-2\"><li><p>增强智能（Augmented Intelligence）</p></li></ol><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">增强智能是指将人工智能与人类智慧相结合，从而提高人类的工作效率和创造力。随着技术的发展，我们有望看到更多的增强智能应用，例如智能助手、智能写作工具等，它们能够根据我们的需求提供实时建议和帮助。</p><ol start=\"2\" style=\"box-sizing: border-box; padding: 0px 0px 0px 32px; -webkit-font-smoothing: antialiased; list-style-position: outside; list-style-image: none; font-family: -apple-system, BlinkMacSystemFont, \" class=\" list-paddingleft-2\"><li><p>可解释的 AI（Explainable AI）</p></li></ol><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">可解释的 AI 是指让计算机能够解释其决策和行为的原因。随着 AI 在各个领域的广泛应用，人们越来越关注 AI 的可解释性。未来，我们期待看到更多的研究和技术发展，以提高 AI 的可解释性，从而增加人们对 AI 的信任和使用。</p><ol start=\"3\" style=\"box-sizing: border-box; padding: 0px 0px 0px 32px; -webkit-font-smoothing: antialiased; list-style-position: outside; list-style-image: none; font-family: -apple-system, BlinkMacSystemFont, \" class=\" list-paddingleft-2\"><li><p>人工智能与物联网（AIoT）</p></li></ol><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">物联网是指将各种设备、传感器等连接在一起，形成一个能够相互通信和交换信息的网络。随着物联网技术的发展，人工智能有望在 AIoT 中发挥更大的作用，例如对海量数据的处理和分析、智能家居控制等。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">总结：人工智能作为当今科技领域的热门话题，其技术前沿和发展趋势令人瞩目。随着技术的不断进步和创新应用的出现，我们有理由相信人工智能将在未来为我们的生活和工作带来更多的便利和价值。</p><p><br/></p>',
        '2022-11-17', 275, 1, 0, '2022-11-17 15:44:05', '2023-11-21 19:49:05');
INSERT INTO `ea_article`
VALUES (4, '程序员', '程序员的自我修养在这个信息爆炸的时代，程序员无疑是这个时代的先锋队，他们用代码改变着世界，创新着生活。然而，要成为一名优秀的程序员，需要哪些自我修养呢？本文将为您揭秘。一、扎实的编程基础编程语言是程序', 2, '/storage/20231121/GfD1700567102JvEDnR1.png',
        '<p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">程序员的自我修养</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">在这个信息爆炸的时代，程序员无疑是这个时代的先锋队，他们用代码改变着世界，创新着生活。然而，要成为一名优秀的程序员，需要哪些自我修养呢？本文将为您揭秘。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">一、扎实的编程基础</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">编程语言是程序员的基本工具，掌握多种编程语言是必不可少的。但更重要的是理解编程语言背后的原理和思想。程序员的自我修养首先需要从基础入手，掌握数据结构、算法、操作系统、网络等基础知识，才能更好地应对各种复杂的编程需求。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">二、学习能力</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">技术日新月异，程序员必须具备强大的学习能力，持续更新自己的知识库。程序员应该时刻关注技术的发展动态，掌握最新的编程技术和工具，从而保持竞争优势。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">三、问题解决能力</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">程序员的核心价值在于解决问题。面对复杂的编程问题，程序员需要具备敏锐的洞察力和严谨的逻辑思维，将问题分解为可管理的部分，并采取有效的解决方案。善于使用搜索引擎、查阅文档和询问社区是解决问题的有效途径。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">四、团队协作能力</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">在软件开发中，单枪匹马是行不通的。程序员需要具备团队协作能力，与团队成员共同解决问题，分享经验。良好的沟通能力、团队合作精神和代码审查能力是程序员必备的素质。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">五、持续优化意识</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">追求代码质量是程序员的内驱力。程序员应该具备持续优化意识，关注代码的性能、可读性、可维护性等方面。善于重构和优化代码是优秀程序员的必备技能。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">六、好奇心和探索精神</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">优秀的程序员不仅解决问题，还会探索新的问题。好奇心和探索精神是推动程序员不断前进的动力。尝试新技术、参与开源项目和分享经验是提升自身技术水平的好方法。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, \">总结：程序员的自我修养不仅包括技术能力，还包括非技术能力。在这个竞争激烈的时代，程序员需要不断学习、探索和创新，才能成为行业的佼佼者。</p><p><br/></p>',
        '2022-11-17', 96, 1, 0, '2022-11-17 15:46:04', '2023-11-21 19:48:56');
INSERT INTO `ea_article`
VALUES (5, '人生忙碌', '人生忙碌，勿忘初心在这个快节奏的社会，我们每个人都在不断地忙碌着，为了生活、为了梦想、为了更多的事情。然而，在忙碌的过程中，我们有时会忘记自己的初心，失去了真正的自我。本文将探讨人生忙碌的背后，如何保', 3, '/storage/20231121/sKj1700567310uHIVqX1.png',
        '<p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">人生忙碌，勿忘初心</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">在这个快节奏的社会，我们每个人都在不断地忙碌着，为了生活、为了梦想、为了更多的事情。然而，在忙碌的过程中，我们有时会忘记自己的初心，失去了真正的自我。本文将探讨人生忙碌的背后，如何保持初心，活出真实的自己。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">一、忙碌的背后</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">现代社会的快节奏和高压力让人们不断地忙碌，有时候甚至忘记了生活的意义。我们为了工作、为了家庭、为了社交网络上的虚荣而奔波。虽然这些事情确实占据了我们大量的时间和精力，但有时候我们是否应该停下来，思考一下我们真正追求的是什么？</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">二、勿忘初心</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">初心，就是我们内心深处最真实的想法和愿望。在人生的道路上，我们会遇到很多困难和挑战，这些困难和挑战可能会让我们偏离初衷。因此，保持初心显得尤为重要。我们应该时刻提醒自己，不要忘记我们的梦想、我们的信仰和我们真正追求的东西。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">三、活出真实的自己</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">每个人都有自己独特的特点和价值，我们应该活出真实的自己。在面对困难和挑战时，我们应该勇敢地表达自己的想法和意见，而不是盲目地迎合他人。只有这样，我们才能找到自己的价值和意义，过上真正属于自己的生活。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">四、如何保持初心</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">要保持初心，首先要学会自我反思。我们应该经常审视自己的行为和想法，看看是否偏离了初衷。其次，我们应该学会关注内心真正的需求和想法，不要被外界的干扰所左右。最后，我们应该保持学习和成长的态度，不断提升自己，以便更好地实现自己的梦想和目标。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">总结：人生忙碌是不可避免的，但我们不能忘记初心，不能失去自我。只有保持初心，活出真实的自己，我们才能过上真正有意义的生活。在忙碌的生活中，我们要学会审视自己、关注内心真正的需求、保持学习和成长的态度，以便更好地实现自己的梦想和目标。</p><p><br/></p>',
        '2023-11-01', 8, 1, 0, '2023-11-21 19:48:49', '2023-11-21 19:48:33');
INSERT INTO `ea_article`
VALUES (6, '直面生活', '生活太苦，何处寻找甜蜜？在这个瞬息万变的世界里，我们时常会感到生活充满了压力和苦难。面对工作的竞争、家庭的责任、人际关系的复杂，我们有时会感到力不从心，甚至怀疑生活的意义。在这篇文章中，我们将探讨如何', 1, '/storage/20231121/uHb1700567613EXMJnA1.png',
        '<p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">生活太苦，何处寻找甜蜜？</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">在这个瞬息万变的世界里，我们时常会感到生活充满了压力和苦难。面对工作的竞争、家庭的责任、人际关系的复杂，我们有时会感到力不从心，甚至怀疑生活的意义。在这篇文章中，我们将探讨如何在忙碌的生活中寻找甜蜜和快乐。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">一、苦难是人生的常态</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">人生就像一条曲折的河流，有平静也有波涛，有顺境也有逆境。苦难是人生的一部分，我们不能回避它。面对苦难，我们要学会接受它，并从中汲取力量和智慧。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">二、甜蜜在于内心的满足</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">虽然生活有时会很苦，但我们可以通过内心的满足来寻找甜蜜。当我们专注于我们所拥有的，感激生活中的点滴美好，我们会发现生活其实并不缺乏甜蜜。感激是一种强大的力量，它可以使我们看到生活中的美好，让我们更加珍惜现在。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">三、寻找自己的快乐之道</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">每个人都有自己的快乐之道，有些人喜欢通过旅行寻找快乐，有些人喜欢通过阅读或运动来放松自己。我们要学会发现自己的快乐之道，并在生活中不断寻找和创造快乐。只有当我们自己感到快乐时，我们才能给予他人更多的快乐。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">四、与他人分享快乐</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">与他人分享快乐是一种幸福。当我们与家人、朋友分享我们的快乐和成功时，我们会感到更加充实和满足。同时，我们也要学会倾听他人的快乐和分享他们的成功，这样我们可以在彼此的快乐中感受到生活的甜蜜。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">五、积极面对生活</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">面对生活的苦难和挑战，我们要学会积极面对。通过改变自己的态度和思维方式，我们可以看到生活中的积极面和美好。我们要学会乐观地看待问题，从中寻找机会和成长。</p><p class=\"\" style=\"box-sizing: border-box; padding: 0px; -webkit-font-smoothing: antialiased; list-style: none; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans CN&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; margin-top: 14px; margin-bottom: 0px; font-size: 15px; line-height: 1.75; color: rgb(5, 7, 59); text-wrap: wrap; background-color: rgb(253, 253, 254);\">总结：生活虽然有时会很苦，但我们可以通过内心的满足、寻找自己的快乐之道、与他人分享快乐和积极面对生活来寻找甜蜜。在这个复杂的世界里，我们要学会珍惜当下，感恩生活中的点滴美好，从而在苦难中找到力量和智慧，活出更加美好的人生。</p><p><br/></p>',
        '2023-11-21', 1, 1, 0, '2023-11-21 19:53:36', NULL);

INSERT INTO `ea_banner`
VALUES (1, '人生忙碌', '/info/5/', 1, '在这个快节奏的社会，我们每个人都在不断地忙碌着，为了生活、为了梦想、为了更多的事情。', '/storage/20231121/sKj1700567310uHIVqX1.png', 1, NULL, '2022-11-17 16:58:35', 10);
INSERT INTO `ea_banner`
VALUES (2, '中秋佳节', '/info/2/', 1, '月圆之夜，繁星点点，明亮的月光洒满了大地。此时，正是中秋佳节，一家人围坐在一起，欢声笑语，其乐融融。', '/storage/20231121/qOu1700566945SUxvJW1.png', 1, '2022-11-17 17:01:34', NULL, 1);

INSERT INTO `ea_options`
VALUES (1, 'blog', '{\"ico\": \"/favicon.ico\", \"file\": \"\", \"logo\": \"/static/template_001/images/logo.jpg\", \"title\": \"我的博客\", \"_token\": \"\", \"tongji\": \"\", \"about_me\": \"<p>关于我</p>\", \"keywords\": \"我的博客\", \"site_icp\": \"京ICP-XXX123\", \"site_name\": \"我的博客\", \"description\": \"我的博客\"}', 1, '2022-05-07 22:05:28', '2022-05-17 13:25:56');

