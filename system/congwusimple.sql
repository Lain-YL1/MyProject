/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : congwusimple

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 09/06/2023 02:24:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `chat_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `chat_user_id` bigint NOT NULL COMMENT '发言者id',
  `chat_dog_id` bigint NOT NULL COMMENT '评论动物id',
  `chat_context` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `chat_belong_chat_id` bigint NOT NULL COMMENT '所属评论id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `version` int NULL DEFAULT 0 COMMENT '版本号',
  `chat_user_role` int NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1665426227936628737 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (1, 113, 1647513116508549121, '啊发发', 0, '2023-04-16 17:13:52', NULL, 1, 0, NULL);
INSERT INTO `chat` VALUES (1647535887766634497, 1, 16472852902198640661, '阿松大', 0, '2023-04-16 17:42:20', '2023-04-16 17:42:20', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647536247042326530, 1, 16472852902198640661, '123', 0, '2023-04-16 17:43:46', '2023-04-16 17:43:46', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647537087081725954, 1, 16472852902198641066, '123', 0, '2023-04-16 17:47:06', '2023-04-16 17:47:06', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647537099236818945, 1, 16472852902198641066, '24', 0, '2023-04-16 17:47:09', '2023-04-16 17:47:09', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647537396231290882, 1, 1647513116508549121, '啊沙发上', 0, '2023-04-16 17:48:20', '2023-04-16 17:48:20', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647538044230287362, 1, 16472852902198641066, '啊', 0, '2023-04-16 17:50:54', '2023-04-16 17:50:54', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647538088161427458, 1, 16475131165085491121, '这种', 0, '2023-04-16 17:51:05', '2023-04-16 17:51:05', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647538416495738881, 1, 1647285290219864066, '123', 0, '2023-04-16 17:52:23', '2023-04-16 17:52:23', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647539093066326017, 1, 16472852902198641066, '12', 0, '2023-04-16 17:55:04', '2023-04-16 17:55:04', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647539121818279937, 1, 1647513116508549121, '案发时', 0, '2023-04-16 17:55:11', '2023-04-16 17:55:11', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647544418133725185, 1, 1647285290219864066, '13123', 0, '2023-04-16 18:16:14', '2023-04-16 18:16:14', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647544422831345666, 1, 16472852902198614066, '123123', 0, '2023-04-16 18:16:15', '2023-04-16 18:16:15', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647544427763847170, 1, 1647285290219864066, 'asfdasf', 0, '2023-04-16 18:16:16', '2023-04-16 18:16:16', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647544432679571458, 1, 16472852902198641066, 'asfasf', 0, '2023-04-16 18:16:17', '2023-04-16 18:16:17', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647546273320521729, 1, 1647285290219864066, '安抚', 0, '2023-04-16 18:23:36', '2023-04-16 18:23:36', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647546427540885506, 1, 1647513116508549121, '案说法', 0, '2023-04-16 18:24:13', '2023-04-16 18:24:13', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647546442170617857, 1, 1647513116508549121, '自行车v', 0, '2023-04-16 18:24:16', '2023-04-16 18:24:16', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647546493114634242, 1, 1647513116508549121, '在线', 0, '2023-04-16 18:24:29', '2023-04-16 18:24:29', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647547516931657730, 1, 16472852902198641066, '岁的法国', 0, '2023-04-16 18:28:33', '2023-04-16 18:28:33', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647548271017185282, 1, 1647285290219864066, '案说法', 0, '2023-04-16 18:31:32', '2023-04-16 18:31:32', 1, 0, NULL);
INSERT INTO `chat` VALUES (1647548372531924994, 1, 1647513116508549121, '1213', 0, '2023-04-16 18:31:57', '2023-04-16 18:31:57', 1, 0, NULL);
INSERT INTO `chat` VALUES (1649763124104523778, 116, 1647285290219864066, '124', 0, '2023-04-22 21:12:35', '2023-04-22 21:12:35', 1, 0, 77);
INSERT INTO `chat` VALUES (1649763146988646401, 116, 1647285290219864066, '案说法', 0, '2023-04-22 21:12:40', '2023-04-22 21:12:40', 1, 0, 77);
INSERT INTO `chat` VALUES (1649763342992666625, 116, 1647285290219864066, '2134', 0, '2023-04-22 21:13:27', '2023-04-22 21:13:27', 1, 0, 77);
INSERT INTO `chat` VALUES (1649765509984014338, 116, 16497654221762601097, '沙发', 0, '2023-04-22 21:22:03', '2023-04-22 21:22:03', 1, 0, 77);
INSERT INTO `chat` VALUES (1649765701416243202, 119, 1649765422176260097, '', 0, '2023-04-22 21:22:49', '2023-04-22 21:22:49', 1, 0, 3);
INSERT INTO `chat` VALUES (1649765735121670146, 119, 1649765422176260097, '前排', 0, '2023-04-22 21:22:57', '2023-04-22 21:22:57', 1, 0, 3);
INSERT INTO `chat` VALUES (1658863429899272193, 1, 1649765422176260097, '', 0, '2023-05-17 23:53:57', '2023-05-17 23:53:57', 1, 0, 101);
INSERT INTO `chat` VALUES (1658863441106452482, 1, 1649765422176260097, '123', 0, '2023-05-17 23:53:59', '2023-05-17 23:53:59', 1, 0, 101);
INSERT INTO `chat` VALUES (1658870195802357762, 1, 1649765422176260097, '123', 0, '2023-05-18 00:20:50', '2023-05-18 00:20:50', 1, 0, 101);
INSERT INTO `chat` VALUES (1658870871039164417, 1, 1658865452522684417, '11', 0, '2023-05-18 00:23:31', '2023-05-18 00:23:31', 1, 0, 101);
INSERT INTO `chat` VALUES (1658871105572061185, 1, 1658865452522684417, '1231', 0, '2023-05-18 00:24:27', '2023-05-18 00:24:27', 1, 0, 101);
INSERT INTO `chat` VALUES (1658871238896402434, 1, 1658865452522684417, '阿松大', 0, '2023-05-18 00:24:58', '2023-05-18 00:24:58', 1, 0, 101);
INSERT INTO `chat` VALUES (1658877234133876738, 1, 1649765422176260097, '', 0, '2023-05-18 00:48:48', '2023-05-18 00:48:48', 1, 0, 101);
INSERT INTO `chat` VALUES (1658884465470574593, 113, 1658865452522684417, '123', 0, '2023-05-18 01:17:32', '2023-05-18 01:17:32', 1, 0, 3);
INSERT INTO `chat` VALUES (1658884703967088642, 113, 1658865452522684417, '1231', 0, '2023-05-18 01:18:29', '2023-05-18 01:18:29', 1, 0, 3);
INSERT INTO `chat` VALUES (1658884712309559297, 113, 1658865452522684417, 'asf1', 0, '2023-05-18 01:18:31', '2023-05-18 01:18:31', 1, 0, 3);
INSERT INTO `chat` VALUES (1665415950214111234, 1, 6667, '123', 0, '2023-06-05 01:51:19', '2023-06-05 01:51:19', 1, 0, 101);
INSERT INTO `chat` VALUES (1665426218008711169, 1, 6668, '123', 0, '2023-06-05 02:32:07', '2023-06-05 02:32:07', 1, 0, 101);
INSERT INTO `chat` VALUES (1665426227936628737, 1, 6668, '阿松大', 0, '2023-06-05 02:32:10', '2023-06-05 02:32:10', 1, 0, 101);
INSERT INTO `chat` VALUES (1666841735445696514, 1, 6669, '啊实打实', 0, '2023-06-09 00:16:53', '2023-06-09 00:16:53', 0, 0, 101);
INSERT INTO `chat` VALUES (1666855939414249474, 114, 6669, '啊啊啊', 0, '2023-06-09 01:13:19', '2023-06-09 01:13:19', 0, 0, 4);

-- ----------------------------
-- Table structure for dog
-- ----------------------------
DROP TABLE IF EXISTS `dog`;
CREATE TABLE `dog`  (
  `dog_id` bigint NOT NULL AUTO_INCREMENT COMMENT '动物ID',
  `dog_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `dog_context` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `dog_type` bigint NOT NULL COMMENT '品种',
  `dog_year` double NOT NULL COMMENT '年龄',
  `dog_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `dog_belong_user_id` bigint NULL DEFAULT NULL COMMENT '领养人ID',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `version` int NULL DEFAULT 0 COMMENT '版本号',
  `dog_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `dog_user_id` bigint NULL DEFAULT NULL COMMENT '发布者ID',
  PRIMARY KEY (`dog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6668 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dog
-- ----------------------------
INSERT INTO `dog` VALUES (1, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (2, '阿发', '<p>123123</p>', 123, 123, '2', 1, '2023-05-05 02:13:09', '2023-05-11 00:08:33', 1, 1, '/profile/upload/2023/05/05/86c86bda-c779-4f4d-b75c-de6f0f2caaac.png', 113);
INSERT INTO `dog` VALUES (3, '123', '<p>123</p>', 4, 124, '1', NULL, '2023-05-09 00:08:16', '2023-05-20 16:24:43', 1, 1, '/profile/upload/2023/05/09/d516bad9-fbbc-484c-9af4-df3b6665b80c.png', 1);
INSERT INTO `dog` VALUES (4, 'asf', '<p>asf123</p>', 7, 123, '2', NULL, '2023-05-20 16:16:39', '2023-05-20 16:16:39', 1, 0, '/profile/upload/2023/05/20/96e8c799-4e7f-4dee-93ae-5c1e879b8c15.png', 1);
INSERT INTO `dog` VALUES (5, '4234', '<p>123</p>', 3, 123, '2', NULL, '2023-05-20 16:20:30', '2023-05-20 16:20:30', 1, 0, '/profile/upload/2023/05/20/41b59fda-1963-4ccf-bd6d-452fac4b2ef3.png', 1);
INSERT INTO `dog` VALUES (11, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (22, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (33, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (55, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (66, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (77, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (88, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (123, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (1111, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (1233, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (2333, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (6666, '哈巴123', '<p>124124<img src=\"/dev-api/profile/upload/2023/05/02/981870d6-c918-4ef7-8fe9-d0836faf8c67.png\"></p>', 123, 1.5, '2', 113, '2023-05-02 16:25:32', '2023-05-05 02:31:07', 1, 5, '/profile/upload/2023/05/03/339a4107-6ab2-4241-8e06-a39b53faefd4.png', NULL);
INSERT INTO `dog` VALUES (6667, '小狗', '<p>123<img src=\"/dev-api/profile/upload/2023/06/04/c74c3cda-b9f1-49c5-8e38-db725a3f5350.png\"></p>', 7, 10000, '2', 1, '2023-06-04 20:09:49', '2023-06-09 01:25:41', 1, 6, '/profile/upload/2023/06/04/66ecfd08-d2e1-4edd-bc09-8be98540f765.png', 1);
INSERT INTO `dog` VALUES (6668, '啊沙发沙发', '<p>123123</p>', 6, 123, '5', 1, '2023-06-05 02:25:28', '2023-06-05 02:34:53', 0, 1, '/profile/upload/2023/06/05/74cc8a88-e4bf-4838-87d7-ebf663542ad4.png', 1);
INSERT INTO `dog` VALUES (6669, '奶猫', '<p>id：恶霸&nbsp;品种：猫&nbsp;生日：2021年X月X日</p><p>状态：</p><p>介绍：橘色白猫</p>', 12, 2, '5', 114, '2023-06-09 00:01:51', '2023-06-09 01:08:49', 0, 1, '/profile/upload/2023/06/09/fe9647bc-0a1a-4991-adc8-8fda4242bb0b.jpg', 1);
INSERT INTO `dog` VALUES (6670, '恶犬', '<p>id：玉皇&nbsp;品种：狗&nbsp;生日：2020年X月X日</p><p>状态：</p><p>介绍：狗狗</p>', 13, 3, '2', NULL, '2023-06-09 00:02:15', '2023-06-09 00:02:15', 0, 0, '/profile/upload/2023/06/09/67d56539-9445-4dae-9bf9-6a48012cf425.jpg', 1);
INSERT INTO `dog` VALUES (6671, '玉皇', '<p>&nbsp;品种：猫&nbsp;生日：2021年X月X日</p><p>状态：</p><p>介绍：橘色白猫</p>', 12, 74, '2', NULL, '2023-06-09 00:02:44', '2023-06-09 00:02:44', 0, 0, '/profile/upload/2023/06/09/894608ab-d1b0-4c9f-a142-1b73ee2f09d9.jpg', 1);
INSERT INTO `dog` VALUES (6672, '小黄', NULL, 14, 123, '2', NULL, '2023-06-09 01:23:22', '2023-06-09 01:23:22', 0, 0, '/profile/upload/2023/06/09/69e8cd69-ce5b-4b02-b899-c9d396b0432e.jpg', 114);

-- ----------------------------
-- Table structure for dog_order
-- ----------------------------
DROP TABLE IF EXISTS `dog_order`;
CREATE TABLE `dog_order`  (
  `dog_order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '领养订单',
  `dog_id` bigint NOT NULL COMMENT '狗ID',
  `dog_user_id` bigint NOT NULL COMMENT '用户ID',
  `dog_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '狗名称',
  `dog_order_status` int NOT NULL COMMENT '状态',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `version` int NULL DEFAULT 0 COMMENT '版本号',
  `dog_order_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '理由',
  `dog_order_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请文件',
  PRIMARY KEY (`dog_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dog_order
-- ----------------------------
INSERT INTO `dog_order` VALUES (6, 1, 1, '哈巴123', 3, '2023-05-14 04:01:40', '2023-06-05 02:27:03', 1, 0, '123', '/profile/upload/2023/05/14/e9226374-0080-4d6e-8142-db466f707813.zip');
INSERT INTO `dog_order` VALUES (7, 6667, 1, '小狗', 2, '2023-06-05 01:52:30', '2023-06-05 02:27:07', 0, 0, '123', NULL);
INSERT INTO `dog_order` VALUES (8, 6668, 1, '啊沙发沙发', 2, '2023-06-05 02:33:04', '2023-06-05 02:34:53', 0, 0, '123', NULL);
INSERT INTO `dog_order` VALUES (11, 6669, 114, '奶猫', 2, '2023-06-09 01:06:25', '2023-06-09 01:08:49', 0, 0, '啊飒飒', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-02-22 09:28:06', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-02-22 09:28:06', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-02-22 09:28:06', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'N', 'admin', '2022-02-22 09:28:06', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-02-22 09:28:06', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-02-22 09:28:00', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-22 09:28:00', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-22 09:28:00', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-02-22 09:28:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-02-22 09:28:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-02-22 09:28:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:02', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-02-22 09:28:02', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-02-22 09:28:02', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-02-22 09:28:02', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:02', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-02-22 09:28:02', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-02-22 09:28:03', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-02-22 09:28:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 0, '未审核', '0', 'sys_status', NULL, 'default', 'N', '1', 'admin', '2022-11-04 16:35:27', 'admin', '2023-06-05 02:34:33', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '审核中', '1', 'sys_status', NULL, 'default', 'N', '0', 'admin', '2022-11-04 16:35:51', 'admin', '2023-06-05 02:35:11', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '审核通过', '2', 'sys_status', NULL, 'default', 'N', '0', 'admin', '2022-11-04 16:35:56', 'admin', '2023-06-05 02:34:39', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 0, '审核失败', '3', 'sys_status', NULL, 'default', 'N', '0', 'admin', '2022-11-04 16:36:03', 'admin', '2023-06-05 02:35:05', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 0, '是', '1', 'sys_if', NULL, 'default', 'N', '0', 'admin', '2022-11-04 21:10:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 0, '否', '0', 'sys_if', NULL, 'default', 'N', '0', 'admin', '2022-11-04 21:10:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (64, 0, '完成', '5', 'sys_status', NULL, 'default', 'N', '0', '123456', '2023-05-02 15:35:51', '123456', '2023-05-02 16:27:09', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-02-22 09:27:58', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-02-22 09:27:58', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-02-22 09:27:59', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '审核状态', 'sys_status', '0', 'admin', '2022-11-04 16:35:10', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '是否', 'sys_if', '0', 'admin', '2022-11-04 21:09:55', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2080 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-02-22 09:27:37', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-02-22 09:27:38', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-02-22 09:27:38', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-02-22 09:27:38', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-02-22 09:27:38', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-02-22 09:27:38', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-02-22 09:27:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-02-22 09:27:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-02-22 09:27:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-02-22 09:27:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-02-22 09:27:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-02-22 09:27:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-02-22 09:27:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-02-22 09:27:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-02-22 09:27:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-02-22 09:27:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-02-22 09:27:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-02-22 09:27:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-02-22 09:27:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-02-22 09:27:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-02-22 09:27:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-02-22 09:27:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-02-22 09:27:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-02-22 09:27:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '流浪动物管理', 0, 1, 'admin/dog', 'admin/dog', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', '123456', '2023-05-02 16:24:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '领养页面', 0, 0, '/list', NULL, NULL, 1, 0, 'M', '0', '0', '', 'button', '123456', '2023-05-04 20:25:13', 'admin', '2023-06-05 02:28:53', '');
INSERT INTO `sys_menu` VALUES (2071, '动物领取管理', 0, 7, 'admin/dogOrder', 'admin/dogOrder', NULL, 1, 0, 'C', '0', '0', NULL, 'build', '123456', '2023-05-05 00:22:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '用户领养记录', 0, 0, 'user/dogOrder', 'user/dogOrder', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', '123456', '2023-05-05 01:43:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '品种管理', 0, 99, 'admin/type', 'admin/type', NULL, 1, 0, 'C', '0', '0', NULL, 'size', 'admin', '2023-05-20 16:02:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '评论管理', 0, 3, 'admin/chat', 'admin/chat', NULL, 1, 0, 'C', '0', '0', NULL, 'button', 'admin', '2023-06-05 01:44:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-02-22 09:27:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (3, '用户', 'user1', 1, '1', 0, 1, '0', '0', '123456', '2022-11-06 21:22:27', 'admin', '2023-06-05 01:55:41', NULL);
INSERT INTO `sys_role` VALUES (4, '管理员', 'manager2', 2, '1', 0, 1, '0', '0', 'admin', '2022-08-20 13:48:11', 'admin', '2023-06-05 01:55:28', NULL);
INSERT INTO `sys_role` VALUES (77, '未知', 'mishu', 3, '1', 1, 1, '0', '0', '123456', '2023-03-11 16:46:14', 'admin', '2023-06-05 01:55:03', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 2070);
INSERT INTO `sys_role_menu` VALUES (3, 2072);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 2063);
INSERT INTO `sys_role_menu` VALUES (4, 2071);
INSERT INTO `sys_role_menu` VALUES (4, 2079);
INSERT INTO `sys_role_menu` VALUES (4, 2080);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `score` int NOT NULL DEFAULT 0,
  `chat_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 101, 'admin', '案说法1', '00', 'r111@163.com', '15888888888', '1', '/profile/avatar/2023/02/08/16879d90-ab27-406f-ba01-9b58e927a4c9.jpeg', '123456', '0', '0', '127.0.0.1', '2023-06-08 23:30:55', 'admin', '2022-02-22 09:27:35', '', '2023-06-08 23:30:54', '', 100, '2023-03-11 16:42:42');
INSERT INTO `sys_user` VALUES (113, 77, 'yonghu1', '修改为111', '00', '', '', '0', '', '$2a$10$vj3qTsOBKaaU96gBj/fTgueAXX79TMizugmXjhQ/3eNcXfXDqu0G2', '0', '0', '127.0.0.1', '2023-05-08 23:43:14', '123456', '2023-02-09 14:52:16', 'guanliyuan', '2023-06-09 00:58:11', NULL, 15, '2023-03-11 15:52:21');
INSERT INTO `sys_user` VALUES (114, 4, 'guanliyuan', '管理员', '00', '', '', '0', '', '123456', '0', '0', '127.0.0.1', '2023-06-09 00:55:34', '123456', '2023-02-09 14:52:28', '123456', '2023-06-09 00:55:33', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (115, 3, 'yonghu2', 'yonghu2', '00', '0231@qq.com', '17605956521', '0', '/profile/avatar/2023/03/11/62120887-4d9e-44ed-bc7d-df4dbbbf105a.jpeg', '123456', '0', '0', '127.0.0.1', '2023-03-11 19:21:36', 'guanliyuan', '2023-02-09 15:18:41', 'guanliyuan', '2023-03-12 18:07:48', NULL, 0, '2023-03-11 18:21:06');
INSERT INTO `sys_user` VALUES (116, 77, 'laoshi', '老师', '00', '', '', '1', '', '123456', '0', '0', '127.0.0.1', '2023-04-22 21:12:20', '123456', '2023-03-11 16:46:29', '123456', '2023-04-22 21:12:19', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (117, 77, 'tt1234', 'tt1234', '00', '', '', '0', '', '123456', '0', '0', '127.0.0.1', '2023-05-05 02:38:20', '', '2023-03-12 17:43:42', '123456', '2023-05-05 02:38:20', NULL, 0, '2023-03-12 18:00:05');
INSERT INTO `sys_user` VALUES (118, 3, 'yy1234', '12345', '00', '', '', '0', '', '123456', '0', '0', '127.0.0.1', '2023-03-23 21:36:52', '', '2023-03-12 18:10:10', '123456', '2023-03-23 21:36:51', NULL, 0, '2023-03-12 18:19:52');
INSERT INTO `sys_user` VALUES (119, 3, 'xuesheng', 'xuesheng', '00', '', '', '0', '', '123456', '0', '0', '127.0.0.1', '2023-04-22 21:22:41', '', '2023-04-22 21:22:32', '', '2023-04-22 21:22:40', NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (120, 3, '888888', '88888', '00', '', '', '0', '', '123456', '0', '0', '', NULL, '', '2023-06-09 00:53:16', '', NULL, NULL, 0, NULL);
INSERT INTO `sys_user` VALUES (121, 3, '测试01', '测试01', '00', '', '', '0', '', '123456', '0', '0', '', NULL, 'guanliyuan', '2023-06-09 01:02:59', '', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 4);
INSERT INTO `sys_user_role` VALUES (113, 77);
INSERT INTO `sys_user_role` VALUES (114, 4);
INSERT INTO `sys_user_role` VALUES (116, 77);
INSERT INTO `sys_user_role` VALUES (117, 77);
INSERT INTO `sys_user_role` VALUES (119, 3);
INSERT INTO `sys_user_role` VALUES (120, 3);
INSERT INTO `sys_user_role` VALUES (121, 3);
INSERT INTO `sys_user_role` VALUES (214124, 77);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `type_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `version` int NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'sad', '2023-05-20 16:08:45', '2023-05-20 16:08:45', 1, 0);
INSERT INTO `type` VALUES (2, '123', '2023-05-20 16:12:02', '2023-05-20 16:12:02', 1, 0);
INSERT INTO `type` VALUES (3, '234', '2023-05-20 16:12:04', '2023-05-20 16:12:04', 1, 0);
INSERT INTO `type` VALUES (4, '345', '2023-05-20 16:12:06', '2023-05-20 16:12:06', 1, 0);
INSERT INTO `type` VALUES (5, '7', '2023-05-20 16:12:08', '2023-05-20 16:12:08', 1, 0);
INSERT INTO `type` VALUES (6, 'zxc', '2023-05-20 16:12:11', '2023-05-20 16:12:11', 1, 0);
INSERT INTO `type` VALUES (7, 'xcv', '2023-05-20 16:12:13', '2023-05-20 16:12:13', 1, 0);
INSERT INTO `type` VALUES (8, 'zxc', '2023-05-20 16:12:14', '2023-05-20 16:12:14', 1, 0);
INSERT INTO `type` VALUES (9, 'xcv', '2023-05-20 16:12:17', '2023-05-20 16:12:17', 1, 0);
INSERT INTO `type` VALUES (10, 'zxc', '2023-05-20 16:12:19', '2023-05-20 16:12:19', 1, 0);
INSERT INTO `type` VALUES (11, '秩序册', '2023-05-20 16:12:20', '2023-06-09 01:31:56', 1, 1);
INSERT INTO `type` VALUES (12, '奶猫', '2023-06-09 00:01:14', '2023-06-09 00:01:14', 0, 0);
INSERT INTO `type` VALUES (13, '恶犬', '2023-06-09 00:01:18', '2023-06-09 00:01:18', 0, 0);
INSERT INTO `type` VALUES (14, '柯基', '2023-06-09 00:01:23', '2023-06-09 00:01:23', 0, 0);
INSERT INTO `type` VALUES (15, '哈士奇', '2023-06-09 00:01:29', '2023-06-09 00:01:29', 0, 0);
INSERT INTO `type` VALUES (16, '小黄', '2023-06-09 01:30:10', '2023-06-09 01:30:10', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
