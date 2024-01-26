/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.100.133
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : 192.168.100.133:32023
 Source Schema         : dinky

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 18/01/2024 17:19:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dinky_alert_group
-- ----------------------------
DROP TABLE IF EXISTS `dinky_alert_group`;
CREATE TABLE `dinky_alert_group`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'alert group name',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `alert_instance_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Alert instance IDS',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'note',
  `enabled` tinyint NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alert_group_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Alert group' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_alert_group
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_alert_history
-- ----------------------------
DROP TABLE IF EXISTS `dinky_alert_history`;
CREATE TABLE `dinky_alert_history`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `alert_group_id` int NULL DEFAULT NULL COMMENT 'Alert group ID',
  `job_instance_id` int NULL DEFAULT NULL COMMENT 'job instance ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'alert title',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'content description',
  `status` int NULL DEFAULT NULL COMMENT 'alert status',
  `log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'log',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Alert history' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_alert_history
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_alert_instance
-- ----------------------------
DROP TABLE IF EXISTS `dinky_alert_instance`;
CREATE TABLE `dinky_alert_instance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'alert instance name',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'alert instance type such as: DingTalk,Wechat(Webhook,app) Feishu ,email',
  `params` json NULL COMMENT 'configuration',
  `enabled` tinyint NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alert_instance_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Alert instance' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_alert_instance
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_alert_rules
-- ----------------------------
DROP TABLE IF EXISTS `dinky_alert_rules`;
CREATE TABLE `dinky_alert_rules`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'rule name',
  `rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'specify rule',
  `template_id` int NULL DEFAULT NULL COMMENT 'template id',
  `rule_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'alert rule type',
  `trigger_conditions` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'trigger conditions',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'description',
  `enabled` tinyint NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'create user id',
  `updater` int NULL DEFAULT NULL COMMENT 'update user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_alert_rules
-- ----------------------------
INSERT INTO `dinky_alert_rules` VALUES (3, 'alert.rule.jobFail', '[{\"ruleKey\":\"jobStatus\",\"ruleOperator\":\"EQ\",\"ruleValue\":\"\'FAILED\'\",\"rulePriority\":\"1\"}]', 1, 'SYSTEM', ' or ', '', 1, '1970-01-01 00:00:00', '2023-11-22 17:03:44', NULL, NULL);
INSERT INTO `dinky_alert_rules` VALUES (4, 'alert.rule.getJobInfoFail', '[{\"ruleKey\":\"jobStatus\",\"ruleOperator\":\"EQ\",\"ruleValue\":\"\'UNKNOWN\'\",\"rulePriority\":\"1\"}]', 1, 'SYSTEM', ' or ', '', 1, '1970-01-01 00:00:00', '2023-11-22 17:03:44', NULL, NULL);
INSERT INTO `dinky_alert_rules` VALUES (5, 'alert.rule.jobRestart', '[{\"ruleKey\":\"jobStatus\",\"ruleOperator\":\"EQ\",\"ruleValue\":\"\'RESTARTING\'\",\"rulePriority\":\"1\"}]', 1, 'SYSTEM', ' or ', '', 1, '1970-01-01 00:00:00', '2023-11-22 17:03:44', NULL, NULL);
INSERT INTO `dinky_alert_rules` VALUES (6, 'alert.rule.checkpointFail', '[{\"ruleKey\":\"isCheckpointFailed\",\"ruleOperator\":\"EQ\",\"ruleValue\":\"true\"}]', 1, 'SYSTEM', ' or ', '', 1, '1970-01-01 00:00:00', '2023-11-22 17:03:44', NULL, NULL);
INSERT INTO `dinky_alert_rules` VALUES (7, 'alert.rule.jobRunException', '[{\"ruleKey\":\"isException\",\"ruleOperator\":\"EQ\",\"ruleValue\":\"true\"}]', 1, 'SYSTEM', ' or ', '', 1, '1970-01-01 00:00:00', '2023-11-22 17:03:44', NULL, NULL);

-- ----------------------------
-- Table structure for dinky_alert_template
-- ----------------------------
DROP TABLE IF EXISTS `dinky_alert_template`;
CREATE TABLE `dinky_alert_template`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET ucs2 COLLATE ucs2_general_ci NULL DEFAULT NULL COMMENT 'template name',
  `template_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'template content',
  `enabled` tinyint NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'create user id',
  `updater` int NULL DEFAULT NULL COMMENT 'update user id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_alert_template
-- ----------------------------
INSERT INTO `dinky_alert_template` VALUES (1, 'Default', '\r\n- **Job Name :** <font color=\'gray\'>${jobName}</font>\r\n- **Job Status :** <font color=\'red\'>${jobStatus}</font>\r\n- **Alert Time :** ${alertTime}\r\n- **Start Time :** ${jobStartTime}\r\n- **End Time :** ${jobEndTime}\r\n- **<font color=\'red\'>${errorMsg}</font>**\r\n[Go toTask Web](http://${taskUrl})\r\n', 1, '2023-12-25 12:05:01', '2023-12-25 12:05:01', NULL, NULL);

-- ----------------------------
-- Table structure for dinky_catalogue
-- ----------------------------
DROP TABLE IF EXISTS `dinky_catalogue`;
CREATE TABLE `dinky_catalogue`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `task_id` int NULL DEFAULT NULL COMMENT 'Job ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Job Name',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Job Type',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT 'parent ID',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is enable',
  `is_leaf` tinyint(1) NOT NULL COMMENT 'is leaf node',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `catalogue_un_idx1`(`name` ASC, `parent_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'catalogue' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_catalogue
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dinky_cluster`;
CREATE TABLE `dinky_cluster`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cluster instance name',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cluster instance alias',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cluster types',
  `hosts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'cluster hosts',
  `job_manager_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Job Manager Host',
  `history_job_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'version',
  `status` int NULL DEFAULT NULL COMMENT 'cluster status',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'note',
  `auto_registers` tinyint(1) NULL DEFAULT 0 COMMENT 'is auto registration',
  `cluster_configuration_id` int NULL DEFAULT NULL COMMENT 'cluster configuration id',
  `task_id` int NULL DEFAULT NULL COMMENT 'task ID',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cluster_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'cluster instance management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_cluster_configuration
-- ----------------------------
DROP TABLE IF EXISTS `dinky_cluster_configuration`;
CREATE TABLE `dinky_cluster_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cluster configuration name',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cluster type',
  `config_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'json of configuration',
  `is_available` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'is available',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'note',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cluster_configuration_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'cluster configuration management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_cluster_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_database
-- ----------------------------
DROP TABLE IF EXISTS `dinky_database`;
CREATE TABLE `dinky_database`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `ds_datasource_id` bigint NULL DEFAULT NULL COMMENT '数据中台数据源id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'database name',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Default' COMMENT 'database belong group name',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'database type',
  `connect_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'connect config ',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'note',
  `flink_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Flink configuration',
  `flink_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Flink template',
  `db_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'version，such as: 11g of oracle ，2.2.3 of hbase',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT 'heartbeat status',
  `health_time` datetime NULL DEFAULT NULL COMMENT 'last heartbeat time of trigger',
  `heartbeat_time` datetime NULL DEFAULT NULL COMMENT 'last heartbeat time',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `database_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'database management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_database
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_flink_document
-- ----------------------------
DROP TABLE IF EXISTS `dinky_flink_document`;
CREATE TABLE `dinky_flink_document`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'document category',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'document type',
  `subtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'document subtype',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'document name',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fill_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'fill value',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'document version such as:(flink1.12,flink1.13,flink1.14,flink1.15,flink1.16,flink1.17,flink1.18)',
  `like_num` int NULL DEFAULT 0 COMMENT 'like number',
  `enabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator user id',
  `updater` int NULL DEFAULT NULL COMMENT 'updater user id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'flink document management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_flink_document
-- ----------------------------
INSERT INTO `dinky_flink_document` VALUES (1, 'Variable', '优化参数', 'Batch/Streaming', 'set table.exec.async-lookup.buffer-capacity', '异步查找连接可以触发的最大异步操作的操作数。\r\nThe max number of async i/o operation that the async lookup join can trigger.', 'Set \'table.exec.async-lookup.buffer-capacity\'=\'100\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (2, 'Variable', '优化参数', 'Batch/Streaming', 'set table.exec.async-lookup.timeout', '异步操作完成的超时时间。\r\nThe async timeout for the asynchronous operation to complete.', 'Set \'table.exec.async-lookup.timeout\'=\'3 min\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (3, 'Variable', '优化参数', 'Batch', 'set table.exec.disabled-operators', '禁用指定operators，用逗号分隔\r\nMainly for testing. A comma-separated list of operator names, each name represents a kind of disabled operator. Operators that can be disabled include \"NestedLoopJoin\", \"ShuffleHashJoin\", \"BroadcastHashJoin\", \"SortMergeJoin\", \"HashAgg\", \"SortAgg\". By default no operator is disabled.', 'Set \'table.exec.disabled-operators\'=\'SortMergeJoin\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (4, 'Variable', '优化参数', 'Streaming', 'set table.exec.mini-batch.allow-latency', '最大等待时间可用于MiniBatch缓冲输入记录。 MiniBatch是用于缓冲输入记录以减少状态访问的优化。MiniBatch以允许的等待时间间隔以及达到最大缓冲记录数触发。注意：如果将table.exec.mini-batch.enabled设置为true，则其值必须大于零.', 'Set \'table.exec.mini-batch.allow-latency\'=\'-1 ms\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (5, 'Variable', '优化参数', 'Streaming', 'set table.exec.mini-batch.enabled', '指定是否启用MiniBatch优化。 MiniBatch是用于缓冲输入记录以减少状态访问的优化。默认情况下禁用此功能。 要启用此功能，用户应将此配置设置为true。注意：如果启用了mini batch 处理，则必须设置“ table.exec.mini-batch.allow-latency”和“ table.exec.mini-batch.size”.', 'Set \'table.exec.mini-batch.enabled\'=\'false\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (6, 'Variable', '优化参数', 'Streaming', 'set table.exec.mini-batch.size', '可以为MiniBatch缓冲最大输入记录数。 MiniBatch是用于缓冲输入记录以减少状态访问的优化。MiniBatch以允许的等待时间间隔以及达到最大缓冲记录数触发。 注意：MiniBatch当前仅适用于非窗口聚合。如果将table.exec.mini-batch.enabled设置为true，则其值必须为正.', 'Set \'table.exec.mini-batch.size\'=\'-1\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (7, 'Variable', '优化参数', 'Batch/Streaming', 'set table.exec.resource.default-parallelism', '设置所有Operator的默认并行度。\r\nSets default parallelism for all operators (such as aggregate, join, filter) to run with parallel instances. This config has a higher priority than parallelism of StreamExecutionEnvironment (actually, this config overrides the parallelism of StreamExecutionEnvironment). A value of -1 indicates that no default parallelism is set, then it will fallback to use the parallelism of StreamExecutionEnvironment.', 'Set \'table.exec.resource.default-parallelism\'=\'1\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (8, 'Variable', '优化参数', 'Batch/Streaming', 'set table.exec.sink.not-null-enforcer', '对表的NOT NULL列约束强制执行不能将空值插入到表中。Flink支持“error”（默认）和“drop”强制行为\r\nThe NOT NULL column constraint on a table enforces that null values can\'t be inserted into the table. Flink supports \'error\' (default) and \'drop\' enforcement behavior. By default, Flink will check values and throw runtime exception when null values writing into NOT NULL columns. Users can change the behavior to \'drop\' to silently drop such records without throwing exception.\r\nPossible values:\r\n\"ERROR\"\r\n\"DROP\"', 'Set \'table.exec.sink.not-null-enforcer\'=\'ERROR\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (9, 'Variable', '优化参数', 'Streaming', 'set table.exec.sink.upsert-materialize', '由于分布式系统中 Shuffle 导致 ChangeLog 数据混乱，Sink 接收到的数据可能不是全局 upsert 的顺序。因此，在 upsert sink 之前添加 upsert materialize 运算符。它接收上游的变更日志记录并为下游生成一个 upsert 视图。默认情况下，当唯一键出现分布式无序时，会添加具体化操作符。您也可以选择不实现（NONE）或强制实现（FORCE）。\r\nPossible values:\r\n\"NONE\"\r\n\"FORCE\"\r\n\"AUTO\"', 'Set \'table.exec.sink.upsert-materialize\'=\'AUTO\';', '1.14', 0, 1, '2022-01-20 15:00:00', '2022-01-20 15:00:00', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (10, 'Module', '建表语句', 'Other', 'create.table.kafka', 'kafka快速建表格式', 'CREATE TABLE Kafka_Table (\r\n  `event_time` TIMESTAMP(3) METADATA FROM \'timestamp\',\r\n  `partition` BIGINT METADATA VIRTUAL,\r\n  `offset` BIGINT METADATA VIRTUAL,\r\n  `user_id` BIGINT,\r\n  `item_id` BIGINT,\r\n  `behavior` STRING\r\n) WITH (\r\n  \'connector\' = \'kafka\',\r\n  \'topic\' = \'user_behavior\',\r\n  \'properties.bootstrap.servers\' = \'localhost:9092\',\r\n  \'properties.group.id\' = \'testGroup\',\r\n  \'scan.startup.mode\' = \'earliest-offset\',\r\n  \'format\' = \'csv\'\r\n);\r\n--可选: \'value.fields-include\' = \'ALL\',\r\n--可选: \'json.ignore-parse-errors\' = \'true\',\r\n--可选: \'key.fields-prefix\' = \'k_\',', '1.14', 0, 1, '2022-01-20 16:59:18', '2022-01-20 17:57:32', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (11, 'Module', '建表语句', 'Other', 'create.table.doris', 'Doris快速建表', 'CREATE TABLE doris_table (\r\n    cid INT,\r\n    sid INT,\r\n    name STRING,\r\n    cls STRING,\r\n    score INT,\r\n    PRIMARY KEY (cid) NOT ENFORCED\r\n) WITH (\r\n\'connector\' = \'doris\',\r\n\'fenodes\' = \'127.0.0.1:8030\' ,\r\n\'table.identifier\' = \'test.scoreinfo\',\r\n\'username\' = \'root\',\r\n\'password\'=\'\'\r\n);', '1.14', 0, 1, '2022-01-20 17:08:00', '2022-01-20 17:57:26', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (12, 'Module', '建表语句', 'Other', 'create.table.jdbc', 'JDBC建表语句', 'CREATE TABLE JDBC_table (\r\n  id BIGINT,\r\n  name STRING,\r\n  age INT,\r\n  status BOOLEAN,\r\n  PRIMARY KEY (id) NOT ENFORCED\r\n) WITH (\r\n   \'connector\' = \'jdbc\',\r\n   \'url\' = \'jdbc:mysql://localhost:3306/mydatabase\',\r\n   \'table-name\' = \'users\',\r\n   \'username\' = \'root\',\r\n   \'password\' = \'123456\'\r\n);\r\n--可选: \'sink.parallelism\'=\'1\',\r\n--可选: \'lookup.cache.ttl\'=\'1000s\',', '1.14', 0, 1, '2022-01-20 17:15:26', '2022-01-20 17:57:20', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (13, 'Module', 'CataLog', 'Other', 'create.catalog.hive', '创建HIVE的catalog', 'CREATE CATALOG hive WITH (\r\n    \'type\' = \'hive\',\r\n    \'default-database\' = \'default\',\r\n    \'hive-conf-dir\' = \'/app/wwwroot/MBDC/hive/conf/\', --hive配置文件\r\n    \'hadoop-conf-dir\'=\'/app/wwwroot/MBDC/hadoop/etc/hadoop/\' --hadoop配置文件，配了环境变量则不需要。\r\n);', '1.14', 0, 1, '2022-01-20 17:18:54', '2022-01-20 17:18:54', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (14, 'Operator', 'CataLog', 'Other', 'use.catalog.hive', '使用hive的catalog', 'USE CATALOG hive;', '1.14', 0, 1, '2022-01-20 17:22:53', '2022-01-20 17:22:53', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (15, 'Operator', 'CataLog', 'Other', 'use.catalog.default', '使用default的catalog', 'USE CATALOG default_catalog;', '1.14', 0, 1, '2022-01-20 17:23:48', '2022-01-20 17:24:23', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (16, 'Variable', '设置参数', 'Other', 'set dialect.hive', '使用hive方言', 'Set table.sql-dialect=hive;', '1.14', 0, 1, '2022-01-20 17:25:37', '2022-01-20 17:27:23', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (17, 'Variable', '设置参数', 'Other', 'set dialect.default', '使用default方言', 'Set table.sql-dialect=default;', '1.14', 0, 1, '2022-01-20 17:26:19', '2022-01-20 17:27:20', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (18, 'Module', '建表语句', 'Other', 'create.stream.table.hive', '创建流式HIVE表', 'CREATE CATALOG hive WITH ( --创建hive的catalog\r\n    \'type\' = \'hive\',\r\n    \'hive-conf-dir\' = \'/app/wwwroot/MBDC/hive/conf/\',\r\n    \'hadoop-conf-dir\'=\'/app/wwwroot/MBDC/hadoop/etc/hadoop/\'\r\n);\r\n\r\nUSE CATALOG hive;\r\nUSE offline_db; --选择库\r\nset table.sql-dialect=hive; --设置方言\r\n\r\nCREATE TABLE hive_stream_table (\r\n  user_id STRING,\r\n  order_amount DOUBLE\r\n) PARTITIONED BY (dt STRING, hr STRING) STORED AS parquet TBLPROPERTIES (\r\n  \'partition.time-extractor.timestamp-pattern\'=\'$dt $hr:00:00\',\r\n  \'sink.partition-commit.trigger\'=\'partition-time\',\r\n  \'sink.partition-commit.delay\'=\'1min\',\r\n  \'sink.semantic\' = \'exactly-once\',\r\n  \'sink.rolling-policy.rollover-interval\' =\'1min\',\r\n  \'sink.rolling-policy.check-interval\'=\'1min\',\r\n  \'sink.partition-commit.policy.kind\'=\'metastore,success-file\'\r\n);', '1.14', 0, 1, '2022-01-20 17:34:06', '2022-01-20 17:46:41', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (19, 'Module', '建表语句', 'Other', 'create.table.mysql_cdc', '创建Mysql_CDC表', 'CREATE TABLE mysql_cdc_table(\r\n    cid INT,\r\n    sid INT,\r\n    cls STRING,\r\n    score INT,\r\n    PRIMARY KEY (cid) NOT ENFORCED\r\n) WITH (\r\n\'connector\' = \'mysql-cdc\',\r\n\'hostname\' = \'127.0.0.1\',\r\n\'port\' = \'3306\',\r\n\'username\' = \'test\',\r\n\'password\' = \'123456\',\r\n\'database-name\' = \'test\',\r\n\'server-time-zone\' = \'UTC\',\r\n\'scan.incremental.snapshot.enabled\' = \'true\',\r\n\'debezium.snapshot.mode\'=\'latest-offset\' ,-- 或者key是scan.startup.mode，initial表示要历史数据，latest-offset表示不要历史数据\r\n\'debezium.datetime.format.date\'=\'yyyy-MM-dd\',\r\n\'debezium.datetime.format.time\'=\'HH-mm-ss\',\r\n\'debezium.datetime.format.datetime\'=\'yyyy-MM-dd HH-mm-ss\',\r\n\'debezium.datetime.format.timestamp\'=\'yyyy-MM-dd HH-mm-ss\',\r\n\'debezium.datetime.format.timestamp.zone\'=\'UTC+8\',\r\n\'table-name\' = \'mysql_cdc_table\');', '1.14', 0, 1, '2022-01-20 17:49:14', '2022-01-20 17:52:20', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (20, 'Module', '建表语句', 'Other', 'create.table.hudi', '创建hudi表', 'CREATE TABLE hudi_table\r\n(\r\n    `goods_order_id`  bigint COMMENT \'自增主键id\',\r\n    `goods_order_uid` string COMMENT \'订单uid\',\r\n    `customer_uid`    string COMMENT \'客户uid\',\r\n    `customer_name`   string COMMENT \'客户name\',\r\n    `create_time`     timestamp(3) COMMENT \'创建时间\',\r\n    `update_time`     timestamp(3) COMMENT \'更新时间\',\r\n    `create_by`       string COMMENT \'创建人uid（唯一标识）\',\r\n    `update_by`       string COMMENT \'更新人uid（唯一标识）\',\r\n    PRIMARY KEY (goods_order_id) NOT ENFORCED\r\n) COMMENT \'hudi_table\'\r\nWITH (\r\n\'connector\' = \'hudi\',\r\n\'path\' = \'hdfs://cluster1/data/bizdata/cdc/mysql/order/goods_order\', -- 路径会自动创建\r\n\'hoodie.datasource.write.recordkey.field\' = \'goods_order_id\', -- 主键\r\n\'write.precombine.field\' = \'update_time\', -- 相同的键值时，取此字段最大值，默认ts字段\r\n\'read.streaming.skip_compaction\' = \'true\', -- 避免重复消费问题\r\n\'write.bucket_assign.tasks\' = \'2\', -- 并发写的 bucekt 数\r\n\'write.tasks\' = \'2\',\r\n\'compaction.tasks\' = \'1\',\r\n\'write.operation\' = \'upsert\', -- UPSERT（插入更新）\\INSERT（插入）\\BULK_INSERT（批插入）（upsert性能会低些，不适合埋点上报）\r\n\'write.rate.limit\' = \'20000\', -- 限制每秒多少条\r\n\'table.type\' = \'COPY_ON_WRITE\', -- 默认COPY_ON_WRITE ，\r\n\'compaction.async.enabled\' = \'true\', -- 在线压缩\r\n\'compaction.trigger.strategy\' = \'num_or_time\', -- 按次数压缩\r\n\'compaction.delta_commits\' = \'20\', -- 默认为5\r\n\'compaction.delta_seconds\' = \'60\', -- 默认为1小时\r\n\'hive_sync.enable\' = \'true\', -- 启用hive同步\r\n\'hive_sync.mode\' = \'hms\', -- 启用hive hms同步，默认jdbc\r\n\'hive_sync.metastore.uris\' = \'thrift://cdh2.vision.com:9083\', -- required, metastore的端口\r\n\'hive_sync.jdbc_url\' = \'jdbc:hive2://cdh1.vision.com:10000\', -- required, hiveServer地址\r\n\'hive_sync.table\' = \'order_mysql_goods_order\', -- required, hive 新建的表名 会自动同步hudi的表结构和数据到hive\r\n\'hive_sync.db\' = \'cdc_ods\', -- required, hive 新建的数据库名\r\n\'hive_sync.username\' = \'hive\', -- required, HMS 用户名\r\n\'hive_sync.password\' = \'123456\', -- required, HMS 密码\r\n\'hive_sync.skip_ro_suffix\' = \'true\' -- 去除ro后缀\r\n);', '1.14', 0, 1, '2022-01-20 17:56:50', '2022-01-20 17:56:50', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (21, 'Function', '内置函数', '比较函数', 'value1 <> value2', '如果value1不等于value2 返回true; 如果value1或value2为NULL，则返回UNKNOWN 。', '${1:} <> ${2:}', '1.12', 4, 1, '2021-02-22 10:05:38', '2021-03-11 09:58:48', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (22, 'Function', '内置函数', '比较函数', 'value1 > value2', '如果value1大于value2 返回true; 如果value1或value2为NULL，则返回UNKNOWN 。', '${1:} > ${2:}', '1.12', 2, 1, '2021-02-22 14:37:58', '2021-03-10 11:58:06', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (23, 'Function', '内置函数', '比较函数', 'value1 >= value2', '如果value1大于或等于value2 返回true; 如果value1或value2为NULL，则返回UNKNOWN 。', '${1:} >= ${2:}', '1.12', 2, 1, '2021-02-22 14:38:52', '2022-03-29 19:05:54', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (24, 'Function', '内置函数', '比较函数', 'value1 < value2', '如果value1小于value2 返回true; 如果value1或value2为NULL，则返回UNKNOWN 。', '${1:} < ${2:}', '1.12', 0, 1, '2021-02-22 14:39:15', '2022-03-29 19:04:58', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (25, 'Function', '内置函数', '比较函数', 'value1 <= value2', '如果value1小于或等于value2 返回true; 如果value1或value2为NULL，则返回UNKNOWN 。', '${1:} <=   ${2:}', '1.12', 0, 1, '2021-02-22 14:39:40', '2022-03-29 19:05:17', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (26, 'Function', '内置函数', '比较函数', 'value IS NULL', '如果value为NULL，则返回TRUE 。', '${1:} IS NULL', '1.12', 2, 1, '2021-02-22 14:40:39', '2021-03-10 11:57:51', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (27, 'Function', '内置函数', '比较函数', 'value IS NOT NULL', '如果value不为NULL，则返回TRUE 。', '${1:}  IS NOT NULL', '1.12', 0, 1, '2021-02-22 14:41:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (28, 'Function', '内置函数', '比较函数', 'value1 IS DISTINCT FROM value2', '如果两个值不相等则返回TRUE。NULL值在这里被视为相同的值。', '${1:} IS DISTINCT FROM ${2:}', '1.12', 0, 1, '2021-02-22 14:42:39', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (29, 'Function', '内置函数', '比较函数', 'value1 IS NOT DISTINCT FROM value2', '如果两个值相等则返回TRUE。NULL值在这里被视为相同的值。', '${1:} IS NOT DISTINCT FROM ${2:}', '1.12', 0, 1, '2021-02-22 14:43:23', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (30, 'Function', '内置函数', '比较函数', 'value1 BETWEEN [ ASYMMETRIC | SYMMETRIC ] value2 AND value3', '如果value1大于或等于value2和小于或等于value3 返回true', '${1:} BETWEEN ${2:} AND ${3:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (31, 'Function', '内置函数', '比较函数', 'value1 NOT BETWEEN [ ASYMMETRIC | SYMMETRIC ] value2 AND value3', '如果value1小于value2或大于value3 返回true', '${1:} NOT BETWEEN ${2:} AND ${3:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (32, 'Function', '内置函数', '比较函数', 'string1 LIKE string2 [ ESCAPE char ]', '如果STRING1匹配模式STRING2，则返回TRUE ；如果STRING1或STRING2为NULL，则返回UNKNOWN 。', '${1:} LIKE ${2:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (33, 'Function', '内置函数', '比较函数', 'string1 NOT LIKE string2 [ ESCAPE char ]', '如果STRING1不匹配模式STRING2，则返回TRUE ；如果STRING1或STRING2为NULL，则返回UNKNOWN 。', '${1:} NOT LIKE ${2:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (34, 'Function', '内置函数', '比较函数', 'string1 SIMILAR TO string2 [ ESCAPE char ]', '如果STRING1与SQL正则表达式STRING2匹配，则返回TRUE ；如果STRING1或STRING2为NULL，则返回UNKNOWN 。', '${1:} SIMILAR TO ${2:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-03-10 11:57:28', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (35, 'Function', '内置函数', '比较函数', 'string1 NOT SIMILAR TO string2 [ ESCAPE char ]', '如果STRING1与SQL正则表达式STRING2不匹配，则返回TRUE ；如果STRING1或STRING2为NULL，则返回UNKNOWN 。', '${1:} NOT SIMILAR TO ${2:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (36, 'Function', '内置函数', '比较函数', 'value1 IN (value2 [, value3]* )', '如果value1存在于给定列表（value2，value3，...）中，则返回TRUE 。\r\n\r\n当（value2，value3，...）包含NULL，如果可以找到该元素，则返回TRUE，否则返回UNKNOWN。\r\n\r\n如果value1为NULL，则始终返回UNKNOWN 。', '${1:} IN (${2:} )', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (37, 'Function', '内置函数', '比较函数', 'value1 NOT IN (value2 [, value3]* )', '如果value1不存在于给定列表（value2，value3，...）中，则返回TRUE 。\r\n\r\n当（value2，value3，...）包含NULL，如果可以找到该元素，则返回TRUE，否则返回UNKNOWN。\r\n\r\n如果value1为NULL，则始终返回UNKNOWN 。', '${1:} NOT IN (${2:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (38, 'Function', '内置函数', '比较函数', 'EXISTS (sub-query)', '如果value存在于子查询中，则返回TRUE。', 'EXISTS (${1:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (39, 'Function', '内置函数', '比较函数', 'value IN (sub-query)', '如果value存在于子查询中，则返回TRUE。', '${1:} IN (${2:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (40, 'Function', '内置函数', '比较函数', 'value NOT IN (sub-query)', '如果value不存在于子查询中，则返回TRUE。', '${1:} NOT IN (${2:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (41, 'Function', '内置函数', '逻辑函数', 'boolean1 OR boolean2', '如果BOOLEAN1为TRUE或BOOLEAN2为TRUE，则返回TRUE。支持三值逻辑。\r\n\r\n例如，true || Null(Types.BOOLEAN)返回TRUE。', '${1:} OR ${2:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (42, 'Function', '内置函数', '逻辑函数', 'boolean1 AND boolean2', '如果BOOLEAN1和BOOLEAN2均为TRUE，则返回TRUE。支持三值逻辑。\r\n\r\n例如，true && Null(Types.BOOLEAN)返回未知。', '${1:} AND ${2:}', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (43, 'Function', '内置函数', '逻辑函数', 'NOT boolean', '如果BOOLEAN为FALSE，则返回TRUE ；如果BOOLEAN为TRUE，则返回FALSE 。\r\n\r\n如果BOOLEAN为UNKNOWN，则返回UNKNOWN。', 'NOT ${1:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (44, 'Function', '内置函数', '逻辑函数', 'boolean IS FALSE', '如果BOOLEAN为FALSE，则返回TRUE ；如果BOOLEAN为TRUE或UNKNOWN，则返回FALSE 。', '${1:}  IS FALSE', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (45, 'Function', '内置函数', '逻辑函数', 'boolean IS NOT FALSE', '如果BOOLEAN为TRUE或UNKNOWN，则返回TRUE ；如果BOOLEAN为FALSE，则返回FALSE。', '${1:}  IS NOT FALSE', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (46, 'Function', '内置函数', '逻辑函数', 'boolean IS TRUE', '如果BOOLEAN为TRUE，则返回TRUE；如果BOOLEAN为FALSE或UNKNOWN，则返回FALSE 。', '${1:}  IS TRUE', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (47, 'Function', '内置函数', '逻辑函数', 'boolean IS NOT TRUE', '如果BOOLEAN为FALSE或UNKNOWN，则返回TRUE ；如果BOOLEAN为TRUE，则返回FALSE 。', '${1:}  IS NOT TRUE', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (48, 'Function', '内置函数', '逻辑函数', 'boolean IS UNKNOWN', '如果BOOLEAN为UNKNOWN，则返回TRUE ；如果BOOLEAN为TRUE或FALSE，则返回FALSE 。', '${1:}  IS UNKNOWN', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (49, 'Function', '内置函数', '逻辑函数', 'boolean IS NOT UNKNOWN', '如果BOOLEAN为TRUE或FALSE，则返回TRUE ；如果BOOLEAN为UNKNOWN，则返回FALSE 。', '${1:}  IS NOT UNKNOWN', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (50, 'Function', '内置函数', '算术函数', '+ numeric', '返回NUMERIC。', '+ ${1:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (51, 'Function', '内置函数', '算术函数', '- numeric', '返回负数NUMERIC。', '- ${1:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (52, 'Function', '内置函数', '算术函数', 'numeric1 + numeric2', '返回NUMERIC1加NUMERIC2。', '${1:}  + ${2:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (53, 'Function', '内置函数', '算术函数', 'numeric1 - numeric2', '返回NUMERIC1减去NUMERIC2。', '${1:}  - ${2:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (54, 'Function', '内置函数', '算术函数', 'numeric1 * numeric2', '返回NUMERIC1乘以NUMERIC2。', '${1:} * ${2:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (55, 'Function', '内置函数', '算术函数', 'numeric1 / numeric2', '返回NUMERIC1除以NUMERIC2。', '${1:}  / ${2:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (56, 'Function', '内置函数', '算术函数', 'numeric1 % numeric2', '返回NUMERIC1除以NUMERIC2的余数（模）。仅当numeric1为负数时，结果为负数。', '${1:}  % ${2:} ', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (57, 'Function', '内置函数', '算术函数', 'POWER(numeric1, numeric2)', '返回NUMERIC1的NUMERIC2 次幂。', 'POWER(${1:} , ${2:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (58, 'Function', '内置函数', '算术函数', 'ABS(numeric)', '返回NUMERIC的绝对值。', 'ABS(${1:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (59, 'Function', '内置函数', '算术函数', 'MOD(numeric1, numeric2)', '返回numeric1除以numeric2的余数(模)。只有当numeric1为负数时，结果才为负数', 'MOD(${1:} , ${2:} )', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (60, 'Function', '内置函数', '算术函数', 'SQRT(numeric)', '返回NUMERIC的平方根。', 'SQRT(${1:})', '1.12', 0, 1, '2021-02-22 14:44:26', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (61, 'Function', '内置函数', '算术函数', 'LN(numeric)', '返回NUMERIC的自然对数（以e为底）。', 'LN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (62, 'Function', '内置函数', '算术函数', 'LOG10(numeric)', '返回NUMERIC的以10为底的对数。', 'LOG10(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (63, 'Function', '内置函数', '算术函数', 'LOG2(numeric)', '返回NUMERIC的以2为底的对数。', 'LOG2(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (64, 'Function', '内置函数', '算术函数', 'EXP(numeric)', '返回e 的 NUMERIC 次幂。', 'EXP(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (65, 'Function', '内置函数', '算术函数', 'FLOOR(numeric)', '向下舍入NUMERIC，并返回小于或等于NUMERIC的最大整数。', 'FLOOR(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (66, 'Function', '内置函数', '算术函数', 'SIN(numeric)', '返回NUMERIC的正弦值。', 'SIN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (67, 'Function', '内置函数', '算术函数', 'SINH(numeric)', '返回NUMERIC的双曲正弦值。\r\n\r\n返回类型为DOUBLE。', 'SINH(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (68, 'Function', '内置函数', '算术函数', 'COS(numeric)', '返回NUMERIC的余弦值。', 'COS(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (69, 'Function', '内置函数', '算术函数', 'TAN(numeric)', '返回NUMERIC的正切。', 'TAN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (70, 'Function', '内置函数', '算术函数', 'TANH(numeric)', '返回NUMERIC的双曲正切值。\r\n\r\n返回类型为DOUBLE。', 'TANH(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (71, 'Function', '内置函数', '算术函数', 'COT(numeric)', '返回NUMERIC的余切。', 'COT(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (72, 'Function', '内置函数', '算术函数', 'ASIN(numeric)', '返回NUMERIC的反正弦值。', 'ASIN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (73, 'Function', '内置函数', '算术函数', 'ACOS(numeric)', '返回NUMERIC的反余弦值。', 'ACOS(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (74, 'Function', '内置函数', '算术函数', 'ATAN(numeric)', '返回NUMERIC的反正切。', 'ATAN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (75, 'Function', '内置函数', '算术函数', 'ATAN2(numeric1, numeric2)', '返回坐标的反正切（NUMERIC1，NUMERIC2）。', 'ATAN2(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (76, 'Function', '内置函数', '算术函数', 'COSH(numeric)', '返回NUMERIC的双曲余弦值。\r\n\r\n返回值类型为DOUBLE。', 'COSH(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (77, 'Function', '内置函数', '算术函数', 'DEGREES(numeric)', '返回弧度NUMERIC的度数表示形式', 'DEGREES(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (78, 'Function', '内置函数', '算术函数', 'RADIANS(numeric)', '返回度数NUMERIC的弧度表示。', 'RADIANS(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (79, 'Function', '内置函数', '算术函数', 'SIGN(numeric)', '返回NUMERIC的符号。', 'SIGN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (80, 'Function', '内置函数', '算术函数', 'ROUND(numeric, integer)', '返回一个数字，四舍五入为NUMERIC的INT小数位。', 'ROUND(${1:} , ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (81, 'Function', '内置函数', '算术函数', 'PI', '返回一个比任何其他值都更接近圆周率的值。', 'PI', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (82, 'Function', '内置函数', '算术函数', 'E()', '返回一个比任何其他值都更接近e的值。', 'E()', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (83, 'Function', '内置函数', '算术函数', 'RAND()', '返回介于0.0（含）和1.0（不含）之间的伪随机双精度值。', 'RAND()', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (84, 'Function', '内置函数', '算术函数', 'RAND(integer)', '返回带有初始种子INTEGER的介于0.0（含）和1.0（不含）之间的伪随机双精度值。\r\n\r\n如果两个RAND函数具有相同的初始种子，它们将返回相同的数字序列。', 'RAND(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (85, 'Function', '内置函数', '算术函数', 'RAND_INTEGER(integer)', '返回介于0（含）和INTEGER（不含）之间的伪随机整数值。', 'RAND_INTEGER(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (86, 'Function', '内置函数', '算术函数', 'RAND_INTEGER(integer1, integer2)', '返回介于0（含）和INTEGER2（不含）之间的伪随机整数值，其初始种子为INTEGER1。\r\n\r\n如果两个randInteger函数具有相同的初始种子和边界，它们将返回相同的数字序列。', 'RAND_INTEGER(${1:} , ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (87, 'Function', '内置函数', '算术函数', 'UUID()', '根据RFC 4122 type 4（伪随机生成）UUID返回UUID（通用唯一标识符）字符串\r\n\r\n（例如，“ 3d3c68f7-f608-473f-b60c-b0c44ad4cc4e”）。使用加密强度高的伪随机数生成器生成UUID。', 'UUID()', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (88, 'Function', '内置函数', '算术函数', 'BIN(integer)', '以二进制格式返回INTEGER的字符串表示形式。如果INTEGER为NULL，则返回NULL。\r\n\r\n例如，4.bin()返回“ 100”并12.bin()返回“ 1100”。', 'BIN(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (89, 'Function', '内置函数', '算术函数', 'HEX(numeric)\r\nHEX(string)', '以十六进制格式返回整数NUMERIC值或STRING的字符串表示形式。如果参数为NULL，则返回NULL。\r\n\r\n例如，数字20导致“ 14”，数字100导致“ 64”，字符串“ hello，world”导致“ 68656C6C6F2C776F726C64”。', 'HEX(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (90, 'Function', '内置函数', '算术函数', 'TRUNCATE(numeric1, integer2)', '返回一个小数点后被截断为integer2位的数字。', 'TRUNCATE(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (91, 'Function', '内置函数', '算术函数', 'PI()', '返回π (pi)的值。仅在blink planner中支持。', 'PI()', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (92, 'Function', '内置函数', '算术函数', 'LOG(numeric1)', '如果不带参数调用，则返回NUMERIC1的自然对数。当使用参数调用时，将NUMERIC1的对数返回到基数NUMERIC2。\r\n\r\n注意：当前，NUMERIC1必须大于0，而NUMERIC2必须大于1。', 'LOG(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (93, 'Function', '内置函数', '算术函数', 'LOG(numeric1, numeric2)', '如果不带参数调用，则返回NUMERIC1的自然对数。当使用参数调用时，将NUMERIC1的对数返回到基数NUMERIC2。\r\n\r\n注意：当前，NUMERIC1必须大于0，而NUMERIC2必须大于1。', 'LOG(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (94, 'Function', '内置函数', '算术函数', 'CEIL(numeric)', '将NUMERIC向上舍入，并返回大于或等于NUMERIC的最小整数。', 'CEIL(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (95, 'Function', '内置函数', '算术函数', 'CEILING(numeric)', '将NUMERIC向上舍入，并返回大于或等于NUMERIC的最小整数。', 'CEILING(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (96, 'Function', '内置函数', '字符串函数', 'string1 || string2', '返回string1和string2的连接。', '${1:} || ${2:}', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (97, 'Function', '内置函数', '字符串函数', 'UPPER(string)', '以大写形式返回STRING。', 'UPPER(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (98, 'Function', '内置函数', '字符串函数', 'LOWER(string)', '以小写形式返回STRING。', 'LOWER(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (99, 'Function', '内置函数', '字符串函数', 'POSITION(string1 IN string2)', '返回STRING1在STRING2中第一次出现的位置（从1开始）；\r\n\r\n如果在STRING2中找不到STRING1，则返回0 。', 'POSITION(${1:} IN ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (100, 'Function', '内置函数', '字符串函数', 'TRIM([ BOTH | LEADING | TRAILING ] string1 FROM string2)', '返回一个字符串，该字符串从STRING中删除前导和/或结尾字符。', 'TRIM(${1:} FROM ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (101, 'Function', '内置函数', '字符串函数', 'LTRIM(string)', '返回一个字符串，该字符串从STRING除去左空格。\r\n\r\n例如，\" This is a test String.\".ltrim()返回“This is a test String.”。', 'LTRIM(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (102, 'Function', '内置函数', '字符串函数', 'RTRIM(string)', '返回一个字符串，该字符串从STRING中删除正确的空格。\r\n\r\n例如，\"This is a test String. \".rtrim()返回“This is a test String.”。', 'RTRIM(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (103, 'Function', '内置函数', '字符串函数', 'REPEAT(string, integer)', '返回一个字符串，该字符串重复基本STRING INT次。\r\n\r\n例如，\"This is a test String.\".repeat(2)返回“This is a test String.This is a test String.”。', 'REPEAT(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (104, 'Function', '内置函数', '字符串函数', 'REGEXP_REPLACE(string1, string2, string3)', '返回字符串STRING1所有匹配正则表达式的子串STRING2连续被替换STRING3。\r\n\r\n例如，\"foobar\".regexpReplace(\"oo|ar\", \"\")返回“ fb”。', 'REGEXP_REPLACE(${1:} , ${2:} , ${3:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (105, 'Function', '内置函数', '字符串函数', 'OVERLAY(string1 PLACING string2 FROM integer1 [ FOR integer2 ])', '从位置INT1返回一个字符串，该字符串将STRING1的INT2（默认为STRING2的长度）字符替换为STRING2', 'OVERLAY(${1:} PLACING ${2:} FROM ${3:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (106, 'Function', '内置函数', '字符串函数', 'SUBSTRING(string FROM integer1 [ FOR integer2 ])', '返回字符串STRING的子字符串，从位置INT1开始，长度为INT2（默认为结尾）。', 'SUBSTRING${1:} FROM ${2:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (107, 'Function', '内置函数', '字符串函数', 'REPLACE(string1, string2, string3)', '返回一个新字符串替换其中出现的所有STRING2与STRING3（非重叠）从STRING1。', 'REPLACE(${1:} , ${2:} , ${3:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (108, 'Function', '内置函数', '字符串函数', 'REGEXP_EXTRACT(string1, string2[, integer])', '从STRING1返回一个字符串，该字符串使用指定的正则表达式STRING2和正则表达式匹配组索引INTEGER1提取。', 'REGEXP_EXTRACT(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (109, 'Function', '内置函数', '字符串函数', 'INITCAP(string)', '返回一种新形式的STRING，其中每个单词的第一个字符转换为大写，其余字符转换为小写。', 'INITCAP(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (110, 'Function', '内置函数', '字符串函数', 'CONCAT(string1, string2,...)', '返回连接STRING1，STRING2，...的字符串。如果任何参数为NULL，则返回NULL。', 'CONCAT(${1:} , ${2:} , ${3:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (111, 'Function', '内置函数', '字符串函数', 'CONCAT_WS(string1, string2, string3,...)', '返回一个字符串，会连接STRING2，STRING3，......与分离STRING1。', 'CONCAT_WS(${1:} , ${2:} , ${3:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (112, 'Function', '内置函数', '字符串函数', 'LPAD(string1, integer, string2)', '返回一个新字符串，该字符串从STRING1的左侧填充STRING2，长度为INT个字符。', 'LPAD(${1:} , ${2:} , ${3:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (113, 'Function', '内置函数', '字符串函数', 'RPAD(string1, integer, string2)', '返回一个新字符串，该字符串从STRING1右侧填充STRING2，长度为INT个字符。', 'RPAD(${1:} , ${2:} , ${3:} )', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (114, 'Function', '内置函数', '字符串函数', 'FROM_BASE64(string)', '返回来自STRING的base64解码结果；如果STRING为NULL，则返回null 。', 'FROM_BASE64(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (115, 'Function', '内置函数', '字符串函数', 'TO_BASE64(string)', '从STRING返回base64编码的结果；如果STRING为NULL，则返回NULL。', 'TO_BASE64(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (116, 'Function', '内置函数', '字符串函数', 'ASCII(string)', '返回字符串的第一个字符的数值。如果字符串为NULL，则返回NULL。仅在blink planner中支持。', 'ASCII(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (117, 'Function', '内置函数', '字符串函数', 'CHR(integer)', '返回与integer在二进制上等价的ASCII字符。如果integer大于255，我们将首先得到integer的模数除以255，并返回模数的CHR。如果integer为NULL，则返回NULL。仅在blink planner中支持。', 'CHR(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (118, 'Function', '内置函数', '字符串函数', 'DECODE(binary, string)', '使用提供的字符集(\'US-ASCII\'， \'ISO-8859-1\'， \'UTF-8\'， \'UTF-16BE\'， \'UTF-16LE\'， \'UTF-16\'之一)将第一个参数解码为字符串。如果任意一个参数为空，结果也将为空。仅在blink planner中支持。', 'DECODE(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (119, 'Function', '内置函数', '字符串函数', 'ENCODE(string1, string2)', '使用提供的string2字符集(\'US-ASCII\'， \'ISO-8859-1\'， \'UTF-8\'， \'UTF-16BE\'， \'UTF-16LE\'， \'UTF-16\'之一)将string1编码为二进制。如果任意一个参数为空，结果也将为空。仅在blink planner中支持。', 'ENCODE(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (120, 'Function', '内置函数', '字符串函数', 'INSTR(string1, string2)', '返回string2在string1中第一次出现的位置。如果任何参数为空，则返回NULL。仅在blink planner中支持。', 'INSTR(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (121, 'Function', '内置函数', '字符串函数', 'LEFT(string, integer)', '返回字符串中最左边的整数字符。如果整数为负，则返回空字符串。如果任何参数为NULL，则返回NULL。仅在blink planner中支持。', 'LEFT(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (122, 'Function', '内置函数', '字符串函数', 'RIGHT(string, integer)', '返回字符串中最右边的整数字符。如果整数为负，则返回空字符串。如果任何参数为NULL，则返回NULL。仅在blink planner中支持。', 'RIGHT(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (123, 'Function', '内置函数', '字符串函数', 'LOCATE(string1, string2[, integer])', '返回string1在string2中的位置整数之后第一次出现的位置。如果没有找到，返回0。如果任何参数为NULL，则返回NULL仅在blink planner中支持。', 'LOCATE(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (124, 'Function', '内置函数', '字符串函数', 'PARSE_URL(string1, string2[, string3])', '从URL返回指定的部分。string2的有效值包括\'HOST\'， \'PATH\'， \'QUERY\'， \'REF\'， \'PROTOCOL\'， \'AUTHORITY\'， \'FILE\'和\'USERINFO\'。如果任何参数为NULL，则返回NULL。仅在blink planner中支持。', 'PARSE_URL(${1:} , ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (125, 'Function', '内置函数', '字符串函数', 'REGEXP(string1, string2)', '如果string1的任何子字符串(可能为空)与Java正则表达式string2匹配，则返回TRUE，否则返回FALSE。如果任何参数为NULL，则返回NULL。仅在blink planner中支持。', 'REGEXP(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (126, 'Function', '内置函数', '字符串函数', 'REVERSE(string)', '返回反向字符串。如果字符串为NULL，则返回NULL仅在blink planner中支持。', 'REVERSE(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (127, 'Function', '内置函数', '字符串函数', 'SPLIT_INDEX(string1, string2, integer1)', '通过分隔符string2拆分string1，返回拆分字符串的整数(从零开始)字符串。如果整数为负，返回NULL。如果任何参数为NULL，则返回NULL。仅在blink planner中支持。', 'SPLIT_INDEX(${1:}, ${2:} , ${3:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (128, 'Function', '内置函数', '字符串函数', 'STR_TO_MAP(string1[, string2, string3]])', '使用分隔符将string1分割成键/值对后返回一个映射。string2是pair分隔符，默认为\'，\'。string3是键值分隔符，默认为\'=\'。仅在blink planner中支持。', 'STR_TO_MAP(${1:})', '1.12', 4, 1, '2021-02-22 15:29:35', '2021-05-20 19:59:50', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (129, 'Function', '内置函数', '字符串函数', 'SUBSTR(string[, integer1[, integer2]])', '返回一个字符串的子字符串，从位置integer1开始，长度为integer2(默认到末尾)。仅在blink planner中支持。', 'SUBSTR(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (130, 'Function', '内置函数', '字符串函数', 'CHAR_LENGTH(string)', '返回STRING中的字符数。', 'CHAR_LENGTH(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (131, 'Function', '内置函数', '字符串函数', 'CHARACTER_LENGTH(string)', '返回STRING中的字符数。', 'CHARACTER_LENGTH(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (132, 'Function', '内置函数', '时间函数', 'DATE string', '返回以“ yyyy-MM-dd”形式从STRING解析的SQL日期。', 'DATE(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (133, 'Function', '内置函数', '时间函数', 'TIME string', '返回以“ HH：mm：ss”的形式从STRING解析的SQL时间。', 'TIME(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (134, 'Function', '内置函数', '时间函数', 'TIMESTAMP string', '返回从STRING解析的SQL时间戳，格式为“ yyyy-MM-dd HH：mm：ss [.SSS]”', 'TIMESTAMP(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (135, 'Function', '内置函数', '时间函数', 'INTERVAL string range', '解析“dd hh:mm:ss”形式的区间字符串。fff表示毫秒间隔，yyyy-mm表示月间隔。间隔范围可以是天、分钟、天到小时或天到秒，以毫秒为间隔;年或年到月的间隔。', 'INTERVAL ${1:} range', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (136, 'Function', '内置函数', '时间函数', 'CURRENT_DATE', '返回UTC时区中的当前SQL日期。', 'CURRENT_DATE', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (137, 'Function', '内置函数', '时间函数', 'CURRENT_TIME', '返回UTC时区的当前SQL时间。', 'CURRENT_TIME', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (138, 'Function', '内置函数', '时间函数', 'CURRENT_TIMESTAMP', '返回UTC时区内的当前SQL时间戳。', 'CURRENT_TIMESTAMP', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (139, 'Function', '内置函数', '时间函数', 'LOCALTIME', '返回本地时区的当前SQL时间。', 'LOCALTIME', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (140, 'Function', '内置函数', '时间函数', 'LOCALTIMESTAMP', '返回本地时区的当前SQL时间戳。', 'LOCALTIMESTAMP', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (141, 'Function', '内置函数', '时间函数', 'EXTRACT(timeintervalunit FROM temporal)', '返回从时域的timeintervalunit部分提取的长值。', 'EXTRACT(${1:} FROM ${2:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (142, 'Function', '内置函数', '时间函数', 'YEAR(date)', '返回SQL date日期的年份。等价于EXTRACT(YEAR FROM date)。', 'YEAR(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (143, 'Function', '内置函数', '时间函数', 'QUARTER(date)', '从SQL date date返回一年中的季度(1到4之间的整数)。相当于EXTRACT(从日期起四分之一)。', 'QUARTER(${1:})', '1.12', 0, 1, '2021-02-22 15:29:35', '2021-02-22 15:28:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (144, 'Function', '内置函数', '时间函数', 'MONTH(date)', '返回SQL date date中的某月(1到12之间的整数)。等价于EXTRACT(MONTH FROM date)。', 'MONTH(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (145, 'Function', '内置函数', '时间函数', 'WEEK(date)', '从SQL date date返回一年中的某个星期(1到53之间的整数)。相当于EXTRACT(从日期开始的星期)。', 'WEEK(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (146, 'Function', '内置函数', '时间函数', 'DAYOFYEAR(date)', '返回SQL date date中的某一天(1到366之间的整数)。相当于EXTRACT(DOY FROM date)。', 'DAYOFYEAR(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (147, 'Function', '内置函数', '时间函数', 'DAYOFMONTH(date)', '从SQL date date返回一个月的哪一天(1到31之间的整数)。相当于EXTRACT(DAY FROM date)。', 'DAYOFMONTH(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (148, 'Function', '内置函数', '时间函数', 'DAYOFWEEK(date)', '返回星期几(1到7之间的整数;星期日= 1)从SQL日期日期。相当于提取(道指从日期)。', 'DAYOFWEEK(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (149, 'Function', '内置函数', '时间函数', 'HOUR(timestamp)', '从SQL timestamp timestamp返回一天中的小时(0到23之间的整数)。相当于EXTRACT(HOUR FROM timestamp)。', 'HOUR(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (150, 'Function', '内置函数', '时间函数', 'MINUTE(timestamp)', '从SQL timestamp timestamp返回一小时的分钟(0到59之间的整数)。相当于EXTRACT(分钟从时间戳)。', 'MINUTE(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (151, 'Function', '内置函数', '时间函数', 'SECOND(timestamp)', '从SQL时间戳返回一分钟中的秒(0到59之间的整数)。等价于EXTRACT(从时间戳开始倒数第二)。', 'SECOND(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (152, 'Function', '内置函数', '时间函数', 'FLOOR(timepoint TO timeintervalunit)', '返回一个将timepoint舍入到时间单位timeintervalunit的值。', 'FLOOR(${1:} TO ${2:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (153, 'Function', '内置函数', '时间函数', 'CEIL(timepoint TO timeintervalunit)', '返回一个将timepoint舍入到时间单位timeintervalunit的值。', 'CEIL(${1:} TO ${2:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (154, 'Function', '内置函数', '时间函数', '(timepoint1, temporal1) OVERLAPS (timepoint2, temporal2)', '如果(timepoint1, temporal1)和(timepoint2, temporal2)定义的两个时间间隔重叠，则返回TRUE。时间值可以是时间点或时间间隔。', '(${1:} , ${1:}) OVERLAPS (${2:} , ${2:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (155, 'Function', '内置函数', '时间函数', 'DATE_FORMAT(timestamp, string)', '注意这个功能有严重的错误，现在不应该使用。请实现一个自定义的UDF，或者使用EXTRACT作为解决方案。', 'DATE_FORMAT(${1:}, \'yyyy-MM-dd\')', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (156, 'Function', '内置函数', '时间函数', 'TIMESTAMPADD(timeintervalunit, interval, timepoint)', '返回一个新的时间值，该值将一个(带符号的)整数间隔添加到时间点。间隔的单位由unit参数给出，它应该是以下值之一:秒、分、小时、日、周、月、季度或年。', 'TIMESTAMPADD(${1:} , ${2:} , ${3:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (157, 'Function', '内置函数', '时间函数', 'TIMESTAMPDIFF(timepointunit, timepoint1, timepoint2)', '返回timepointunit在timepoint1和timepoint2之间的(带符号)数。间隔的单位由第一个参数给出，它应该是以下值之一:秒、分、小时、日、月或年。', 'TIMESTAMPDIFF(${1:} , ${2:} , ${3:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (158, 'Function', '内置函数', '时间函数', 'CONVERT_TZ(string1, string2, string3)', '将时区string2中的datetime string1(默认ISO时间戳格式\'yyyy-MM-dd HH:mm:ss\')转换为时区string3。时区的格式可以是缩写，如“PST”;可以是全名，如“America/Los_Angeles”;或者是自定义ID，如“GMT-8:00”。仅在blink planner中支持。', 'CONVERT_TZ(${1:} , ${2:} , ${3:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (159, 'Function', '内置函数', '时间函数', 'FROM_UNIXTIME(numeric[, string])', '以字符串格式返回数值参数的表示形式(默认为\'yyyy-MM-dd HH:mm:ss\')。numeric是一个内部时间戳值，表示从UTC \'1970-01-01 00:00:00\'开始的秒数，例如UNIX_TIMESTAMP()函数生成的时间戳。返回值用会话时区表示(在TableConfig中指定)。仅在blink planner中支持。', 'FROM_UNIXTIME(${1:} )', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (160, 'Function', '内置函数', '时间函数', 'UNIX_TIMESTAMP()', '获取当前Unix时间戳(以秒为单位)。仅在blink planner中支持。', 'UNIX_TIMESTAMP()', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (161, 'Function', '内置函数', '时间函数', 'UNIX_TIMESTAMP(string1[, string2])', '转换日期时间字符串string1，格式为string2(缺省为yyyy-MM-dd HH:mm:ss，如果没有指定)为Unix时间戳(以秒为单位)，使用表配置中指定的时区。仅在blink planner中支持。', 'UNIX_TIMESTAMP(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (162, 'Function', '内置函数', '时间函数', 'TO_DATE(string1[, string2])', '将格式为string2的日期字符串string1(默认为\'yyyy-MM-dd\')转换为日期。仅在blink planner中支持。', 'TO_DATE(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (163, 'Function', '内置函数', '时间函数', 'TO_TIMESTAMP(string1[, string2])', '将会话时区(由TableConfig指定)下的日期时间字符串string1转换为时间戳，格式为string2(默认为\'yyyy-MM-dd HH:mm:ss\')。仅在blink planner中支持。', 'TO_TIMESTAMP(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (164, 'Function', '内置函数', '时间函数', 'NOW()', '返回UTC时区内的当前SQL时间戳。仅在blink planner中支持。', 'NOW()', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (165, 'Function', '内置函数', '条件函数', 'CASE value\r\nWHEN value1_1 [, value1_2 ]* THEN result1\r\n[ WHEN value2_1 [, value2_2 ]* THEN result2 ]*\r\n[ ELSE resultZ ]\r\nEND', '当第一个时间值包含在(valueX_1, valueX_2，…)中时，返回resultX。如果没有匹配的值，则返回resultZ，否则返回NULL。', 'CASE ${1:}\r\n  WHEN ${2:}  THEN ${3:}\r\n ELSE ${4:}\r\nEND AS ${5:}', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (166, 'Function', '内置函数', '条件函数', 'CASE\r\nWHEN condition1 THEN result1\r\n[ WHEN condition2 THEN result2 ]*\r\n[ ELSE resultZ ]\r\nEND', '当第一个条件满足时返回resultX。当不满足任何条件时，如果提供了resultZ则返回resultZ，否则返回NULL。', 'CASE WHEN ${1:} THEN ${2:}\r\n   ELSE ${3:}\r\nEND AS ${4:}', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (167, 'Function', '内置函数', '条件函数', 'NULLIF(value1, value2)', '如果value1等于value2，则返回NULL;否则返回value1。', 'NULLIF(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (168, 'Function', '内置函数', '条件函数', 'COALESCE(value1, value2 [, value3 ]* )', '返回value1, value2， ....中的第一个非空值', 'COALESCE(${1:} )', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (169, 'Function', '内置函数', '条件函数', 'IF(condition, true_value, false_value)', '如果条件满足则返回true值，否则返回false值。仅在blink planner中支持。', 'IF((${1:}, ${2:}, ${3:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (170, 'Function', '内置函数', '条件函数', 'IS_ALPHA(string)', '如果字符串中所有字符都是字母则返回true，否则返回false。仅在blink planner中支持。', 'IS_ALPHA(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (171, 'Function', '内置函数', '条件函数', 'IS_DECIMAL(string)', '如果字符串可以被解析为有效的数字则返回true，否则返回false。仅在blink planner中支持。', 'IS_DECIMAL(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (172, 'Function', '内置函数', '条件函数', 'IS_DIGIT(string)', '如果字符串中所有字符都是数字则返回true，否则返回false。仅在blink planner中支持。', 'IS_DIGIT(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (173, 'Function', '内置函数', '类型转换函数功能', 'CAST(value AS type)', '返回一个要转换为type类型的新值。', 'CAST(${1:} AS ${2:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (174, 'Function', '内置函数', 'Collection 函数', 'CARDINALITY(array)', '返回数组中元素的数量。', 'CARDINALITY(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (175, 'Function', '内置函数', 'Collection 函数', 'array ‘[’ integer ‘]’', '返回数组中位于整数位置的元素。索引从1开始。', 'array[${1:}]', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (176, 'Function', '内置函数', 'Collection 函数', 'ELEMENT(array)', '返回数组的唯一元素(其基数应为1);如果数组为空，则返回NULL。如果数组有多个元素，则抛出异常。', 'ELEMENT(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (177, 'Function', '内置函数', 'Collection 函数', 'CARDINALITY(map)', '返回map中的条目数。', 'CARDINALITY(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (178, 'Function', '内置函数', 'Collection 函数', 'map ‘[’ value ‘]’', '返回map中key value指定的值。', 'map[${1:}]', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (179, 'Function', '内置函数', 'Value Construction函数', 'ARRAY ‘[’ value1 [, value2 ]* ‘]’', '返回一个由一系列值(value1, value2，…)创建的数组。', 'ARRAY[ ${1:} ]', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (180, 'Function', '内置函数', 'Value Construction函数', 'MAP ‘[’ value1, value2 [, value3, value4 ]* ‘]’', '返回一个从键值对列表((value1, value2)， (value3, value4)，…)创建的映射。', 'MAP[ ${1:} ]', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (181, 'Function', '内置函数', 'Value Construction函数', 'implicit constructor with parenthesis\r\n(value1 [, value2]*)', '返回从值列表(value1, value2，…)创建的行。', '(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (182, 'Function', '内置函数', 'Value Construction函数', 'explicit ROW constructor\r\nROW(value1 [, value2]*)', '返回从值列表(value1, value2，…)创建的行。', 'ROW(${1:}) ', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (183, 'Function', '内置函数', 'Value Access函数', 'tableName.compositeType.field', '按名称从Flink复合类型(例如，Tuple, POJO)中返回一个字段的值。', 'tableName.compositeType.field', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (184, 'Function', '内置函数', 'Value Access函数', 'tableName.compositeType.*', '返回Flink复合类型(例如，Tuple, POJO)的平面表示，它将每个直接子类型转换为一个单独的字段。在大多数情况下，平面表示的字段的名称与原始字段类似，但使用了$分隔符(例如，mypojo$mytuple$f0)。', 'tableName.compositeType.*', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (185, 'Function', '内置函数', '分组函数', 'GROUP_ID()', '返回唯一标识分组键组合的整数', 'GROUP_ID()', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (186, 'Function', '内置函数', '分组函数', 'GROUPING(expression1 [, expression2]* )\r\nGROUPING_ID(expression1 [, expression2]* )', '返回给定分组表达式的位向量。', 'GROUPING(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (187, 'Function', '内置函数', 'hash函数', 'MD5(string)', '以32位十六进制数字的字符串形式返回string的MD5哈希值;如果字符串为NULL，则返回NULL。', 'MD5(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (188, 'Function', '内置函数', 'hash函数', 'SHA1(string)', '返回字符串的SHA-1散列，作为一个由40个十六进制数字组成的字符串;如果字符串为NULL，则返回NULL', 'SHA1(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (189, 'Function', '内置函数', 'hash函数', 'SHA224(string)', '以56位十六进制数字的字符串形式返回字符串的SHA-224散列;如果字符串为NULL，则返回NULL。', 'SHA224(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (190, 'Function', '内置函数', 'hash函数', 'SHA256(string)', '以64位十六进制数字的字符串形式返回字符串的SHA-256散列;如果字符串为NULL，则返回NULL。', 'SHA256(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (191, 'Function', '内置函数', 'hash函数', 'SHA384(string)', '以96个十六进制数字的字符串形式返回string的SHA-384散列;如果字符串为NULL，则返回NULL。', 'SHA384(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (192, 'Function', '内置函数', 'hash函数', 'SHA512(string)', '以128位十六进制数字的字符串形式返回字符串的SHA-512散列;如果字符串为NULL，则返回NULL。', 'SHA512(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (193, 'Function', '内置函数', 'hash函数', 'SHA2(string, hashLength)', '使用SHA-2哈希函数族(SHA-224、SHA-256、SHA-384或SHA-512)返回哈希值。第一个参数string是要散列的字符串，第二个参数hashLength是结果的位长度(224、256、384或512)。如果string或hashLength为NULL，则返回NULL。', 'SHA2(${1:}, ${2:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (194, 'Function', '内置函数', '聚合函数', 'COUNT([ ALL ] expression | DISTINCT expression1 [, expression2]*)', '默认情况下或使用ALL时，返回表达式不为空的输入行数。对每个值的唯一实例使用DISTINCT。', 'COUNT( DISTINCT ${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (195, 'Function', '内置函数', '聚合函数', 'COUNT(*)\r\nCOUNT(1)', '返回输入行数。', 'COUNT(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (196, 'Function', '内置函数', '聚合函数', 'AVG([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，返回表达式在所有输入行中的平均值(算术平均值)。对每个值的唯一实例使用DISTINCT。', 'AVG(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (197, 'Function', '内置函数', '聚合函数', 'SUM([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，返回所有输入行表达式的和。对每个值的唯一实例使用DISTINCT。', 'SUM(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (198, 'Function', '内置函数', '聚合函数', 'MAX([ ALL | DISTINCT ] expression)', '默认情况下或使用关键字ALL，返回表达式在所有输入行中的最大值。对每个值的唯一实例使用DISTINCT。', 'MAX(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (199, 'Function', '内置函数', '聚合函数', 'MIN([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，返回表达式在所有输入行中的最小值。对每个值的唯一实例使用DISTINCT。', 'MIN(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (200, 'Function', '内置函数', '聚合函数', 'STDDEV_POP([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，返回表达式在所有输入行中的总体标准差。对每个值的唯一实例使用DISTINCT。', 'STDDEV_POP(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (201, 'Function', '内置函数', '聚合函数', 'STDDEV_SAMP([ ALL | DISTINCT ] expression)', '默认情况下或使用关键字ALL时，返回表达式在所有输入行中的样本标准差。对每个值的唯一实例使用DISTINCT。', 'STDDEV_SAMP(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (202, 'Function', '内置函数', '聚合函数', 'VAR_POP([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，返回表达式在所有输入行中的总体方差(总体标准差的平方)。对每个值的唯一实例使用DISTINCT。', 'VAR_POP(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (203, 'Function', '内置函数', '聚合函数', 'VAR_SAMP([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，返回表达式在所有输入行中的样本方差(样本标准差的平方)。对每个值的唯一实例使用DISTINCT。', 'VAR_SAMP(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (204, 'Function', '内置函数', '聚合函数', 'COLLECT([ ALL | DISTINCT ] expression)', '默认情况下，或使用关键字ALL，跨所有输入行返回表达式的多集。空值将被忽略。对每个值的唯一实例使用DISTINCT。', 'COLLECT(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (205, 'Function', '内置函数', '聚合函数', 'VARIANCE([ ALL | DISTINCT ] expression)', 'VAR_SAMP的同义词。仅在blink planner中支持。', 'VARIANCE(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (206, 'Function', '内置函数', '聚合函数', 'RANK()', '返回值在一组值中的秩。结果是1加上分区顺序中位于当前行之前或等于当前行的行数。这些值将在序列中产生空白。仅在blink planner中支持。', 'RANK()', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (207, 'Function', '内置函数', '聚合函数', 'DENSE_RANK()', '返回值在一组值中的秩。结果是1加上前面分配的秩值。与函数rank不同，dense_rank不会在排序序列中产生空隙。仅在blink planner中支持。', 'DENSE_RANK()', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (208, 'Function', '内置函数', '聚合函数', 'ROW_NUMBER()', '根据窗口分区中的行顺序，为每一行分配一个惟一的连续数字，从1开始。仅在blink planner中支持。', 'ROW_NUMBER()', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (209, 'Function', '内置函数', '聚合函数', 'LEAD(expression [, offset] [, default] )', '返回表达式在窗口中当前行之前的偏移行上的值。offset的默认值是1,default的默认值是NULL。仅在blink planner中支持。', 'LEAD(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (210, 'Function', '内置函数', '聚合函数', 'LAG(expression [, offset] [, default])', '返回表达式的值，该值位于窗口中当前行之后的偏移行。offset的默认值是1,default的默认值是NULL。仅在blink planner中支持。', 'LAG(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (211, 'Function', '内置函数', '聚合函数', 'FIRST_VALUE(expression)', '返回一组有序值中的第一个值。仅在blink planner中支持。', 'FIRST_VALUE(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (212, 'Function', '内置函数', '聚合函数', 'LAST_VALUE(expression)', '返回一组有序值中的最后一个值。仅在blink planner中支持。', 'LAST_VALUE(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (213, 'Function', '内置函数', '聚合函数', 'LISTAGG(expression [, separator])', '连接字符串表达式的值，并在它们之间放置分隔符值。分隔符没有添加在字符串的末尾。分隔符的默认值是\'，\'。仅在blink planner中支持。', 'LISTAGG(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (214, 'Function', '内置函数', '列函数', 'withColumns(…)', '选择的列', 'withColumns(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (215, 'Function', '内置函数', '列函数', 'withoutColumns(…)', '不选择的列', 'withoutColumns(${1:})', '1.12', 0, 1, '2021-02-22 15:46:48', '2021-02-22 15:47:21', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (216, 'Function', '内置函数', '比较函数', 'value1 = value2', '如果value1等于value2 返回true; 如果value1或value2为NULL，则返回UNKNOWN 。', '${1:} =${2:}', '1.12', 9, 1, '2021-02-22 10:06:49', '2021-02-24 09:40:30', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (217, 'Function', 'UDF', '表值聚合函数', 'TO_MAP(string1,object2[, string3])', '将非规则一维表转化为规则二维表，string1是key。string2是value。string3为非必填项，表示key的值域（维度），用英文逗号分割。', 'TO_MAP(${1:})', '1.12', 8, 1, '2021-05-20 19:59:22', '2021-05-20 20:00:54', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (218, 'Reference', '建表语句', 'Streaming', 'EXECUTE CDCSOURCE print', 'Whole library synchronization print', 'EXECUTE CDCSOURCE demo_print WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'10000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\.student,test\\.score\',\r\n  \'sink.connector\' = \'print\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:01:45', '2023-10-31 16:02:56', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (219, 'Reference', '建表语句', 'Streaming', 'EXECUTE CDCSOURCE doris', 'Whole library synchronization doris', 'EXECUTE CDCSOURCE demo_print WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'10000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\.student,test\\.score\',\r\n  \'sink.connector\' = \'print\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:02:21', '2023-10-31 16:03:09', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (220, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE demo_doris_schema_evolution', 'The entire library is synchronized to doris tape mode evolution', 'EXECUTE CDCSOURCE demo_doris_schema_evolution WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'10000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\.student,test\\.score\',\r\n  \'sink.connector\' = \'datastream-doris-schema-evolution\',\r\n  \'sink.fenodes\' = \'127.0.0.1:8030\',\r\n  \'sink.username\' = \'root\',\r\n  \'sink.password\' = \'123456\',\r\n  \'sink.doris.batch.size\' = \'1000\',\r\n  \'sink.sink.max-retries\' = \'1\',\r\n  \'sink.sink.batch.interval\' = \'60000\',\r\n  \'sink.sink.db\' = \'test\',\r\n  \'sink.table.identifier\' = \'${schemaName}.${tableName}\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:04:53', '2023-10-31 16:04:53', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (221, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE StarRocks ', 'The entire library is synchronized to StarRocks\r\n', 'EXECUTE CDCSOURCE demo_hudi WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'10000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'database-name\'=\'bigdata\',\r\n \'table-name\'=\'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\'=\'hudi\',\r\n \'sink.path\'=\'hdfs://nameservice1/data/hudi/${tableName}\',\r\n \'sink.hoodie.datasource.write.recordkey.field\'=\'${pkList}\',\r\n \'sink.hoodie.parquet.max.file.size\'=\'268435456\',\r\n \'sink.write.tasks\'=\'1\',\r\n \'sink.write.bucket_assign.tasks\'=\'2\',\r\n \'sink.write.precombine\'=\'true\',\r\n \'sink.compaction.async.enabled\'=\'true\',\r\n \'sink.write.task.max.size\'=\'1024\',\r\n \'sink.write.rate.limit\'=\'3000\',\r\n \'sink.write.operation\'=\'upsert\',\r\n \'sink.table.type\'=\'COPY_ON_WRITE\',\r\n \'sink.compaction.tasks\'=\'1\',\r\n \'sink.compaction.delta_seconds\'=\'20\',\r\n \'sink.compaction.async.enabled\'=\'true\',\r\n \'sink.read.streaming.skip_compaction\'=\'true\',\r\n \'sink.compaction.delta_commits\'=\'20\',\r\n \'sink.compaction.trigger.strategy\'=\'num_or_time\',\r\n \'sink.compaction.max_memory\'=\'500\',\r\n \'sink.changelog.enabled\'=\'true\',\r\n \'sink.read.streaming.enabled\'=\'true\',\r\n \'sink.read.streaming.check.interval\'=\'3\',\r\n \'sink.hive_sync.skip_ro_suffix\' = \'true\',\r\n \'sink.hive_sync.enable\'=\'true\',\r\n \'sink.hive_sync.mode\'=\'hms\',\r\n \'sink.hive_sync.metastore.uris\'=\'thrift://bigdata1:9083\',\r\n \'sink.hive_sync.db\'=\'qhc_hudi_ods\',\r\n \'sink.hive_sync.table\'=\'${tableName}\',\r\n \'sink.table.prefix.schema\'=\'true\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:05:50', '2023-10-31 16:08:53', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (222, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_mysql', 'The entire library is synchronized to mysql', 'EXECUTE CDCSOURCE demo_startrocks WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'3000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n  \'sink.connector\' = \'starrocks\',\r\n  \'sink.jdbc-url\' = \'jdbc:mysql://127.0.0.1:19035\',\r\n  \'sink.load-url\' = \'127.0.0.1:18035\',\r\n  \'sink.username\' = \'root\',\r\n  \'sink.password\' = \'123456\',\r\n  \'sink.sink.db\' = \'ods\',\r\n  \'sink.table.prefix\' = \'ods_\',\r\n  \'sink.table.lower\' = \'true\',\r\n  \'sink.database-name\' = \'ods\',\r\n  \'sink.table-name\' = \'${tableName}\',\r\n  \'sink.sink.properties.format\' = \'json\',\r\n  \'sink.sink.properties.strip_outer_array\' = \'true\',\r\n  \'sink.sink.max-retries\' = \'10\',\r\n  \'sink.sink.buffer-flush.interval-ms\' = \'15000\',\r\n  \'sink.sink.parallelism\' = \'1\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:07:08', '2023-10-31 16:08:46', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (223, 'Reference', '建表语句', 'Streaming', 'EXECUTE CDCSOURCE demo_doris', 'The entire library is synchronized to mysql', 'EXECUTE CDCSOURCE cdc_mysql WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\' = \'jdbc\',\r\n \'sink.url\' = \'jdbc:mysql://127.0.0.1:3306/test?characterEncoding=utf-8&useSSL=false\',\r\n \'sink.username\' = \'root\',\r\n \'sink.password\' = \'123456\',\r\n \'sink.sink.db\' = \'test\',\r\n \'sink.table.prefix\' = \'test_\',\r\n \'sink.table.lower\' = \'true\',\r\n \'sink.table-name\' = \'${tableName}\',\r\n \'sink.driver\' = \'com.mysql.jdbc.Driver\',\r\n \'sink.sink.buffer-flush.interval\' = \'2s\',\r\n \'sink.sink.buffer-flush.max-rows\' = \'100\',\r\n \'sink.sink.max-retries\' = \'5\',\r\n \'sink.auto.create\' = \'true\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:07:47', '2023-10-31 16:08:39', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (224, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_oracle', 'The entire library is synchronized to cdc_oracle', 'EXECUTE CDCSOURCE cdc_oracle WITH (\r\n \'connector\' = \'oracle-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'1521\',\r\n \'username\'=\'root\',\r\n \'password\'=\'123456\',\r\n \'database-name\'=\'ORCL\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'TEST\\..*\',\r\n \'connector\' = \'jdbc\',\r\n \'url\' = \'jdbc:oracle:thin:@127.0.0.1:1521:orcl\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'table-name\' = \'TEST2.${tableName}\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:08:30', '2023-10-31 16:08:30', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (225, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_kafka_one', 'The entire library is synchronized to a topic in kafka', 'EXECUTE CDCSOURCE cdc_kafka_one WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\'=\'datastream-kafka\',\r\n \'sink.topic\'=\'cdctest\',\r\n \'sink.brokers\'=\'bigdata2:9092,bigdata3:9092,bigdata4:9092\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:10:13', '2023-10-31 16:10:13', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (226, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_kafka_mul', 'The entire library is synchronized to a single topic in kafka', 'EXECUTE CDCSOURCE cdc_kafka_mul WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\'=\'datastream-kafka\',\r\n \'sink.brokers\'=\'bigdata2:9092,bigdata3:9092,bigdata4:9092\'\r\n)', 'All Versions', 0, 1, '2023-10-31 16:10:59', '2023-10-31 16:10:59', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (227, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_upsert_kafka', 'The entire library is synchronized to kafka primary key mode', 'EXECUTE CDCSOURCE cdc_upsert_kafka WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\' = \'upsert-kafka\',\r\n \'sink.topic\' = \'${tableName}\',\r\n \'sink.properties.bootstrap.servers\' = \'bigdata2:9092,bigdata3:9092,bigdata4:9092\',\r\n \'sink.key.format\' = \'json\',\r\n \'sink.value.format\' = \'json\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:12:14', '2023-10-31 16:12:14', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (228, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_postgresql ', 'The entire library is synchronized to postgresql', 'EXECUTE CDCSOURCE cdc_postgresql WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\' = \'jdbc\',\r\n \'sink.url\' = \'jdbc:postgresql://127.0.0.1:5432/test\',\r\n \'sink.username\' = \'test\',\r\n \'sink.password\' = \'123456\',\r\n \'sink.sink.db\' = \'test\',\r\n \'sink.table.prefix\' = \'test_\',\r\n \'sink.table.lower\' = \'true\',\r\n \'sink.table-name\' = \'${tableName}\',\r\n \'sink.driver\' = \'org.postgresql.Driver\',\r\n \'sink.sink.buffer-flush.interval\' = \'2s\',\r\n \'sink.sink.buffer-flush.max-rows\' = \'100\',\r\n \'sink.sink.max-retries\' = \'5\'\r\n)', 'All Versions', 0, 1, '2023-10-31 16:12:54', '2023-10-31 16:12:54', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (229, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE cdc_clickhouse', 'Sync the entire library to clickhouse', 'EXECUTE CDCSOURCE cdc_clickhouse WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'3000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'table-name\' = \'bigdata\\.products,bigdata\\.orders\',\r\n  \'sink.connector\' = \'clickhouse\',\r\n  \'sink.url\' = \'clickhouse://127.0.0.1:8123\',\r\n  \'sink.username\' = \'default\',\r\n  \'sink.password\' = \'123456\',\r\n  \'sink.sink.db\' = \'test\',\r\n  \'sink.table.prefix\' = \'test_\',\r\n  \'sink.table.lower\' = \'true\',\r\n  \'sink.database-name\' = \'test\',\r\n  \'sink.table-name\' = \'${tableName}\',\r\n  \'sink.sink.batch-size\' = \'500\',\r\n  \'sink.sink.flush-interval\' = \'1000\',\r\n  \'sink.sink.max-retries\' = \'3\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:13:33', '2023-10-31 16:13:33', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (230, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE mysql2hive', 'The entire library is synchronized to the sql-catalog of hive', 'EXECUTE CDCSOURCE mysql2hive WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'10000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\..*\',\r\n  \'sink.connector\' = \'sql-catalog\',\r\n  \'sink.catalog.name\' = \'hive\',\r\n  \'sink.catalog.type\' = \'hive\',\r\n  \'sink.default-database\' = \'hdb\',\r\n  \'sink.hive-conf-dir\' = \'/usr/local/dlink/hive-conf\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:14:31', '2023-10-31 16:14:31', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (231, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE  mysql2paimon', 'The entire library is synchronized to paimon', 'EXECUTE CDCSOURCE mysql2paimon WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'10000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\..*\',\r\n  \'sink.connector\' = \'sql-catalog\',\r\n  \'sink.catalog.name\' = \'fts\',\r\n  \'sink.catalog.type\' = \'table-store\',\r\n  \'sink.catalog.warehouse\'=\'file:/tmp/table_store\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:15:22', '2023-10-31 16:28:52', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (232, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE mysql2dinky_catalog', 'The entire library is synchronized to dinky\'s built-in catalog', 'EXECUTE CDCSOURCE mysql2dinky_catalog WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'10000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\..*\',\r\n  \'sink.connector\' = \'sql-catalog\',\r\n  \'sink.catalog.name\' = \'dlinkmysql\',\r\n  \'sink.catalog.type\' = \'dlink_mysql\',\r\n  \'sink.catalog.username\' = \'dlink\',\r\n  \'sink.catalog.password\' = \'dlink\',\r\n  \'sink.catalog.url\' = \'jdbc:mysql://127.0.0.1:3306/dlink?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC\',\r\n  \'sink.sink.db\' = \'default_database\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:16:22', '2023-10-31 16:16:22', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (233, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE mysql2multiple_sink', 'Synchronization of the entire library to multiple data sources (sink)', 'EXECUTE CDCSOURCE mysql2multiple_sink WITH (\r\n  \'connector\' = \'mysql-cdc\',\r\n  \'hostname\' = \'127.0.0.1\',\r\n  \'port\' = \'3306\',\r\n  \'username\' = \'root\',\r\n  \'password\' = \'123456\',\r\n  \'checkpoint\' = \'3000\',\r\n  \'scan.startup.mode\' = \'initial\',\r\n  \'parallelism\' = \'1\',\r\n  \'table-name\' = \'test\\.student,test\\.score\',\r\n  \'sink[0].connector\' = \'doris\',\r\n  \'sink[0].fenodes\' = \'127.0.0.1:8030\',\r\n  \'sink[0].username\' = \'root\',\r\n  \'sink[0].password\' = \'dw123456\',\r\n  \'sink[0].sink.batch.size\' = \'1\',\r\n  \'sink[0].sink.max-retries\' = \'1\',\r\n  \'sink[0].sink.batch.interval\' = \'60000\',\r\n  \'sink[0].sink.db\' = \'test\',\r\n  \'sink[0].table.prefix\' = \'ODS_\',\r\n  \'sink[0].table.upper\' = \'true\',\r\n  \'sink[0].table.identifier\' = \'${schemaName}.${tableName}\',\r\n  \'sink[0].sink.label-prefix\' = \'${schemaName}_${tableName}_1\',\r\n  \'sink[0].sink.enable-delete\' = \'true\',\r\n  \'sink[1].connector\'=\'datastream-kafka\',\r\n  \'sink[1].topic\'=\'cdc\',\r\n  \'sink[1].brokers\'=\'127.0.0.1:9092\'\r\n)', 'All Versions', 0, 1, '2023-10-31 16:17:27', '2023-10-31 16:17:27', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (234, 'Reference', '建表语句', 'Batch/Streaming', 'ADD JAR', 'ADD JAR', 'ADD JAR ${1:}; -- str path ', 'All Versions', 0, 1, '2023-10-31 16:19:52', '2023-10-31 16:23:16', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (235, 'Function', 'Other', 'Batch/Streaming', 'SHOW FRAGMENTS', 'SHOW FRAGMENTS', 'SHOW FRAGMENTS;', 'All Versions', 0, 1, '2023-10-31 16:20:30', '2023-10-31 16:20:30', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (236, 'Function', 'Other', 'Batch/Streaming', 'SHOW FRAGMENT var1', 'SHOW FRAGMENT var1', 'SHOW FRAGMENT ${1:};', 'All Versions', 0, 1, '2023-10-31 16:21:23', '2023-10-31 16:21:23', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (237, 'Reference', '建表语句', 'Batch/Streaming', 'EXECUTE CDCSOURCE demo_hudi', 'The entire library is synchronized to hudi', 'EXECUTE CDCSOURCE demo_hudi WITH (\r\n \'connector\' = \'mysql-cdc\',\r\n \'hostname\' = \'127.0.0.1\',\r\n \'port\' = \'3306\',\r\n \'username\' = \'root\',\r\n \'password\' = \'123456\',\r\n \'checkpoint\' = \'10000\',\r\n \'scan.startup.mode\' = \'initial\',\r\n \'parallelism\' = \'1\',\r\n \'database-name\'=\'bigdata\',\r\n \'table-name\'=\'bigdata\\.products,bigdata\\.orders\',\r\n \'sink.connector\'=\'hudi\',\r\n \'sink.path\'=\'hdfs://nameservice1/data/hudi/${tableName}\',\r\n \'sink.hoodie.datasource.write.recordkey.field\'=\'${pkList}\',\r\n \'sink.hoodie.parquet.max.file.size\'=\'268435456\',\r\n \'sink.write.tasks\'=\'1\',\r\n \'sink.write.bucket_assign.tasks\'=\'2\',\r\n \'sink.write.precombine\'=\'true\',\r\n \'sink.compaction.async.enabled\'=\'true\',\r\n \'sink.write.task.max.size\'=\'1024\',\r\n \'sink.write.rate.limit\'=\'3000\',\r\n \'sink.write.operation\'=\'upsert\',\r\n \'sink.table.type\'=\'COPY_ON_WRITE\',\r\n \'sink.compaction.tasks\'=\'1\',\r\n \'sink.compaction.delta_seconds\'=\'20\',\r\n \'sink.compaction.async.enabled\'=\'true\',\r\n \'sink.read.streaming.skip_compaction\'=\'true\',\r\n \'sink.compaction.delta_commits\'=\'20\',\r\n \'sink.compaction.trigger.strategy\'=\'num_or_time\',\r\n \'sink.compaction.max_memory\'=\'500\',\r\n \'sink.changelog.enabled\'=\'true\',\r\n \'sink.read.streaming.enabled\'=\'true\',\r\n \'sink.read.streaming.check.interval\'=\'3\',\r\n \'sink.hive_sync.skip_ro_suffix\' = \'true\',\r\n \'sink.hive_sync.enable\'=\'true\',\r\n \'sink.hive_sync.mode\'=\'hms\',\r\n \'sink.hive_sync.metastore.uris\'=\'thrift://bigdata1:9083\',\r\n \'sink.hive_sync.db\'=\'qhc_hudi_ods\',\r\n \'sink.hive_sync.table\'=\'${tableName}\',\r\n \'sink.table.prefix.schema\'=\'true\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:24:47', '2023-10-31 16:24:47', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (238, 'Reference', 'Other', 'Batch/Streaming', 'EXECUTE JAR ', 'EXECUTE JAR use sql', 'EXECUTE JAR WITH (\r\n\'uri\'=\'file:///opt/flink/lib/paimon-flink-1.16-0.5-20230818.001833-127.jar\',\r\n\'main-class\'=\'org.apache.paimon.flink.action.FlinkActions\',\r\n\'args\'=\'mysql-sync-table --warehouse hdfs:///save --database cdc-test --table cdc_test1 --primary-keys id --mysql-conf hostname=121.5.136.161 --mysql-conf port=3371 --mysql-conf username=root --mysql-conf password=dinky --mysql-conf database-name=cdc-test --mysql-conf table-name=table_1 --mysql-conf server-time-zone=Asia/Shanghai --table-conf bucket=4 --table-conf changelog-producer=input --table-conf sink.parallelism=1\',\r\n\'parallelism\'=\'\',\r\n\'savepoint-path\'=\'\'\r\n);', 'All Versions', 0, 1, '2023-10-31 16:27:53', '2023-10-31 16:27:53', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (239, 'Reference', '内置函数', 'Streaming', 'PRINT tablename', 'PRINT table data', 'PRINT ${1:}', 'All Versions', 0, 1, '2023-10-31 16:30:22', '2023-10-31 16:30:22', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (240, 'Reference', '建表语句', 'Batch/Streaming', 'CREATE TABLE Like', 'CREATE TABLE Like source table', 'DROP TABLE IF EXISTS sink_table;\r\nCREATE TABLE IF not EXISTS sink_table\r\nWITH (\r\n    \'topic\' = \'motor_vehicle_error\'\r\n)\r\nLIKE source_table;', 'All Versions', 0, 1, '2023-10-31 16:33:38', '2023-10-31 16:33:38', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (241, 'Reference', '建表语句', 'Batch/Streaming', 'CREATE TABLE like source_table EXCLUDING', 'CREATE TABLE like source_table EXCLUDING', 'DROP TABLE IF EXISTS sink_table;\r\nCREATE TABLE IF not EXISTS sink_table(\r\n     -- Add watermark definition\r\n    WATERMARK FOR order_time AS order_time - INTERVAL \'5\' SECOND\r\n)\r\nWITH (\r\n    \'topic\' = \'motor_vehicle_error\'\r\n)\r\nLIKE source_table (\r\n     -- Exclude everything besides the computed columns which we need to generate the watermark for.\r\n    -- We do not want to have the partitions or filesystem options as those do not apply to kafka.\r\n    EXCLUDING ALL\r\n    INCLUDING GENERATED\r\n);', 'All Versions', 0, 1, '2023-10-31 16:36:13', '2023-10-31 16:36:13', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (242, 'Reference', '建表语句', 'Batch/Streaming', 'CREATE TABLE ctas_kafka', 'CREATE TABLE ctas_kafka', 'CREATE TABLE my_ctas_table\r\nWITH (\r\n    \'connector\' = \'kafka\'\r\n)\r\nAS SELECT id, name, age FROM source_table WHERE mod(id, 10) = 0;', 'All Versions', 0, 1, '2023-10-31 16:37:33', '2023-10-31 16:47:17', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (243, 'Reference', '建表语句', 'Batch/Streaming', 'CREATE TABLE rtas_kafka', 'CREATE TABLE rtas_kafka', 'CREATE OR REPLACE TABLE my_ctas_table\r\nWITH (\r\n    \'connector\' = \'kafka\'\r\n)\r\nAS SELECT id, name, age FROM source_table WHERE mod(id, 10) = 0;', 'All Versions', 0, 1, '2023-10-31 16:41:46', '2023-10-31 16:43:29', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (244, 'Reference', '建表语句', 'Batch/Streaming', 'datagen job demo', 'datagen job demo', 'DROP TABLE IF EXISTS source_table3;\r\nCREATE TABLE IF NOT EXISTS source_table3(\r\n--订单id\r\n`order_id` BIGINT,\r\n--产品\r\n\r\n`product` BIGINT,\r\n--金额\r\n`amount` BIGINT,\r\n\r\n--支付时间\r\n`order_time` as CAST(CURRENT_TIMESTAMP AS TIMESTAMP(3)), -- `在这里插入代码片`\r\n--WATERMARK\r\nWATERMARK FOR order_time AS order_time - INTERVAL \'2\' SECOND\r\n) WITH(\r\n\'connector\' = \'datagen\',\r\n \'rows-per-second\' = \'1\',\r\n \'fields.order_id.min\' = \'1\',\r\n \'fields.order_id.max\' = \'2\',\r\n \'fields.amount.min\' = \'1\',\r\n \'fields.amount.max\' = \'10\',\r\n \'fields.product.min\' = \'1\',\r\n \'fields.product.max\' = \'2\'\r\n);\r\n\r\n-- SELECT * FROM source_table3 LIMIT 10;\r\n\r\nDROP TABLE IF EXISTS sink_table5;\r\nCREATE TABLE IF NOT EXISTS sink_table5(\r\n--产品\r\n`product` BIGINT,\r\n--金额\r\n`amount` BIGINT,\r\n--支付时间\r\n`order_time` TIMESTAMP(3),\r\n--1分钟时间聚合总数\r\n`one_minute_sum` BIGINT\r\n) WITH(\r\n\'connector\'=\'print\'\r\n);\r\n\r\nINSERT INTO sink_table5\r\nSELECT\r\nproduct,\r\namount,\r\norder_time,\r\nSUM(amount) OVER(\r\nPARTITION BY product\r\nORDER BY order_time\r\n-- 标识统计范围是1个 product 的最近 1 分钟的数据\r\nRANGE BETWEEN INTERVAL \'1\' MINUTE PRECEDING AND CURRENT ROW\r\n) as one_minute_sum\r\nFROM source_table3;', 'All Versions', 0, 1, '2023-11-15 15:42:16', '2023-11-15 15:42:16', NULL, NULL);
INSERT INTO `dinky_flink_document` VALUES (245, 'Property', '优化参数', 'Streaming', 'checkpoint config', 'checkpoint config', '-- 声明一些调优参数 (checkpoint 等相关配置)\r\nset \'execution.checkpointing.checkpoints-after-tasks-finish.enabled\' =\'true\';\r\nSET \'pipeline.operator-chaining\' = \'false\';\r\nset \'state.savepoints.dir\'=\'file:///opt/data/flink_cluster/savepoints\'; -- 目录自行修改\r\nset \'state.checkpoints.dir\'= \'file:///opt/data/flink_cluster/checkpoints\'; -- 目录自行修改\r\n-- set state.checkpoint-storage=\'filesystem\';\r\nset \'state.backend.type\'=\'rocksdb\';\r\nset \'execution.checkpointing.interval\'=\'60 s\';\r\nset \'state.checkpoints.num-retained\'=\'100\';\r\n-- 使 solt 均匀分布在 各个 TM 上\r\nset \'cluster.evenly-spread-out-slots\'=\'true\';', 'All Versions', 0, 1, '2023-11-15 15:57:42', '2023-11-15 15:57:42', NULL, NULL);

-- ----------------------------
-- Table structure for dinky_fragment
-- ----------------------------
DROP TABLE IF EXISTS `dinky_fragment`;
CREATE TABLE `dinky_fragment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'fragment name',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `fragment_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'fragment value',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'note',
  `enabled` tinyint NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fragment_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'fragment management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_fragment
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_git_project
-- ----------------------------
DROP TABLE IF EXISTS `dinky_git_project`;
CREATE TABLE `dinky_git_project`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `branch` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `private_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'keypath',
  `pom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `build_args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `code_type` tinyint NULL DEFAULT NULL COMMENT 'code type(1-java,2-python)',
  `type` tinyint NOT NULL COMMENT '1-http ,2-ssh',
  `last_build` datetime NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `build_state` tinyint NOT NULL DEFAULT 0 COMMENT '0-notStart 1-process 2-failed 3-success',
  `build_step` tinyint NOT NULL DEFAULT 0 COMMENT 'different from java and python, when build java project, the step value is as follows: 0: environment check 1: clone project 2: compile and build 3: get artifact 4: analyze UDF 5: finish; when build python project, the step value is as follows: 0: environment check 1: clone project 2: get artifact 3: analyze UDF 4: finish',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0-disable 1-enable',
  `udf_class_map_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'scan udf class',
  `order_line` int NOT NULL DEFAULT 1 COMMENT 'order',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  `operator` int NULL DEFAULT NULL COMMENT 'operator',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_git_project
-- ----------------------------
INSERT INTO `dinky_git_project` VALUES (1, 1, 'java-udf', 'https://github.com/zackyoungh/dinky-quickstart-java.git', 'master', NULL, NULL, NULL, NULL, '-P flink-1.14', 1, 1, NULL, NULL, 0, 0, 1, '[]', 1, '2023-12-25 12:05:01', '2023-12-25 12:05:01', NULL, NULL, NULL);
INSERT INTO `dinky_git_project` VALUES (2, 1, 'python-udf', 'https://github.com/zackyoungh/dinky-quickstart-python.git', 'master', NULL, NULL, NULL, NULL, '', 2, 1, NULL, NULL, 0, 0, 1, '[]', 2, '2023-12-25 12:05:01', '2023-12-25 12:05:01', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dinky_history
-- ----------------------------
DROP TABLE IF EXISTS `dinky_history`;
CREATE TABLE `dinky_history`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `cluster_id` int NOT NULL DEFAULT 0 COMMENT 'cluster ID',
  `cluster_configuration_id` int NULL DEFAULT NULL COMMENT 'cluster configuration id',
  `session` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'session',
  `job_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Job ID',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Job Name',
  `job_manager_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JJobManager Address',
  `status` int NOT NULL DEFAULT 0 COMMENT 'status',
  `batch_model` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'is batch model',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'job type',
  `statement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'statement set',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'error message',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'result set',
  `config_json` json NULL COMMENT 'config json',
  `start_time` datetime NULL DEFAULT NULL COMMENT 'job start time',
  `end_time` datetime NULL DEFAULT NULL COMMENT 'job end time',
  `task_id` int NULL DEFAULT NULL COMMENT 'task ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task_index`(`task_id` ASC) USING BTREE,
  INDEX `cluster_index`(`cluster_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'execution history' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_history
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_job_history
-- ----------------------------
DROP TABLE IF EXISTS `dinky_job_history`;
CREATE TABLE `dinky_job_history`  (
  `id` int NOT NULL COMMENT 'id',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `job_json` json NULL COMMENT 'Job information json',
  `exceptions_json` json NULL COMMENT 'error message json',
  `checkpoints_json` json NULL COMMENT 'checkpoints json',
  `checkpoints_config_json` json NULL COMMENT 'checkpoints configuration json',
  `config_json` json NULL COMMENT 'configuration',
  `cluster_json` json NULL COMMENT 'cluster instance configuration',
  `cluster_configuration_json` json NULL COMMENT 'cluster config',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Job history details' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_job_history
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_job_instance
-- ----------------------------
DROP TABLE IF EXISTS `dinky_job_instance`;
CREATE TABLE `dinky_job_instance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'job instance name',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `task_id` int NULL DEFAULT NULL COMMENT 'task ID',
  `step` int NULL DEFAULT NULL COMMENT 'job lifecycle',
  `cluster_id` int NULL DEFAULT NULL COMMENT 'cluster ID',
  `jid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Flink JobId',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'job instance status',
  `history_id` int NULL DEFAULT NULL COMMENT 'execution history ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `finish_time` datetime NULL DEFAULT NULL COMMENT 'finish time',
  `duration` bigint NULL DEFAULT NULL COMMENT 'job duration',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'error logs',
  `failed_restart_count` int NULL DEFAULT NULL COMMENT 'failed restart count',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  `operator` int NULL DEFAULT NULL COMMENT 'operator user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `job_instance_un_idx1`(`tenant_id` ASC, `name` ASC, `task_id` ASC, `history_id` ASC) USING BTREE,
  INDEX `job_instance_task_id_idx1`(`task_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'job instance' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_job_instance
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_metrics
-- ----------------------------
DROP TABLE IF EXISTS `dinky_metrics`;
CREATE TABLE `dinky_metrics`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `task_id` int NULL DEFAULT NULL COMMENT 'task id',
  `vertices` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'vertices',
  `metrics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'metrics',
  `position` int NULL DEFAULT NULL COMMENT 'position',
  `show_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'show type',
  `show_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'show size',
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'title',
  `layout_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'layout name',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'metrics layout' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_metrics
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_resources
-- ----------------------------
DROP TABLE IF EXISTS `dinky_resources`;
CREATE TABLE `dinky_resources`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'key',
  `file_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'file name',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL COMMENT 'user id',
  `type` tinyint NULL DEFAULT NULL COMMENT 'resource type,0:FILE，1:UDF',
  `size` bigint NULL DEFAULT NULL COMMENT 'resource size',
  `pid` int NULL DEFAULT NULL,
  `full_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `is_directory` tinyint NULL DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dinky_resources_un`(`full_name` ASC, `type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_resources
-- ----------------------------
INSERT INTO `dinky_resources` VALUES (1, 'Root', 'main folder', 1, 0, 118499600, -1, '/', 1, '2023-12-25 12:05:01', '2024-01-18 09:11:00', NULL, 1);
INSERT INTO `dinky_resources` VALUES (12, 'flink-connector-jdbc-3.0.0-1.16.jar', NULL, NULL, 0, 247854, 1, '//flink-connector-jdbc-3.0.0-1.16.jar', 0, '2024-01-18 09:10:59', '2024-01-18 09:10:59', 1, 1);

-- ----------------------------
-- Table structure for dinky_role
-- ----------------------------
DROP TABLE IF EXISTS `dinky_role`;
CREATE TABLE `dinky_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` int NOT NULL COMMENT 'tenant id',
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'role code',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'role name',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'is delete',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'note',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_un_idx1`(`role_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'role' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_role
-- ----------------------------
INSERT INTO `dinky_role` VALUES (1, 1, 'SuperAdmin', 'SuperAdmin', 0, 'SuperAdmin of Role', '2022-12-13 05:27:19', '2022-12-13 05:27:19');
INSERT INTO `dinky_role` VALUES (2, 1, 'user', '用户', 0, NULL, '2023-12-26 09:56:08', '2023-12-26 09:56:08');

-- ----------------------------
-- Table structure for dinky_row_permissions
-- ----------------------------
DROP TABLE IF EXISTS `dinky_row_permissions`;
CREATE TABLE `dinky_row_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int NOT NULL COMMENT 'role id',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'table name',
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'expression',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'row permissions of select' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_row_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_savepoints
-- ----------------------------
DROP TABLE IF EXISTS `dinky_savepoints`;
CREATE TABLE `dinky_savepoints`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` int NOT NULL COMMENT 'task ID',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'task name',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'savepoint type',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'savepoint path',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'job savepoint management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_savepoints
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `dinky_sys_config`;
CREATE TABLE `dinky_sys_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'configuration name',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'configuration value',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'system configuration' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_sys_config
-- ----------------------------
INSERT INTO `dinky_sys_config` VALUES (1, 'sys.dolphinscheduler.settings.enable', 'false', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (2, 'sys.dolphinscheduler.settings.url', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (3, 'sys.dolphinscheduler.settings.token', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (4, 'sys.dolphinscheduler.settings.projectName', 'Dinky', '2023-12-25 14:21:52', '2024-01-12 11:58:18');
INSERT INTO `dinky_sys_config` VALUES (5, 'sys.env.settings.pythonHome', 'python3', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (6, 'sys.env.settings.dinkyAddr', '192.168.2.35:8888', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (7, 'sys.env.settings.maxRetainCount', '10', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (8, 'sys.env.settings.maxRetainDays', '30', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (9, 'sys.flink.settings.useRestAPI', 'false', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (10, 'sys.flink.settings.sqlSeparator', ';\\n', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (11, 'sys.flink.settings.jobIdWait', '30', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (12, 'sys.ldap.settings.url', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (13, 'sys.ldap.settings.userDn', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (14, 'sys.ldap.settings.userPassword', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (15, 'sys.ldap.settings.timeLimit', '30', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (16, 'sys.ldap.settings.baseDn', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (17, 'sys.ldap.settings.filter', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (18, 'sys.ldap.settings.autoload', 'true', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (19, 'sys.ldap.settings.defaultTeant', 'DefaultTenant', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (20, 'sys.ldap.settings.castUsername', 'cn', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (21, 'sys.ldap.settings.castNickname', 'sn', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (22, 'sys.ldap.settings.enable', 'false', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (23, 'sys.maven.settings.settingsFilePath', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (24, 'sys.maven.settings.repository', 'https://maven.aliyun.com/nexus/content/repositories/central', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (25, 'sys.maven.settings.repositoryUser', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (26, 'sys.maven.settings.repositoryPassword', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (27, 'sys.metrics.settings.sys.enable', 'false', '2023-12-25 14:21:52', '2023-12-26 11:06:33');
INSERT INTO `dinky_sys_config` VALUES (28, 'sys.metrics.settings.sys.gatherTiming', '3000', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (29, 'sys.metrics.settings.flink.gatherTiming', '3000', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (30, 'sys.metrics.settings.flink.gatherTimeout', '1000', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (31, 'sys.resource.settings.base.enable', 'true', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (32, 'sys.resource.settings.base.model', 'OSS', '2023-12-25 14:21:52', '2024-01-18 11:55:24');
INSERT INTO `dinky_sys_config` VALUES (33, 'sys.resource.settings.base.upload.base.path', '/home/dinky', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (34, 'sys.resource.settings.oss.endpoint', 'http://192.168.100.133:32141', '2023-12-25 14:21:52', '2024-01-18 09:10:12');
INSERT INTO `dinky_sys_config` VALUES (35, 'sys.resource.settings.oss.accessKey', '1cWuECFnmB6LT8nHkEvR', '2023-12-25 14:21:52', '2024-01-18 12:19:52');
INSERT INTO `dinky_sys_config` VALUES (36, 'sys.resource.settings.oss.secretKey', 'MHMvumqgb14a2bzwQ8ckiOFO6gSYBE4xDW4nVavr', '2023-12-25 14:21:52', '2024-01-18 12:19:58');
INSERT INTO `dinky_sys_config` VALUES (37, 'sys.resource.settings.oss.bucketName', 'dinky', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (38, 'sys.resource.settings.oss.region', '', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (39, 'sys.resource.settings.hdfs.root.user', 'hdfs', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (40, 'sys.resource.settings.hdfs.fs.defaultFS', 'file:///', '2023-12-25 14:21:52', '2023-12-25 14:21:52');
INSERT INTO `dinky_sys_config` VALUES (41, 'sys.resource.settings.oss.path.style.access', 'false', '2023-12-25 14:21:52', '2024-01-18 12:23:34');

-- ----------------------------
-- Table structure for dinky_sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `dinky_sys_login_log`;
CREATE TABLE `dinky_sys_login_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'key',
  `user_id` int NOT NULL COMMENT 'user id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'username',
  `login_type` int NOT NULL COMMENT 'login type（0:LOCAL,1:LDAP）',
  `ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ip addr',
  `status` int NOT NULL COMMENT 'login status',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'status msg',
  `access_time` datetime NULL DEFAULT NULL COMMENT 'access time',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'system login log record' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `dinky_sys_menu`;
CREATE TABLE `dinky_sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT ' id',
  `parent_id` bigint NOT NULL COMMENT 'parent menu id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'menu button name',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'routing path',
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'routing component component',
  `perms` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'authority id',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'icon',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'type(M:directory C:menu F:button)',
  `display` tinyint NOT NULL DEFAULT 1 COMMENT 'whether the menu is displayed',
  `order_num` int NULL DEFAULT NULL COMMENT 'sort',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'modify time',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_sys_menu
-- ----------------------------
INSERT INTO `dinky_sys_menu` VALUES (1, -1, '首页', '/home', './Home', 'home', 'HomeOutlined', 'C', 0, 1, '2023-08-11 14:06:52', '2023-09-25 18:26:45', NULL);
INSERT INTO `dinky_sys_menu` VALUES (2, -1, '运维中心', '/devops', NULL, 'devops', 'ControlOutlined', 'M', 0, 20, '2023-08-11 14:06:52', '2023-09-26 14:53:34', NULL);
INSERT INTO `dinky_sys_menu` VALUES (3, -1, '注册中心', '/registration', NULL, 'registration', 'AppstoreOutlined', 'M', 0, 23, '2023-08-11 14:06:52', '2023-09-26 14:54:03', NULL);
INSERT INTO `dinky_sys_menu` VALUES (4, -1, '认证中心', '/auth', NULL, 'auth', 'SafetyCertificateOutlined', 'M', 0, 79, '2023-08-11 14:06:52', '2023-09-26 15:08:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (5, -1, '数据开发', '/datastudio', './DataStudio', 'datastudio', 'CodeOutlined', 'C', 0, 4, '2023-08-11 14:06:52', '2023-09-26 14:49:12', NULL);
INSERT INTO `dinky_sys_menu` VALUES (6, -1, '配置中心', '/settings', NULL, 'settings', 'SettingOutlined', 'M', 0, 115, '2023-08-11 14:06:53', '2023-09-26 15:16:03', NULL);
INSERT INTO `dinky_sys_menu` VALUES (7, -1, '关于', '/about', './Other/About', 'about', 'SmileOutlined', 'C', 0, 143, '2023-08-11 14:06:53', '2023-09-26 15:21:21', NULL);
INSERT INTO `dinky_sys_menu` VALUES (8, -1, '监控', '/metrics', './Metrics', 'metrics', 'DashboardOutlined', 'C', 0, 140, '2023-08-11 14:06:53', '2023-09-26 15:20:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (9, 3, '集群', '/registration/cluster', NULL, 'registration:cluster', 'GoldOutlined', 'M', 0, 24, '2023-08-11 14:06:54', '2023-09-26 14:54:19', NULL);
INSERT INTO `dinky_sys_menu` VALUES (10, 3, '数据源', '/registration/datasource', './RegCenter/DataSource', 'registration:datasource', 'DatabaseOutlined', 'M', 0, 37, '2023-08-11 14:06:54', '2023-09-26 14:59:31', NULL);
INSERT INTO `dinky_sys_menu` VALUES (11, -1, '个人中心', '/account/center', './Other/PersonCenter', 'account:center', 'UserOutlined', 'C', 0, 144, '2023-08-11 14:06:54', '2023-09-26 15:21:29', NULL);
INSERT INTO `dinky_sys_menu` VALUES (12, 3, '告警', '/registration/alert', NULL, 'registration:alert', 'AlertOutlined', 'M', 0, 43, '2023-08-11 14:06:54', '2023-09-26 15:01:32', NULL);
INSERT INTO `dinky_sys_menu` VALUES (13, 3, '文档', '/registration/document', './RegCenter/Document', 'registration:document', 'BookOutlined', 'C', 0, 55, '2023-08-11 14:06:54', '2023-09-26 15:03:59', NULL);
INSERT INTO `dinky_sys_menu` VALUES (14, 3, '全局变量', '/registration/fragment', './RegCenter/GlobalVar', 'registration:fragment', 'RocketOutlined', 'C', 0, 59, '2023-08-11 14:06:54', '2023-09-26 15:04:55', NULL);
INSERT INTO `dinky_sys_menu` VALUES (15, 3, 'Git 项目', '/registration/gitproject', './RegCenter/GitProject', 'registration:gitproject', 'GithubOutlined', 'C', 0, 63, '2023-08-11 14:06:54', '2023-09-26 15:05:37', NULL);
INSERT INTO `dinky_sys_menu` VALUES (16, 3, 'UDF 模版', '/registration/udf', './RegCenter/UDF', 'registration:udf', 'ToolOutlined', 'C', 0, 69, '2023-08-11 14:06:54', '2023-09-26 15:06:40', NULL);
INSERT INTO `dinky_sys_menu` VALUES (17, 2, 'job-detail', '/devops/job-detail', './DevOps/JobDetail', 'devops:job-detail', 'InfoCircleOutlined', 'C', 0, 22, '2023-08-11 14:06:54', '2023-09-26 14:53:53', NULL);
INSERT INTO `dinky_sys_menu` VALUES (18, 2, 'job', '/devops/joblist', './DevOps', 'devops:joblist', 'AppstoreFilled', 'C', 0, 21, '2023-08-11 14:06:54', '2023-09-26 14:53:43', NULL);
INSERT INTO `dinky_sys_menu` VALUES (19, 3, '资源中心', '/registration/resource', './RegCenter/Resource', 'registration:resource', 'FileZipOutlined', 'C', 0, 73, '2023-08-11 14:06:54', '2023-09-26 15:07:25', NULL);
INSERT INTO `dinky_sys_menu` VALUES (20, 4, '角色', '/auth/role', './AuthCenter/Role', 'auth:role', 'TeamOutlined', 'C', 0, 88, '2023-08-11 14:06:54', '2023-09-26 15:10:19', NULL);
INSERT INTO `dinky_sys_menu` VALUES (21, 4, '用户', '/auth/user', './AuthCenter/User', 'auth:user', 'UserOutlined', 'C', 0, 80, '2023-08-11 14:06:54', '2023-09-26 15:08:51', NULL);
INSERT INTO `dinky_sys_menu` VALUES (22, 4, '菜单', '/auth/menu', './AuthCenter/Menu', 'auth:menu', 'MenuOutlined', 'C', 0, 94, '2023-08-11 14:06:54', '2023-09-26 15:11:34', NULL);
INSERT INTO `dinky_sys_menu` VALUES (23, 4, '租户', '/auth/tenant', './AuthCenter/Tenant', 'auth:tenant', 'SecurityScanOutlined', 'C', 0, 104, '2023-08-11 14:06:54', '2023-09-26 15:13:35', NULL);
INSERT INTO `dinky_sys_menu` VALUES (24, 6, '全局设置', '/settings/globalsetting', './SettingCenter/GlobalSetting', 'settings:globalsetting', 'SettingOutlined', 'C', 0, 116, '2023-08-11 14:06:54', '2023-09-26 15:16:12', NULL);
INSERT INTO `dinky_sys_menu` VALUES (25, 6, '系统日志', '/settings/systemlog', './SettingCenter/SystemLogs', 'settings:systemlog', 'InfoCircleOutlined', 'C', 0, 131, '2023-08-11 14:06:55', '2023-09-26 15:18:53', NULL);
INSERT INTO `dinky_sys_menu` VALUES (26, 6, '进程', '/settings/process', './SettingCenter/Process', 'settings:process', 'ReconciliationOutlined', 'C', 0, 135, '2023-08-11 14:06:55', '2023-09-26 15:19:35', NULL);
INSERT INTO `dinky_sys_menu` VALUES (27, 4, '行权限', '/auth/rowpermissions', './AuthCenter/RowPermissions', 'auth:rowpermissions', 'SafetyCertificateOutlined', 'C', 0, 100, '2023-08-11 14:06:55', '2023-09-26 15:12:46', NULL);
INSERT INTO `dinky_sys_menu` VALUES (28, 9, 'Flink 实例', '/registration/cluster/instance', './RegCenter/Cluster/Instance', 'registration:cluster:instance', 'ReconciliationOutlined', 'C', 0, 25, '2023-08-11 14:06:55', '2023-09-26 14:54:29', NULL);
INSERT INTO `dinky_sys_menu` VALUES (29, 12, '告警组', '/registration/alert/group', './RegCenter/Alert/AlertGroup', 'registration:alert:group', 'AlertOutlined', 'C', 0, 48, '2023-08-11 14:06:55', '2023-09-26 15:02:23', NULL);
INSERT INTO `dinky_sys_menu` VALUES (30, 9, '集群配置', '/registration/cluster/config', './RegCenter/Cluster/Configuration', 'registration:cluster:config', 'SettingOutlined', 'C', 0, 31, '2023-08-11 14:06:55', '2023-09-26 14:57:57', NULL);
INSERT INTO `dinky_sys_menu` VALUES (31, 12, '告警实例', '/registration/alert/instance', './RegCenter/Alert/AlertInstance', 'registration:alert:instance', 'AlertFilled', 'C', 0, 44, '2023-08-11 14:06:55', '2023-09-26 15:01:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (32, 1, '作业监控', '/home/jobOverView', 'JobOverView', 'home:jobOverView', 'AntCloudOutlined', 'F', 0, 2, '2023-08-15 16:52:59', '2023-09-26 14:48:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (33, 1, '数据开发', '/home/devOverView', 'DevOverView', 'home:devOverView', 'AimOutlined', 'F', 0, 3, '2023-08-15 16:54:47', '2023-09-26 14:49:00', NULL);
INSERT INTO `dinky_sys_menu` VALUES (34, 5, '项目列表', '/datastudio/left/project', NULL, 'datastudio:left:project', 'ConsoleSqlOutlined', 'F', 0, 5, '2023-09-01 18:00:39', '2023-09-26 14:49:31', NULL);
INSERT INTO `dinky_sys_menu` VALUES (35, 5, '数据源', '/datastudio/left/datasource', NULL, 'datastudio:left:datasource', 'TableOutlined', 'F', 0, 7, '2023-09-01 18:01:09', '2023-09-26 14:49:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (36, 5, 'catalog', '/datastudio/left/catalog', NULL, 'datastudio:left:structure', 'DatabaseOutlined', 'F', 0, 6, '2023-09-01 18:01:30', '2023-09-26 14:49:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (37, 5, '作业配置', '/datastudio/right/jobConfig', NULL, 'datastudio:right:jobConfig', 'SettingOutlined', 'F', 0, 8, '2023-09-01 18:02:15', '2023-09-26 14:50:24', NULL);
INSERT INTO `dinky_sys_menu` VALUES (38, 5, '预览配置', '/datastudio/right/previewConfig', NULL, 'datastudio:right:previewConfig', 'InsertRowRightOutlined', 'F', 0, 9, '2023-09-01 18:03:08', '2023-09-26 14:50:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (39, 5, '版本历史', '/datastudio/right/historyVision', NULL, 'datastudio:right:historyVision', 'HistoryOutlined', 'F', 0, 10, '2023-09-01 18:03:29', '2023-09-26 14:51:03', NULL);
INSERT INTO `dinky_sys_menu` VALUES (40, 5, '保存点', '/datastudio/right/savePoint', NULL, 'datastudio:right:savePoint', 'FolderOutlined', 'F', 0, 11, '2023-09-01 18:03:58', '2023-09-26 14:51:13', NULL);
INSERT INTO `dinky_sys_menu` VALUES (41, 5, '作业信息', '/datastudio/right/jobInfo', NULL, 'datastudio:right:jobInfo', 'InfoCircleOutlined', 'F', 0, 8, '2023-09-01 18:04:31', '2023-09-25 18:26:45', NULL);
INSERT INTO `dinky_sys_menu` VALUES (42, 5, '控制台', '/datastudio/bottom/console', NULL, 'datastudio:bottom:console', 'ConsoleSqlOutlined', 'F', 0, 12, '2023-09-01 18:04:56', '2023-09-26 14:51:24', NULL);
INSERT INTO `dinky_sys_menu` VALUES (43, 5, '结果', '/datastudio/bottom/result', NULL, 'datastudio:bottom:result', 'SearchOutlined', 'F', 0, 13, '2023-09-01 18:05:16', '2023-09-26 14:51:36', NULL);
INSERT INTO `dinky_sys_menu` VALUES (44, 5, 'BI', '/datastudio/bottom/bi', NULL, 'datastudio:bottom:bi', 'DashboardOutlined', 'F', 0, 14, '2023-09-01 18:05:43', '2023-09-26 14:51:45', NULL);
INSERT INTO `dinky_sys_menu` VALUES (45, 5, '血缘', '/datastudio/bottom/lineage', NULL, 'datastudio:bottom:lineage', 'PushpinOutlined', 'F', 0, 15, '2023-09-01 18:07:15', '2023-09-26 14:52:00', NULL);
INSERT INTO `dinky_sys_menu` VALUES (46, 5, '表数据监控', '/datastudio/bottom/process', NULL, 'datastudio:bottom:process', 'TableOutlined', 'F', 0, 16, '2023-09-01 18:07:55', '2023-09-26 14:52:38', NULL);
INSERT INTO `dinky_sys_menu` VALUES (47, 5, '小工具', '/datastudio/bottom/tool', NULL, 'datastudio:bottom:tool', 'ToolOutlined', 'F', 0, 17, '2023-09-01 18:08:18', '2023-09-26 14:53:04', NULL);
INSERT INTO `dinky_sys_menu` VALUES (48, 28, '新建', '/registration/cluster/instance/add', NULL, 'registration:cluster:instance:add', 'PlusOutlined', 'F', 0, 26, '2023-09-06 08:56:45', '2023-09-26 14:56:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (49, 28, '回收', '/registration/cluster/instance/recovery', NULL, 'registration:cluster:instance:recovery', 'DeleteFilled', 'F', 0, 29, '2023-09-06 08:57:30', '2023-09-26 14:56:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (50, 28, '编辑', '/registration/cluster/instance/edit', NULL, 'registration:cluster:instance:edit', 'EditOutlined', 'F', 0, 27, '2023-09-06 08:56:45', '2023-09-26 14:56:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (51, 28, '删除', '/registration/cluster/instance/delete', NULL, 'registration:cluster:instance:delete', 'DeleteOutlined', 'F', 0, 28, '2023-09-06 08:57:30', '2023-09-26 14:56:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (52, 30, '新建', '/registration/cluster/config/add', NULL, 'registration:cluster:config:add', 'PlusOutlined', 'F', 0, 32, '2023-09-06 09:00:31', '2023-09-26 14:58:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (53, 30, '编辑', '/registration/cluster/config/edit', NULL, 'registration:cluster:config:edit', 'EditOutlined', 'F', 0, 33, '2023-09-06 08:56:45', '2023-09-26 14:58:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (54, 30, '删除', '/registration/cluster/config/delete', NULL, 'registration:cluster:config:delete', 'DeleteOutlined', 'F', 0, 34, '2023-09-06 08:57:30', '2023-09-26 14:58:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (55, 10, '新建', '/registration/datasource/add', NULL, 'registration:datasource:add', 'PlusOutlined', 'F', 0, 38, '2023-09-06 09:01:05', '2023-09-26 15:00:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (56, 10, '编辑', '/registration/datasource/edit', NULL, 'registration:datasource:edit', 'EditOutlined', 'F', 0, 39, '2023-09-06 08:56:45', '2023-09-26 15:00:41', NULL);
INSERT INTO `dinky_sys_menu` VALUES (57, 10, '删除', '/registration/datasource/delete', NULL, 'registration:datasource:delete', 'DeleteOutlined', 'F', 0, 40, '2023-09-06 08:57:30', '2023-09-26 15:00:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (58, 31, '新建', '/registration/alert/instance/add', NULL, 'registration:alert:instance:add', 'PlusOutlined', 'F', 0, 46, '2023-09-06 09:01:05', '2023-09-26 15:02:04', NULL);
INSERT INTO `dinky_sys_menu` VALUES (59, 31, '编辑', '/registration/alert/instance/edit', NULL, 'registration:alert:instance:edit', 'EditOutlined', 'F', 0, 45, '2023-09-06 08:56:45', '2023-09-26 15:01:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (60, 31, '删除', '/registration/alert/instance/delete', NULL, 'registration:alert:instance:delete', 'DeleteOutlined', 'F', 0, 47, '2023-09-06 08:57:30', '2023-09-26 15:02:13', NULL);
INSERT INTO `dinky_sys_menu` VALUES (61, 29, '新建', '/registration/alert/group/add', NULL, 'registration:alert:group:add', 'PlusOutlined', 'F', 0, 49, '2023-09-06 09:01:05', '2023-09-26 15:02:48', NULL);
INSERT INTO `dinky_sys_menu` VALUES (62, 29, '编辑', '/registration/alert/group/edit', NULL, 'registration:alert:group:edit', 'EditOutlined', 'F', 0, 49, '2023-09-06 08:56:45', '2023-09-26 15:02:36', NULL);
INSERT INTO `dinky_sys_menu` VALUES (63, 29, '删除', '/registration/alert/group/delete', NULL, 'registration:alert:group:delete', 'DeleteOutlined', 'F', 0, 50, '2023-09-06 08:57:30', '2023-09-26 15:03:01', NULL);
INSERT INTO `dinky_sys_menu` VALUES (64, 13, '新建', '/registration/document/add', NULL, 'registration:document:add', 'PlusOutlined', 'F', 0, 57, '2023-09-06 09:01:05', '2023-09-26 15:04:22', NULL);
INSERT INTO `dinky_sys_menu` VALUES (65, 13, '编辑', '/registration/document/edit', NULL, 'registration:document:edit', 'EditOutlined', 'F', 0, 56, '2023-09-06 08:56:45', '2023-09-26 15:04:13', NULL);
INSERT INTO `dinky_sys_menu` VALUES (66, 13, '删除', '/registration/document/delete', NULL, 'registration:document:delete', 'DeleteOutlined', 'F', 0, 58, '2023-09-06 08:57:30', '2023-09-26 15:04:32', NULL);
INSERT INTO `dinky_sys_menu` VALUES (68, 14, '新建', '/registration/fragment/add', NULL, 'registration:fragment:add', 'PlusOutlined', 'F', 0, 61, '2023-09-06 09:01:05', '2023-09-26 15:05:13', NULL);
INSERT INTO `dinky_sys_menu` VALUES (69, 14, '编辑', '/registration/fragment/edit', NULL, 'registration:fragment:edit', 'EditOutlined', 'F', 0, 60, '2023-09-06 08:56:45', '2023-09-26 15:05:04', NULL);
INSERT INTO `dinky_sys_menu` VALUES (70, 14, '删除', '/registration/fragment/delete', NULL, 'registration:fragment:delete', 'DeleteOutlined', 'F', 0, 62, '2023-09-06 08:57:30', '2023-09-26 15:05:21', NULL);
INSERT INTO `dinky_sys_menu` VALUES (72, 15, '新建', '/registration/gitproject/add', NULL, 'registration:gitproject:add', 'PlusOutlined', 'F', 0, 65, '2023-09-06 09:01:05', '2023-09-26 15:06:01', NULL);
INSERT INTO `dinky_sys_menu` VALUES (73, 15, '编辑', '/registration/gitproject/edit', NULL, 'registration:gitproject:edit', 'EditOutlined', 'F', 0, 64, '2023-09-06 08:56:45', '2023-09-26 15:05:52', NULL);
INSERT INTO `dinky_sys_menu` VALUES (74, 15, '删除', '/registration/gitproject/delete', NULL, 'registration:gitproject:delete', 'DeleteOutlined', 'F', 0, 66, '2023-09-06 08:57:30', '2023-09-26 15:06:09', NULL);
INSERT INTO `dinky_sys_menu` VALUES (76, 15, '构建', '/registration/gitproject/build', NULL, 'registration:gitproject:build', 'PlaySquareOutlined', 'F', 0, 67, '2023-09-06 08:57:30', '2023-09-26 15:06:17', NULL);
INSERT INTO `dinky_sys_menu` VALUES (77, 15, '查看日志', '/registration/gitproject/showLog', NULL, 'registration:gitproject:showLog', 'SearchOutlined', 'F', 0, 68, '2023-09-06 08:57:30', '2023-09-26 15:06:26', NULL);
INSERT INTO `dinky_sys_menu` VALUES (78, 16, '新建', '/registration/udf/template/add', NULL, 'registration:udf:template:add', 'PlusOutlined', 'F', 0, 71, '2023-09-06 09:01:05', '2023-09-26 15:07:04', NULL);
INSERT INTO `dinky_sys_menu` VALUES (79, 16, '编辑', '/registration/udf/template/edit', NULL, 'registration:udf:template:edit', 'EditOutlined', 'F', 0, 70, '2023-09-06 08:56:45', '2023-09-26 15:06:48', NULL);
INSERT INTO `dinky_sys_menu` VALUES (80, 16, '删除', '/registration/udf/template/delete', NULL, 'registration:udf:template:delete', 'DeleteOutlined', 'F', 0, 72, '2023-09-06 08:57:30', '2023-09-26 15:07:12', NULL);
INSERT INTO `dinky_sys_menu` VALUES (82, 19, '上传', '/registration/resource/upload', NULL, 'registration:resource:upload', 'PlusOutlined', 'F', 0, 77, '2023-09-06 09:01:05', '2023-09-26 15:08:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (83, 19, '重命名', '/registration/resource/rename', NULL, 'registration:resource:rename', 'EditOutlined', 'F', 0, 75, '2023-09-06 08:56:45', '2023-09-26 15:07:45', NULL);
INSERT INTO `dinky_sys_menu` VALUES (84, 19, '删除', '/registration/resource/delete', NULL, 'registration:resource:delete', 'DeleteOutlined', 'F', 0, 76, '2023-09-06 08:57:30', '2023-09-26 15:07:54', NULL);
INSERT INTO `dinky_sys_menu` VALUES (85, 19, '创建文件夹', '/registration/resource/addFolder', NULL, 'registration:resource:addFolder', 'PlusOutlined', 'F', 0, 74, '2023-09-06 08:57:30', '2023-09-26 15:07:37', NULL);
INSERT INTO `dinky_sys_menu` VALUES (86, 4, 'Token 令牌', '/auth/token', './AuthCenter/Token', 'auth:token', 'SecurityScanFilled', 'C', 0, 111, '2023-09-05 23:14:23', '2023-09-26 15:15:22', NULL);
INSERT INTO `dinky_sys_menu` VALUES (87, 21, '添加', '/auth/user/add', NULL, 'auth:user:add', 'PlusOutlined', 'F', 0, 81, '2023-09-22 22:06:52', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (88, 21, '重置密码', '/auth/user/reset', NULL, 'auth:user:reset', 'RollbackOutlined', 'F', 0, 84, '2023-09-22 22:08:17', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (89, 21, '恢复用户', '/auth/user/recovery', NULL, 'auth:user:recovery', 'RadiusSettingOutlined', 'F', 0, 85, '2023-09-22 22:08:53', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (90, 21, '删除', '/auth/user/delete', NULL, 'auth:user:delete', 'DeleteOutlined', 'F', 0, 83, '2023-09-22 22:09:29', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (91, 21, '修改密码', '/auth/user/changePassword', NULL, 'auth:user:changePassword', 'EditOutlined', 'F', 0, 86, '2023-09-22 22:10:01', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (92, 21, '分配角色', '/auth/user/assignRole', NULL, 'auth:user:assignRole', 'ForwardOutlined', 'F', 0, 87, '2023-09-22 22:10:31', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (93, 21, '编辑', '/auth/user/edit', NULL, 'auth:user:edit', 'EditOutlined', 'F', 0, 82, '2023-09-22 22:11:41', '2023-09-26 15:09:49', NULL);
INSERT INTO `dinky_sys_menu` VALUES (94, 20, '添加', '/auth/role/add', NULL, 'auth:role:add', 'PlusOutlined', 'F', 0, 89, '2023-09-22 22:06:52', '2023-09-26 15:11:10', NULL);
INSERT INTO `dinky_sys_menu` VALUES (95, 20, '删除', '/auth/role/delete', NULL, 'auth:role:delete', 'DeleteOutlined', 'F', 0, 91, '2023-09-22 22:09:29', '2023-09-26 15:11:10', NULL);
INSERT INTO `dinky_sys_menu` VALUES (96, 20, '分配菜单', '/auth/role/assignMenu', NULL, 'auth:role:assignMenu', 'AntDesignOutlined', 'F', 0, 92, '2023-09-22 22:10:31', '2023-09-26 15:11:10', NULL);
INSERT INTO `dinky_sys_menu` VALUES (97, 20, '编辑', '/auth/role/edit', NULL, 'auth:role:edit', 'EditOutlined', 'F', 0, 90, '2023-09-22 22:11:41', '2023-09-26 15:11:10', NULL);
INSERT INTO `dinky_sys_menu` VALUES (98, 20, '查看用户列表', '/auth/role/viewUser', NULL, 'auth:role:viewUser', 'FundViewOutlined', 'F', 0, 93, '2023-09-22 22:11:41', '2023-09-26 15:11:10', NULL);
INSERT INTO `dinky_sys_menu` VALUES (99, 86, '添加 Token', '/auth/token/add', NULL, 'auth:token:add', 'PlusOutlined', 'F', 0, 112, '2023-09-22 22:11:41', '2023-09-26 15:15:46', NULL);
INSERT INTO `dinky_sys_menu` VALUES (100, 86, '删除 Token', '/auth/token/delete', NULL, 'auth:token:delete', 'DeleteOutlined', 'F', 0, 114, '2023-09-22 22:11:41', '2023-09-26 15:15:46', NULL);
INSERT INTO `dinky_sys_menu` VALUES (101, 86, '修改 Token', '/auth/token/edit', NULL, 'auth:token:edit', 'EditOutlined', 'F', 0, 113, '2023-09-22 22:11:41', '2023-09-26 15:15:46', NULL);
INSERT INTO `dinky_sys_menu` VALUES (102, 27, '添加', '/auth/rowPermissions/add', NULL, 'auth:rowPermissions:add', 'PlusOutlined', 'F', 0, 101, '2023-09-22 22:11:41', '2023-09-26 15:13:12', NULL);
INSERT INTO `dinky_sys_menu` VALUES (103, 27, '编辑', '/auth/rowPermissions/edit', NULL, 'auth:rowPermissions:edit', 'EditOutlined', 'F', 0, 102, '2023-09-22 22:11:41', '2023-09-26 15:13:12', NULL);
INSERT INTO `dinky_sys_menu` VALUES (104, 27, '删除', '/auth/rowPermissions/delete', NULL, 'auth:rowPermissions:delete', 'DeleteOutlined', 'F', 0, 103, '2023-09-22 22:11:41', '2023-09-26 15:13:12', NULL);
INSERT INTO `dinky_sys_menu` VALUES (105, 23, '添加', '/auth/tenant/add', NULL, 'auth:tenant:add', 'PlusOutlined', 'F', 0, 105, '2023-09-22 22:11:41', '2023-09-26 15:15:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (106, 23, '编辑', '/auth/tenant/edit', NULL, 'auth:tenant:edit', 'EditOutlined', 'F', 0, 106, '2023-09-22 22:11:41', '2023-09-26 15:15:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (107, 23, '删除', '/auth/tenant/delete', NULL, 'auth:tenant:delete', 'DeleteOutlined', 'F', 0, 107, '2023-09-22 22:11:41', '2023-09-26 15:15:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (108, 23, '分配用户', '/auth/tenant/assignUser', NULL, 'auth:tenant:assignUser', 'EuroOutlined', 'F', 0, 108, '2023-09-22 22:11:41', '2023-09-26 15:15:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (109, 23, '查看用户', '/auth/tenant/viewUser', NULL, 'auth:tenant:viewUser', 'FundViewOutlined', 'F', 0, 109, '2023-09-22 22:11:41', '2023-09-26 15:15:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (110, 23, '设置/取消租户管理员', '/auth/tenant/modifyTenantManager', NULL, 'auth:tenant:modifyTenantManager', 'ExclamationCircleOutlined', 'F', 0, 110, '2023-09-22 22:11:41', '2023-09-26 15:15:02', NULL);
INSERT INTO `dinky_sys_menu` VALUES (111, 22, '创建根菜单', '/auth/menu/createRoot', NULL, 'auth:menu:createRoot', 'FolderAddOutlined', 'F', 0, 95, '2023-09-22 22:11:41', '2023-09-26 15:12:26', NULL);
INSERT INTO `dinky_sys_menu` VALUES (112, 22, '刷新', '/auth/menu/refresh', NULL, 'auth:menu:refresh', 'ReloadOutlined', 'F', 0, 97, '2023-09-22 22:11:41', '2023-09-26 15:12:26', NULL);
INSERT INTO `dinky_sys_menu` VALUES (113, 22, '编辑', '/auth/menu/edit', NULL, 'auth:menu:edit', 'EditOutlined', 'F', 0, 98, '2023-09-22 22:11:41', '2023-09-26 15:12:26', NULL);
INSERT INTO `dinky_sys_menu` VALUES (114, 22, '添加子项', '/auth/menu/addSub', NULL, 'auth:menu:addSub', 'PlusOutlined', 'F', 0, 96, '2023-09-22 22:11:41', '2023-09-26 15:12:26', NULL);
INSERT INTO `dinky_sys_menu` VALUES (115, 22, '删除', '/auth/menu/delete', NULL, 'auth:menu:delete', 'DeleteOutlined', 'F', 0, 99, '2023-09-22 22:11:41', '2023-09-26 15:12:26', NULL);
INSERT INTO `dinky_sys_menu` VALUES (116, 6, '告警策略', '/settings/alertrule', './SettingCenter/AlertRule', 'settings:alertrule', 'AndroidOutlined', 'C', 0, 136, '2023-09-22 23:31:10', '2023-09-26 15:19:52', NULL);
INSERT INTO `dinky_sys_menu` VALUES (117, 116, '添加', '/settings/alertrule/add', NULL, 'settings:alertrule:add', 'PlusOutlined', 'F', 0, 137, '2023-09-22 23:34:51', '2023-09-26 15:20:03', NULL);
INSERT INTO `dinky_sys_menu` VALUES (118, 116, '删除', '/settings/alertrule/delete', NULL, 'settings:alertrule:delete', 'DeleteOutlined', 'F', 0, 139, '2023-09-22 23:35:20', '2023-09-26 15:20:21', NULL);
INSERT INTO `dinky_sys_menu` VALUES (119, 116, '编辑', '/settings/alertrule/edit', NULL, 'settings:alertrule:edit', 'EditOutlined', 'F', 0, 138, '2023-09-22 23:36:32', '2023-09-26 15:20:13', NULL);
INSERT INTO `dinky_sys_menu` VALUES (120, 8, 'Dinky 服务监控', '/metrics/server', './Metrics/Server', 'metrics:server', 'DashboardOutlined', 'F', 0, 141, '2023-09-22 23:37:43', '2023-09-26 15:21:00', NULL);
INSERT INTO `dinky_sys_menu` VALUES (121, 8, 'Flink 任务监控', '/metrics/job', './Metrics/Job', 'metrics:job', 'DashboardTwoTone', 'C', 0, 142, '2023-09-22 23:38:34', '2023-09-26 15:21:08', NULL);
INSERT INTO `dinky_sys_menu` VALUES (122, 24, 'Dinky 环境配置', '/settings/globalsetting/dinky', NULL, 'settings:globalsetting:dinky', 'SettingOutlined', 'C', 0, 117, '2023-09-22 23:40:30', '2023-09-26 15:16:20', NULL);
INSERT INTO `dinky_sys_menu` VALUES (123, 24, 'Flink 环境配置', '/settings/globalsetting/flink', NULL, 'settings:globalsetting:flink', 'SettingOutlined', 'C', 0, 119, '2023-09-22 23:40:30', '2023-09-26 15:16:40', NULL);
INSERT INTO `dinky_sys_menu` VALUES (124, 24, 'Maven 配置', '/settings/globalsetting/maven', NULL, 'settings:globalsetting:maven', 'SettingOutlined', 'C', 0, 121, '2023-09-22 23:40:30', '2023-09-26 15:17:04', NULL);
INSERT INTO `dinky_sys_menu` VALUES (125, 24, 'DolphinScheduler 配置', '/settings/globalsetting/ds', NULL, 'settings:globalsetting:ds', 'SettingOutlined', 'C', 0, 123, '2023-09-22 23:40:30', '2023-09-26 15:17:23', NULL);
INSERT INTO `dinky_sys_menu` VALUES (126, 24, 'LDAP 配置', '/settings/globalsetting/ldap', NULL, 'settings:globalsetting:ldap', 'SettingOutlined', 'C', 0, 125, '2023-09-22 23:40:30', '2023-09-26 15:17:41', NULL);
INSERT INTO `dinky_sys_menu` VALUES (127, 24, 'Metrics 配置', '/settings/globalsetting/metrics', NULL, 'settings:globalsetting:metrics', 'SettingOutlined', 'C', 0, 127, '2023-09-22 23:40:30', '2023-09-26 15:18:06', NULL);
INSERT INTO `dinky_sys_menu` VALUES (128, 24, 'Resource 配置', '/settings/globalsetting/resource', NULL, 'settings:globalsetting:resource', 'SettingOutlined', 'C', 0, 129, '2023-09-22 23:40:30', '2023-09-26 15:18:27', NULL);
INSERT INTO `dinky_sys_menu` VALUES (129, 122, '编辑', '/settings/globalsetting/dinky/edit', NULL, 'settings:globalsetting:dinky:edit', 'EditOutlined', 'F', 0, 118, '2023-09-22 23:44:18', '2023-09-26 15:16:29', NULL);
INSERT INTO `dinky_sys_menu` VALUES (130, 123, '编辑', '/settings/globalsetting/flink/edit', NULL, 'settings:globalsetting:flink:edit', 'EditOutlined', 'F', 0, 120, '2023-09-22 23:44:18', '2023-09-26 15:16:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (131, 124, '编辑', '/settings/globalsetting/maven/edit', NULL, 'settings:globalsetting:maven:edit', 'EditOutlined', 'F', 0, 122, '2023-09-22 23:44:18', '2023-09-26 15:17:13', NULL);
INSERT INTO `dinky_sys_menu` VALUES (132, 125, '编辑', '/settings/globalsetting/ds/edit', NULL, 'settings:globalsetting:ds:edit', 'EditOutlined', 'F', 0, 124, '2023-09-22 23:44:18', '2023-09-26 15:17:32', NULL);
INSERT INTO `dinky_sys_menu` VALUES (133, 126, '编辑', '/settings/globalsetting/ldap/edit', NULL, 'settings:globalsetting:ldap:edit', 'EditOutlined', 'F', 0, 126, '2023-09-22 23:44:18', '2023-09-26 15:17:51', NULL);
INSERT INTO `dinky_sys_menu` VALUES (134, 127, '编辑', '/settings/globalsetting/metrics/edit', NULL, 'settings:globalsetting:metrics:edit', 'EditOutlined', 'F', 0, 128, '2023-09-22 23:44:18', '2023-09-26 15:18:16', NULL);
INSERT INTO `dinky_sys_menu` VALUES (135, 128, '编辑', '/settings/globalsetting/resource/edit', NULL, 'settings:globalsetting:resource:edit', 'EditOutlined', 'F', 0, 130, '2023-09-22 23:44:18', '2023-09-26 15:18:39', NULL);
INSERT INTO `dinky_sys_menu` VALUES (136, 12, '告警模版', '/registration/alert/template', './RegCenter/Alert/AlertTemplate', 'registration:alert:template', 'AlertOutlined', 'C', 0, 51, '2023-09-23 21:34:43', '2023-09-26 15:03:14', NULL);
INSERT INTO `dinky_sys_menu` VALUES (137, 136, '添加', '/registration/alert/template/add', NULL, 'registration:alert:template:add', 'PlusOutlined', 'F', 0, 52, '2023-09-23 21:36:37', '2023-09-26 15:03:22', NULL);
INSERT INTO `dinky_sys_menu` VALUES (138, 136, '编辑', '/registration/alert/template/edit', NULL, 'registration:alert:template:edit', 'EditOutlined', 'F', 0, 53, '2023-09-23 21:37:00', '2023-09-26 15:03:30', NULL);
INSERT INTO `dinky_sys_menu` VALUES (139, 136, '删除', '/registration/alert/template/delete', NULL, 'registration:alert:template:delete', 'DeleteOutlined', 'F', 0, 54, '2023-09-23 21:37:43', '2023-09-26 15:03:37', NULL);
INSERT INTO `dinky_sys_menu` VALUES (140, 25, '系统日志', '/settings/systemlog/rootlog', NULL, 'settings:systemlog:rootlog', 'BankOutlined', 'F', 0, 133, '2023-09-23 21:43:57', '2023-09-26 15:19:14', NULL);
INSERT INTO `dinky_sys_menu` VALUES (141, 25, '日志列表', '/settings/systemlog/loglist', NULL, 'settings:systemlog:loglist', 'BankOutlined', 'F', 0, 134, '2023-09-23 21:45:05', '2023-09-26 15:19:23', NULL);
INSERT INTO `dinky_sys_menu` VALUES (142, 30, '部署 Session 集群', '/registration/cluster/config/deploy', NULL, 'registration:cluster:config:deploy', 'PlayCircleOutlined', 'F', 0, 35, '2023-09-26 13:42:55', '2023-09-26 14:58:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (143, 30, ' 心跳检测', '/registration/cluster/config/heartbeat', NULL, 'registration:cluster:config:heartbeat', 'HeartOutlined', 'F', 0, 36, '2023-09-26 13:44:23', '2023-09-26 14:58:50', NULL);
INSERT INTO `dinky_sys_menu` VALUES (144, 28, '心跳检测', '/registration/cluster/instance/heartbeat', NULL, 'registration:cluster:instance:heartbeat', 'HeartOutlined', 'F', 0, 30, '2023-09-26 13:51:04', '2023-09-26 14:57:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (145, 10, '心跳检测', '/registration/datasource/heartbeat', NULL, 'registration:datasource:heartbeat', 'HeartOutlined', 'F', 0, 41, '2023-09-26 14:00:06', '2023-09-26 15:00:42', NULL);
INSERT INTO `dinky_sys_menu` VALUES (146, 10, ' 拷贝', '/registration/datasource/copy', NULL, 'registration:datasource:copy', 'CopyOutlined', 'F', 0, 42, '2023-09-26 14:02:28', '2023-09-26 15:00:41', NULL);

-- ----------------------------
-- Table structure for dinky_sys_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `dinky_sys_operate_log`;
CREATE TABLE `dinky_sys_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'module name',
  `business_type` int NULL DEFAULT 0 COMMENT 'business type',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'method name',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'request method',
  `operate_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'operate name',
  `operate_user_id` int NULL DEFAULT NULL COMMENT 'operate user id',
  `operate_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'operate url',
  `operate_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'ip',
  `operate_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'operate location',
  `operate_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'request param',
  `json_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'return json result',
  `status` int NULL DEFAULT NULL COMMENT 'operate status',
  `error_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'error msg',
  `operate_time` datetime NULL DEFAULT NULL COMMENT 'operate time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'operate log record' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_sys_operate_log
-- ----------------------------
INSERT INTO `dinky_sys_operate_log` VALUES (1, 'Modify System Config', 3, 'org.dinky.controller.SysConfigController.modifyConfig()', 'POST', '', NULL, '/api/sysConfig/modifyConfig', '192.168.100.133', '', '{\"key\":\"sys.resource.settings.oss.endpoint\",\"name\":\"对象存储服务的 URL（Endpoint）\",\"frontType\":\"string\",\"example\":[],\"note\":\"例如：https://oss-cn-hangzhou.aliyuncs.com\",\"defaultValue\":\"http://localhost:9000\",\"value\":\"http://192.168.100.133:32141\",\"index\":0}', '{\"code\":0,\"msg\":\"修改成功\",\"time\":\"2024-01-18 09:10:12\",\"success\":true}', 0, NULL, '2024-01-18 09:10:12');
INSERT INTO `dinky_sys_operate_log` VALUES (2, 'Upload File To Resource', 14, 'org.dinky.controller.ResourceController.uploadFile()', 'POST', '', NULL, '/api/resource/uploadFile', '192.168.100.133', '', '{} null', '{\"code\":0,\"msg\":\"操作成功\",\"time\":\"2024-01-18 09:11:00\",\"success\":true}', 0, NULL, '2024-01-18 09:11:00');

-- ----------------------------
-- Table structure for dinky_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `dinky_sys_role_menu`;
CREATE TABLE `dinky_sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint NOT NULL COMMENT 'role id',
  `menu_id` bigint NOT NULL COMMENT 'menu id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'modify time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_role_menu_inx`(`role_id` ASC, `menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_sys_role_menu
-- ----------------------------
INSERT INTO `dinky_sys_role_menu` VALUES (1, 2, 1, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (2, 2, 32, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (3, 2, 33, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (4, 2, 5, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (5, 2, 34, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (6, 2, 36, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (7, 2, 35, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (8, 2, 37, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (9, 2, 41, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (10, 2, 38, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (11, 2, 39, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (12, 2, 40, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (13, 2, 42, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (14, 2, 43, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (15, 2, 44, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (16, 2, 45, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (17, 2, 46, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (18, 2, 47, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (19, 2, 2, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (20, 2, 18, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (21, 2, 17, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (22, 2, 3, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (23, 2, 9, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (24, 2, 10, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (25, 2, 12, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (26, 2, 13, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (27, 2, 14, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (28, 2, 15, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (29, 2, 16, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (30, 2, 19, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (31, 2, 28, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (32, 2, 30, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (33, 2, 55, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (34, 2, 56, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (35, 2, 57, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (36, 2, 145, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (37, 2, 146, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (38, 2, 31, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (39, 2, 29, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (40, 2, 136, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (41, 2, 65, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (42, 2, 64, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (43, 2, 66, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (44, 2, 69, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (45, 2, 68, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (46, 2, 70, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (47, 2, 73, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (48, 2, 72, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (49, 2, 74, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (50, 2, 76, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (51, 2, 77, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (52, 2, 79, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (53, 2, 78, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (54, 2, 80, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (55, 2, 85, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (56, 2, 83, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (57, 2, 84, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (58, 2, 82, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (59, 2, 48, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (60, 2, 50, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (61, 2, 51, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (62, 2, 49, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (63, 2, 144, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (64, 2, 61, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (65, 2, 62, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (66, 2, 63, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (67, 2, 52, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (68, 2, 53, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (69, 2, 54, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (70, 2, 142, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (71, 2, 143, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (72, 2, 59, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (73, 2, 58, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (74, 2, 60, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (75, 2, 137, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (76, 2, 138, '2023-12-26 09:57:24', '2023-12-26 09:57:24');
INSERT INTO `dinky_sys_role_menu` VALUES (77, 2, 139, '2023-12-26 09:57:24', '2023-12-26 09:57:24');

-- ----------------------------
-- Table structure for dinky_sys_token
-- ----------------------------
DROP TABLE IF EXISTS `dinky_sys_token`;
CREATE TABLE `dinky_sys_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `token_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token value',
  `user_id` bigint NOT NULL COMMENT 'user id',
  `role_id` bigint NOT NULL COMMENT 'role id',
  `tenant_id` bigint NOT NULL COMMENT 'tenant id',
  `expire_type` tinyint NOT NULL COMMENT '1: never expire, 2: expire after a period of time, 3: expire at a certain time',
  `expire_start_time` datetime NULL DEFAULT NULL COMMENT 'expire start time ,when expire_type = 3 , it is the start time of the period',
  `expire_end_time` datetime NULL DEFAULT NULL COMMENT 'expire end time ,when expire_type = 2,3 , it is the end time of the period',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `source` tinyint NULL DEFAULT NULL COMMENT '1:login 2:custom',
  `creator` int NULL DEFAULT NULL COMMENT '创建人',
  `updater` int NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token_value`(`token_value` ASC) USING BTREE,
  INDEX `source`(`source` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'token management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_sys_token
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_task
-- ----------------------------
DROP TABLE IF EXISTS `dinky_task`;
CREATE TABLE `dinky_task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT '租户id',
  `data_job_id` bigint NULL DEFAULT NULL COMMENT '数据中台任务中心id',
  `dialect` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作业类型',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行模式',
  `schedule_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `check_point` int NULL DEFAULT NULL COMMENT 'CheckPoint trigger seconds',
  `save_point_strategy` int NULL DEFAULT NULL COMMENT 'SavePoint策略',
  `save_point_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SavePointPath',
  `parallelism` int NULL DEFAULT NULL COMMENT '并行度',
  `fragment` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启全局变量',
  `statement_set` tinyint(1) NULL DEFAULT 0 COMMENT 'enable statement set',
  `batch_model` tinyint(1) NULL DEFAULT 0 COMMENT '是否使用批模式',
  `cluster_id` int NULL DEFAULT NULL COMMENT 'Flink集群id',
  `cluster_configuration_id` int NULL DEFAULT NULL COMMENT 'cluster configuration ID',
  `database_id` int NULL DEFAULT NULL COMMENT 'database ID',
  `env_id` int NULL DEFAULT NULL COMMENT '环境id',
  `alert_group_id` bigint NULL DEFAULT NULL COMMENT '告警组ID',
  `config_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他配置',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Job Note',
  `step` int NULL DEFAULT 1 COMMENT '任务生命周期',
  `job_instance_id` bigint NULL DEFAULT NULL COMMENT 'job instance id',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `version_id` int NULL DEFAULT NULL COMMENT '版本id',
  `statement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT ' sql statement',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  `operator` int NULL DEFAULT NULL COMMENT 'operator user id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_un_idx1`(`name` ASC, `tenant_id` ASC) USING BTREE,
  UNIQUE INDEX `task_un_idx2`(`save_point_path` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Task' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_task
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_task_version
-- ----------------------------
DROP TABLE IF EXISTS `dinky_task_version`;
CREATE TABLE `dinky_task_version`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` int NOT NULL COMMENT 'task ID ',
  `tenant_id` int NOT NULL DEFAULT 1 COMMENT 'tenant id',
  `version_id` int NOT NULL COMMENT 'version ID ',
  `statement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'flink sql statement',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'version name',
  `dialect` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'dialect',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'type',
  `task_configure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'task configuration',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_version_un_idx1`(`task_id` ASC, `tenant_id` ASC, `version_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'job history version' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_task_version
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_tenant
-- ----------------------------
DROP TABLE IF EXISTS `dinky_tenant`;
CREATE TABLE `dinky_tenant`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'tenant code',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'is delete',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'note',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tenant' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_tenant
-- ----------------------------
INSERT INTO `dinky_tenant` VALUES (1, 'DefaultTenant', 0, 'DefaultTenant', '2022-12-13 05:27:19', '2022-12-13 05:27:19');

-- ----------------------------
-- Table structure for dinky_udf_manage
-- ----------------------------
DROP TABLE IF EXISTS `dinky_udf_manage`;
CREATE TABLE `dinky_udf_manage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'udf name',
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Complete class name',
  `task_id` int NULL DEFAULT NULL COMMENT 'task id',
  `resources_id` int NULL DEFAULT NULL COMMENT 'resources id',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'create user id',
  `updater` int NULL DEFAULT NULL COMMENT 'update user id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name,resources_id`(`name` ASC, `resources_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'udf' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_udf_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dinky_udf_template
-- ----------------------------
DROP TABLE IF EXISTS `dinky_udf_template`;
CREATE TABLE `dinky_udf_template`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'template name',
  `code_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'code type',
  `function_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'function type',
  `template_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'code',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is enable',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `creator` int NULL DEFAULT NULL COMMENT 'creator',
  `updater` int NULL DEFAULT NULL COMMENT 'updater',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'udf template' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_udf_template
-- ----------------------------
INSERT INTO `dinky_udf_template` VALUES (1, 'java_udf', 'Java', 'UDF', '${(package==\'\')?string(\'\',\'package \'+package+\';\')}\n\nimport org.apache.flink.table.functions.ScalarFunction;\n\npublic class ${className} extends ScalarFunction {\n    public String eval(String s) {\n        return null;\n    }\n}', 1, '2022-10-19 09:17:37', '2022-10-25 17:45:57', NULL, NULL);
INSERT INTO `dinky_udf_template` VALUES (2, 'java_udtf', 'Java', 'UDTF', '${(package==\'\')?string(\'\',\'package \'+package+\';\')}\n\nimport org.apache.flink.table.functions.ScalarFunction;\n\n@FunctionHint(output = @DataTypeHint(\"ROW<word STRING, length INT>\"))\npublic static class ${className} extends TableFunction<Row> {\n\n  public void eval(String str) {\n    for (String s : str.split(\" \")) {\n      // use collect(...) to emit a row\n      collect(Row.of(s, s.length()));\n    }\n  }\n}', 1, '2022-10-19 09:22:58', '2022-10-25 17:49:30', NULL, NULL);
INSERT INTO `dinky_udf_template` VALUES (3, 'scala_udf', 'Scala', 'UDF', '${(package==\'\')?string(\'\',\'package \'+package+\';\')}\n\nimport org.apache.flink.table.api._\nimport org.apache.flink.table.functions.ScalarFunction\n\n// 定义可参数化的函数逻辑\nclass ${className} extends ScalarFunction {\n  def eval(s: String, begin: Integer, end: Integer): String = {\n    \"this is scala\"\n  }\n}', 1, '2022-10-25 09:21:32', '2022-10-25 17:49:46', NULL, NULL);
INSERT INTO `dinky_udf_template` VALUES (4, 'python_udf_1', 'Python', 'UDF', 'from pyflink.table import ScalarFunction, DataTypes\nfrom pyflink.table.udf import udf\n\nclass ${className}(ScalarFunction):\n    def __init__(self):\n        pass\n\n    def eval(self, variable):\n        return str(variable)\n\n\n${attr!\'f\'} = udf(${className}(), result_type=DataTypes.STRING())', 1, '2022-10-25 09:23:07', '2022-10-25 09:34:01', NULL, NULL);
INSERT INTO `dinky_udf_template` VALUES (5, 'python_udf_2', 'Python', 'UDF', 'from pyflink.table import DataTypes\nfrom pyflink.table.udf import udf\n\n@udf(result_type=DataTypes.STRING())\ndef ${className}(variable1:str):\n  return \'\'', 1, '2022-10-25 09:25:13', '2022-10-25 09:34:47', NULL, NULL);

-- ----------------------------
-- Table structure for dinky_user
-- ----------------------------
DROP TABLE IF EXISTS `dinky_user`;
CREATE TABLE `dinky_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'username',
  `user_type` int NULL DEFAULT 1,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'password',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'nickname',
  `worknum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'worknum',
  `avatar` blob NULL COMMENT 'avatar',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'mobile phone',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'is enable',
  `super_admin_flag` tinyint NULL DEFAULT 0 COMMENT 'is super admin(0:false,1true)',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'is delete',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'user' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_user
-- ----------------------------
INSERT INTO `dinky_user` VALUES (1, 'admin', 0, '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'Dinky-001', NULL, '17777777777', 1, 1, 0, '2022-12-13 05:27:19', '2023-07-28 23:22:52');
INSERT INTO `dinky_user` VALUES (2, 'lrl', 0, 'e10adc3949ba59abbe56e057f20f883e', '刘儒霖', NULL, NULL, NULL, 1, 0, 0, '2023-12-26 09:55:37', '2023-12-26 09:55:37');

-- ----------------------------
-- Table structure for dinky_user_role
-- ----------------------------
DROP TABLE IF EXISTS `dinky_user_role`;
CREATE TABLE `dinky_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NOT NULL COMMENT 'user id',
  `role_id` int NOT NULL COMMENT 'role id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_role_un_idx1`(`user_id` ASC, `role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Relationship between users and roles' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_user_role
-- ----------------------------
INSERT INTO `dinky_user_role` VALUES (1, 1, 1, '2022-12-13 05:27:19', '2022-12-13 05:27:19');
INSERT INTO `dinky_user_role` VALUES (3, 2, 1, '2023-12-26 10:14:56', '2023-12-26 10:14:56');
INSERT INTO `dinky_user_role` VALUES (4, 2, 2, '2023-12-26 10:14:56', '2023-12-26 10:14:56');

-- ----------------------------
-- Table structure for dinky_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS `dinky_user_tenant`;
CREATE TABLE `dinky_user_tenant`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NOT NULL COMMENT 'user id',
  `tenant_id` int NOT NULL COMMENT 'tenant id',
  `tenant_admin_flag` tinyint NULL DEFAULT 0 COMMENT 'tenant admin flag(0:false,1:true)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_tenant_un_idx1`(`user_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Relationship between users and tenants' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dinky_user_tenant
-- ----------------------------
INSERT INTO `dinky_user_tenant` VALUES (5, 2, 2, 0, '2023-12-26 10:01:35', '2023-12-26 10:01:35');
INSERT INTO `dinky_user_tenant` VALUES (8, 1, 1, 0, '2023-12-29 10:59:34', '2023-12-29 10:59:34');

-- ----------------------------
-- Table structure for metadata_column
-- ----------------------------
DROP TABLE IF EXISTS `metadata_column`;
CREATE TABLE `metadata_column`  (
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'column name',
  `column_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'column type, such as : Physical , Metadata , Computed , WATERMARK',
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'data type',
  `expr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'expression',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'column description',
  `table_id` int NOT NULL COMMENT 'table id',
  `primary` bit(1) NULL DEFAULT NULL COMMENT 'table primary key',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`table_id`, `column_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'column informations' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metadata_column
-- ----------------------------

-- ----------------------------
-- Table structure for metadata_database
-- ----------------------------
DROP TABLE IF EXISTS `metadata_database`;
CREATE TABLE `metadata_database`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `database_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'database name',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'database description',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'metadata of database information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metadata_database
-- ----------------------------
INSERT INTO `metadata_database` VALUES (1, 'default_database', '', NULL, '2024-01-15 17:23:25');

-- ----------------------------
-- Table structure for metadata_database_property
-- ----------------------------
DROP TABLE IF EXISTS `metadata_database_property`;
CREATE TABLE `metadata_database_property`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'key',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `database_id` int NOT NULL COMMENT 'database id',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`key`, `database_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'metadata of database configurations' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metadata_database_property
-- ----------------------------

-- ----------------------------
-- Table structure for metadata_function
-- ----------------------------
DROP TABLE IF EXISTS `metadata_function`;
CREATE TABLE `metadata_function`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `function_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'function name',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'class name',
  `database_id` int NOT NULL COMMENT 'database id',
  `function_language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'function language',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'UDF informations' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metadata_function
-- ----------------------------

-- ----------------------------
-- Table structure for metadata_table
-- ----------------------------
DROP TABLE IF EXISTS `metadata_table`;
CREATE TABLE `metadata_table`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'table name',
  `table_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'type，such as：database,table,view',
  `database_id` int NOT NULL COMMENT 'database id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'table description',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'metadata of table information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metadata_table
-- ----------------------------

-- ----------------------------
-- Table structure for metadata_table_property
-- ----------------------------
DROP TABLE IF EXISTS `metadata_table_property`;
CREATE TABLE `metadata_table_property`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'key',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'value',
  `table_id` int NOT NULL COMMENT 'table id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`key`, `table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'metadata of table configurations' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metadata_table_property
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;