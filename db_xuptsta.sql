/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : db_xuptsta

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-12-15 16:31:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_blog`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogImage` varchar(100) DEFAULT NULL,
  `clickHit` int(11) DEFAULT NULL,
  `content` text,
  `honey` int(11) NOT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `replyHit` int(11) DEFAULT NULL,
  `summary` varchar(300) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `blogTypeId` int(11) DEFAULT NULL,
  `bloggerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t35wj753wnwh6db5qh7fl8l4x` (`blogTypeId`),
  KEY `FK_ri8v2swvgp63j7ixfoe8m8rml` (`bloggerId`),
  CONSTRAINT `FK_ri8v2swvgp63j7ixfoe8m8rml` FOREIGN KEY (`bloggerId`) REFERENCES `t_blogger` (`id`),
  CONSTRAINT `FK_t35wj753wnwh6db5qh7fl8l4x` FOREIGN KEY (`blogTypeId`) REFERENCES `t_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('1', '/xuptSta/UEditor/jsp/upload/image/20171104/1509775354754040859.jpg', '14', '<p><img src=\"/xuptSta/UEditor/jsp/upload/image/20171104/1509775354754040859.jpg\" title=\"1509775354754040859.jpg\" width=\"100%\"alt=\"1.jpg\"/></p>', '0', '2017-11-04 14:02:37', '0', '<p></p>', 'as ', '1', '1');

-- ----------------------------
-- Table structure for `t_blogger`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogger`;
CREATE TABLE `t_blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageName` varchar(40) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `profile` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogger
-- ----------------------------
INSERT INTO `t_blogger` VALUES ('1', '/images/member/20171104020008.jpg', '赵珩帆', '123456', '', '', '赵珩帆');

-- ----------------------------
-- Table structure for `t_blogtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogtype`;
CREATE TABLE `t_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` int(11) DEFAULT NULL,
  `typeName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogtype
-- ----------------------------
INSERT INTO `t_blogtype` VALUES ('1', '1', 'java');

-- ----------------------------
-- Table structure for `t_categories`
-- ----------------------------
DROP TABLE IF EXISTS `t_categories`;
CREATE TABLE `t_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentDate` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `userIp` varchar(20) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `bloggerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oogivodwa4vnhq9mfc7krevl4` (`blogId`),
  KEY `FK_dylsecat2c14xalu10sq9ac9v` (`bloggerId`),
  CONSTRAINT `FK_dylsecat2c14xalu10sq9ac9v` FOREIGN KEY (`bloggerId`) REFERENCES `t_blogger` (`id`),
  CONSTRAINT `FK_oogivodwa4vnhq9mfc7krevl4` FOREIGN KEY (`blogId`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_conus`
-- ----------------------------
DROP TABLE IF EXISTS `t_conus`;
CREATE TABLE `t_conus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `professional` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_conus
-- ----------------------------

-- ----------------------------
-- Table structure for `t_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic`;
CREATE TABLE `t_dynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `publishDate` datetime DEFAULT NULL,
  `summary` varchar(400) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `dynamicTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_onr8giv8gm0xx2vgci6gukrr0` (`dynamicTypeId`),
  CONSTRAINT `FK_onr8giv8gm0xx2vgci6gukrr0` FOREIGN KEY (`dynamicTypeId`) REFERENCES `t_dynamictype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `t_dynamictype`
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamictype`;
CREATE TABLE `t_dynamictype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dynamictype
-- ----------------------------

-- ----------------------------
-- Table structure for `t_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkImage` varchar(20) DEFAULT NULL,
  `linkName` varchar(20) DEFAULT NULL,
  `linkUrl` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_link
-- ----------------------------

-- ----------------------------
-- Table structure for `t_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `imageName` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `memberTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9y6cq0gqrcpa4y9k9lst8wa6g` (`memberTypeId`),
  CONSTRAINT `FK_9y6cq0gqrcpa4y9k9lst8wa6g` FOREIGN KEY (`memberTypeId`) REFERENCES `t_membertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('1', '123', '20171104020008.jpg', '赵珩帆', '1');

-- ----------------------------
-- Table structure for `t_membertype`
-- ----------------------------
DROP TABLE IF EXISTS `t_membertype`;
CREATE TABLE `t_membertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_membertype
-- ----------------------------
INSERT INTO `t_membertype` VALUES ('1', '集体合照');

-- ----------------------------
-- Table structure for `t_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `message` longtext,
  `name` varchar(20) DEFAULT NULL,
  `studentId` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(50) DEFAULT NULL,
  `questionNo` varchar(5) DEFAULT NULL,
  `categoriesId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1tbjk6tm2m1f6gqimgsal7dv0` (`categoriesId`),
  CONSTRAINT `FK_1tbjk6tm2m1f6gqimgsal7dv0` FOREIGN KEY (`categoriesId`) REFERENCES `t_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------

-- ----------------------------
-- Table structure for `t_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text,
  `correctRate` float DEFAULT NULL,
  `submitTime` varchar(5) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `userOJId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_eq327keuoejgqiy68yso10ly8` (`questionId`),
  KEY `FK_n9kbqfx40wm25mirpjy6ixyd8` (`userOJId`),
  CONSTRAINT `FK_eq327keuoejgqiy68yso10ly8` FOREIGN KEY (`questionId`) REFERENCES `t_question` (`id`),
  CONSTRAINT `FK_n9kbqfx40wm25mirpjy6ixyd8` FOREIGN KEY (`userOJId`) REFERENCES `t_useroj` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test
-- ----------------------------

-- ----------------------------
-- Table structure for `t_testdata`
-- ----------------------------
DROP TABLE IF EXISTS `t_testdata`;
CREATE TABLE `t_testdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `input` varchar(200) DEFAULT NULL,
  `output` varchar(200) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dl2vdct7x3898wvmc0y70oiph` (`questionId`),
  CONSTRAINT `FK_dl2vdct7x3898wvmc0y70oiph` FOREIGN KEY (`questionId`) REFERENCES `t_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_testdata
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123456', '1', 'admin');

-- ----------------------------
-- Table structure for `t_useroj`
-- ----------------------------
DROP TABLE IF EXISTS `t_useroj`;
CREATE TABLE `t_useroj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `enabled` varchar(2) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_useroj
-- ----------------------------
