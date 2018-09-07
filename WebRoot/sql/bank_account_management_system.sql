/*
Navicat MySQL Data Transfer

Source Server         : PC3306
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : bank_account_management_system

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-09-06 20:04:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `sid` varchar(20) NOT NULL COMMENT '银行账户',
  `idcard` varchar(20) NOT NULL COMMENT '身份证',
  `opendate` varchar(20) DEFAULT NULL COMMENT '开户日期',
  `realname` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `balance` double DEFAULT NULL COMMENT '账户金额',
  `interest` double DEFAULT NULL COMMENT '存款利息',
  `accountType` varchar(20) DEFAULT NULL COMMENT '账户类型定期活期',
  `useType` varchar(20) DEFAULT NULL COMMENT '是否贷款账户',
  `status` varchar(20) DEFAULT NULL COMMENT '银行账户状态正常与冻结',
  `overduerepay` int(2) DEFAULT '0' COMMENT '曾经逾期还款0否1是',
  `gender` int(2) NOT NULL COMMENT '客户性别',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `def01` varchar(101) DEFAULT NULL COMMENT '自定义项1',
  `def02` varchar(101) DEFAULT NULL COMMENT '自定义项2',
  `def03` varchar(101) DEFAULT NULL COMMENT '自定义项3',
  `def04` varchar(101) DEFAULT NULL COMMENT '自定义项4',
  `def05` varchar(101) DEFAULT NULL COMMENT '自定义项5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('1', '123456', '9887005663000762098', '400999288811192989', '2018-05-09', '蒋锐', '1066760', '12', '活期', '贷款', '正常', '0', '1', '13777778888', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('2', '123456', '9887001701700940919', '123456789123456789', '2018-04-09', '椿', '65102', '3', '定期', '否', '正常', '0', '1', '12345678911', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('3', '123456', '9887000363600765339', '123456789123456789', '2018-05-01', '椿', '1230000', '30', '定期', '否', '正常', '0', '1', '12345678911', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('4', '123456', '9887003436500537833', '123456789123456789', '2018-05-09', '椿', '989898787', '1785028.2218082498', '定期', '贷款', '正常', '1', '1', '15622220090', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('5', '123456', '9887008249300977721', '123456789123456789', '2018-01-09', '椿', '22220000', '78', '定期', '否', '冻结', '0', '1', '12345678911', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('6', '123456', '9887009702700970791', '999999999999999999', '2018-05-11', '鬮', '90000', '4', '定期', '否', '正常', '0', '1', '15987690909', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('7', '123456', '9887008182100734061', '400400200101012989', '2018-05-11', '霐', '1000000', '10', '定期', '否', '正常', '0', '1', '18702029989', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('8', '123456', '9887001622400872331', '999999999999999998', '2018-05-09', '韩寒', '1000000', '10', '定期', '否', '正常', '0', '0', '13777778888', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('9', '123456', '9887001460000549943', '999999999999999997', '2018-05-30', '张韵', '100', '0', '定期', '否', '正常', '0', '0', '13777778888', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('10', '123456', '9887004524400355857', '434299129393439949', '2018-06-07', '李石', '100', '0', '定期', '否', '正常', '0', '1', '12345678911', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('11', '123456', '9887004454700989501', '400999288822192989', '2018-06-14', '蒋锐', '10000', '0', '定期', '否', '正常', '0', '1', '15738539102', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('12', '123456', '9887003806500408501', '400999288811192989', '2018-06-14', '蒋锐', '100', '0', '定期', '否', '冻结', '0', '1', '13777778888', null, null, null, null, null);
INSERT INTO `t_account` VALUES ('13', '123456', '9887009434300379206', '400999288883792989', '2018-06-14', '范仲永', '1100000', '0', '活期', '贷款', '正常', '0', '1', '16356262671', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_loan
-- ----------------------------
DROP TABLE IF EXISTS `t_loan`;
CREATE TABLE `t_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(20) NOT NULL COMMENT '贷款日期',
  `money` double NOT NULL COMMENT '贷款金额',
  `month` int(11) NOT NULL COMMENT '贷款分期',
  `rate` double NOT NULL COMMENT '贷款利率',
  `startPayDate` varchar(20) DEFAULT NULL COMMENT '还款日期',
  `perPayMoney` double NOT NULL COMMENT '每期还款',
  `repaymonth` int(2) DEFAULT NULL COMMENT '已还分期',
  `overdueinterest` double(11,0) DEFAULT NULL COMMENT '逾期利息',
  `repaystatus` varchar(4) DEFAULT '' COMMENT '还款状态1待还款2还款中3已还款4逾期还款',
  `account_id` int(11) DEFAULT NULL,
  `def01` varchar(101) DEFAULT NULL COMMENT '自定义项1',
  `def02` varchar(101) DEFAULT NULL COMMENT '自定义项2',
  `def03` varchar(101) DEFAULT NULL COMMENT '自定义项3',
  `def04` varchar(101) DEFAULT NULL COMMENT '自定义项4',
  `def05` varchar(101) DEFAULT NULL COMMENT '自定义项5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKCB5FA5DB7ECF11AA` (`account_id`),
  CONSTRAINT `FKCB5FA5DB7ECF11AA` FOREIGN KEY (`account_id`) REFERENCES `t_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loan
-- ----------------------------
INSERT INTO `t_loan` VALUES ('3', '2018-05-29', '10000', '7', '6', '2018-06-28', '1791.35', '7', '0', '已还款', '4', null, null, null, null, null);
INSERT INTO `t_loan` VALUES ('4', '2018-05-29', '400000', '6', '6', '2018-07-28', '81345.05', '6', '0', '已还款', '4', null, null, null, null, null);
INSERT INTO `t_loan` VALUES ('5', '2018-06-04', '9999', '8', '6', '2018-07-04', '1610.2', '0', '0', '待还款', '4', null, null, null, null, null);
INSERT INTO `t_loan` VALUES ('6', '2018-06-14', '66660', '6', '6', '2018-07-14', '13556.15', '2', '0', '还款中', '1', null, null, null, null, null);
INSERT INTO `t_loan` VALUES ('7', '2018-06-14', '100000', '7', '6', '2018-07-14', '17913.5', '2', '0', '还款中', '13', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_simple_user
-- ----------------------------
DROP TABLE IF EXISTS `t_simple_user`;
CREATE TABLE `t_simple_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userID` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK99BA02ED78313856` (`userID`),
  CONSTRAINT `FK99BA02ED78313856` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_simple_user
-- ----------------------------
INSERT INTO `t_simple_user` VALUES ('3', '2');
INSERT INTO `t_simple_user` VALUES ('4', '3');
INSERT INTO `t_simple_user` VALUES ('6', '16');
INSERT INTO `t_simple_user` VALUES ('7', '17');
INSERT INTO `t_simple_user` VALUES ('8', '18');
INSERT INTO `t_simple_user` VALUES ('9', '19');
INSERT INTO `t_simple_user` VALUES ('10', '20');
INSERT INTO `t_simple_user` VALUES ('13', '23');
INSERT INTO `t_simple_user` VALUES ('16', '26');
INSERT INTO `t_simple_user` VALUES ('17', '27');
INSERT INTO `t_simple_user` VALUES ('18', '28');
INSERT INTO `t_simple_user` VALUES ('19', '29');
INSERT INTO `t_simple_user` VALUES ('20', '30');
INSERT INTO `t_simple_user` VALUES ('21', '31');
INSERT INTO `t_simple_user` VALUES ('22', '32');
INSERT INTO `t_simple_user` VALUES ('23', '33');
INSERT INTO `t_simple_user` VALUES ('24', '34');
INSERT INTO `t_simple_user` VALUES ('25', '35');
INSERT INTO `t_simple_user` VALUES ('26', '36');
INSERT INTO `t_simple_user` VALUES ('27', '37');
INSERT INTO `t_simple_user` VALUES ('28', '43');
INSERT INTO `t_simple_user` VALUES ('29', '47');
INSERT INTO `t_simple_user` VALUES ('30', '48');
INSERT INTO `t_simple_user` VALUES ('31', '51');
INSERT INTO `t_simple_user` VALUES ('32', '52');
INSERT INTO `t_simple_user` VALUES ('35', '56');
INSERT INTO `t_simple_user` VALUES ('36', '57');
INSERT INTO `t_simple_user` VALUES ('37', '58');
INSERT INTO `t_simple_user` VALUES ('38', '59');
INSERT INTO `t_simple_user` VALUES ('39', '60');
INSERT INTO `t_simple_user` VALUES ('40', '61');
INSERT INTO `t_simple_user` VALUES ('41', '62');
INSERT INTO `t_simple_user` VALUES ('42', '63');
INSERT INTO `t_simple_user` VALUES ('43', '64');
INSERT INTO `t_simple_user` VALUES ('44', '65');
INSERT INTO `t_simple_user` VALUES ('45', '66');
INSERT INTO `t_simple_user` VALUES ('46', '67');
INSERT INTO `t_simple_user` VALUES ('47', '68');
INSERT INTO `t_simple_user` VALUES ('48', '69');
INSERT INTO `t_simple_user` VALUES ('49', '70');
INSERT INTO `t_simple_user` VALUES ('50', '71');
INSERT INTO `t_simple_user` VALUES ('51', '72');
INSERT INTO `t_simple_user` VALUES ('52', '73');
INSERT INTO `t_simple_user` VALUES ('53', '74');
INSERT INTO `t_simple_user` VALUES ('54', '75');
INSERT INTO `t_simple_user` VALUES ('55', '76');
INSERT INTO `t_simple_user` VALUES ('56', '77');
INSERT INTO `t_simple_user` VALUES ('57', '78');
INSERT INTO `t_simple_user` VALUES ('58', '79');
INSERT INTO `t_simple_user` VALUES ('59', '80');
INSERT INTO `t_simple_user` VALUES ('60', '81');
INSERT INTO `t_simple_user` VALUES ('61', '82');
INSERT INTO `t_simple_user` VALUES ('62', '83');
INSERT INTO `t_simple_user` VALUES ('63', '84');
INSERT INTO `t_simple_user` VALUES ('64', '85');
INSERT INTO `t_simple_user` VALUES ('65', '86');
INSERT INTO `t_simple_user` VALUES ('66', '87');
INSERT INTO `t_simple_user` VALUES ('67', '88');
INSERT INTO `t_simple_user` VALUES ('68', '89');
INSERT INTO `t_simple_user` VALUES ('69', '90');

-- ----------------------------
-- Table structure for t_super_user
-- ----------------------------
DROP TABLE IF EXISTS `t_super_user`;
CREATE TABLE `t_super_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userId` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK56F4EEBA78313856` (`userId`),
  CONSTRAINT `FK56F4EEBA78313856` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_super_user
-- ----------------------------
INSERT INTO `t_super_user` VALUES ('1', '10');

-- ----------------------------
-- Table structure for t_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `t_sysuser`;
CREATE TABLE `t_sysuser` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userID` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK54046F4D78313856` (`userID`),
  CONSTRAINT `FK54046F4D78313856` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysuser
-- ----------------------------
INSERT INTO `t_sysuser` VALUES ('1', '1');
INSERT INTO `t_sysuser` VALUES ('2', '6');
INSERT INTO `t_sysuser` VALUES ('3', '7');
INSERT INTO `t_sysuser` VALUES ('4', '8');
INSERT INTO `t_sysuser` VALUES ('5', '9');
INSERT INTO `t_sysuser` VALUES ('7', '53');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL COMMENT '账户名',
  `userPassword` varchar(50) NOT NULL,
  `userAddress` varchar(50) DEFAULT NULL COMMENT '地址',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  `userGender` int(11) NOT NULL COMMENT '性别',
  `userBirth` varchar(10) DEFAULT NULL COMMENT '出生日期',
  `userEmail` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `userPhone` varchar(20) DEFAULT NULL COMMENT '电话',
  `def01` varchar(101) DEFAULT NULL COMMENT '自定义项1',
  `def02` varchar(101) DEFAULT NULL COMMENT '自定义项2',
  `def03` varchar(101) DEFAULT NULL COMMENT '自定义项3',
  `def04` varchar(101) DEFAULT NULL COMMENT '自定义项4',
  `def05` varchar(101) DEFAULT NULL COMMENT '自定义项5',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'hpu松7', '柯纯', '0', '2093-01-01', '0609@hpu.com', '15728288888', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('2', 'clerk01', 'E10ADC3949BA59ABBE56E057F20F883E', 'hpu松7', '柜员01', '0', '1999-01-07', '8899@hpu.com', '13788889999', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('3', 'clerk02', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区', '檒', '0', '1979-01-18', '999@hpu.com', '12345635353', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('4', 'clerk03', 'E10ADC3949BA59ABBE56E057F20F883E', '郑州', '柜员03', '0', '1993-02-16', '0201@hpu.com', '15711110201', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('5', 'clerk05', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '柜员05', '1', '1993-02-16', '0205@hpu.com', '15711110205', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('6', 'admin01', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '徐峥', '1', '2000-01-01', 'admin01@hpu.com', '15711110206', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('7', 'admin02', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '易晓', '1', '1996-01-25', 'admin02@hpu.com', '15711110207', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('8', 'admin03', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '武衫', '1', '1994-01-01', 'admin03@hpu.com', '15711110202', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('9', 'admin04', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '郑飞', '1', '1999-01-01', 'admin04@hpu.com', '15711110209', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('10', 'root', 'E10ADC3949BA59ABBE56E057F20F883E', null, '超级管理员', '1', null, null, null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('11', 'clerk11', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作山阳区', '柜员11', '1', '1993-02-16', '0211@hpu.com', '15711110211', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('12', 'clerk12', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '柜员12', '1', '1993-02-16', '0212@hpu.com', '15711110212', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('13', 'clerk13', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '柜员13', '1', '1993-02-12', '0213@hpu.com', '15711110213', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('14', 'clerk14', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '柜员14', '1', '1993-02-16', '014@hpu.com', '15711110214', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('15', 'clerk15', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '柜员15', '1', '1993-02-16', '0215@hpu.com', '15711110215', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('16', 'clerk16', 'E10ADC3949BA59ABBE56E057F20F883E', '漯河', '职员16', '0', '2001-02-13', '0216@hpu.com', '15711110216', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('17', 'clerk17', 'E10ADC3949BA59ABBE56E057F20F883E', '漯河', '职员17', '0', '2001-02-13', '0217@hpu.com', '15711110217', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('18', 'clerk18', 'E10ADC3949BA59ABBE56E057F20F883E', '漯河', '职员18', '0', '2001-02-18', '0218@hpu.com', '15711110218', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('19', 'niaonao', '46F94C8DE14FB36680850768FF1B7F2A', 'hpu', '袅袅', '0', '1995-04-04', '0301@hpu.com', '15711110301', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('20', 'rfeng', '46F94C8DE14FB36680850768FF1B7F2A', 'hpu', '檒', '1', '1995-04-04', '0302@hpu.com', '15711110302', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('21', 'x', '46F94C8DE14FB36680850768FF1B7F2A', 'hpusource', '艾克', '1', '1995-04-02', '0403@hpu.com', '15711110403', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('22', 'xs', '46F94C8DE14FB36680850768FF1B7F2A', '瑞典', '艾克思', '1', '1995-04-02', '0401@hpu.com', '15711110401', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('23', 'SD', '46F94C8DE14FB36680850768FF1B7F2A', '帝都', '艾斯德', '1', '1992-04-02', '0400@hpu.com', '15711110400', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('24', 'hs', '46F94C8DE14FB36680850768FF1B7F2A', '帝都', '韩束', '0', '1992-01-02', '0411@hpu.com', '15711110411', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('25', 'h', '46F94C8DE14FB36680850768FF1B7F2A', '汉城', '韩', '1', '1992-01-02', '0410@hpu.com', '15711110410', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('26', 'jian', 'E10ADC3949BA59ABBE56E057F20F883E', '英格兰', '简', '0', '1998-02-02', '0101@hpu.com', '15722220101', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('27', 'baster', 'E10ADC3949BA59ABBE56E057F20F883E', '英格兰', '巴斯特', '1', '1998-02-02', '0108@hpu.com', '15722220108', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('28', 'handsome', 'E10ADC3949BA59ABBE56E057F20F883E', '旧金山', '菡', '0', '1998-02-01', '0105@hpu.com', '15722220105', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('29', 'helloacm', 'E10ADC3949BA59ABBE56E057F20F883E', '沈阳', '陈旭', '0', '1998-02-01', '0102@hpu.com', '15722220102', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('30', 'justgo', 'E10ADC3949BA59ABBE56E057F20F883E', '沈阳', '贾斯特枸', '1', '1998-02-01', '0203@hpu.com', '15722220203', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('31', 'one', 'E10ADC3949BA59ABBE56E057F20F883E', '英国', '欧尼尔', '1', '1998-02-01', '0202@hpu.com', '15722220202', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('32', 'mouse', 'E10ADC3949BA59ABBE56E057F20F883E', '英国', '狂鼠', '1', '1998-02-01', '0201@hpu.com', '15722220201', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('33', 'gbwz', 'E10ADC3949BA59ABBE56E057F20F883E', '日本', '半藏', '1', '1998-12-01', '0505@hpu.com', '15722220505', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('34', 'xgtz', 'E10ADC3949BA59ABBE56E057F20F883E', '新郑市', '兴港', '1', '1998-12-01', '0502@hpu.com', '15722220502', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('35', 'h01', 'E10ADC3949BA59ABBE56E057F20F883E', '未知', 'h', '0', '1999-12-12', '12@163.com', '112211212', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('36', 'hpustu100', 'E10ADC3949BA59ABBE56E057F20F883E', 'HPU北校区', '诸葛青', '1', '2003-03-04', '0100@hpu.com', '15711110100222', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('37', 'cun', 'E10ADC3949BA59ABBE56E057F20F883E', 'hpu', '韩', '0', '2003-05-01', '222@qq.com', '12345622223', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('38', 'shi01', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '123', '0', '2018-01-02', '8899@hpu.com', '13788889999', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('39', 'shi02', '4297F44B13955235245B2497399D7A93', 'hpu松7', '111', '0', '2018-01-02', '8899@hpu.com', '15711110206', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('40', 'shi03', '4297F44B13955235245B2497399D7A93', 'hpu松7', '111', '0', '2018-01-02', '8899@hpu.com', '15711110206', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('41', 'adm2342', '4297F44B13955235245B2497399D7A93', 'hpu松7', '啊啊', '0', '1999-01-07', 'admin04@hpu.com', '15711110206', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('42', 'hpu01', '4297F44B13955235245B2497399D7A93', 'hpu松7', '123123', '0', '1999-01-07', 'admin04@hpu.com', '13788889999', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('43', 'cun01', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '閽', '0', '1958-01-01', 'admin04@hpu.com', '13788889999', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('47', 'cuncun', 'EFE6398127928F1B2E9EF3207FB82663', '焦作', '閽', '0', '1901-01-01', '8899@hpu.com', '13788889999', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('48', 'cun2', '4297F44B13955235245B2497399D7A93', 'hpu松7', '閽', '0', '1999-01-07', '8899@hpu.com', '15711110206', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('50', 'admin07', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '撒旦', '1', '1999-01-01', '8899@qq.com', '13788889999', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('51', 'hpu0101', 'E10ADC3949BA59ABBE56E057F20F883E', 'hpu松7', '閽', '0', '1999-06-01', '889998@hpu.com', '13788889990', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('52', 'jerry', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区', '杰瑞', '0', '1999-01-07', '888899@hpu.com', '15711110205', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('53', 'admin05', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '海子', '1', '2001-01-01', '8899@hpu.com', '15711110200', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('54', 'counter01', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '梁伊', '0', '2000-06-16', '9239@hpu.com', '13781829239', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('55', 'counter9', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '钱修云', '0', '2000-06-23', '2339@hpu.com', '13781822339', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('56', 'counter08', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '李嘉凯', '1', '2000-04-01', '2312@hpu.com', '13781822312', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('57', 'counter07', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '金晓海', '1', '2000-04-01', '7822@hpu.com', '13778232312', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('58', 'counter06', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '王志军', '1', '2000-04-01', '8484@hpu.com', '13723678484', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('59', 'counter05', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '柳城保', '1', '2000-04-28', '8482@hpu.com', '13723678485', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('60', 'counter04', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '胡萌', '0', '2000-04-20', '2983@hpu.com', '13529838485', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('61', 'counter03', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作高新区世纪路2001号', '胡萌', '0', '1992-09-11', '9607@hpu.com', '15783829607', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('62', 'yingrx', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '应如仙', '0', '1999-06-01', '8372@hpu.com', '15712827200', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('63', 'xux', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '徐晓', '1', '1999-06-01', '7298@hpu.com', '15712827298', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('64', 'yuanlt', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '元六塘', '1', '1999-06-09', '1225@hpu.com', '15712253298', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('65', 'liuq', 'E10ADC3949BA59ABBE56E057F20F883E', '焦作', '刘琦', '1', '1999-06-24', '13611225@hpu.com', '13612253298', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('66', 'liuq1', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '刘谦', '1', '1984-06-01', '8862@hpu.com', '15783838862', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('67', 'yingcj', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '应超建', '1', '1975-06-01', '3872@hpu.com', '15783872662', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('68', 'fanjl', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '范俊丽', '0', '1975-06-27', '8390@hpu.com', '15783901962', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('69', 'caim', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '蔡敏', '0', '1975-06-24', '8340@hpu.com', '15783401989', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('70', 'zhuc', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '朱超', '1', '1975-05-01', '4109@hpu.com', '15783404109', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('71', 'fangwj', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '方魏娟', '0', '1975-05-22', '8320@hpu.com', '15783202109', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('72', 'wangap', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '王安平', '1', '1975-05-13', '8758@hpu.com', '15783208758', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('73', 'zhuxq', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '朱晓清', '1', '1999-01-07', '8899@hpu.com', '15711110200', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('74', 'ligl', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '李国立', '1', '1999-01-07', '1102@hpu.com', '15711110200', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('75', 'chenqx', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '陈秋香', '0', '1999-01-21', '1403@hpu.com', '15711140300', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('76', 'xud', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '徐丹', '0', '1986-01-01', '0328@hpu.com', '15711140328', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('77', 'wun', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '吴娜', '0', '1986-01-22', '1824@hpu.com', '15718240328', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('78', 'zhuxq1', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '朱晓清', '0', '1986-01-22', '1834@hpu.com', '15718340328', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('79', 'shugw', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '姝宫闱', '0', '1986-01-22', '0028@hpu.com', '15718350028', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('80', 'liangx', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '梁修', '1', '1986-05-01', '0328@hpu.com', '15718350328', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('81', 'xuxj', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '徐潇俊', '1', '1986-05-22', '1428@hpu.com', '15718351428', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('82', 'zhuqy', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '朱庆元', '1', '1986-05-14', '1303@hpu.com', '15718351303', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('83', 'xiagw', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '夏龚伟', '1', '1986-07-25', '1793@hpu.com', '15717931303', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('84', 'chenwx', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '陈文秀', '0', '1986-07-15', '9103@hpu.com', '15717939103', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('85', 'wanjm', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '万健明', '1', '1986-04-16', '1853@hpu.com', '15738589103', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('86', 'liyz', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '李永忠', '1', '1986-04-17', '6403@hpu.com', '15738276403', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('87', 'shenzm', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '沈志明', '1', '1986-04-22', '3284@hpu.com', '15732847403', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('88', 'jiangyq', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '蒋怡囷', '1', '1986-04-18', '5403@hpu.com', '15738475403', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('89', 'heh', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '何欢', '1', '1986-04-24', '3847@hpu.com', '15738473847', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('90', 'xuq', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '许启明', '1', '1984-04-11', '2163@hpu.com', '1572163847', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('91', 'yueyb', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '岳元彬', '1', '1984-04-02', '2739@hpu.com', '15727393847', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('92', 'daih', 'E10ADC3949BA59ABBE56E057F20F883E', '济南', '戴号', '1', '1984-02-01', '8147@hpu.com', '15737368147', null, null, null, null, null);
