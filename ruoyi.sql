/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-11-08 18:05:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for biz_city
-- ----------------------------
DROP TABLE IF EXISTS `biz_city`;
CREATE TABLE `biz_city` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_city
-- ----------------------------
INSERT INTO `biz_city` VALUES ('1', '南京', '1');
INSERT INTO `biz_city` VALUES ('2', '镇江', '1');

-- ----------------------------
-- Table structure for biz_merchant
-- ----------------------------
DROP TABLE IF EXISTS `biz_merchant`;
CREATE TABLE `biz_merchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bizName` varchar(255) DEFAULT NULL,
  `bizdesc` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `prodesc` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `rank` tinyint(4) DEFAULT NULL COMMENT '1-5',
  `provinceId` bigint(20) DEFAULT NULL,
  `city` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商家表';

-- ----------------------------
-- Records of biz_merchant
-- ----------------------------
INSERT INTO `biz_merchant` VALUES ('1', 'sj', 'nihao', 'sj', '小王', '1231312124', 'sdjflsdf.jsp', '1,2', '1', '1', '1', '2', '2018-11-06 22:34:21');
INSERT INTO `biz_merchant` VALUES ('3', 'aa', 'aaa', 'jsflj', 'sdf', '23434', 'sdjlfj.jpg', null, '4', '1', null, null, '2018-11-08 09:45:13');

-- ----------------------------
-- Table structure for biz_order
-- ----------------------------
DROP TABLE IF EXISTS `biz_order`;
CREATE TABLE `biz_order` (
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `userName` varchar(255) DEFAULT NULL COMMENT '客户名',
  `userPhone` varchar(255) DEFAULT NULL COMMENT '客户电话',
  `provinceId` int(11) DEFAULT NULL COMMENT '省份ID',
  `cityId` int(11) DEFAULT NULL COMMENT '城市',
  `merId` int(11) DEFAULT NULL COMMENT '商家',
  `projectId` int(11) DEFAULT NULL COMMENT '项目',
  `price` bigint(10) DEFAULT NULL COMMENT '价格',
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of biz_order
-- ----------------------------
INSERT INTO `biz_order` VALUES ('1', '小王', '134164', '1', '1', '1', '1', '3000', '2018-11-07 17:23:44');

-- ----------------------------
-- Table structure for biz_proj
-- ----------------------------
DROP TABLE IF EXISTS `biz_proj`;
CREATE TABLE `biz_proj` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `proName` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `price` bigint(10) DEFAULT NULL COMMENT '价格',
  `merId` int(11) DEFAULT NULL COMMENT '商家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='项目';

-- ----------------------------
-- Records of biz_proj
-- ----------------------------
INSERT INTO `biz_proj` VALUES ('1', '房屋除醛', '3000', '1');
INSERT INTO `biz_proj` VALUES ('2', '汽车除醛', '1000', '1');
INSERT INTO `biz_proj` VALUES ('3', 'aaa', '1000', '1');
INSERT INTO `biz_proj` VALUES ('4', 'aa1', '1223', '3');

-- ----------------------------
-- Table structure for biz_province
-- ----------------------------
DROP TABLE IF EXISTS `biz_province`;
CREATE TABLE `biz_province` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_province
-- ----------------------------
INSERT INTO `biz_province` VALUES ('1', '江苏');
INSERT INTO `biz_province` VALUES ('2', '安徽');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(500) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('24', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('25', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '0' COMMENT '计划执行错误策略（0默认 1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 08:51:46');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 10:51:03');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 11:07:01');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 11:38:55');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 12:52:16');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 13:38:41');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 13:40:15');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 13:42:45');
INSERT INTO `sys_logininfor` VALUES ('108', 'xumy', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 13:43:22');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 13:48:40');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 13:53:57');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:30:13');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-11-06 14:31:47');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:31:50');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 14:33:49');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:33:52');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 14:34:26');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:34:39');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:37:01');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 14:37:41');
INSERT INTO `sys_logininfor` VALUES ('120', 'ry', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-11-06 14:37:47');
INSERT INTO `sys_logininfor` VALUES ('121', 'ry', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，ry123', '2018-11-06 14:37:50');
INSERT INTO `sys_logininfor` VALUES ('122', 'xumy', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:37:59');
INSERT INTO `sys_logininfor` VALUES ('123', 'xumy', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 14:40:23');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:40:27');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，admin123', '2018-11-06 14:47:25');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-11-06 14:47:43');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误2次，admin123', '2018-11-06 14:47:46');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误3次，123456', '2018-11-06 14:47:52');
INSERT INTO `sys_logininfor` VALUES ('129', 'xumy', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-11-06 14:48:15');
INSERT INTO `sys_logininfor` VALUES ('130', 'xumy', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2018-11-06 14:48:21');
INSERT INTO `sys_logininfor` VALUES ('131', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:48:35');
INSERT INTO `sys_logininfor` VALUES ('132', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 14:57:13');
INSERT INTO `sys_logininfor` VALUES ('133', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 14:57:13');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误4次，admin123', '2018-11-06 14:57:21');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 14:57:33');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，admin123', '2018-11-06 15:00:08');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 15:00:15');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，admin123', '2018-11-06 15:02:08');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 15:02:44');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，admin123', '2018-11-06 15:09:58');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-11-06 15:10:01');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 15:10:08');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 15:18:35');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 15:20:08');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 15:21:52');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 20:47:40');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 23:17:42');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 23:19:02');
INSERT INTO `sys_logininfor` VALUES ('149', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 23:19:18');
INSERT INTO `sys_logininfor` VALUES ('150', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，xmy1234516', '2018-11-06 23:27:27');
INSERT INTO `sys_logininfor` VALUES ('151', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 23:27:38');
INSERT INTO `sys_logininfor` VALUES ('152', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 23:30:14');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 23:30:20');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-06 23:32:06');
INSERT INTO `sys_logininfor` VALUES ('155', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 23:32:20');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-06 23:37:10');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次，admin123', '2018-11-07 17:24:16');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-11-07 17:24:30');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 17:24:42');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-07 17:25:02');
INSERT INTO `sys_logininfor` VALUES ('161', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 17:25:14');
INSERT INTO `sys_logininfor` VALUES ('162', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-07 17:27:44');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 17:27:51');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-07 17:31:27');
INSERT INTO `sys_logininfor` VALUES ('165', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 17:31:36');
INSERT INTO `sys_logininfor` VALUES ('166', 'root', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-11-07 17:51:53');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 17:51:58');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:03:24');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:05:34');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:08:07');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:10:31');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:11:38');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:16:19');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 18:16:53');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 20:53:17');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 21:06:31');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 21:12:21');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 21:32:09');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 21:57:22');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-07 22:20:47');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-08 09:17:21');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-08 09:29:29');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-08 09:44:32');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-11-08 17:56:07');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '账号管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-11-06 11:43:15', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('113', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('114', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '重置密码', '100', '5', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色导出', '101', '4', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位导出', '104', '4', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典导出', '105', '4', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数导出', '106', '4', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '2', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '5', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '113', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成代码', '113', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '商户管理', '1', '1', '/module/merchant', 'C', '0', 'module:merchant:view', '#', 'admin', '2018-11-06 13:29:53', 'admin', '2018-11-06 13:30:27', '');
INSERT INTO `sys_menu` VALUES ('2001', '查询', '2000', '2', '#', 'F', '0', 'module:merchant:list', '#', 'admin', '2018-11-06 13:31:33', 'admin', '2018-11-06 13:34:01', '');
INSERT INTO `sys_menu` VALUES ('2002', '新增', '2000', '1', '#', 'F', '0', 'module:merchant:add', '#', 'admin', '2018-11-06 13:32:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '编辑', '2000', '3', '#', 'F', '0', 'module:merchant:edit', '#', 'admin', '2018-11-06 13:33:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '删除', '2000', '4', '#', 'F', '0', 'module:merchant:remove', '#', 'admin', '2018-11-06 13:33:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '用户管理', '1', '1', '/module/order', 'C', '0', 'module:order:view', '#', 'root', '2018-11-06 23:29:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '查', '2005', '1', '#', 'F', '0', 'module:order:list', '#', 'root', '2018-11-06 23:33:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '增', '2005', '2', '#', 'F', '0', 'module:order:add', '#', 'root', '2018-11-06 23:34:05', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '改', '2005', '3', '#', 'F', '0', 'module:order:edit', '#', 'root', '2018-11-06 23:34:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '删', '2005', '4', '#', 'F', '0', 'module:order:remove', '#', 'root', '2018-11-07 17:26:29', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '2', 'com.homk.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2018-11-06 11:41:25');
INSERT INTO `sys_oper_log` VALUES ('101', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005\"]}', '0', null, '2018-11-06 11:42:32');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '2', 'com.homk.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 11:43:15');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '3', 'com.homk.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/103', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-11-06 13:01:03');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '8', 'com.homk.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/biz_merchant', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-11-06 13:23:47');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"商户管理\"],\"url\":[\"/module/merchant\"],\"perms\":[\"module:merchant\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:29:53');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.homk.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"商户管理\"],\"url\":[\"/module/merchant\"],\"perms\":[\"module:merchant:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:30:28');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"perms\":[\"module:merchant:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:31:33');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"perms\":[\"module:merchant:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:32:14');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑\"],\"url\":[\"\"],\"perms\":[\"module:merchant:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:33:00');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"perms\":[\"module:merchant:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:33:48');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '2', 'com.homk.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"#\"],\"perms\":[\"module:merchant:list\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 13:34:02');
INSERT INTO `sys_oper_log` VALUES ('112', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-11-06 13:34:28');
INSERT INTO `sys_oper_log` VALUES ('113', '用户管理', '1', 'com.homk.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"loginName\":[\"xumy\"],\"userName\":[\"admin\"],\"password\":[\"123456\"],\"email\":[\"xmy770212572@163.com\"],\"phonenumber\":[\"18115605158\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2018-11-06 13:42:36');
INSERT INTO `sys_oper_log` VALUES ('114', '商家', '1', 'com.homk.project.module.merchant.controller.MerchantController.addSave()', '1', 'admin', '研发部门', '/module/merchant/add', '127.0.0.1', 'XX XX', '{\"bizdesc\":[\"sj\"],\"logo\":[\"sj\"],\"userName\":[\"sj\"],\"phone\":[\"1231312124\"],\"pic\":[\"sdjflsdf.jsp\"],\"prodesc\":[\"装潢\"],\"sort\":[\"1\"],\"rank\":[\"1\"],\"provinceId\":[\"1\"],\"city\":[\"2\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.homk.project.module.merchant.mapper.MerchantMapper.insertMerchant-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into biz_merchant    ( logo,    userName,    phone,    pic,    prodesc,    sort,    rank,    provinceId,    city )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; ]; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2018-11-06 13:55:17');
INSERT INTO `sys_oper_log` VALUES ('115', '商家', '1', 'com.homk.project.module.merchant.controller.MerchantController.addSave()', '1', 'admin', '研发部门', '/module/merchant/add', '127.0.0.1', 'XX XX', '{\"bizdesc\":[\"sj\"],\"logo\":[\"sj\"],\"userName\":[\"sj\"],\"phone\":[\"1231312124\"],\"pic\":[\"sdjflsdf.jsp\"],\"prodesc\":[\"装潢\"],\"sort\":[\"1\"],\"rank\":[\"1\"],\"provinceId\":[\"1\"],\"city\":[\"2\"]}', '0', null, '2018-11-06 13:57:26');
INSERT INTO `sys_oper_log` VALUES ('116', '角色管理', '1', 'com.homk.project.system.role.controller.RoleController.addSave()', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', 'XX XX', '{\"roleName\":[\"研发\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,1023,105,1024,1025,102', '0', null, '2018-11-06 14:32:40');
INSERT INTO `sys_oper_log` VALUES ('117', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004\"]}', '0', null, '2018-11-06 14:33:00');
INSERT INTO `sys_oper_log` VALUES ('118', '用户管理', '2', 'com.homk.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"admin\"],\"email\":[\"xmy770212572@163.com\"],\"phonenumber\":[\"18115605158\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"1\"]}', '0', null, '2018-11-06 14:33:24');
INSERT INTO `sys_oper_log` VALUES ('119', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004\"]}', '0', null, '2018-11-06 14:37:28');
INSERT INTO `sys_oper_log` VALUES ('120', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'xumy', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"研发\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,1023,', '0', null, '2018-11-06 14:39:12');
INSERT INTO `sys_oper_log` VALUES ('121', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'xumy', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"研发\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004\"]}', '0', null, '2018-11-06 14:40:00');
INSERT INTO `sys_oper_log` VALUES ('122', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"root\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004,2,109,1045,1046,1047,110,1048,1049,1050,1051,1052,1053,111,3,112,113,1054,105', '0', null, '2018-11-06 14:41:06');
INSERT INTO `sys_oper_log` VALUES ('123', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004\"]}', '0', null, '2018-11-06 14:41:19');
INSERT INTO `sys_oper_log` VALUES ('124', '用户管理', '2', 'com.homk.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"1\"]}', '0', null, '2018-11-06 14:41:40');
INSERT INTO `sys_oper_log` VALUES ('125', '用户管理', '2', 'com.homk.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"email\":[\"ry@qq.com\"],\"phonenumber\":[\"15666666666\"],\"sex\":[\"1\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"2\"]}', '0', null, '2018-11-06 14:42:05');
INSERT INTO `sys_oper_log` VALUES ('126', '用户管理', '2', 'com.homk.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"email\":[\"ry@qq.com\"],\"phonenumber\":[\"15666666666\"],\"sex\":[\"1\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '0', null, '2018-11-06 14:42:16');
INSERT INTO `sys_oper_log` VALUES ('127', '重置密码', '2', 'com.homk.project.system.user.controller.ProfileController.resetPwd()', '1', 'root', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', 'XX XX', '{\"userId\":[\"1\"],\"loginName\":[\"root\"],\"oldPassword\":[\"admin123\"],\"password\":[\"xmy123456\"],\"confirm\":[\"xmy123456\"]}', '0', null, '2018-11-06 14:45:50');
INSERT INTO `sys_oper_log` VALUES ('128', '重置密码', '2', 'com.homk.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/2', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-11-06 15:05:21');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '8', 'com.homk.project.tool.gen.controller.GenController.genCode()', '1', 'root', '研发部门', '/tool/gen/genCode/biz_order', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-11-06 23:22:27');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'root', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/module/order\"],\"perms\":[\"module:order:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 23:29:22');
INSERT INTO `sys_oper_log` VALUES ('131', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'root', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004,2005\"]}', '0', null, '2018-11-06 23:30:12');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'root', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"查\"],\"url\":[\"\"],\"perms\":[\"module:order:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 23:33:37');
INSERT INTO `sys_oper_log` VALUES ('133', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'root', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"增\"],\"url\":[\"\"],\"perms\":[\"module:order:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 23:34:05');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'root', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"改\"],\"url\":[\"\"],\"perms\":[\"module:order:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 23:34:45');
INSERT INTO `sys_oper_log` VALUES ('135', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'root', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"删\"],\"url\":[\"\"],\"perms\":[\"module:order:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-06 23:35:08');
INSERT INTO `sys_oper_log` VALUES ('136', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'root', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004,2005,2006,2007,2008\"]}', '0', null, '2018-11-06 23:35:30');
INSERT INTO `sys_oper_log` VALUES ('137', '菜单管理', '3', 'com.homk.project.system.menu.controller.MenuController.remove()', '1', 'root', '研发部门', '/system/menu/remove/2009', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-11-07 17:26:11');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '1', 'com.homk.project.system.menu.controller.MenuController.addSave()', '1', 'root', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"删\"],\"url\":[\"\"],\"perms\":[\"module:order:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-11-07 17:26:29');
INSERT INTO `sys_oper_log` VALUES ('139', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'root', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"root\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,2000,2001,2002,2003,2004,2005,2006,2007,2008,2010\"]}', '0', null, '2018-11-07 17:26:59');
INSERT INTO `sys_oper_log` VALUES ('140', '角色管理', '2', 'com.homk.project.system.role.controller.RoleController.editSave()', '1', 'root', '研发部门', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1004,2000,2001,2002,2003,2005,2006,2007,2008\"]}', '0', null, '2018-11-07 17:27:31');
INSERT INTO `sys_oper_log` VALUES ('141', '代码生成', '8', 'com.homk.project.tool.gen.controller.GenController.genCode()', '1', 'root', '研发部门', '/tool/gen/genCode/biz_proj', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-11-07 17:31:51');
INSERT INTO `sys_oper_log` VALUES ('142', '项目', '1', 'com.homk.project.module.proj.controller.ProjController.addSave()', '1', 'admin', '研发部门', '/module/proj/add', '127.0.0.1', 'XX XX', '{\"proName\":[\"aaa\"],\"price\":[\"1000\"]}', '0', null, '2018-11-07 22:21:16');
INSERT INTO `sys_oper_log` VALUES ('143', '商家', '1', 'com.homk.project.module.merchant.controller.MerchantController.addSave()', '1', 'admin', '研发部门', '/module/merchant/add', '127.0.0.1', 'XX XX', '{\"desc\":[\"bbb\",\"bbb\"],\"logo\":[\"sjlfjsd\"],\"userName\":[\"12324\"],\"phone\":[\"24234324\"],\"pic\":[\"jpg\"],\"prodesc\":[\"\"],\"sort\":[\"2\"],\"rank\":[\"4\"],\"provinceId\":[\"1\"],\"city\":[\"1\"]}', '0', null, '2018-11-08 09:31:16');
INSERT INTO `sys_oper_log` VALUES ('144', '商家', '3', 'com.homk.project.module.merchant.controller.MerchantController.remove()', '1', 'admin', '研发部门', '/module/merchant/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2018-11-08 09:44:41');
INSERT INTO `sys_oper_log` VALUES ('145', '商家', '1', 'com.homk.project.module.merchant.controller.MerchantController.addSave()', '1', 'admin', '研发部门', '/module/merchant/add', '127.0.0.1', 'XX XX', '{\"bizName\":[\"aa\"],\"desc\":[\"aaa\"],\"logo\":[\"jsflj\"],\"userName\":[\"sdf\"],\"phone\":[\"23434\"],\"pic\":[\"sdjlfj.jpg\"],\"sort\":[\"4\"],\"rank\":[\"1\"],\"provinceId\":[\"\"],\"city\":[\"\"]}', '0', null, '2018-11-08 09:45:13');
INSERT INTO `sys_oper_log` VALUES ('146', '项目', '1', 'com.homk.project.module.proj.controller.ProjController.addSave()', '1', 'admin', '研发部门', '/module/proj/add', '127.0.0.1', 'XX XX', '{\"proName\":[\"aa1\"],\"price\":[\"1223\"]}', '0', null, '2018-11-08 09:45:35');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'root', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-11-06 14:41:06', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'root', '2018-11-07 17:27:31', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '管理员', 'root', '3', '1', '0', '0', 'admin', '2018-11-06 14:32:40', 'root', '2018-11-07 17:26:59', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '2002');
INSERT INTO `sys_role_menu` VALUES ('1', '2003');
INSERT INTO `sys_role_menu` VALUES ('1', '2004');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2001');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');
INSERT INTO `sys_role_menu` VALUES ('2', '2003');
INSERT INTO `sys_role_menu` VALUES ('2', '2005');
INSERT INTO `sys_role_menu` VALUES ('2', '2006');
INSERT INTO `sys_role_menu` VALUES ('2', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '2008');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '1000');
INSERT INTO `sys_role_menu` VALUES ('100', '1001');
INSERT INTO `sys_role_menu` VALUES ('100', '1002');
INSERT INTO `sys_role_menu` VALUES ('100', '1003');
INSERT INTO `sys_role_menu` VALUES ('100', '1004');
INSERT INTO `sys_role_menu` VALUES ('100', '1005');
INSERT INTO `sys_role_menu` VALUES ('100', '2000');
INSERT INTO `sys_role_menu` VALUES ('100', '2001');
INSERT INTO `sys_role_menu` VALUES ('100', '2002');
INSERT INTO `sys_role_menu` VALUES ('100', '2003');
INSERT INTO `sys_role_menu` VALUES ('100', '2004');
INSERT INTO `sys_role_menu` VALUES ('100', '2005');
INSERT INTO `sys_role_menu` VALUES ('100', '2006');
INSERT INTO `sys_role_menu` VALUES ('100', '2007');
INSERT INTO `sys_role_menu` VALUES ('100', '2008');
INSERT INTO `sys_role_menu` VALUES ('100', '2010');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT '105' COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'root', '徐某人', '00', 'ry@163.com', '15888888888', '1', '', '2089e79d9687b4a078d5c2e150e1e5a7', '1840db', '0', '0', '127.0.0.1', '2018-11-07 17:31:36', 'admin', '2018-03-16 11:33:00', 'ry', '2018-11-07 17:31:36', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2018-11-06 14:42:16', '测试员');
INSERT INTO `sys_user` VALUES ('100', '103', 'admin', 'admin', '00', 'xmy770212572@163.com', '18115605158', '0', '', '2b425350fdfe9813c39e10c3dc3f293a', '09f8b5', '0', '0', '127.0.0.1', '2018-11-08 17:56:07', 'admin', '2018-11-06 13:42:36', 'admin', '2018-11-08 17:56:07', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('46dbffa7-5f3a-4e57-9d7b-926f7da5dcac', 'admin', '研发部门', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', 'on_line', '2018-11-08 17:55:55', '2018-11-08 17:58:22', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('100', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '100');

-- ----------------------------
-- Table structure for sys_uuu
-- ----------------------------
DROP TABLE IF EXISTS `sys_uuu`;
CREATE TABLE `sys_uuu` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_uuu
-- ----------------------------
