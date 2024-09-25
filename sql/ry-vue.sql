/*
 Navicat MySQL Data Transfer

 Source Server         : ry-vue
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 20/09/2024 22:39:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'sys_products', '商品表', NULL, NULL, 'SysProducts', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'products', '商品', 'ruoyi', '0', '/', '{}', 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (72, 4, 'id', '商品ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (73, 4, 'name', '商品名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (74, 4, 'internal_name', '商品内部名称以及发货名称', 'varchar(255)', 'String', 'internalName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (75, 4, 'category_id', '商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 ', 'int', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_product_type', 4, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (76, 4, 'commodity_ownership', '商品归属', 'varchar(255)', 'String', 'commodityOwnership', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (77, 4, 'domain_name', '链接广告域名', 'varchar(100)', 'String', 'domainName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (78, 4, 'cost_price', '采购价格', 'decimal(10,2)', 'BigDecimal', 'costPrice', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (79, 4, 'purchasing_links', '采购链接', 'varchar(100)', 'String', 'purchasingLinks', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (80, 4, 'description', '商品描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 9, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (81, 4, 'main_image', '主图', 'varchar(255)', 'String', 'mainImage', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 10, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (82, 4, 'images', '其他图片，JSON格式存储', 'text', 'String', 'images', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 11, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (83, 4, 'status', '商品状态（1：上架，0：下架）', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (84, 4, 'created_at', '创建时间', 'timestamp', 'Date', 'createdAt', '0', '0', '0', '0', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (85, 4, 'is_deleted', '是否删除', 'tinyint(1)', 'Integer', 'isDeleted', '0', '0', '1', '0', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');
INSERT INTO `gen_table_column` VALUES (86, 4, 'pixel_id', '像素ID', 'int', 'Long', 'pixelId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2024-09-17 09:39:16', '', '2024-09-17 10:13:39');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2024-09-11 22:57:03', 'admin', '2024-09-11 23:43:33', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '112324', 'Y', 'admin', '2024-09-11 22:57:03', 'admin', '2024-09-11 23:43:41', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-09-11 22:57:03', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-09-11 22:57:03', 'admin', '2024-09-11 23:41:47', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-09-11 22:57:03', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-09-11 22:57:03', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '渝合鑫', 0, '代高高', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-11 22:57:01', 'admin', '2024-09-11 23:36:12');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '重庆总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-11 22:57:01', 'admin', '2024-09-11 23:37:59');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '清洁用品', '1', 'sys_product_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:39:44', 'admin', '2024-09-16 13:39:54', ' 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_data` VALUES (101, 2, '居家百货', '2', 'sys_product_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:40:13', '', NULL, ' 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_data` VALUES (102, 3, '汽车用品', '3', 'sys_product_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:40:30', '', NULL, ' 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_data` VALUES (103, 4, '女装', '4', 'sys_product_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:41:59', '', NULL, ' 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_data` VALUES (104, 5, '美容美妆', '5', 'sys_product_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:42:14', '', NULL, ' 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_data` VALUES (105, 6, '饰品包包', '6', 'sys_product_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:42:36', '', NULL, ' 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_data` VALUES (106, 1, '宅配配送', '1', 'sys_product_logistics', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:43:50', '', NULL, '1宅配配送 2：7-11商超  3全家商超');
INSERT INTO `sys_dict_data` VALUES (107, 2, '7-11商超', '2', 'sys_product_logistics', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:44:04', '', NULL, '1宅配配送 2：7-11商超  3全家商超');
INSERT INTO `sys_dict_data` VALUES (108, 3, '全家商超', '3', 'sys_product_logistics', NULL, 'default', 'N', '0', 'admin', '2024-09-16 13:44:27', '', NULL, '1宅配配送 2：7-11商超  3全家商超');
INSERT INTO `sys_dict_data` VALUES (109, 1, '普通发货', '1', 'sys_shipping_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 22:46:07', '', NULL, '用户发货类型 1普通发货 2私密发货');
INSERT INTO `sys_dict_data` VALUES (110, 2, '私密发货', '2', 'sys_shipping_type', NULL, 'default', 'N', '0', 'admin', '2024-09-16 22:46:18', '', NULL, '用户发货类型 1普通发货 2私密发货2');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-09-11 22:57:02', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '商品类型', 'sys_product_type', '0', 'admin', '2024-09-16 11:40:16', 'admin', '2024-09-16 13:39:19', '商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包');
INSERT INTO `sys_dict_type` VALUES (101, '配送方式', 'sys_product_logistics', '0', 'admin', '2024-09-16 11:56:19', 'admin', '2024-09-16 13:36:34', '物流配送方式：1宅配配送 2 7-11商超配送  3全家商超');
INSERT INTO `sys_dict_type` VALUES (102, '发货类型', 'sys_shipping_type', '0', 'admin', '2024-09-16 22:45:28', '', NULL, '用户快递发货类型 1：普通发货 2：私密发货');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-09-11 22:57:03', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-09-11 22:57:03', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-09-11 22:57:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:01:49');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-11 23:42:10');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:42:12');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-11 23:42:16');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-11 23:42:21');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:42:25');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-11 23:42:44');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:42:47');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-11 23:42:51');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-11 23:42:54');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-11 23:43:00');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:43:04');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-11 23:43:46');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:43:47');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-15 14:56:10');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-15 16:40:31');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-15 23:58:42');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 00:35:26');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 11:25:20');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 13:36:02');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 13:54:52');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 19:27:19');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 21:47:59');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 22:27:02');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-16 23:20:19');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 09:00:43');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 09:37:35');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 11:07:28');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 16:20:27');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-17 16:39:00');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 16:39:02');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-17 23:09:51');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-20 19:39:34');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2024 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-09-11 22:57:01', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-09-11 22:57:01', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-09-11 22:57:01', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '商品管理', 0, 4, 'product', 'system/products/index', '', '', 1, 0, 'C', '0', '0', 'system:products:list', 'guide', 'admin', '2024-09-11 22:57:01', 'admin', '2024-09-17 23:51:21', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-09-11 22:57:01', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-09-11 22:57:01', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-09-11 22:57:01', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-09-11 22:57:01', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-09-11 22:57:01', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-09-11 22:57:01', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-09-11 22:57:01', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-09-11 22:57:01', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-09-11 22:57:01', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-09-11 22:57:01', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-09-11 22:57:01', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-09-11 22:57:01', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-09-11 22:57:01', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-09-11 22:57:01', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-09-11 22:57:01', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-09-11 22:57:01', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-09-11 22:57:01', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-09-11 22:57:01', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-09-11 22:57:01', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-09-11 22:57:01', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '商品查询', 4, 7, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:products:query', '#', 'admin', '2024-09-16 14:01:26', 'admin', '2024-09-16 19:31:13', '');
INSERT INTO `sys_menu` VALUES (2019, '商品新增', 4, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:products:add', '#', 'admin', '2024-09-16 14:01:26', 'admin', '2024-09-16 19:30:34', '');
INSERT INTO `sys_menu` VALUES (2020, '商品修改', 4, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:products:edit', '#', 'admin', '2024-09-16 14:01:26', 'admin', '2024-09-16 19:30:42', '');
INSERT INTO `sys_menu` VALUES (2021, '商品删除', 4, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:products:remove', '#', 'admin', '2024-09-16 14:01:26', 'admin', '2024-09-16 19:30:50', '');
INSERT INTO `sys_menu` VALUES (2022, '商品导出', 4, 6, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:products:export', '#', 'admin', '2024-09-16 14:01:26', 'admin', '2024-09-16 19:30:57', '');
INSERT INTO `sys_menu` VALUES (2023, '新增商品', 4, 1, 'products', 'system/products/index', NULL, '', 1, 0, 'C', '0', '0', 'system:products:list', '#', 'admin', '2024-09-16 14:02:02', 'admin', '2024-09-17 23:50:04', '商品菜单');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-09-11 22:57:03', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-09-11 22:57:03', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"渝合鑫\",\"email\":\"ry@qq.com\",\"leader\":\"代高高\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:36:12', 21);
INSERT INTO `sys_oper_log` VALUES (101, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2024-09-11 23:36:18', 3);
INSERT INTO `sys_oper_log` VALUES (102, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:36:48', 11);
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:36:51', 11);
INSERT INTO `sys_oper_log` VALUES (104, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:36:53', 11);
INSERT INTO `sys_oper_log` VALUES (105, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:37:00', 10);
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:37:02', 9);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-09-11 23:37:04', 5);
INSERT INTO `sys_oper_log` VALUES (108, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:37:24', 23);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:37:29', 12);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:37:32', 9);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-09-11 23:37:35', 4);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-09-11 23:37:49', 4);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"重庆总公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"渝合鑫\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:37:59', 22);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:39:23', 18);
INSERT INTO `sys_oper_log` VALUES (115, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-09-11 22:57:03\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:41:47', 15);
INSERT INTO `sys_oper_log` VALUES (116, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":2,\"configKey\":\"sys.user.initPassword\",\"configName\":\"用户管理-账号初始密码\",\"configType\":\"Y\",\"configValue\":\"112324\",\"createBy\":\"admin\",\"createTime\":\"2024-09-11 22:57:03\",\"params\":{},\"remark\":\"初始化密码 123456\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:42:06', 10);
INSERT INTO `sys_oper_log` VALUES (117, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":2,\"configKey\":\"sys.user.initPassword\",\"configName\":\"用户管理-账号初始密码\",\"configType\":\"N\",\"configValue\":\"112324\",\"createBy\":\"admin\",\"createTime\":\"2024-09-11 22:57:03\",\"params\":{},\"remark\":\"初始化密码 123456\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-11 23:42:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:42:41', 10);
INSERT INTO `sys_oper_log` VALUES (118, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"createBy\":\"admin\",\"createTime\":\"2024-09-11 22:57:03\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:43:33', 11);
INSERT INTO `sys_oper_log` VALUES (119, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":2,\"configKey\":\"sys.user.initPassword\",\"configName\":\"用户管理-账号初始密码\",\"configType\":\"Y\",\"configValue\":\"112324\",\"createBy\":\"admin\",\"createTime\":\"2024-09-11 22:57:03\",\"params\":{},\"remark\":\"初始化密码 123456\",\"updateBy\":\"admin\",\"updateTime\":\"2024-09-11 23:42:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:43:41', 10);
INSERT INTO `sys_oper_log` VALUES (120, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-11 23:43:42', 5);
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-15 16:41:42', 23);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:07:00', 282);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:07:06', 144);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:10:42', 58);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-16 00:13:38', 68);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-16 00:13:41', 55);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2012', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:18:29', 12);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:18:33', 9);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/products/index\",\"createTime\":\"2024-09-16 00:14:28\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"products\",\"perms\":\"system:products:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:19:43', 18);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 00:10:42\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 00:10:42\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":3,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 00:10:42\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":4,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:21:07', 64);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:21:15', 65);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-16 00:21:19', 47);
INSERT INTO `sys_oper_log` VALUES (133, '商品', 1, 'com.ruoyi.system.controller.SysProductsController.add()', 'POST', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commentCount\":15,\"commodityOwnership\":15,\"costPrice\":13,\"createdAt\":\"2024-09-04\",\"deliveryMethod\":1,\"description\":\"zanwu \",\"domainName\":\"ok\",\"id\":1,\"images\":\"{q:q}\",\"internalName\":\"衣服\",\"isDeleted\":1,\"isHot\":1,\"isNew\":1,\"isRecommend\":1,\"mainImage\":\"/profile/upload/2024/09/16/屏幕截图 2024-07-28 200225_20240916003942A001.png,/profile/upload/2024/09/16/屏幕截图 2024-07-31 000900_20240916003942A002.png,/profile/upload/2024/09/16/屏幕截图 2024-07-28 203110_20240916003942A003.png\",\"name\":\"衣服\",\"params\":{},\"price\":99,\"purchasingLinks\":\"216\",\"salesCount\":13,\"skuId\":\"1\",\"volume\":15,\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:40:44', 130);
INSERT INTO `sys_oper_log` VALUES (134, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commentCount\":15,\"commodityOwnership\":15,\"costPrice\":13,\"createdAt\":\"2024-09-04\",\"deliveryMethod\":1,\"description\":\"zanwu \",\"domainName\":\"ok\",\"id\":1,\"images\":\"{q:q}\",\"internalName\":\"衣服\",\"isDeleted\":1,\"isHot\":1,\"isNew\":1,\"isRecommend\":1,\"mainImage\":\"/profile/upload/2024/09/16/屏幕截图 2024-07-28 200225_20240916003942A001.png,/profile/upload/2024/09/16/屏幕截图 2024-07-31 000900_20240916003942A002.png,/profile/upload/2024/09/16/屏幕截图 2024-07-28 203110_20240916003942A003.png\",\"name\":\"衣服\",\"params\":{},\"price\":99,\"purchasingLinks\":\"216\",\"salesCount\":13,\"skuId\":\"1\",\"status\":1,\"volume\":15,\"weight\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 00:41:05', 6);
INSERT INTO `sys_oper_log` VALUES (135, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"商品类型\",\"dictType\":\"sys_product_type\",\"params\":{},\"remark\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 11:40:16', 20);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 00:21:15\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 00:21:15\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":3,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 00:21:15\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":4,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"sys_product_type\",\"edit\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 11:43:20', 102);
INSERT INTO `sys_oper_log` VALUES (137, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"配送方式\",\"dictType\":\"sys_product_logistics\",\"params\":{},\"remark\":\"物流配送方式：1宅配配送 2 7-11商超配送  3黑猫配送\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 11:56:19', 9);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 11:43:20\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 11:43:20\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":3,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 11:43:20\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":4,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"sys_product_type\",\"edit\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 11:56:53', 61);
INSERT INTO `sys_oper_log` VALUES (139, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-09-16 11:56:19\",\"dictId\":101,\"dictName\":\"配送方式\",\"dictType\":\"sys_product_logistics\",\"params\":{},\"remark\":\"物流配送方式：1宅配配送 2 7-11商超配送  3全家商超\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:36:34', 19);
INSERT INTO `sys_oper_log` VALUES (140, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-09-16 11:40:16\",\"dictId\":100,\"dictName\":\"商品类型\",\"dictType\":\"sys_product_type\",\"params\":{},\"remark\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:39:19', 14);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"清洁用品\",\"dictSort\":0,\"dictType\":\"sys_product_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:39:45', 11);
INSERT INTO `sys_oper_log` VALUES (142, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-09-16 13:39:44\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"清洁用品\",\"dictSort\":1,\"dictType\":\"sys_product_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:39:54', 9);
INSERT INTO `sys_oper_log` VALUES (143, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"居家百货\",\"dictSort\":2,\"dictType\":\"sys_product_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:40:13', 9);
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"汽车用品\",\"dictSort\":3,\"dictType\":\"sys_product_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:40:30', 10);
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"女装\",\"dictSort\":4,\"dictType\":\"sys_product_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:41:59', 9);
INSERT INTO `sys_oper_log` VALUES (146, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"美容美妆\",\"dictSort\":5,\"dictType\":\"sys_product_type\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:42:14', 10);
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"饰品包包\",\"dictSort\":6,\"dictType\":\"sys_product_type\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"remark\":\" 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:42:36', 11);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"宅配配送\",\"dictSort\":1,\"dictType\":\"sys_product_logistics\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"1宅配配送 2：7-11商超  3全家商超\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:43:50', 9);
INSERT INTO `sys_oper_log` VALUES (149, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"7-11商超\",\"dictSort\":2,\"dictType\":\"sys_product_logistics\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"1宅配配送 2：7-11商超  3全家商超\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:44:04', 9);
INSERT INTO `sys_oper_log` VALUES (150, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"全家商超\",\"dictSort\":3,\"dictType\":\"sys_product_logistics\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\"1宅配配送 2：7-11商超  3全家商超\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:44:27', 11);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 11:56:53\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称（落地页商品名称：繁体）\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 11:56:53\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称（繁体）\",\"columnId\":3,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 11:56:53\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":4,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"sys_product', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:50:19', 56);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:50:24', 98);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-16 13:51:01', 341);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-09-11 22:57:01\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"商品管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"product\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 13:58:22', 16);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 13:50:24\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 13:50:24\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":3,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-16 13:50:24\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":4,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-16 00:06:59\",\"dictType\":\"sys_product_type\",\"edit\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 14:00:30', 66);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-16 14:00:43', 51);
INSERT INTO `sys_oper_log` VALUES (157, '商品', 3, 'com.ruoyi.system.controller.SysProductsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/products/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:29:11', 15);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-16 14:01:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"商品查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"#\",\"perms\":\"system:products:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:29:47', 19);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-16 14:01:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"商品新增\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":4,\"path\":\"#\",\"perms\":\"system:products:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:30:34', 10);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-16 14:01:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"商品修改\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":4,\"path\":\"#\",\"perms\":\"system:products:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:30:42', 9);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-16 14:01:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"商品删除\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":4,\"path\":\"#\",\"perms\":\"system:products:remove\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:30:50', 10);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-16 14:01:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"商品导出\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":4,\"path\":\"#\",\"perms\":\"system:products:export\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:30:57', 10);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-09-16 14:01:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"商品查询\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":4,\"path\":\"#\",\"perms\":\"system:products:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:31:13', 10);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/products/index\",\"createTime\":\"2024-09-16 14:02:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"新增商品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"products\",\"perms\":\"system:products:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 19:31:30', 9);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:27:21', 20);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:38:00', 80);
INSERT INTO `sys_oper_log` VALUES (167, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"发货类型\",\"dictType\":\"sys_shipping_type\",\"params\":{},\"remark\":\"用户快递发货类型 1：普通发货 2：私密发货\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:45:28', 11);
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通发货\",\"dictSort\":1,\"dictType\":\"sys_shipping_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"用户发货类型 1普通发货 2私密发货\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:46:07', 10);
INSERT INTO `sys_oper_log` VALUES (169, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"私密发货\",\"dictSort\":2,\"dictType\":\"sys_shipping_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"用户发货类型 1普通发货 2私密发货2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:46:18', 9);
INSERT INTO `sys_oper_log` VALUES (170, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否推荐\",\"dictType\":\"sys_is_recommend\",\"params\":{},\"remark\":\"推荐商品是商品主页几个主推产品\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:49:19', 9);
INSERT INTO `sys_oper_log` VALUES (171, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-16 22:49:50', 13);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 09:01:09', 23);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 09:37:42', 109);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 09:39:13', 10);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 09:39:16', 53);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":74,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":75,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 09:46:27', 49);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-17 09:46:39', 51);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 09:46:27\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 09:46:27\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":74,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 09:46:27\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":75,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"sys_product_type\",\"edit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 10:01:00', 30);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 10:01:04', 43);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-17 10:01:22', 40);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 10:01:04\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 10:01:04\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":74,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 10:01:04\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":75,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"sys_product_type\",\"edit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 10:08:06', 34);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_products\"}', NULL, 0, NULL, '2024-09-17 10:08:09', 35);
INSERT INTO `sys_oper_log` VALUES (183, '商品', 1, 'com.ruoyi.system.controller.SysProductsController.add()', 'POST', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":1,\"costPrice\":1,\"domainName\":\"1\",\"id\":1,\"internalName\":\"1\",\"isDeleted\":1,\"name\":\"1\",\"params\":{},\"purchasingLinks\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 10:12:34', 13);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"SysProducts\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"商品ID\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 10:08:06\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"商品名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 10:08:06\",\"usableColumn\":false},{\"capJavaField\":\"InternalName\",\"columnComment\":\"商品内部名称以及发货名称\",\"columnId\":74,\"columnName\":\"internal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"internalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-09-17 10:08:06\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 \",\"columnId\":75,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-17 09:39:16\",\"dictType\":\"sys_product_type\",\"edit', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 10:13:39', 26);
INSERT INTO `sys_oper_log` VALUES (185, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"1\",\"costPrice\":1,\"createdAt\":\"2024-09-17\",\"domainName\":\"1\",\"id\":1,\"images\":\"/profile/upload/2024/09/17/3_20240917111538A002.png\",\"internalName\":\"1\",\"isDeleted\":1,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917111536A001.png\",\"name\":\"1\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"1\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 11:15:40', 23);
INSERT INTO `sys_oper_log` VALUES (186, '商品', 1, 'com.ruoyi.system.controller.SysProductsController.add()', 'POST', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"commodityOwnership\":\"代建高\",\"costPrice\":1,\"description\":\"2131\",\"domainName\":\"1\",\"id\":2,\"images\":\"/profile/upload/2024/09/17/1_20240917112305A004.png\",\"internalName\":\"女包\",\"mainImage\":\"/profile/upload/2024/09/17/2_20240917112301A003.png\",\"name\":\"衣服\",\"params\":{},\"purchasingLinks\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 11:23:07', 13);
INSERT INTO `sys_oper_log` VALUES (187, '商品', 3, 'com.ruoyi.system.controller.SysProductsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/products/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 11:23:26', 7);
INSERT INTO `sys_oper_log` VALUES (188, '商品', 1, 'com.ruoyi.system.controller.SysProductsController.add()', 'POST', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"12\",\"domainName\":\"123\",\"id\":3,\"images\":\"/profile/upload/2024/09/17/1_20240917112453A008.png,/profile/upload/2024/09/17/2_20240917112453A009.png,/profile/upload/2024/09/17/3_20240917112453A010.png\",\"internalName\":\"洗衣机\",\"mainImage\":\"/profile/upload/2024/09/17/3_20240917112443A005.png,/profile/upload/2024/09/17/1_20240917112446A006.png,/profile/upload/2024/09/17/2_20240917112446A007.png\",\"name\":\"系一起\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 11:24:54', 11);
INSERT INTO `sys_oper_log` VALUES (189, '商品', 3, 'com.ruoyi.system.controller.SysProductsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/products/2,3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 11:26:37', 7);
INSERT INTO `sys_oper_log` VALUES (190, '商品', 1, 'com.ruoyi.system.controller.SysProductsController.add()', 'POST', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"name\":\"12\",\"params\":{},\"purchasingLinks\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 11:27:37', 6);
INSERT INTO `sys_oper_log` VALUES (191, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"params\":{},\"status\":0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-17 12:28:02', 2);
INSERT INTO `sys_oper_log` VALUES (192, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"params\":{},\"status\":0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-17 12:28:05', 3);
INSERT INTO `sys_oper_log` VALUES (193, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"params\":{},\"status\":0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-17 12:28:38', 2);
INSERT INTO `sys_oper_log` VALUES (194, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"params\":{},\"status\":0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-17 12:28:48', 2);
INSERT INTO `sys_oper_log` VALUES (195, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"params\":{},\"status\":0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-17 12:29:52', 1);
INSERT INTO `sys_oper_log` VALUES (196, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:29:55', 6);
INSERT INTO `sys_oper_log` VALUES (197, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:29:57', 6);
INSERT INTO `sys_oper_log` VALUES (198, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:29:59', 7);
INSERT INTO `sys_oper_log` VALUES (199, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:30:27', 6);
INSERT INTO `sys_oper_log` VALUES (200, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:30:55', 11);
INSERT INTO `sys_oper_log` VALUES (201, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:31:00', 6);
INSERT INTO `sys_oper_log` VALUES (202, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:31:02', 9);
INSERT INTO `sys_oper_log` VALUES (203, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:33:20', 6);
INSERT INTO `sys_oper_log` VALUES (204, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:33:22', 6);
INSERT INTO `sys_oper_log` VALUES (205, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:33:23', 8);
INSERT INTO `sys_oper_log` VALUES (206, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:36:28', 8);
INSERT INTO `sys_oper_log` VALUES (207, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:38:14', 7);
INSERT INTO `sys_oper_log` VALUES (208, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:38:22', 7);
INSERT INTO `sys_oper_log` VALUES (209, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:38:55', 6);
INSERT INTO `sys_oper_log` VALUES (210, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:38:56', 7);
INSERT INTO `sys_oper_log` VALUES (211, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:38:58', 2);
INSERT INTO `sys_oper_log` VALUES (212, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:39:01', 6);
INSERT INTO `sys_oper_log` VALUES (213, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:39:59', 3);
INSERT INTO `sys_oper_log` VALUES (214, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:40:00', 6);
INSERT INTO `sys_oper_log` VALUES (215, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:40:09', 3);
INSERT INTO `sys_oper_log` VALUES (216, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:40:23', 6);
INSERT INTO `sys_oper_log` VALUES (217, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:40:25', 3);
INSERT INTO `sys_oper_log` VALUES (218, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:49:40', 5);
INSERT INTO `sys_oper_log` VALUES (219, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:49:42', 11);
INSERT INTO `sys_oper_log` VALUES (220, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:50:11', 5);
INSERT INTO `sys_oper_log` VALUES (221, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:53:58', 7);
INSERT INTO `sys_oper_log` VALUES (222, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:54:00', 7);
INSERT INTO `sys_oper_log` VALUES (223, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:54:45', 6);
INSERT INTO `sys_oper_log` VALUES (224, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:58:23', 7);
INSERT INTO `sys_oper_log` VALUES (225, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:59:12', 6);
INSERT INTO `sys_oper_log` VALUES (226, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 12:59:14', 6);
INSERT INTO `sys_oper_log` VALUES (227, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 13:00:01', 5);
INSERT INTO `sys_oper_log` VALUES (228, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 13:00:19', 7);
INSERT INTO `sys_oper_log` VALUES (229, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123\",\"costPrice\":123,\"createdAt\":\"2024-09-17\",\"description\":\"123\",\"domainName\":\"123\",\"id\":4,\"internalName\":\"123\",\"isDeleted\":0,\"name\":\"12\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"123\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 13:10:56', 7);
INSERT INTO `sys_oper_log` VALUES (230, '商品', 1, 'com.ruoyi.system.controller.SysProductsController.add()', 'POST', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/3_20240917132023A012.png,/profile/upload/2024/09/17/2_20240917132023A013.png\",\"internalName\":\"123123\",\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A014.png\",\"name\":\"3123\",\"params\":{},\"purchasingLinks\":\"312312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 13:20:49', 7);
INSERT INTO `sys_oper_log` VALUES (231, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/3_20240917132023A012.png,/profile/upload/2024/09/17/2_20240917132023A013.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A014.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 13:21:23', 7);
INSERT INTO `sys_oper_log` VALUES (232, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/3_20240917132023A012.png,/profile/upload/2024/09/17/2_20240917132023A013.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A014.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 16:20:31', 6);
INSERT INTO `sys_oper_log` VALUES (233, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/3_20240917132023A012.png,/profile/upload/2024/09/17/2_20240917132023A013.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A014.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 16:20:33', 6);
INSERT INTO `sys_oper_log` VALUES (234, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/3_20240917132023A012.png,/profile/upload/2024/09/17/2_20240917132023A013.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A014.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 16:22:26', 2);
INSERT INTO `sys_oper_log` VALUES (235, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/3_20240917132023A012.png,/profile/upload/2024/09/17/2_20240917132023A013.png,/profile/upload/2024/09/17/1 - 副本 (6)_20240917162853A035.png,/profile/upload/2024/09/17/1 - 副本_20240917162853A036.png,/profile/upload/2024/09/17/1 - 副本 (2)_20240917162853A031.png,/profile/upload/2024/09/17/1 - 副本 (3)_20240917162853A032.png,/profile/upload/2024/09/17/1 - 副本 (4)_20240917162853A034.png,/profile/upload/2024/09/17/1 - 副本 (5)_20240917162853A033.png,/profile/upload/2024/09/17/1_20240917162854A037.png,/profile/upload/2024/09/17/2 - 副本 (2)_20240917162854A038.png,/profile/upload/2024/09/17/2 - 副本 (3)_20240917162854A039.png,/profile/upload/2024/09/17/2 - 副本 (4)_20240917162854A040.png,/profile/upload/2024/09/17/2 - 副本 (5)_20240917162854A042.png,/profile/upload/2024/09/17/2 - 副本 (6)_20240917162854A041.png,/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2 - 副本_20240917162854A044.png,/profile/upload/2024/09/17/3 - 副本 (3)_20240917162854A045.png,/profile/upload/2024/09/17/3 - 副本 (4)_20240917162854A048.png,/profile/upload/2024/09/17/3 - 副本 (5)_20240917162854A047.png,/profile/upload/2024/09/17/3 - 副本 (2)_20240917162854A046.png,/profile/upload/2024/09/17/3 - 副本 (6)_20240917162854A049.png,/profile/upload/2024/09/17/3 - 副本_20240917162854A050.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (3)_20240917162854A051.jpg,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (2)_20240917162854A052.jpg,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg,/profile/upload/2024/09/17/3_20240917162854A054.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (5)_20240917162855A055.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A01', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 16:29:02', 6);
INSERT INTO `sys_oper_log` VALUES (236, '商品', 5, 'com.ruoyi.system.controller.SysProductsController.export()', 'POST', 1, 'admin', '研发部门', '/system/products/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-09-17 16:30:18', 812);
INSERT INTO `sys_oper_log` VALUES (237, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2 - 副本_20240917162854A044.png,/profile/upload/2024/09/17/3 - 副本 (3)_20240917162854A045.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg,/profile/upload/2024/09/17/3_20240917162854A054.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (5)_20240917162855A055.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/1_20240917132032A014.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 16:41:07', 7);
INSERT INTO `sys_oper_log` VALUES (238, '商品', 3, 'com.ruoyi.system.controller.SysProductsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/products/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 16:47:17', 5);
INSERT INTO `sys_oper_log` VALUES (239, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2 - 副本_20240917162854A044.png,/profile/upload/2024/09/17/3 - 副本 (3)_20240917162854A045.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg,/profile/upload/2024/09/17/3_20240917162854A054.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (5)_20240917162855A055.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:14:47', 17);
INSERT INTO `sys_oper_log` VALUES (240, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/1_20240917132023A011.png,/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2 - 副本_20240917162854A044.png,/profile/upload/2024/09/17/3 - 副本 (3)_20240917162854A045.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg,/profile/upload/2024/09/17/3_20240917162854A054.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (5)_20240917162855A055.jpg,/profile/upload/2024/09/17/2_20240917231613A006.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png,/profile/upload/2024/09/17/3_20240917231617A007.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:16:19', 9);
INSERT INTO `sys_oper_log` VALUES (241, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"123123\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg,/profile/upload/2024/09/17/3_20240917162854A054.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (5)_20240917162855A055.jpg,/profile/upload/2024/09/17/2_20240917231613A006.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png,/profile/upload/2024/09/17/3_20240917231617A007.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:22:57', 7);
INSERT INTO `sys_oper_log` VALUES (242, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:45:01', 9);
INSERT INTO `sys_oper_log` VALUES (243, '商品', 5, 'com.ruoyi.system.controller.SysProductsController.export()', 'POST', 1, 'admin', '研发部门', '/system/products/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-09-17 23:46:59', 616);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/products/index\",\"createTime\":\"2024-09-16 14:02:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"新增商品\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"products\",\"perms\":\"system:products:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:48:33', 17);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/products/index\",\"createTime\":\"2024-09-16 14:02:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"新增商品\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"products\",\"perms\":\"system:products:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:49:09', 10);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/products/index\",\"createTime\":\"2024-09-16 14:02:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"新增商品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":4,\"path\":\"products\",\"perms\":\"system:products:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:50:04', 11);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/products/index\",\"createTime\":\"2024-09-11 22:57:01\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":4,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"product\",\"perms\":\"system:products:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:51:21', 12);
INSERT INTO `sys_oper_log` VALUES (248, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:51:31', 9);
INSERT INTO `sys_oper_log` VALUES (249, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-17 23:51:33', 8);
INSERT INTO `sys_oper_log` VALUES (250, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-18 00:06:27', 4);
INSERT INTO `sys_oper_log` VALUES (251, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-18 00:11:58', 2);
INSERT INTO `sys_oper_log` VALUES (252, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"/profile/upload/2024/09/17/2_20240917162854A043.png,/profile/upload/2024/09/17/2024-09-14-21-36-53-1152x864 - 副本 (4)_20240917162854A053.jpg,/profile/upload/2024/09/18/1_20240918001343A008.png\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"/profile/upload/2024/09/17/2_20240917231445A005.png\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-18 00:13:44', 8);
INSERT INTO `sys_oper_log` VALUES (253, '商品', 2, 'com.ruoyi.system.controller.SysProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/products', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"commodityOwnership\":\"admin\",\"costPrice\":12312,\"createdAt\":\"2024-09-17\",\"description\":\"3123123\",\"domainName\":\"123123\",\"id\":5,\"images\":\"\",\"internalName\":\"123123\",\"isDeleted\":0,\"mainImage\":\"\",\"name\":\"3123\",\"params\":{},\"pixelId\":0,\"purchasingLinks\":\"312312\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-09-20 19:50:40', 16);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-09-11 22:57:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-09-11 22:57:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_products
-- ----------------------------
DROP TABLE IF EXISTS `sys_products`;
CREATE TABLE `sys_products`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `internal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品内部名称以及发货名称',
  `category_id` int NOT NULL COMMENT '商品分类ID 1清洁用品 2居家百货 3汽车用品 4女装 5美容美妆 6饰品包包 ',
  `commodity_ownership` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品归属',
  `domain_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接广告域名',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购价格',
  `purchasing_links` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '采购链接',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品描述',
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主图',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '其他图片，JSON格式存储',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品状态（1：下架，0：上架）',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `pixel_id` int NULL DEFAULT 0 COMMENT '像素ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_products
-- ----------------------------
INSERT INTO `sys_products` VALUES (5, '3123', '123123', 1, 'admin', '123123', 12312.00, '312312', '3123123', '', '', 0, '2024-09-17 00:00:00', 0, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-09-11 22:57:01', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2024-09-11 22:57:01', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-09-20 19:39:34', 'admin', '2024-09-11 22:57:01', '', '2024-09-20 19:39:34', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2024-09-11 22:57:01', 'admin', '2024-09-11 22:57:01', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
