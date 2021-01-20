/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : backstage_management_system

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2021-01-20 15:18:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'admin', '1234@123');

-- ----------------------------
-- Table structure for account_authority
-- ----------------------------
DROP TABLE IF EXISTS `account_authority`;
CREATE TABLE `account_authority` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL,
  `submit_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isDel` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id_key2` (`account_id`),
  KEY `authority_id_key` (`authority_id`),
  CONSTRAINT `account_id_key2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `authority_id_key` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_authority
-- ----------------------------

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` int(11) DEFAULT NULL,
  `organization` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_key` (`type`),
  KEY `avatar_url_key2` (`avatar_url`),
  KEY `organization_id_key` (`organization`),
  CONSTRAINT `avatar_url_key2` FOREIGN KEY (`avatar_url`) REFERENCES `file` (`id`),
  CONSTRAINT `organization_id_key` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`),
  CONSTRAINT `type_key` FOREIGN KEY (`type`) REFERENCES `dictionaries` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `dictionaries`;
CREATE TABLE `dictionaries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionaries
-- ----------------------------
INSERT INTO `dictionaries` VALUES ('1', 'gender', 'm', '男');
INSERT INTO `dictionaries` VALUES ('2', 'gender', 'f', '女');
INSERT INTO `dictionaries` VALUES ('3', 'educationBackground', 'doctor', '博士');
INSERT INTO `dictionaries` VALUES ('4', 'educationBackground', 'master', '硕士');
INSERT INTO `dictionaries` VALUES ('5', 'educationBackground', 'undergraduate', '本科');
INSERT INTO `dictionaries` VALUES ('6', 'educationBackground', 'highSchool', '高中');
INSERT INTO `dictionaries` VALUES ('7', 'educationBackground', 'other', '其他');
INSERT INTO `dictionaries` VALUES ('8', 'fileType', 'image', '图片');
INSERT INTO `dictionaries` VALUES ('9', 'fileType', 'word', '文档');
INSERT INTO `dictionaries` VALUES ('10', 'fileType', 'video', '视频');
INSERT INTO `dictionaries` VALUES ('11', 'fileType', 'other', '其他');
INSERT INTO `dictionaries` VALUES ('12', 'depType', 'research ', '研发部');
INSERT INTO `dictionaries` VALUES ('13', 'depType', 'administration ', '行政部');
INSERT INTO `dictionaries` VALUES ('14', 'depType', 'design', '设计部');
INSERT INTO `dictionaries` VALUES ('15', 'depType', 'accounting', '财务部');
INSERT INTO `dictionaries` VALUES ('16', 'depType', 'executive', '高管层');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` double DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for file_upload
-- ----------------------------
DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `id` int(255) NOT NULL,
  `system_id` int(11) NOT NULL,
  `descripttion` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_tag` varchar(255) NOT NULL,
  `upload_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `file_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_id_key` (`system_id`),
  KEY `file_tag_key` (`file_tag`),
  KEY `file_id_key` (`file_id`),
  KEY `accout_id_key2` (`account_id`),
  CONSTRAINT `accout_id_key2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `file_id_key` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `file_tag_key` FOREIGN KEY (`file_tag`) REFERENCES `dictionaries` (`key`) ON UPDATE CASCADE,
  CONSTRAINT `system_id_key` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `system_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `operation_type` varchar(255) DEFAULT NULL,
  `data_table_name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_id_key2` (`system_id`),
  KEY `account_id_key3` (`account_id`),
  CONSTRAINT `account_id_key3` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `system_id_key2` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `label` varchar(255) NOT NULL COMMENT '英文名称',
  `name` varchar(255) NOT NULL,
  `level` tinyint(255) NOT NULL,
  `parent_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for module_table
-- ----------------------------
DROP TABLE IF EXISTS `module_table`;
CREATE TABLE `module_table` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module_table
-- ----------------------------

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `avatar_url` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avatar_url_key` (`avatar_url`),
  KEY `type_key3` (`type`),
  CONSTRAINT `avatar_url_key` FOREIGN KEY (`avatar_url`) REFERENCES `file` (`id`),
  CONSTRAINT `type_key3` FOREIGN KEY (`type`) REFERENCES `dictionaries` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('2021012000', '后台管理系统', 'http');

-- ----------------------------
-- Table structure for sys_ori_dep
-- ----------------------------
DROP TABLE IF EXISTS `sys_ori_dep`;
CREATE TABLE `sys_ori_dep` (
  `id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_id_key3` (`system_id`),
  KEY `organization_id_key2` (`organization_id`),
  CONSTRAINT `organization_id_key2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `system_id_key3` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ori_dep
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `gender` char(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birth_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `education_background` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gender_key` (`gender`),
  KEY `education_background_key` (`education_background`),
  KEY `account_id_key` (`account_id`),
  CONSTRAINT `account_id_key` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `education_background_key` FOREIGN KEY (`education_background`) REFERENCES `dictionaries` (`key`) ON UPDATE CASCADE,
  CONSTRAINT `gender_key` FOREIGN KEY (`gender`) REFERENCES `dictionaries` (`key`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'm', '测试人员', '2021-01-20 00:00:00', 'undergraduate', null, null);
