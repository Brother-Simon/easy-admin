# --------------------------------------- 
# Easy-Admin Backup File. 
# Github: http://github.com/happen-zhang/easy-admin 
# Description:当前SQL文件包含了表：ea_access、ea_admin、ea_field、ea_happy_article、ea_happy_see、ea_home_img、ea_home_introduce、ea_input、ea_model、ea_node、ea_produce_img、ea_role、ea_role_admin、fdsf的结构信息，表：ea_access、ea_admin、ea_field、ea_happy_article、ea_happy_see、ea_home_img、ea_home_introduce、ea_input、ea_model、ea_node、ea_produce_img、ea_role、ea_role_admin、fdsf的数据
# Time: 2015-03-03 17:33:36 
# --------------------------------------- 
# 当前SQL卷标：#1
# --------------------------------------- 


# 数据库表：ea_access 结构信息
DROP TABLE IF EXISTS `ea_access`;
CREATE TABLE `ea_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `node_id` int(11) NOT NULL COMMENT '节点id',
  PRIMARY KEY (`id`),
  KEY `fk_role_access` (`role_id`),
  KEY `fk_node_acess` (`node_id`),
  CONSTRAINT `fk_node_acess` FOREIGN KEY (`node_id`) REFERENCES `ea_node` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_acess` FOREIGN KEY (`role_id`) REFERENCES `ea_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8 COMMENT='结点权限访问表';

# 数据库表：ea_admin 结构信息
DROP TABLE IF EXISTS `ea_admin`;
CREATE TABLE `ea_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int(11) NOT NULL COMMENT '所属角色id',
  `email` varchar(64) NOT NULL COMMENT '登录邮箱',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `mail_hash` varchar(36) NOT NULL COMMENT '邮件hash值',
  `remark` text NOT NULL COMMENT '管理员备注信息',
  `is_super` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `is_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `last_login_at` int(11) NOT NULL COMMENT '最后登录时间',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`email`),
  KEY `fk_admin_role` (`role_id`),
  CONSTRAINT `fk_admin_role` FOREIGN KEY (`role_id`) REFERENCES `ea_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

# 数据库表：ea_field 结构信息
DROP TABLE IF EXISTS `ea_field`;
CREATE TABLE `ea_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model_id` int(11) NOT NULL COMMENT '所属模型id',
  `name` varchar(128) NOT NULL COMMENT '字段名称',
  `comment` varchar(32) NOT NULL COMMENT '字段注释',
  `type` varchar(32) NOT NULL COMMENT '字段类型',
  `length` varchar(16) NOT NULL COMMENT '字段长度',
  `value` varchar(128) NOT NULL COMMENT '字段默认值',
  `is_require` tinyint(4) DEFAULT '0' COMMENT '是否必需',
  `is_unique` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否唯一',
  `is_index` tinyint(4) DEFAULT '0' COMMENT '是否添加索引',
  `is_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统字段',
  `is_list_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '列表中显示',
  `auto_filter` varchar(32) NOT NULL COMMENT '自动过滤函数',
  `auto_fill` varchar(32) NOT NULL COMMENT '自动完成函数',
  `fill_time` varchar(16) NOT NULL DEFAULT 'both' COMMENT '填充时机',
  `relation_model` int(11) NOT NULL COMMENT '关联的模型',
  `relation_field` varchar(128) NOT NULL COMMENT '关联的字段',
  `relation_value` varchar(128) NOT NULL COMMENT '关联显示的值',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_model` (`model_id`),
  CONSTRAINT `fk_field_model` FOREIGN KEY (`model_id`) REFERENCES `ea_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='数据模型字段';

# 数据库表：ea_happy_article 结构信息
DROP TABLE IF EXISTS `ea_happy_article`;
CREATE TABLE `ea_happy_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `context` longtext COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# 数据库表：ea_happy_see 结构信息
DROP TABLE IF EXISTS `ea_happy_see`;
CREATE TABLE `ea_happy_see` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `img_url` varchar(255) DEFAULT NULL COMMENT '文章图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

# 数据库表：ea_home_img 结构信息
DROP TABLE IF EXISTS `ea_home_img`;
CREATE TABLE `ea_home_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `img_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `img_url` longtext COMMENT '上传图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

# 数据库表：ea_home_introduce 结构信息
DROP TABLE IF EXISTS `ea_home_introduce`;
CREATE TABLE `ea_home_introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `introduce_text` longtext COMMENT '介绍内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# 数据库表：ea_input 结构信息
DROP TABLE IF EXISTS `ea_input`;
CREATE TABLE `ea_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表单域是否显示',
  `label` varchar(32) NOT NULL COMMENT '表单域标签',
  `remark` varchar(128) NOT NULL COMMENT '表单域域',
  `type` varchar(32) NOT NULL COMMENT '表单域类型',
  `width` int(11) NOT NULL DEFAULT '20' COMMENT '表单域宽度',
  `height` int(11) NOT NULL DEFAULT '8' COMMENT '表单域高度',
  `opt_value` text NOT NULL COMMENT '表单域可选值',
  `value` varchar(128) NOT NULL COMMENT '表单域默认值',
  `editor` varchar(32) NOT NULL COMMENT '编辑器类型',
  `html` text NOT NULL COMMENT '表单域html替换',
  `show_order` int(11) DEFAULT NULL COMMENT '表单域显示顺序',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_input` (`field_id`),
  CONSTRAINT `fk_input_field` FOREIGN KEY (`field_id`) REFERENCES `ea_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字段表单域信息';

# 数据库表：ea_model 结构信息
DROP TABLE IF EXISTS `ea_model`;
CREATE TABLE `ea_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL COMMENT '模型名称',
  `tbl_name` varchar(32) NOT NULL COMMENT '数据表名称',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `is_inner` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为内部表',
  `has_pk` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否包含主键',
  `tbl_engine` varchar(16) NOT NULL DEFAULT 'InnoDB' COMMENT '引擎类型',
  `description` text NOT NULL COMMENT '模型描述',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='数据模型信息';

# 数据库表：ea_node 结构信息
DROP TABLE IF EXISTS `ea_node`;
CREATE TABLE `ea_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) NOT NULL COMMENT '父节点id',
  `name` varchar(32) NOT NULL COMMENT '节点名称',
  `title` varchar(32) NOT NULL COMMENT '节点标题',
  `level` tinyint(4) NOT NULL COMMENT '节点等级',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '节点状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='节点表';

# 数据库表：ea_produce_img 结构信息
DROP TABLE IF EXISTS `ea_produce_img`;
CREATE TABLE `ea_produce_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `img_url` varchar(255) DEFAULT NULL COMMENT '上传图片',
  `img_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# 数据库表：ea_role 结构信息
DROP TABLE IF EXISTS `ea_role`;
CREATE TABLE `ea_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) NOT NULL COMMENT '父角色id',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `description` text NOT NULL COMMENT '角色描述',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '角色状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

# 数据库表：ea_role_admin 结构信息
DROP TABLE IF EXISTS `ea_role_admin`;
CREATE TABLE `ea_role_admin` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `user_id` int(11) NOT NULL COMMENT '管理员id',
  KEY `fk_role_admin` (`role_id`),
  KEY `fk_admin_role` (`user_id`),
  CONSTRAINT `fk_ar` FOREIGN KEY (`user_id`) REFERENCES `ea_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ra` FOREIGN KEY (`role_id`) REFERENCES `ea_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限表';

# 数据库表：fdsf 结构信息
DROP TABLE IF EXISTS `fdsf`;
CREATE TABLE `fdsf` (
  `id` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# 数据表：ea_access 数据信息

INSERT INTO `ea_access` VALUES ('341','2','1');
INSERT INTO `ea_access` VALUES ('342','2','2');
INSERT INTO `ea_access` VALUES ('343','2','3');
INSERT INTO `ea_access` VALUES ('344','2','4');
INSERT INTO `ea_access` VALUES ('345','2','5');
INSERT INTO `ea_access` VALUES ('346','2','6');
INSERT INTO `ea_access` VALUES ('347','2','7');
INSERT INTO `ea_access` VALUES ('348','2','8');
INSERT INTO `ea_access` VALUES ('349','2','9');
INSERT INTO `ea_access` VALUES ('350','2','10');
INSERT INTO `ea_access` VALUES ('351','2','11');
INSERT INTO `ea_access` VALUES ('352','2','12');
INSERT INTO `ea_access` VALUES ('353','2','13');
INSERT INTO `ea_access` VALUES ('354','2','14');
INSERT INTO `ea_access` VALUES ('355','2','15');
INSERT INTO `ea_access` VALUES ('356','2','16');
INSERT INTO `ea_access` VALUES ('357','2','17');
INSERT INTO `ea_access` VALUES ('358','2','18');
INSERT INTO `ea_access` VALUES ('359','2','19');
INSERT INTO `ea_access` VALUES ('360','2','20');
INSERT INTO `ea_access` VALUES ('361','2','21');
INSERT INTO `ea_access` VALUES ('362','2','22');
INSERT INTO `ea_access` VALUES ('363','2','23');
INSERT INTO `ea_access` VALUES ('364','2','24');
INSERT INTO `ea_access` VALUES ('365','2','25');
INSERT INTO `ea_access` VALUES ('366','2','26');
INSERT INTO `ea_access` VALUES ('367','2','27');
INSERT INTO `ea_access` VALUES ('368','2','28');
INSERT INTO `ea_access` VALUES ('369','2','29');
INSERT INTO `ea_access` VALUES ('370','2','30');
INSERT INTO `ea_access` VALUES ('371','2','31');
INSERT INTO `ea_access` VALUES ('372','2','32');
INSERT INTO `ea_access` VALUES ('373','2','33');
INSERT INTO `ea_access` VALUES ('374','2','34');
INSERT INTO `ea_access` VALUES ('375','2','35');
INSERT INTO `ea_access` VALUES ('376','2','36');
INSERT INTO `ea_access` VALUES ('377','2','37');
INSERT INTO `ea_access` VALUES ('378','2','38');
INSERT INTO `ea_access` VALUES ('379','2','39');
INSERT INTO `ea_access` VALUES ('380','2','40');
INSERT INTO `ea_access` VALUES ('381','2','41');
INSERT INTO `ea_access` VALUES ('382','2','42');
INSERT INTO `ea_access` VALUES ('383','2','43');
INSERT INTO `ea_access` VALUES ('384','2','44');
INSERT INTO `ea_access` VALUES ('385','2','45');
INSERT INTO `ea_access` VALUES ('386','2','46');
INSERT INTO `ea_access` VALUES ('387','2','47');
INSERT INTO `ea_access` VALUES ('388','2','61');
INSERT INTO `ea_access` VALUES ('389','2','48');
INSERT INTO `ea_access` VALUES ('390','2','49');
INSERT INTO `ea_access` VALUES ('391','2','50');
INSERT INTO `ea_access` VALUES ('392','2','51');
INSERT INTO `ea_access` VALUES ('393','2','52');
INSERT INTO `ea_access` VALUES ('394','2','53');
INSERT INTO `ea_access` VALUES ('395','2','54');
INSERT INTO `ea_access` VALUES ('396','2','55');
INSERT INTO `ea_access` VALUES ('397','2','56');
INSERT INTO `ea_access` VALUES ('398','2','57');
INSERT INTO `ea_access` VALUES ('399','2','58');
INSERT INTO `ea_access` VALUES ('400','2','59');
INSERT INTO `ea_access` VALUES ('401','2','60');
INSERT INTO `ea_access` VALUES ('409','3','1');
INSERT INTO `ea_access` VALUES ('410','3','2');
INSERT INTO `ea_access` VALUES ('411','3','3');
INSERT INTO `ea_access` VALUES ('412','3','4');
INSERT INTO `ea_access` VALUES ('413','3','5');
INSERT INTO `ea_access` VALUES ('414','3','6');
INSERT INTO `ea_access` VALUES ('415','3','7');
INSERT INTO `ea_access` VALUES ('416','3','8');
INSERT INTO `ea_access` VALUES ('417','3','9');
INSERT INTO `ea_access` VALUES ('418','3','10');
INSERT INTO `ea_access` VALUES ('419','3','11');
INSERT INTO `ea_access` VALUES ('420','3','12');
INSERT INTO `ea_access` VALUES ('421','3','13');
INSERT INTO `ea_access` VALUES ('422','3','14');
INSERT INTO `ea_access` VALUES ('423','3','15');
INSERT INTO `ea_access` VALUES ('424','3','16');
INSERT INTO `ea_access` VALUES ('425','3','17');
INSERT INTO `ea_access` VALUES ('426','3','18');
INSERT INTO `ea_access` VALUES ('427','3','19');
INSERT INTO `ea_access` VALUES ('428','3','20');
INSERT INTO `ea_access` VALUES ('429','3','21');
INSERT INTO `ea_access` VALUES ('430','3','22');
INSERT INTO `ea_access` VALUES ('431','3','23');
INSERT INTO `ea_access` VALUES ('432','3','24');
INSERT INTO `ea_access` VALUES ('433','3','25');
INSERT INTO `ea_access` VALUES ('434','3','26');
INSERT INTO `ea_access` VALUES ('435','3','27');
INSERT INTO `ea_access` VALUES ('436','3','28');
INSERT INTO `ea_access` VALUES ('437','3','29');
INSERT INTO `ea_access` VALUES ('438','3','30');
INSERT INTO `ea_access` VALUES ('439','3','31');
INSERT INTO `ea_access` VALUES ('440','3','32');
INSERT INTO `ea_access` VALUES ('441','3','33');
INSERT INTO `ea_access` VALUES ('442','3','34');
INSERT INTO `ea_access` VALUES ('443','3','35');
INSERT INTO `ea_access` VALUES ('444','3','36');
INSERT INTO `ea_access` VALUES ('445','3','37');
INSERT INTO `ea_access` VALUES ('446','3','38');
INSERT INTO `ea_access` VALUES ('447','3','39');
INSERT INTO `ea_access` VALUES ('448','3','40');
INSERT INTO `ea_access` VALUES ('449','3','41');
INSERT INTO `ea_access` VALUES ('450','3','42');
INSERT INTO `ea_access` VALUES ('451','3','43');
INSERT INTO `ea_access` VALUES ('452','3','44');
INSERT INTO `ea_access` VALUES ('453','3','45');
INSERT INTO `ea_access` VALUES ('454','3','46');
INSERT INTO `ea_access` VALUES ('455','3','47');
INSERT INTO `ea_access` VALUES ('456','3','61');
INSERT INTO `ea_access` VALUES ('457','3','48');
INSERT INTO `ea_access` VALUES ('458','3','49');
INSERT INTO `ea_access` VALUES ('459','3','50');
INSERT INTO `ea_access` VALUES ('460','3','51');
INSERT INTO `ea_access` VALUES ('461','3','52');
INSERT INTO `ea_access` VALUES ('462','3','53');
INSERT INTO `ea_access` VALUES ('463','3','54');
INSERT INTO `ea_access` VALUES ('464','3','55');
INSERT INTO `ea_access` VALUES ('465','3','56');
INSERT INTO `ea_access` VALUES ('466','3','57');
INSERT INTO `ea_access` VALUES ('467','3','58');
INSERT INTO `ea_access` VALUES ('468','3','59');
INSERT INTO `ea_access` VALUES ('469','3','60');

# 数据表：ea_admin 数据信息

INSERT INTO `ea_admin` VALUES ('1','1','mahuan1768@126.com','87c7878186c7f6ddd2f63a6d8396a787','','超级管理员','1','1','1425367195','1424350568','1424350568');
INSERT INTO `ea_admin` VALUES ('2','2','793298197@qq.com','87c7878186c7f6ddd2f63a6d8396a787','','','0','1','1424432505','1424351724','1424413688');

# 数据表：ea_field 数据信息

INSERT INTO `ea_field` VALUES ('17','6','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1424429858','1424429858');
INSERT INTO `ea_field` VALUES ('18','6','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1424429858','1424429858');
INSERT INTO `ea_field` VALUES ('19','6','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1424429858','1424429858');
INSERT INTO `ea_field` VALUES ('20','6','img_name','图片名称','VARCHAR','255','','1','0','0','0','1','','','both','0','','','1424429950','1424429950');
INSERT INTO `ea_field` VALUES ('21','6','img_url','上传图片','LONGTEXT','','','0','0','0','0','1','','','both','0','','','1424430027','1424430027');
INSERT INTO `ea_field` VALUES ('22','7','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1424765385','1424765385');
INSERT INTO `ea_field` VALUES ('23','7','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1424765385','1424765385');
INSERT INTO `ea_field` VALUES ('24','7','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1424765385','1424765385');
INSERT INTO `ea_field` VALUES ('25','7','img_url','上传图片','VARCHAR','255','','0','0','0','0','1','','','both','0','','','1424765510','1424765617');
INSERT INTO `ea_field` VALUES ('26','7','img_name','图片名称','VARCHAR','255','','0','0','0','0','1','','','both','0','','','1424765572','1424765572');
INSERT INTO `ea_field` VALUES ('27','8','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1425223599','1425223599');
INSERT INTO `ea_field` VALUES ('28','8','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1425223599','1425223599');
INSERT INTO `ea_field` VALUES ('29','8','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1425223599','1425223599');
INSERT INTO `ea_field` VALUES ('30','8','introduce_text','介绍内容','LONGTEXT','','','0','0','0','0','1','','','both','0','','','1425223674','1425223674');
INSERT INTO `ea_field` VALUES ('31','9','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1425350760','1425350760');
INSERT INTO `ea_field` VALUES ('32','9','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1425350760','1425350760');
INSERT INTO `ea_field` VALUES ('33','9','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1425350760','1425350760');
INSERT INTO `ea_field` VALUES ('34','9','title','文章标题','VARCHAR','255','','0','0','0','0','1','','','both','0','','','1425350821','1425350821');
INSERT INTO `ea_field` VALUES ('35','9','img_url','文章图片','VARCHAR','255','','0','0','0','0','1','','','both','0','','','1425350868','1425350868');
INSERT INTO `ea_field` VALUES ('36','10','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1425367372','1425367372');
INSERT INTO `ea_field` VALUES ('37','10','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1425367372','1425367372');
INSERT INTO `ea_field` VALUES ('38','10','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1425367372','1425367372');
INSERT INTO `ea_field` VALUES ('39','10','img_url','图片名称','VARCHAR','255','','0','0','0','0','1','','','both','0','','','1425368380','1425368380');
INSERT INTO `ea_field` VALUES ('40','10','context','文章内容','LONGTEXT','','','0','0','0','0','1','','','both','0','','','1425368495','1425368495');

# 数据表：ea_happy_article 数据信息

INSERT INTO `ea_happy_article` VALUES ('1','1425368529','1425368529','Public/uploads/HappyArticle/54f565d1bb55f.png','<p>
	文章内容<span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,<span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span></span>
</p>
<p>
	<span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span></span>
</p>
<p>
	<span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span></span>
</p>
<p>
	<span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容</span><span>文章内容,</span></span>
</p>');

# 数据表：ea_happy_see 数据信息

INSERT INTO `ea_happy_see` VALUES ('1','1425350934','1425350934','雅虎剥离阿里巴巴15%股份，是如何操作的？','Public/uploads/HappySee/54f521168e1aa.png');
INSERT INTO `ea_happy_see` VALUES ('2','1425350954','1425350954','雅虎剥离阿里巴巴15%股份，是如何操作的？','Public/uploads/HappySee/54f5212a810b6.png');
INSERT INTO `ea_happy_see` VALUES ('3','1425350962','1425350962','雅虎剥离阿里巴巴15%股份，是如何操作的？','Public/uploads/HappySee/54f5213226d1d.png');
INSERT INTO `ea_happy_see` VALUES ('4','1425350968','1425350968','雅虎剥离阿里巴巴15%股份，是如何操作的？','Public/uploads/HappySee/54f521386dc71.png');

# 数据表：ea_home_img 数据信息

INSERT INTO `ea_home_img` VALUES ('1','1424430068','1424430068','第一张','Public/uploads/HomeImg/54e713f486e09.png');
INSERT INTO `ea_home_img` VALUES ('2','1424430490','1424430490','第二章','Public/uploads/HomeImg/54e7159a9e2f2.png');
INSERT INTO `ea_home_img` VALUES ('3','1424430500','1424433704','第三章','Public/uploads/HomeImg/54e72228f20e6.png');

# 数据表：ea_home_introduce 数据信息

INSERT INTO `ea_home_introduce` VALUES ('1','1425223827','1425223827','<p style="text-align:center;">
	0.5毫米的包装<span>0.5毫米的包装<span>0.5毫米的包装，<span>0.5毫米的包装，<span>0.5毫米的包装，<span>0.5毫米的包装，<span>0.5毫米的包装，<span>0.5毫米的包装，</span></span></span></span></span></span></span>
</p>
<p style="text-align:center;">
	<span><span>0.5毫米的包装</span><span>0.5毫米的包装0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，</span></span>
</p>
<p style="text-align:center;">
	<span><span>0.5毫米的包装</span><span>0.5毫米的包装0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，0.5毫米的包装，</span><br />
</span>
</p>');

# 数据表：ea_input 数据信息

INSERT INTO `ea_input` VALUES ('2','20','1','图片名称','图片名称','text','20','0','','','all','<input type='text' class='input' size='20' name='homeimg[img_name]' value='' />','1','1424429950','1424429950');
INSERT INTO `ea_input` VALUES ('3','21','1','上传图片','上传图片','file','10','0','','','all','<input type='file' name='img_url' class='' />','1','1424430027','1424430027');
INSERT INTO `ea_input` VALUES ('4','25','1','上传图片','上传产品图片','file','10','0','','','all','<input type='file' name='img_url' class='' />','2','1424765510','1424765617');
INSERT INTO `ea_input` VALUES ('5','26','1','图片名称','图片名称','text','20','0','','','all','<input type='text' class='input' size='20' name='produceimg[img_name]' value='' />','1','1424765572','1424765572');
INSERT INTO `ea_input` VALUES ('6','30','1','介绍内容','介绍内容','editor','84','12','','','all','<textarea name='homeintroduce[introduce_text]' id='RFAd47Z4' rows='12' cols='84' >介绍内容</textarea><script type='text/javascript'>$(function(){KindEditor.ready(function(K) {K.create('#RFAd47Z4',{resizeType:1,afterBlur:function(){this.sync();}});});});</script>','1','1425223674','1425223674');
INSERT INTO `ea_input` VALUES ('7','34','1','文章标题','文章标题','text','20','0','','','all','<input type='text' class='input' size='20' name='happysee[title]' value='' />','1','1425350821','1425350821');
INSERT INTO `ea_input` VALUES ('8','35','1','文章图片','文章图片','file','5','0','','','all','<input type='file' name='img_url' class='' />','1','1425350868','1425350868');
INSERT INTO `ea_input` VALUES ('9','39','1','图片名称','图片名称','file','5','0','','','all','<input type='file' name='img_url' class='' />','1','1425368380','1425368380');
INSERT INTO `ea_input` VALUES ('10','40','1','文章内容','文章内容','editor','84','12','','','all','<textarea name='happyarticle[context]' id='Ht9LAPUe' rows='12' cols='84' >文章内容</textarea><script type='text/javascript'>$(function(){KindEditor.ready(function(K) {K.create('#Ht9LAPUe',{resizeType:1,afterBlur:function(){this.sync();}});});});</script>','1','1425368495','1425368495');

# 数据表：ea_model 数据信息

INSERT INTO `ea_model` VALUES ('6','首页图片','ea_home_img','首页图片','0','1','InnoDB','','1424429857','1425367219');
INSERT INTO `ea_model` VALUES ('7','产品图片','ea_produce_img','产品图片','0','1','InnoDB','','1424765384','1425367270');
INSERT INTO `ea_model` VALUES ('8','首页文字','ea_home_introduce','首页文字','0','1','InnoDB','','1425223599','1425367234');
INSERT INTO `ea_model` VALUES ('9','喜闻乐见','ea_happy_see','喜闻乐见','0','1','InnoDB','','1425350760','1425350760');
INSERT INTO `ea_model` VALUES ('10','乐见文章','ea_happy_article','乐见文章','0','1','InnoDB','','1425367372','1425367372');

# 数据表：ea_node 数据信息

INSERT INTO `ea_node` VALUES ('1','0','Admin','后台管理','1','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('2','1','Index','首页','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('3','2','index','查看系统信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('4','2','editPassword','修改密码页面','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('5','2','updatePassword','更新密码','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('6','2','siteEdit','编辑站点信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('7','2','siteUpdate','更新站点信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('8','1','Cache','缓存管理','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('9','8','index','缓存文件列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('10','8','delete','删除缓存文件','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('11','1','Admins','管理员权限','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('12','11','index','查看管理员列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('13','11','add','添加管理员','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('14','11','create','创建管理员','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('15','11','edit','编辑管理员信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('16','11','update','更新管理员信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('17','1','Roles','角色管理','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('18','17','index','查看角色列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('19','17','add','添加角色','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('20','17','create','创建角色','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('21','17','edit','编辑角色信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('22','17','update','更新角色信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('23','17','assignAccess','编辑角色权限','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('24','17','doAssignAccess','更新角色权限','3','1','0','0');
INSERT INTO `ea_node` VALUES ('25','1','Nodes','节点管理','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('26','25','index','查看节点信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('27','25','toggleStatus','修改节点状态','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('28','1','Models','模型管理','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('29','28','index','查看模型列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('30','28','show','查看模型信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('31','28','add','添加模型','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('32','28','create','创建模型','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('33','28','edit','编辑模型信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('34','28','update','更新模型信息','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('35','28','delete','删除模型','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('36','28','checkModelName','检查模型名称','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('37','28','checkTblName','检查数据表名称','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('38','28','checkMenuName','检查菜单名称','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('39','1','Fields','字段管理','2','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('40','39','index','查看字段信息列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('41','39','add','添加字段','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('42','39','create','创建字段','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('43','39','edit','编辑字段','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('44','39','update','更新字段','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('45','39','delete','删除字段','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('46','39','checkFieldName','检查字段名称','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('47','39','checkFieldLabel','检查字段标签','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('48','1','Data','数据管理','2','1','1','1424350568');
INSERT INTO `ea_node` VALUES ('49','48','backup','查看数据备份列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('50','48','doBackup','处理数据备份','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('51','48','restore','查看SQL文件列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('52','48','doRestore','恢复SQL文件','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('53','48','deleteSqlFiles','删除SQL文件','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('54','48','zipSqlFiles','打包SQL文件为ZIP','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('55','48','zipList','查看ZIP文件列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('56','48','unzipFiles','解压ZIP文件','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('57','48','deleteZipFiles','删除ZIP文件','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('58','48','downloadFile','下载SQL、ZIP文件','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('59','48','optimize','查看可优化数据表列表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('60','48','doOptimize','优化数据表','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('61','39','toggleListShow','切换系统字段在数据列表中的显示','3','1','1424350568','1424350568');
INSERT INTO `ea_node` VALUES ('97','1','HomeImg','首页图片管理管理','2','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('98','97','index','首页图片管理管理','3','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('99','97','add','添加首页图片管理','3','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('100','97','create','创建首页图片管理','3','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('101','97','edit','编辑首页图片管理','3','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('102','97','update','更新首页图片管理','3','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('103','97','delete','删除首页图片管理','3','1','1424429858','1424429858');
INSERT INTO `ea_node` VALUES ('104','1','ProduceImg','产品图片管理管理','2','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('105','104','index','产品图片管理管理','3','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('106','104','add','添加产品图片管理','3','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('107','104','create','创建产品图片管理','3','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('108','104','edit','编辑产品图片管理','3','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('109','104','update','更新产品图片管理','3','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('110','104','delete','删除产品图片管理','3','1','1424765385','1424765385');
INSERT INTO `ea_node` VALUES ('111','1','HomeIntroduce','首页文字介绍管理','2','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('112','111','index','首页文字介绍管理','3','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('113','111','add','添加首页文字介绍','3','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('114','111','create','创建首页文字介绍','3','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('115','111','edit','编辑首页文字介绍','3','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('116','111','update','更新首页文字介绍','3','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('117','111','delete','删除首页文字介绍','3','1','1425223599','1425223599');
INSERT INTO `ea_node` VALUES ('118','1','HappySee','喜闻乐见管理','2','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('119','118','index','喜闻乐见管理','3','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('120','118','add','添加喜闻乐见','3','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('121','118','create','创建喜闻乐见','3','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('122','118','edit','编辑喜闻乐见','3','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('123','118','update','更新喜闻乐见','3','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('124','118','delete','删除喜闻乐见','3','1','1425350760','1425350760');
INSERT INTO `ea_node` VALUES ('125','1','HappyArticle','乐见文章管理','2','1','1425367372','1425367372');
INSERT INTO `ea_node` VALUES ('126','125','index','乐见文章管理','3','1','1425367372','1425367372');
INSERT INTO `ea_node` VALUES ('127','125','add','添加乐见文章','3','1','1425367372','1425367372');
INSERT INTO `ea_node` VALUES ('128','125','create','创建乐见文章','3','1','1425367372','1425367372');
INSERT INTO `ea_node` VALUES ('129','125','edit','编辑乐见文章','3','1','1425367372','1425367372');
INSERT INTO `ea_node` VALUES ('130','125','update','更新乐见文章','3','1','1425367372','1425367372');
INSERT INTO `ea_node` VALUES ('131','125','delete','删除乐见文章','3','1','1425367372','1425367372');

# 数据表：ea_produce_img 数据信息

INSERT INTO `ea_produce_img` VALUES ('1','1425309490','1425344227','Public/uploads/ProduceImg/54f506e38d792.png','第一张');
INSERT INTO `ea_produce_img` VALUES ('2','1425309538','1425344130','Public/uploads/ProduceImg/54f50682b4f46.png','第二张');

# 数据表：ea_role 数据信息

INSERT INTO `ea_role` VALUES ('1','0','超级管理员','系统内置超级管理员组，不受权限分配账号限制','1','1424350568','1424350742');
INSERT INTO `ea_role` VALUES ('2','1','普通员工','','1','1424350785','1424350785');
INSERT INTO `ea_role` VALUES ('3','1','范德萨撒范德萨发','','1','1424351629','1424351629');

# 数据表：ea_role_admin 数据信息

INSERT INTO `ea_role_admin` VALUES ('1','1');
INSERT INTO `ea_role_admin` VALUES ('2','2');

# 数据表：fdsf 数据信息
# 没有数据记录

