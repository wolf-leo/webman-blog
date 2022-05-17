SET
FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`
(
    `id`           bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title`        varchar(100) NOT NULL DEFAULT '',
    `desc`         varchar(255) NOT NULL DEFAULT '',
    `category_id`         int(10) unsigned NOT NULL DEFAULT '0',
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

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`
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

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
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

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`
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

DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin`
(
    `id`       int(10) unsigned NOT NULL AUTO_INCREMENT,
    `username` varchar(64)  NOT NULL DEFAULT '',
    `password` varchar(125) NOT NULL DEFAULT '',
    `salt`     char(6)      NOT NULL DEFAULT '',
    `date_v`   date                  DEFAULT NULL,
    `status`   tinyint(3) unsigned NOT NULL DEFAULT '1',
    `c_time`   datetime              DEFAULT NULL,
    `u_time`   datetime              DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;