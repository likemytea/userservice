/*
SQLyog v10.2 
MySQL - 5.7.21 : Database - fes01
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fes01` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fes01`;

/*Table structure for table `enterprise_info` */

DROP TABLE IF EXISTS `enterprise_info`;

CREATE TABLE `enterprise_info` (
  `id` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建或更新时间',
  `contact_man` varchar(128) DEFAULT NULL COMMENT '企业联系人',
  `contact_man_phone` varchar(32) DEFAULT NULL COMMENT '企业联系人电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `enterprise_info` */

/*Table structure for table `enterprise_staff` */

DROP TABLE IF EXISTS `enterprise_staff`;

CREATE TABLE `enterprise_staff` (
  `id` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `enterprise_id` varchar(64) NOT NULL COMMENT '企业id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `enterprise_code` (`enterprise_id`),
  CONSTRAINT `enterprise_staff_ibfk_1` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprise_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `enterprise_staff` */

/*Table structure for table `enterprise_staff_account` */

DROP TABLE IF EXISTS `enterprise_staff_account`;

CREATE TABLE `enterprise_staff_account` (
  `id` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `enterprise_staff_id` varchar(64) NOT NULL COMMENT '企业员工id',
  `account_type` int(11) NOT NULL COMMENT '账户类别1.积分2.一次性购物卡3.其它',
  `available_balance` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '可用余额',
  `freezing_amount` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '冻结金额',
  `total_amount` bigint(20) unsigned zerofill DEFAULT NULL COMMENT '总金额',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL COMMENT '版本号用于乐观锁分页查询等',
  PRIMARY KEY (`id`),
  KEY `enterprise_staff_id` (`enterprise_staff_id`),
  CONSTRAINT `enterprise_staff_account_ibfk_1` FOREIGN KEY (`enterprise_staff_id`) REFERENCES `enterprise_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `enterprise_staff_account` */

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`description`,`url`,`pid`) values (1,'ROLE_HOME','home','/',NULL),(2,'ROLE_ADMIN','ABel','/admin',NULL);

/*Table structure for table `sys_permission_role` */

DROP TABLE IF EXISTS `sys_permission_role`;

CREATE TABLE `sys_permission_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_permission_role` */

insert  into `sys_permission_role`(`id`,`role_id`,`permission_id`) values (1,1,1),(2,1,2),(3,2,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`) values (1,'ROLE_ADMIN'),(2,'ROLE_USER');

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) unsigned NOT NULL,
  `sys_role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`id`,`sys_user_id`,`sys_role_id`) values (1,1,1),(2,2,2);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`) values (1,'admin','admin'),(2,'abel','abel');

/*Table structure for table `test_01` */

DROP TABLE IF EXISTS `test_01`;

CREATE TABLE `test_01` (
  `id` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `test_01` */

insert  into `test_01`(`id`,`name`) values ('',NULL),('1','提摩太'),('1233333','提摩太'),('3242','提摩太'),('32424','提摩太'),('43242ds','提摩太'),('434','提摩太'),('655','提摩太'),('er33','提摩太');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
