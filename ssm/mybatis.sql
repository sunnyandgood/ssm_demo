/*
MySQL Data Transfer
Source Host: localhost
Source Database: mybatis
Target Host: localhost
Target Database: mybatis
Date: 2018/8/18 11:50:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for classroom
-- ----------------------------
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) default NULL,
  `gender` char(1) default NULL,
  `email` varchar(255) default NULL,
  `c_id` int(11) default NULL,
  `birthday` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `classroom` VALUES ('1', '一班');
INSERT INTO `classroom` VALUES ('2', '二班');
INSERT INTO `classroom` VALUES ('3', '三班');
INSERT INTO `user` VALUES ('1', '小美', '2', '8877@163.com', '1', '2018-08-02');
INSERT INTO `user` VALUES ('2', '小华', '2', '8767@163.com', '3', '2018-08-30');
INSERT INTO `user` VALUES ('3', '小亮', '1', 'qqsunny@163.com', '3', '2018-08-29');
INSERT INTO `user` VALUES ('4', '小红11', '1', '5duj@qq.com5', '2', '2018-08-03');
INSERT INTO `user` VALUES ('20', '小红13', '2', 'qqsunny@163.com', '2', '2018-08-02');
INSERT INTO `user` VALUES ('21', '小红14', '1', null, '3', null);
INSERT INTO `user` VALUES ('22', '小红15', '1', null, '2', null);
INSERT INTO `user` VALUES ('23', '小红16', '1', null, '2', null);
INSERT INTO `user` VALUES ('24', '小红17', '1', null, '2', null);
INSERT INTO `user` VALUES ('25', '小红18', '1', null, '1', null);
INSERT INTO `user` VALUES ('28', '小红21', '1', null, '3', null);
INSERT INTO `user` VALUES ('29', '小红22', '1', null, null, null);
INSERT INTO `user` VALUES ('30', '小红23', '1', null, null, null);
INSERT INTO `user` VALUES ('31', '小红24', '1', null, null, null);
INSERT INTO `user` VALUES ('32', '小红25', '1', null, null, null);
INSERT INTO `user` VALUES ('33', '小红26', '1', null, null, null);
INSERT INTO `user` VALUES ('34', '小红27', '1', null, null, null);
INSERT INTO `user` VALUES ('35', '小红28', '1', 'aaa', null, null);
INSERT INTO `user` VALUES ('36', '小红29', '1', null, null, null);
INSERT INTO `user` VALUES ('38', '小红31', '1', null, null, null);
INSERT INTO `user` VALUES ('39', '小红32', '1', null, null, null);
INSERT INTO `user` VALUES ('42', '小红35', '1', null, null, null);
INSERT INTO `user` VALUES ('43', '小红36', '1', null, null, null);
INSERT INTO `user` VALUES ('44', '小红37', '1', null, null, null);
INSERT INTO `user` VALUES ('45', '小红38', '1', null, null, null);
INSERT INTO `user` VALUES ('46', '小红39', '1', null, null, null);
INSERT INTO `user` VALUES ('47', '小红40', '1', null, null, null);
INSERT INTO `user` VALUES ('48', '小红41', '1', null, null, null);
INSERT INTO `user` VALUES ('49', '小红42', '1', null, null, null);
INSERT INTO `user` VALUES ('50', '小红43', '1', null, null, null);
INSERT INTO `user` VALUES ('51', '小红44', '1', null, null, null);
INSERT INTO `user` VALUES ('52', '小红45', '1', null, null, null);
INSERT INTO `user` VALUES ('53', '小红46', '1', null, null, null);
INSERT INTO `user` VALUES ('54', '小红47', '1', null, null, null);
INSERT INTO `user` VALUES ('55', '小红48', '1', null, null, null);
INSERT INTO `user` VALUES ('56', '小红49', '1', null, null, null);
INSERT INTO `user` VALUES ('74', 'xiao100', '2', 'sdfsf@163.com', null, null);
INSERT INTO `user` VALUES ('76', '小黄', '2', 'h78656@qq.com', null, null);
INSERT INTO `user` VALUES ('77', '小黄', '2', 'h78656@qq.com', null, null);
INSERT INTO `user` VALUES ('78', '小黄', '2', 'h78656@qq.com', null, null);
INSERT INTO `user` VALUES ('79', '小黄==', '2', 'h78656@qq.com', null, null);
INSERT INTO `user` VALUES ('80', '小黄', '2', 'h78656@qq.com', null, null);
INSERT INTO `user` VALUES ('81', null, '1', 'qqsunny@163.com', '3', '2018-08-14');
INSERT INTO `user` VALUES ('82', null, '1', 'qqsunny@163.com', '1', '1997-09-18');
INSERT INTO `user` VALUES ('83', null, '1', 'qqsunny@163.com', '1', '1997-09-18');
INSERT INTO `user` VALUES ('84', null, '1', 'qqsunny@163.com', '1', '1997-09-18');
INSERT INTO `user` VALUES ('85', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('86', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('87', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('88', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('89', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('90', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('91', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('92', null, '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('93', '小亮', '1', 'qqsunny@163.com', '1', '2018-08-08');
INSERT INTO `user` VALUES ('108', '中', '1', 'wrhsunny@163.com', '2', '2018-08-01');
INSERT INTO `user` VALUES ('109', '小红', '2', 'qqsunny@163.com', '1', '2018-08-10');
