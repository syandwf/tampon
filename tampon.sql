/*
 Navicat Premium Data Transfer

 Source Server         : aikelante
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 47.111.0.61:3306
 Source Schema         : tampon

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 04/03/2019 11:07:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_access`;
CREATE TABLE `dp_admin_access`  (
  `module` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `nid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '授权节点id'
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统一授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_action`;
CREATE TABLE `dp_admin_action`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为规则',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_action
-- ----------------------------
INSERT INTO `dp_admin_action` VALUES (1, 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', 1, 1480156399, 1480163853);
INSERT INTO `dp_admin_action` VALUES (2, 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', 1, 1480164578, 1480297748);
INSERT INTO `dp_admin_action` VALUES (3, 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', 1, 1480168582, 1480168616);
INSERT INTO `dp_admin_action` VALUES (4, 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', 1, 1480169185, 1480169185);
INSERT INTO `dp_admin_action` VALUES (5, 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', 1, 1480169214, 1480170581);
INSERT INTO `dp_admin_action` VALUES (6, 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', 1, 1480221441, 1480221563);
INSERT INTO `dp_admin_action` VALUES (7, 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', 1, 1480251473, 1480251473);
INSERT INTO `dp_admin_action` VALUES (8, 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', 1, 1480252369, 1480252369);
INSERT INTO `dp_admin_action` VALUES (9, 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', 1, 1480252580, 1480252580);
INSERT INTO `dp_admin_action` VALUES (10, 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', 1, 1480252620, 1480252620);
INSERT INTO `dp_admin_action` VALUES (11, 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', 1, 1480252651, 1480252651);
INSERT INTO `dp_admin_action` VALUES (12, 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', 1, 1480253226, 1480253332);
INSERT INTO `dp_admin_action` VALUES (13, 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', 1, 1480253267, 1480253340);
INSERT INTO `dp_admin_action` VALUES (14, 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', 1, 1480253323, 1480253323);
INSERT INTO `dp_admin_action` VALUES (15, 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', 1, 1480296196, 1480296196);
INSERT INTO `dp_admin_action` VALUES (16, 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', 1, 1480296960, 1480296960);
INSERT INTO `dp_admin_action` VALUES (17, 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', 1, 1480298479, 1480298479);
INSERT INTO `dp_admin_action` VALUES (18, 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', 1, 1480298506, 1480298506);
INSERT INTO `dp_admin_action` VALUES (19, 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', 1, 1480298532, 1480298532);
INSERT INTO `dp_admin_action` VALUES (20, 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', 1, 1480298946, 1480298946);
INSERT INTO `dp_admin_action` VALUES (21, 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', 1, 1480301990, 1480302022);
INSERT INTO `dp_admin_action` VALUES (22, 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', 1, 1480302616, 1480302616);
INSERT INTO `dp_admin_action` VALUES (23, 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', 1, 1480302798, 1480302798);
INSERT INTO `dp_admin_action` VALUES (24, 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', 1, 1480302870, 1480302870);
INSERT INTO `dp_admin_action` VALUES (25, 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', 1, 1480303198, 1480303198);
INSERT INTO `dp_admin_action` VALUES (26, 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', 1, 1480303229, 1480303229);
INSERT INTO `dp_admin_action` VALUES (27, 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', 1, 1480303264, 1480303264);
INSERT INTO `dp_admin_action` VALUES (28, 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', 1, 1480303294, 1480303294);
INSERT INTO `dp_admin_action` VALUES (29, 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', 1, 1480303409, 1480303409);
INSERT INTO `dp_admin_action` VALUES (30, 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', 1, 1480305468, 1480305468);
INSERT INTO `dp_admin_action` VALUES (31, 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', 1, 1480305513, 1480305513);
INSERT INTO `dp_admin_action` VALUES (32, 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', 1, 1480305562, 1480305562);
INSERT INTO `dp_admin_action` VALUES (33, 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', 1, 1480305630, 1480305630);
INSERT INTO `dp_admin_action` VALUES (34, 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', 1, 1480305659, 1480305659);
INSERT INTO `dp_admin_action` VALUES (35, 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', 1, 1480307558, 1480307558);
INSERT INTO `dp_admin_action` VALUES (36, 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', 1, 1480307588, 1480307588);
INSERT INTO `dp_admin_action` VALUES (37, 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', 1, 1480307618, 1480307618);
INSERT INTO `dp_admin_action` VALUES (38, 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', 1, 1480307653, 1480307653);
INSERT INTO `dp_admin_action` VALUES (39, 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', 1, 1480307682, 1480307682);
INSERT INTO `dp_admin_action` VALUES (40, 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', 1, 1480308342, 1480308342);
INSERT INTO `dp_admin_action` VALUES (41, 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', 1, 1480308372, 1480308372);
INSERT INTO `dp_admin_action` VALUES (42, 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', 1, 1480309555, 1480309642);
INSERT INTO `dp_admin_action` VALUES (43, 'cms', 'slider_delete', '删除滚动图片', '删除滚动图片', '', '[user|get_nickname] 删除了滚动图片：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (44, 'cms', 'slider_edit', '编辑滚动图片', '编辑滚动图片', '', '[user|get_nickname] 编辑了滚动图片：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (45, 'cms', 'slider_add', '添加滚动图片', '添加滚动图片', '', '[user|get_nickname] 添加了滚动图片：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (46, 'cms', 'document_delete', '删除文档', '删除文档', '', '[user|get_nickname] 删除了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (47, 'cms', 'document_restore', '还原文档', '还原文档', '', '[user|get_nickname] 还原了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (48, 'cms', 'nav_disable', '禁用导航', '禁用导航', '', '[user|get_nickname] 禁用了导航：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (49, 'cms', 'nav_enable', '启用导航', '启用导航', '', '[user|get_nickname] 启用了导航：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (50, 'cms', 'nav_delete', '删除导航', '删除导航', '', '[user|get_nickname] 删除了导航：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (51, 'cms', 'nav_edit', '编辑导航', '编辑导航', '', '[user|get_nickname] 编辑了导航：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (52, 'cms', 'nav_add', '添加导航', '添加导航', '', '[user|get_nickname] 添加了导航：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (53, 'cms', 'model_disable', '禁用内容模型', '禁用内容模型', '', '[user|get_nickname] 禁用了内容模型：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (54, 'cms', 'model_enable', '启用内容模型', '启用内容模型', '', '[user|get_nickname] 启用了内容模型：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (55, 'cms', 'model_delete', '删除内容模型', '删除内容模型', '', '[user|get_nickname] 删除了内容模型：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (56, 'cms', 'model_edit', '编辑内容模型', '编辑内容模型', '', '[user|get_nickname] 编辑了内容模型：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (57, 'cms', 'model_add', '添加内容模型', '添加内容模型', '', '[user|get_nickname] 添加了内容模型：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (58, 'cms', 'menu_disable', '禁用导航菜单', '禁用导航菜单', '', '[user|get_nickname] 禁用了导航菜单：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (59, 'cms', 'menu_enable', '启用导航菜单', '启用导航菜单', '', '[user|get_nickname] 启用了导航菜单：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (60, 'cms', 'menu_delete', '删除导航菜单', '删除导航菜单', '', '[user|get_nickname] 删除了导航菜单：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (61, 'cms', 'menu_edit', '编辑导航菜单', '编辑导航菜单', '', '[user|get_nickname] 编辑了导航菜单：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (62, 'cms', 'menu_add', '添加导航菜单', '添加导航菜单', '', '[user|get_nickname] 添加了导航菜单：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (63, 'cms', 'link_disable', '禁用友情链接', '禁用友情链接', '', '[user|get_nickname] 禁用了友情链接：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (64, 'cms', 'link_enable', '启用友情链接', '启用友情链接', '', '[user|get_nickname] 启用了友情链接：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (65, 'cms', 'link_delete', '删除友情链接', '删除友情链接', '', '[user|get_nickname] 删除了友情链接：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (66, 'cms', 'link_edit', '编辑友情链接', '编辑友情链接', '', '[user|get_nickname] 编辑了友情链接：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (67, 'cms', 'link_add', '添加友情链接', '添加友情链接', '', '[user|get_nickname] 添加了友情链接：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (68, 'cms', 'field_disable', '禁用模型字段', '禁用模型字段', '', '[user|get_nickname] 禁用了模型字段：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (69, 'cms', 'field_enable', '启用模型字段', '启用模型字段', '', '[user|get_nickname] 启用了模型字段：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (70, 'cms', 'field_delete', '删除模型字段', '删除模型字段', '', '[user|get_nickname] 删除了模型字段：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (71, 'cms', 'field_edit', '编辑模型字段', '编辑模型字段', '', '[user|get_nickname] 编辑了模型字段：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (72, 'cms', 'field_add', '添加模型字段', '添加模型字段', '', '[user|get_nickname] 添加了模型字段：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (73, 'cms', 'column_disable', '禁用栏目', '禁用栏目', '', '[user|get_nickname] 禁用了栏目：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (74, 'cms', 'column_enable', '启用栏目', '启用栏目', '', '[user|get_nickname] 启用了栏目：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (75, 'cms', 'column_delete', '删除栏目', '删除栏目', '', '[user|get_nickname] 删除了栏目：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (76, 'cms', 'column_edit', '编辑栏目', '编辑栏目', '', '[user|get_nickname] 编辑了栏目：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (77, 'cms', 'column_add', '添加栏目', '添加栏目', '', '[user|get_nickname] 添加了栏目：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (78, 'cms', 'advert_type_disable', '禁用广告分类', '禁用广告分类', '', '[user|get_nickname] 禁用了广告分类：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (79, 'cms', 'advert_type_enable', '启用广告分类', '启用广告分类', '', '[user|get_nickname] 启用了广告分类：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (80, 'cms', 'advert_type_delete', '删除广告分类', '删除广告分类', '', '[user|get_nickname] 删除了广告分类：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (81, 'cms', 'advert_type_edit', '编辑广告分类', '编辑广告分类', '', '[user|get_nickname] 编辑了广告分类：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (82, 'cms', 'advert_type_add', '添加广告分类', '添加广告分类', '', '[user|get_nickname] 添加了广告分类：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (83, 'cms', 'advert_disable', '禁用广告', '禁用广告', '', '[user|get_nickname] 禁用了广告：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (84, 'cms', 'advert_enable', '启用广告', '启用广告', '', '[user|get_nickname] 启用了广告：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (85, 'cms', 'advert_delete', '删除广告', '删除广告', '', '[user|get_nickname] 删除了广告：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (86, 'cms', 'advert_edit', '编辑广告', '编辑广告', '', '[user|get_nickname] 编辑了广告：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (87, 'cms', 'advert_add', '添加广告', '添加广告', '', '[user|get_nickname] 添加了广告：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (88, 'cms', 'document_disable', '禁用文档', '禁用文档', '', '[user|get_nickname] 禁用了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (89, 'cms', 'document_enable', '启用文档', '启用文档', '', '[user|get_nickname] 启用了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (90, 'cms', 'document_trash', '回收文档', '回收文档', '', '[user|get_nickname] 回收了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (91, 'cms', 'document_edit', '编辑文档', '编辑文档', '', '[user|get_nickname] 编辑了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (92, 'cms', 'document_add', '添加文档', '添加文档', '', '[user|get_nickname] 添加了文档：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (93, 'cms', 'slider_enable', '启用滚动图片', '启用滚动图片', '', '[user|get_nickname] 启用了滚动图片：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (94, 'cms', 'slider_disable', '禁用滚动图片', '禁用滚动图片', '', '[user|get_nickname] 禁用了滚动图片：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (95, 'cms', 'support_add', '添加客服', '添加客服', '', '[user|get_nickname] 添加了客服：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (96, 'cms', 'support_edit', '编辑客服', '编辑客服', '', '[user|get_nickname] 编辑了客服：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (97, 'cms', 'support_delete', '删除客服', '删除客服', '', '[user|get_nickname] 删除了客服：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (98, 'cms', 'support_enable', '启用客服', '启用客服', '', '[user|get_nickname] 启用了客服：[details]', 1, 1546683238, 1546683238);
INSERT INTO `dp_admin_action` VALUES (99, 'cms', 'support_disable', '禁用客服', '禁用客服', '', '[user|get_nickname] 禁用了客服：[details]', 1, 1546683238, 1546683238);

-- ----------------------------
-- Table structure for dp_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_attachment`;
CREATE TABLE `dp_admin_attachment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `width` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片宽度',
  `height` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片高度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_attachment
-- ----------------------------
INSERT INTO `dp_admin_attachment` VALUES (1, 1, 'wheel1.jpg', 'home', 'uploads/images/20190128/7aef9b6b6cc87ddc12894716aad8ed7c.jpg', 'uploads/images/20190128/thumb/7aef9b6b6cc87ddc12894716aad8ed7c.jpg', '', 'image/jpeg', 'jpg', 62012, '3cca4ead08f5874dd77028c36cda08d6', '0d44c93cafd8fe9ec07e622a0458390cee088859', 'local', 0, 1548640319, 1548640319, 100, 1, 1080, 641);
INSERT INTO `dp_admin_attachment` VALUES (2, 1, 'rb.jpg', 'home', 'uploads/images/20190128/1f994d1a6278b0ef6c3af59e812fd5cd.jpg', 'uploads/images/20190128/thumb/1f994d1a6278b0ef6c3af59e812fd5cd.jpg', '', 'image/jpeg', 'jpg', 51524, 'a1ff5999950f2d10bfb1f5d5eb2afef7', '127a18ec1ffd169c6dc05303e2eb2014192d5d53', 'local', 0, 1548642010, 1548642010, 100, 1, 380, 238);
INSERT INTO `dp_admin_attachment` VALUES (3, 1, '微信图片_20190128160058.png', 'home', 'uploads/images/20190128/27c06620f33846900b53b3d54851f497.png', '', '', 'image/png', 'png', 564108, '7db80d4178a1e3a8c21340a074f7700d', '46883613e8168b4e29d54d1f6f133b9076264036', 'local', 0, 1548662488, 1548662488, 100, 1, 900, 383);
INSERT INTO `dp_admin_attachment` VALUES (4, 1, 'fbb.jpg', 'home', 'uploads/images/20190128/9fdc10af671b684cfa15ff3d06994b85.jpg', '', '', 'image/jpeg', 'jpg', 49641, '1e0f206e818c16f3689fadbe7edc3e70', '77158178e4ebb56a291cc57e63f4da3565a5abad', 'local', 0, 1548683714, 1548683714, 100, 1, 380, 238);
INSERT INTO `dp_admin_attachment` VALUES (5, 1, '1.jpg', 'home', 'uploads/images/20190129/334440748d4d4cf4c90194aa210cd260.jpg', '', '', 'image/jpeg', 'jpg', 87490, 'a9926d7bcc98aabbaad7a980c646515b', '8f2f96fb3618e77c9c80245fd70c33316571eef9', 'local', 0, 1548692358, 1548692358, 100, 1, 800, 800);
INSERT INTO `dp_admin_attachment` VALUES (6, 1, '1-1.jpg', 'home', 'uploads/images/20190129/7223a22b7cdfa8db68327b81cac10b4e.jpg', '', '', 'image/jpeg', 'jpg', 123934, '5c7c83648b04b0f2dc29de648f20e188', '76d13d9bac11cef403ba61a5edc1864409c19a3f', 'local', 0, 1548692364, 1548692364, 100, 1, 774, 1200);
INSERT INTO `dp_admin_attachment` VALUES (7, 1, '1-2.jpg', 'home', 'uploads/images/20190129/ba9ecdf129a90a28e8a1cb083ff08493.jpg', '', '', 'image/jpeg', 'jpg', 78234, 'b5559e2d9e0b0ebb414e59dee3500f6e', 'a249052cf4cebcd53c4e4bc3e7c6067520194eb5', 'local', 0, 1548692364, 1548692364, 100, 1, 776, 1200);
INSERT INTO `dp_admin_attachment` VALUES (8, 1, '1-3.jpg', 'home', 'uploads/images/20190129/3a126e7e213c8282255632a805a8f72a.jpg', '', '', 'image/jpeg', 'jpg', 73177, 'e2911ea78d9dfd05b79075abfb2fcf47', '01c61a8194d380296b6c0a8222e86fbdf0b3e122', 'local', 0, 1548692365, 1548692365, 100, 1, 1079, 1265);
INSERT INTO `dp_admin_attachment` VALUES (9, 1, '1-4.jpg', 'home', 'uploads/images/20190129/142094ef594bc1aee21b6a7940ca205c.jpg', '', '', 'image/jpeg', 'jpg', 63274, '53ba666264bf19d1895e6e11b7d748c8', '7cb3d4d37e1e8ece7496803a7f13466579252bfc', 'local', 0, 1548692365, 1548692365, 100, 1, 1080, 1260);
INSERT INTO `dp_admin_attachment` VALUES (10, 1, '2.jpg', 'home', 'uploads/images/20190130/f3797d15bf6b2e3c3fe0c0086e30b729.jpg', '', '', 'image/jpeg', 'jpg', 158551, '864aed81d4df7c7ff896c9d1e9add952', 'd1fbf23a8352975409ae5acd8c081a3542834ed9', 'local', 0, 1548781648, 1548781648, 100, 1, 800, 800);
INSERT INTO `dp_admin_attachment` VALUES (11, 1, '2-1.jpg', 'home', 'uploads/images/20190130/ffbe72a48f88e9cb3cc16ebeea1e956a.jpg', '', '', 'image/jpeg', 'jpg', 151960, '1061d7d42ef387ec89dcddb4a8fca301', 'c827560fd6d19c8ab3abb98e3123744dc614684d', 'local', 0, 1548781654, 1548781654, 100, 1, 790, 896);
INSERT INTO `dp_admin_attachment` VALUES (12, 1, '2-2.jpg', 'home', 'uploads/images/20190130/62afd30dace40c2d6f7d4c884ffd2026.jpg', '', '', 'image/jpeg', 'jpg', 161674, '35dbb4530e6812172c272eecb977bd03', 'b4e39ff025c96a156d4134713fee7b8259d7e048', 'local', 0, 1548781654, 1548781654, 100, 1, 790, 826);
INSERT INTO `dp_admin_attachment` VALUES (13, 1, '2-3.jpg', 'home', 'uploads/images/20190130/6eadcbf40b59a71a0ae7049a4e1dd28c.jpg', '', '', 'image/jpeg', 'jpg', 128626, 'a0a07b762c78c85d4f371e99e2fab463', 'd63d449ed0cb5820f79e38ae225d74ff40b5680f', 'local', 0, 1548781654, 1548781654, 100, 1, 790, 739);
INSERT INTO `dp_admin_attachment` VALUES (14, 1, '2-4.jpg', 'home', 'uploads/images/20190130/b757524f27b72aa43c6005327732e84b.jpg', '', '', 'image/jpeg', 'jpg', 92104, '0269fc029db4f04d7fcd05ade1ff488f', 'cc5d0b3a42008cd5dd79da2ecf0b18791fa6d306', 'local', 0, 1548781654, 1548781654, 100, 1, 790, 517);
INSERT INTO `dp_admin_attachment` VALUES (15, 1, '微信图片_20190127095524.jpg', 'home', 'uploads/images/20190130/98dc72502fef68dbe9f2b8d56aa6fe6c.jpg', '', '', 'image/jpeg', 'jpg', 107624, 'bc87faac9f8c119cdcb132877ffdd92e', 'f5ee4a9fc7f3fe673a41330c89e212222cf93f7d', 'local', 0, 1548834868, 1548834868, 100, 1, 1080, 1920);
INSERT INTO `dp_admin_attachment` VALUES (16, 1, '14a3e696798ae89f6ed8ac2992bda9e4.jpg', 'home', 'uploads/images/20190130/3025dc25ce503ac2c7cf18109ad3f938.jpg', '', '', 'image/jpeg', 'jpg', 777835, '9d377b10ce778c4938b3c7e2c63a229a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', 'local', 0, 1548834949, 1548834949, 100, 1, 1024, 768);
INSERT INTO `dp_admin_attachment` VALUES (17, 1, 'no.png', 'home', 'uploads/images/20190130/f7d734e739160ca7fc24e73ab5bc4031.png', '', '', 'image/png', 'png', 3791, 'd3e2c98544d1c5d99e3884fc289ec22f', '8b00c8b9fdc1cee28d705d306624db692a98c90b', 'local', 0, 1548837322, 1548837322, 100, 1, 200, 200);
INSERT INTO `dp_admin_attachment` VALUES (18, 1, 'IMG_2014(20181020-114456).jpg', 'home', 'uploads/images/20190130/9b80d529b58efe2b95e8ae01bd7485fc.jpg', '', '', 'image/jpeg', 'jpg', 716274, '70c236682307861a00b05013dbd38627', '054dcad26e9af707f3809401622375983ef3dc02', 'local', 0, 1548837342, 1548837342, 100, 1, 1242, 662);
INSERT INTO `dp_admin_attachment` VALUES (19, 1, '微信图片_20190130155324.jpg', 'home', 'uploads/images/20190130/ef69e060d77ee47f53d4fe5d9efb3b83.jpg', '', '', 'image/jpeg', 'jpg', 3906217, '9928f9906a7088325daa764852a5a8da', 'c3e657d0719d7ba9db7e7c456bf3bdd1b07a96c9', 'local', 0, 1548837976, 1548837976, 100, 1, 7874, 3937);
INSERT INTO `dp_admin_attachment` VALUES (20, 1, '3.jpg', 'home', 'uploads/images/20190130/85ed626e41d580e2b26a548cf975e120.jpg', '', '', 'image/jpeg', 'jpg', 85963, '54c7996fa40b3c074ca9820ba2520ba0', 'e3026ef1d725797810f16d2599fea42aeaa31526', 'local', 0, 1548839197, 1548839197, 100, 1, 800, 800);
INSERT INTO `dp_admin_attachment` VALUES (21, 1, '3-1.jpg', 'home', 'uploads/images/20190130/f459da2d397fb485921a822fef4ed5d1.jpg', '', '', 'image/jpeg', 'jpg', 80763, '6414523e5c305e058fdab492198da87a', '08f4cb27eb43dd808fbda4e313ea7ef21d90f299', 'local', 0, 1548839204, 1548839204, 100, 1, 790, 960);
INSERT INTO `dp_admin_attachment` VALUES (22, 1, '3-2.jpg', 'home', 'uploads/images/20190130/f90e61931538572e6c0e68f75f2818db.jpg', '', '', 'image/jpeg', 'jpg', 111699, '16c954af75f8b59b35660986d4207764', '1a60333e85740aef82ccd4a2d4c876e015344e4d', 'local', 0, 1548839204, 1548839204, 100, 1, 790, 960);
INSERT INTO `dp_admin_attachment` VALUES (23, 1, '3-3.jpg', 'home', 'uploads/images/20190130/53a840ab89902d2fead347c8a68a1a81.jpg', '', '', 'image/jpeg', 'jpg', 86166, '783509d7be46945e7753aceb2eb41b21', '28878fa8dd46295dc74f0f17bcd1f9063cc22bb5', 'local', 0, 1548839204, 1548839204, 100, 1, 790, 960);
INSERT INTO `dp_admin_attachment` VALUES (24, 1, '3-4.jpg', 'home', 'uploads/images/20190130/2d6e49bb4234cb128251dc94f1c40707.jpg', '', '', 'image/jpeg', 'jpg', 80789, '4b5dab5a591d60f0b62f0eba56ec7f31', '653d3748432bd00e416f0d0c1594b6f0f7739db8', 'local', 0, 1548839204, 1548839204, 100, 1, 790, 960);

-- ----------------------------
-- Table structure for dp_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_config`;
CREATE TABLE `dp_admin_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `options` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置项',
  `tips` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 2 COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_config
-- ----------------------------
INSERT INTO `dp_admin_config` VALUES (1, 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', 2, '', '', '', '', 1475240395, 1477403914, 1, 1);
INSERT INTO `dp_admin_config` VALUES (2, 'web_site_title', '站点标题', 'base', 'text', '海豚PHP', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240646, 1477710341, 2, 1);
INSERT INTO `dp_admin_config` VALUES (3, 'web_site_slogan', '站点标语', 'base', 'text', '海豚PHP，极简、极速、极致', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240994, 1477710357, 3, 1);
INSERT INTO `dp_admin_config` VALUES (4, 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241067, 1475241067, 4, 1);
INSERT INTO `dp_admin_config` VALUES (5, 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', 2, '', '', '', '', 1475241186, 1475241186, 6, 1);
INSERT INTO `dp_admin_config` VALUES (6, 'web_site_keywords', '站点关键词', 'base', 'text', '海豚PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', 2, '', '', '', '', 1475241328, 1475241328, 7, 1);
INSERT INTO `dp_admin_config` VALUES (7, 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 DolphinPHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241416, 1477710383, 8, 1);
INSERT INTO `dp_admin_config` VALUES (8, 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241441, 1477710441, 9, 1);
INSERT INTO `dp_admin_config` VALUES (9, 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241498, 1477710455, 10, 1);
INSERT INTO `dp_admin_config` VALUES (10, 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241716, 1477649446, 100, 1);
INSERT INTO `dp_admin_config` VALUES (11, 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241835, 1495853193, 100, 1);
INSERT INTO `dp_admin_config` VALUES (12, 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475241897, 1477663520, 100, 1);
INSERT INTO `dp_admin_config` VALUES (13, 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475241975, 1477649489, 100, 1);
INSERT INTO `dp_admin_config` VALUES (14, 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475242015, 1477663529, 100, 1);
INSERT INTO `dp_admin_config` VALUES (15, 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475242056, 1477649506, 100, 1);
INSERT INTO `dp_admin_config` VALUES (16, 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', 2, '', '', '', '', 1475242066, 1476074507, 101, 1);
INSERT INTO `dp_admin_config` VALUES (17, 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', 2, '', '', '', '', 1475250066, 1477316689, 102, 1);
INSERT INTO `dp_admin_config` VALUES (18, 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', 2, '', '', '', '', 1476864205, 1476864231, 100, 1);
INSERT INTO `dp_admin_config` VALUES (19, 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', 2, '', '', '', '', 1476866355, 1476866355, 100, 1);
INSERT INTO `dp_admin_config` VALUES (21, 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', 2, '', '', '', '', 1477017745, 1477018467, 100, 1);
INSERT INTO `dp_admin_config` VALUES (22, 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', 2, '', '', '', '', 1477017886, 1477017886, 100, 1);
INSERT INTO `dp_admin_config` VALUES (23, 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', 2, '', '', '', '', 1477017978, 1477018172, 100, 1);
INSERT INTO `dp_admin_config` VALUES (24, 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', 2, '', '', '', '', 1477018083, 1477018083, 100, 1);
INSERT INTO `dp_admin_config` VALUES (25, 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', 2, '', '', '', '', 1477579289, 1477579289, 103, 1);
INSERT INTO `dp_admin_config` VALUES (26, 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1477620643, 1477620643, 5, 1);
INSERT INTO `dp_admin_config` VALUES (27, 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', 2, '', '', '', '', 1477644150, 1477649513, 100, 1);
INSERT INTO `dp_admin_config` VALUES (28, 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', 2, '', '', '', '', 1477646271, 1477649521, 100, 1);
INSERT INTO `dp_admin_config` VALUES (29, 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', 2, '', '', '', '', 1477649648, 1477649648, 100, 1);
INSERT INTO `dp_admin_config` VALUES (30, 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656390, 1477656390, 100, 1);
INSERT INTO `dp_admin_config` VALUES (31, 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656528, 1477656528, 100, 1);
INSERT INTO `dp_admin_config` VALUES (32, 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', 2, '', '', '', '', 1477656714, 1477661309, 100, 1);
INSERT INTO `dp_admin_config` VALUES (33, 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', 2, '', '', '', '', 1477727305, 1477727305, 100, 1);
INSERT INTO `dp_admin_config` VALUES (34, 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', 2, '', '', '', '', 1478771958, 1478771958, 99, 1);
INSERT INTO `dp_admin_config` VALUES (35, 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', 0, '', '', '', '', 1486714723, 1486715620, 104, 1);
INSERT INTO `dp_admin_config` VALUES (36, 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', 0, '', '', '', '', 1487035843, 1487035843, 99, 1);
INSERT INTO `dp_admin_config` VALUES (37, 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', 0, '', '', '', '', 1501488567, 1501490821, 100, 1);
INSERT INTO `dp_admin_config` VALUES (38, 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', 0, '', '', '', '', 1512635391, 1512635391, 99, 1);
INSERT INTO `dp_admin_config` VALUES (39, 'asset_version', '资源版本号', 'develop', 'text', '20180327', '', '可通过修改版号强制用户更新静态文件', '', '', '', '', '', 0, '', '', '', '', 1522143239, 1522143239, 100, 1);

-- ----------------------------
-- Table structure for dp_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook`;
CREATE TABLE `dp_admin_hook`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为系统钩子',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钩子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_hook
-- ----------------------------
INSERT INTO `dp_admin_hook` VALUES (1, 'admin_index', '', '后台首页', 1, 1468174214, 1477757518, 1);
INSERT INTO `dp_admin_hook` VALUES (2, 'plugin_index_tab_list', '', '插件扩展tab钩子', 1, 1468174214, 1468174214, 1);
INSERT INTO `dp_admin_hook` VALUES (3, 'module_index_tab_list', '', '模块扩展tab钩子', 1, 1468174214, 1468174214, 1);
INSERT INTO `dp_admin_hook` VALUES (4, 'page_tips', '', '每个页面的提示', 1, 1468174214, 1468174214, 1);
INSERT INTO `dp_admin_hook` VALUES (5, 'signin_footer', '', '登录页面底部钩子', 1, 1479269315, 1479269315, 1);
INSERT INTO `dp_admin_hook` VALUES (6, 'signin_captcha', '', '登录页面验证码钩子', 1, 1479269315, 1479269315, 1);
INSERT INTO `dp_admin_hook` VALUES (7, 'signin', '', '登录控制器钩子', 1, 1479386875, 1479386875, 1);
INSERT INTO `dp_admin_hook` VALUES (8, 'upload_attachment', '', '附件上传钩子', 1, 1501493808, 1501493808, 1);
INSERT INTO `dp_admin_hook` VALUES (9, 'page_plugin_js', '', '页面插件js钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (10, 'page_plugin_css', '', '页面插件css钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (11, 'signin_sso', '', '单点登录钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (12, 'signout_sso', '', '单点退出钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (13, 'user_add', '', '添加用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (14, 'user_edit', '', '编辑用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (15, 'user_delete', '', '删除用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (16, 'user_enable', '', '启用用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (17, 'user_disable', '', '禁用用户钩子', 1, 1503633591, 1503633591, 1);

-- ----------------------------
-- Table structure for dp_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook_plugin`;
CREATE TABLE `dp_admin_hook_plugin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钩子-插件对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_hook_plugin
-- ----------------------------
INSERT INTO `dp_admin_hook_plugin` VALUES (1, 'admin_index', 'SystemInfo', 1477757503, 1477757503, 1, 1);
INSERT INTO `dp_admin_hook_plugin` VALUES (2, 'admin_index', 'DevTeam', 1477755780, 1477755780, 2, 1);

-- ----------------------------
-- Table structure for dp_admin_icon
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_icon`;
CREATE TABLE `dp_admin_icon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图标表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_admin_icon_list
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_icon_list`;
CREATE TABLE `dp_admin_icon_list`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `icon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属图标id',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标关键词',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '详细图标列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_log`;
CREATE TABLE `dp_admin_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '行为id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '触发行为的数据id',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行行为的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action_ip_ix`(`action_ip`) USING BTREE,
  INDEX `action_id_ix`(`action_id`) USING BTREE,
  INDEX `user_id_ix`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行为日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_log
-- ----------------------------
INSERT INTO `dp_admin_log` VALUES (1, 35, 1, 993856584, 'admin_module', 0, '超级管理员 安装了模块：门户', 1, 1546683237);
INSERT INTO `dp_admin_log` VALUES (2, 35, 1, 993856584, 'admin_module', 0, '超级管理员 安装了模块：客户', 1, 1546691727);
INSERT INTO `dp_admin_log` VALUES (3, 30, 1, 993856584, 'admin_menu', 329, '超级管理员 添加了节点：所属模块(customer),所属节点ID(0),节点标题(客户管理),节点链接(customer/admin/index)', 1, 1546692553);
INSERT INTO `dp_admin_log` VALUES (4, 30, 1, 993856584, 'admin_menu', 330, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(客户列表),节点链接(customer/customerlist/index)', 1, 1546692676);
INSERT INTO `dp_admin_log` VALUES (5, 30, 1, 993856584, 'admin_menu', 331, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(经期设置),节点链接(customer/periodlist/index)', 1, 1546694614);
INSERT INTO `dp_admin_log` VALUES (6, 30, 1, 993856584, 'admin_menu', 332, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(经期记录),节点链接(customer/menstrualist/index)', 1, 1546694685);
INSERT INTO `dp_admin_log` VALUES (7, 30, 1, 993856584, 'admin_menu', 333, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(留言列表),节点链接(customer/leavelist/index)', 1, 1546695190);
INSERT INTO `dp_admin_log` VALUES (8, 30, 1, 993856584, 'admin_menu', 334, '超级管理员 添加了节点：所属模块(customer),所属节点ID(333),节点标题(留言回复),节点链接(customer/leavelist/reply)', 1, 1546695269);
INSERT INTO `dp_admin_log` VALUES (9, 30, 1, 993856584, 'admin_menu', 335, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(测试接口),节点链接(api/index/index)', 1, 1546695338);
INSERT INTO `dp_admin_log` VALUES (10, 30, 1, 1851196401, 'admin_menu', 336, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(振宇测试接口),节点链接(apil2/index/index)', 1, 1547132435);
INSERT INTO `dp_admin_log` VALUES (11, 1, 1, 1851196401, 'admin_user', 2, '超级管理员 添加了用户：lzy', 1, 1547132824);
INSERT INTO `dp_admin_log` VALUES (12, 35, 1, 2130706433, 'admin_module', 0, '超级管理员 安装了模块：圈子', 1, 1548563960);
INSERT INTO `dp_admin_log` VALUES (13, 30, 1, 2130706433, 'admin_menu', 337, '超级管理员 添加了节点：所属模块(circle),所属节点ID(0),节点标题(圈子管理),节点链接(circle/Index/index)', 1, 1548565152);
INSERT INTO `dp_admin_log` VALUES (14, 30, 1, 2130706433, 'admin_menu', 338, '超级管理员 添加了节点：所属模块(circle),所属节点ID(337),节点标题(圈子列表),节点链接(circle/Circlelist/index)', 1, 1548565296);
INSERT INTO `dp_admin_log` VALUES (15, 31, 1, 2015993387, 'admin_menu', 337, '超级管理员 编辑了节点：节点ID(337)', 1, 1548586126);
INSERT INTO `dp_admin_log` VALUES (16, 30, 1, 2130706433, 'admin_menu', 339, '超级管理员 添加了节点：所属模块(circle),所属节点ID(338),节点标题(审核通过列表),节点链接(circle/Circlelist/shlist)', 1, 1548590905);
INSERT INTO `dp_admin_log` VALUES (17, 30, 1, 2130706433, 'admin_menu', 340, '超级管理员 添加了节点：所属模块(circle),所属节点ID(338),节点标题(待审核列表),节点链接(circle/Circlelist/dshlist)', 1, 1548590924);
INSERT INTO `dp_admin_log` VALUES (18, 30, 1, 2130706433, 'admin_menu', 341, '超级管理员 添加了节点：所属模块(circle),所属节点ID(337),节点标题(圈子类型),节点链接(circle/Circlelist/circletype)', 1, 1548591098);
INSERT INTO `dp_admin_log` VALUES (19, 30, 1, 2130706433, 'admin_menu', 342, '超级管理员 添加了节点：所属模块(circle),所属节点ID(341),节点标题(添加圈子类型),节点链接(circle/Circlelist/add_circletype)', 1, 1548591528);
INSERT INTO `dp_admin_log` VALUES (20, 30, 1, 2130706433, 'admin_menu', 343, '超级管理员 添加了节点：所属模块(circle),所属节点ID(338),节点标题(删除圈子),节点链接(circle/circlelist/deletelist)', 1, 1548594578);
INSERT INTO `dp_admin_log` VALUES (21, 32, 1, 2130706433, 'admin_menu', 343, '超级管理员 删除了节点：节点ID(343),节点标题(删除圈子),节点链接(circle/circlelist/deletelist)', 1, 1548594719);
INSERT INTO `dp_admin_log` VALUES (22, 35, 1, 2015993387, 'admin_module', 0, '超级管理员 安装了模块：主页', 1, 1548596356);
INSERT INTO `dp_admin_log` VALUES (23, 30, 1, 2015993387, 'admin_menu', 344, '超级管理员 添加了节点：所属模块(home),所属节点ID(0),节点标题(主页管理),节点链接(home/admin/index)', 1, 1548596535);
INSERT INTO `dp_admin_log` VALUES (24, 30, 1, 2015993387, 'admin_menu', 345, '超级管理员 添加了节点：所属模块(home),所属节点ID(344),节点标题(轮播列表),节点链接(home/advList/index)', 1, 1548596683);
INSERT INTO `dp_admin_log` VALUES (25, 31, 1, 2015993387, 'admin_menu', 345, '超级管理员 编辑了节点：节点ID(345)', 1, 1548596726);
INSERT INTO `dp_admin_log` VALUES (26, 31, 1, 2130706433, 'admin_menu', 342, '超级管理员 编辑了节点：节点ID(342)', 1, 1548597064);
INSERT INTO `dp_admin_log` VALUES (27, 30, 1, 2130706433, 'admin_menu', 346, '超级管理员 添加了节点：所属模块(circle),所属节点ID(341),节点标题(添加圈子类型),节点链接(circle/circlelist/add_circletype)', 1, 1548597131);
INSERT INTO `dp_admin_log` VALUES (28, 31, 1, 2130706433, 'admin_menu', 346, '超级管理员 编辑了节点：节点ID(346)', 1, 1548597273);
INSERT INTO `dp_admin_log` VALUES (29, 30, 1, 2015993387, 'admin_menu', 347, '超级管理员 添加了节点：所属模块(home),所属节点ID(345),节点标题(新增轮播图),节点链接(home/Advlist/add)', 1, 1548597485);
INSERT INTO `dp_admin_log` VALUES (30, 31, 1, 2015993387, 'admin_menu', 347, '超级管理员 编辑了节点：节点ID(347)', 1, 1548597537);
INSERT INTO `dp_admin_log` VALUES (31, 32, 1, 2130706433, 'admin_menu', 346, '超级管理员 删除了节点：节点ID(346),节点标题(添加圈子类型),节点链接(circle/circlelist/add)', 1, 1548598945);
INSERT INTO `dp_admin_log` VALUES (32, 30, 1, 2130706433, 'admin_menu', 348, '超级管理员 添加了节点：所属模块(circle),所属节点ID(342),节点标题(添加类型),节点链接(circle/circlelist/add)', 1, 1548598975);
INSERT INTO `dp_admin_log` VALUES (33, 30, 1, 2130706433, 'admin_menu', 349, '超级管理员 添加了节点：所属模块(circle),所属节点ID(342),节点标题(编辑类型),节点链接(circle/Circlelist/edit)', 1, 1548645370);
INSERT INTO `dp_admin_log` VALUES (34, 30, 1, 2015993387, 'admin_menu', 350, '超级管理员 添加了节点：所属模块(home),所属节点ID(345),节点标题(轮播上架),节点链接(home/Advlist/uppershelf)', 1, 1548658896);
INSERT INTO `dp_admin_log` VALUES (35, 32, 1, 2130706433, 'admin_menu', 349, '超级管理员 删除了节点：节点ID(349),节点标题(编辑类型),节点链接(circle/circlelist/edit)', 1, 1548659208);
INSERT INTO `dp_admin_log` VALUES (36, 30, 1, 2130706433, 'admin_menu', 351, '超级管理员 添加了节点：所属模块(circle),所属节点ID(342),节点标题(更改状态),节点链接(circle/Circlelist/state)', 1, 1548677668);
INSERT INTO `dp_admin_log` VALUES (37, 30, 1, 2015993387, 'admin_menu', 352, '超级管理员 添加了节点：所属模块(home),所属节点ID(345),节点标题(轮播下架),节点链接(home/Advlist/lowershelf)', 1, 1548685781);
INSERT INTO `dp_admin_log` VALUES (38, 30, 1, 2015993387, 'admin_menu', 353, '超级管理员 添加了节点：所属模块(home),所属节点ID(344),节点标题(盒子列表),节点链接(home/Boxlist/index)', 1, 1548686626);
INSERT INTO `dp_admin_log` VALUES (39, 30, 1, 2015993387, 'admin_menu', 354, '超级管理员 添加了节点：所属模块(home),所属节点ID(353),节点标题(添加盒子),节点链接(home/Boxlist/add)', 1, 1548688800);
INSERT INTO `dp_admin_log` VALUES (40, 31, 1, 2015993387, 'admin_menu', 337, '超级管理员 编辑了节点：节点ID(337)', 1, 1548725518);
INSERT INTO `dp_admin_log` VALUES (41, 30, 1, 2015993387, 'admin_menu', 355, '超级管理员 添加了节点：所属模块(circle),所属节点ID(337),节点标题(zy测试接口),节点链接(apil2/index/index)', 1, 1548746070);
INSERT INTO `dp_admin_log` VALUES (42, 31, 1, 2015993387, 'admin_menu', 355, '超级管理员 编辑了节点：节点ID(355)', 1, 1548746078);
INSERT INTO `dp_admin_log` VALUES (43, 34, 1, 2015993387, 'admin_menu', 336, '超级管理员 禁用了节点：节点ID(336),节点标题(振宇测试接口),节点链接(apil2/index/index)', 1, 1548746133);
INSERT INTO `dp_admin_log` VALUES (44, 31, 1, 2015993387, 'admin_menu', 338, '超级管理员 编辑了节点：节点ID(338)', 1, 1548746167);
INSERT INTO `dp_admin_log` VALUES (45, 31, 1, 2015993387, 'admin_menu', 341, '超级管理员 编辑了节点：节点ID(341)', 1, 1548746205);
INSERT INTO `dp_admin_log` VALUES (46, 34, 1, 2015993387, 'admin_menu', 333, '超级管理员 禁用了节点：节点ID(333),节点标题(留言列表),节点链接(customer/leavelist/index)', 1, 1548746228);
INSERT INTO `dp_admin_log` VALUES (47, 30, 1, 2015993387, 'admin_menu', 356, '超级管理员 添加了节点：所属模块(home),所属节点ID(353),节点标题(编辑盒子),节点链接(home/Boxlist/edit)', 1, 1548764996);
INSERT INTO `dp_admin_log` VALUES (48, 31, 1, 2015993387, 'admin_menu', 356, '超级管理员 编辑了节点：节点ID(356)', 1, 1548765053);
INSERT INTO `dp_admin_log` VALUES (49, 31, 1, 2015993387, 'admin_menu', 356, '超级管理员 编辑了节点：节点ID(356)', 1, 1548765089);
INSERT INTO `dp_admin_log` VALUES (50, 31, 1, 2015993387, 'admin_menu', 356, '超级管理员 编辑了节点：节点ID(356)', 1, 1548765140);
INSERT INTO `dp_admin_log` VALUES (51, 31, 1, 2015993387, 'admin_menu', 356, '超级管理员 编辑了节点：节点ID(356)', 1, 1548765191);
INSERT INTO `dp_admin_log` VALUES (52, 31, 1, 2015993387, 'admin_menu', 356, '超级管理员 编辑了节点：节点ID(356)', 1, 1548765261);
INSERT INTO `dp_admin_log` VALUES (53, 31, 1, 2015993387, 'admin_menu', 356, '超级管理员 编辑了节点：节点ID(356)', 1, 1548766029);
INSERT INTO `dp_admin_log` VALUES (54, 32, 1, 2015993387, 'admin_menu', 356, '超级管理员 删除了节点：节点ID(356),节点标题(编辑盒子),节点链接(home/boxlist/edit)', 1, 1548766433);
INSERT INTO `dp_admin_log` VALUES (55, 30, 1, 2015993387, 'admin_menu', 357, '超级管理员 添加了节点：所属模块(home),所属节点ID(353),节点标题(编辑盒子),节点链接(home/Boxlist/bianji)', 1, 1548767247);
INSERT INTO `dp_admin_log` VALUES (56, 31, 1, 2015993387, 'admin_menu', 357, '超级管理员 编辑了节点：节点ID(357)', 1, 1548767705);
INSERT INTO `dp_admin_log` VALUES (57, 31, 1, 2015993387, 'admin_menu', 357, '超级管理员 编辑了节点：节点ID(357)', 1, 1548767724);
INSERT INTO `dp_admin_log` VALUES (58, 30, 1, 1964801766, 'admin_menu', 358, '超级管理员 添加了节点：所属模块(home),所属节点ID(353),节点标题(盒子价格),节点链接(home)', 1, 1548773414);
INSERT INTO `dp_admin_log` VALUES (59, 31, 1, 1964801766, 'admin_menu', 358, '超级管理员 编辑了节点：节点ID(358)', 1, 1548773604);
INSERT INTO `dp_admin_log` VALUES (60, 32, 1, 1964801766, 'admin_menu', 358, '超级管理员 删除了节点：节点ID(358),节点标题(价格列表),节点链接(home/boxlist/boxprice)', 1, 1548773987);
INSERT INTO `dp_admin_log` VALUES (61, 30, 1, 1964801766, 'admin_menu', 359, '超级管理员 添加了节点：所属模块(home),所属节点ID(344),节点标题(盒子价格列表),节点链接(home/Boxlist/boxprice)', 1, 1548774032);
INSERT INTO `dp_admin_log` VALUES (62, 30, 1, 1964801766, 'admin_menu', 360, '超级管理员 添加了节点：所属模块(home),所属节点ID(353),节点标题(添加盒子价格),节点链接(home/Boxlist/addprice)', 1, 1548774690);
INSERT INTO `dp_admin_log` VALUES (63, 31, 1, 1964801766, 'admin_menu', 360, '超级管理员 编辑了节点：节点ID(360)', 1, 1548775793);
INSERT INTO `dp_admin_log` VALUES (64, 42, 1, 1964801766, 'admin_config', 0, '超级管理员 更新了系统设置：分组(upload)', 1, 1548835817);
INSERT INTO `dp_admin_log` VALUES (65, 30, 1, 2015986867, 'admin_menu', 361, '超级管理员 添加了节点：所属模块(home),所属节点ID(353),节点标题(添加盒子品牌),节点链接(home/Boxlist/addbrand)', 1, 1549889947);
INSERT INTO `dp_admin_log` VALUES (66, 30, 1, 2015986867, 'admin_menu', 362, '超级管理员 添加了节点：所属模块(home),所属节点ID(344),节点标题(盒子品牌),节点链接(home/Boxlist/boxbrand)', 1, 1549895523);
INSERT INTO `dp_admin_log` VALUES (67, 30, 1, 993856482, 'admin_menu', 363, '超级管理员 添加了节点：所属模块(customer),所属节点ID(329),节点标题(收货地址列表),节点链接(customer/Receiveaddress/index)', 1, 1550309986);
INSERT INTO `dp_admin_log` VALUES (68, 31, 1, 993856482, 'admin_menu', 363, '超级管理员 编辑了节点：节点ID(363)', 1, 1550309998);

-- ----------------------------
-- Table structure for dp_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_menu`;
CREATE TABLE `dp_admin_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级菜单id',
  `module` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '网站上线后是否隐藏',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `system_menu` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 364 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_menu
-- ----------------------------
INSERT INTO `dp_admin_menu` VALUES (1, 0, 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', 0, 1467617722, 1477710540, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (2, 1, 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1467618170, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (3, 2, 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', 0, 1467618273, 1489049773, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (4, 0, 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', 0, 1467618361, 1477710540, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (5, 4, 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', 0, 1467618441, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (6, 5, 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', 0, 1467618490, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (7, 5, 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', 0, 1467618618, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (8, 7, 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', 0, 1467618648, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (9, 7, 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', 0, 1467619566, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (10, 7, 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', 0, 1467619583, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (11, 7, 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', 0, 1467619609, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (12, 7, 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', 0, 1467619637, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (13, 5, 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', 0, 1467619882, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (14, 13, 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', 0, 1467619902, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (15, 13, 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', 0, 1467620331, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (16, 13, 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', 0, 1467620363, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (17, 13, 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', 0, 1467620386, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (18, 13, 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', 0, 1467620404, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (19, 68, 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', 0, 1467688065, 1477710702, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (20, 19, 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1467688137, 1477710702, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (21, 20, 'user', '新增', '', 'module_admin', 'user/index/add', '_self', 0, 1467688177, 1477710702, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (22, 20, 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', 0, 1467688202, 1477710702, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (23, 20, 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', 0, 1467688219, 1477710702, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (24, 20, 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', 0, 1467688238, 1477710702, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (25, 20, 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', 0, 1467688256, 1477710702, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (211, 64, 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', 0, 1480299320, 1480299320, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (32, 4, 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', 0, 1467688853, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (33, 32, 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', 0, 1467689008, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (34, 33, 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', 0, 1467689153, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (35, 33, 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', 0, 1467689173, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (36, 33, 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', 0, 1467689192, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (37, 33, 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', 0, 1467689241, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (38, 33, 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', 0, 1467689294, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (39, 33, 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', 0, 1467689312, 1477710695, 6, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (40, 33, 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', 0, 1467689341, 1477710695, 7, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (41, 32, 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', 0, 1467689527, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (42, 41, 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', 0, 1467689650, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (43, 41, 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', 0, 1467689665, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (44, 41, 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', 0, 1467689680, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (45, 41, 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', 0, 1467689700, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (46, 41, 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', 0, 1467689730, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (47, 41, 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', 0, 1467689747, 1477710695, 6, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (48, 41, 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', 0, 1467689789, 1477710695, 7, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (49, 41, 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', 0, 1467689846, 1477710695, 8, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (50, 5, 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', 0, 1467690161, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (51, 70, 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', 0, 1467690240, 1489049773, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (52, 50, 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', 0, 1467690334, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (53, 50, 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', 0, 1467690352, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (54, 50, 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', 0, 1467690369, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (55, 50, 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', 0, 1467690396, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (56, 41, 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', 0, 1467858065, 1477710695, 11, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (57, 41, 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', 0, 1467858092, 1477710695, 10, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (60, 41, 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', 0, 1467858421, 1477710695, 9, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (61, 41, 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', 0, 1467879016, 1477710695, 14, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (62, 13, 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', 0, 1468073039, 1477710695, 6, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (64, 5, 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', 0, 1476111944, 1477710695, 6, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (65, 5, 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', 0, 1476111992, 1477710695, 8, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (66, 32, 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', 0, 1476112326, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (67, 19, 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', 0, 1476113025, 1477710702, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (68, 0, 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1476193348, 1477710540, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (69, 32, 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', 0, 1476236193, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (70, 2, 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', 0, 1476237472, 1489049773, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (71, 67, 'user', '新增', '', 'module_admin', 'user/role/add', '_self', 0, 1476256935, 1477710702, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (72, 67, 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', 0, 1476256968, 1477710702, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (73, 67, 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', 0, 1476256993, 1477710702, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (74, 67, 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', 0, 1476257023, 1477710702, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (75, 67, 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', 0, 1476257046, 1477710702, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (76, 20, 'user', '授权', '', 'module_admin', 'user/index/access', '_self', 0, 1476375187, 1477710702, 6, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (77, 69, 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', 0, 1476668971, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (78, 69, 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', 0, 1476669006, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (79, 69, 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', 0, 1476669375, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (80, 69, 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', 0, 1476669427, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (81, 69, 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', 0, 1476669564, 1477710695, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (183, 66, 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', 0, 1476851362, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (184, 66, 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', 0, 1476851382, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (185, 5, 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', 0, 1476882441, 1477710695, 7, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (186, 185, 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', 0, 1476884439, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (187, 185, 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', 0, 1476884464, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (188, 185, 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', 0, 1476884493, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (189, 185, 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', 0, 1476884534, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (190, 185, 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', 0, 1476884551, 1477710695, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (191, 65, 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', 0, 1476972746, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (192, 65, 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', 0, 1476972772, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (193, 65, 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', 0, 1476972800, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (194, 65, 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', 0, 1476972825, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (195, 65, 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', 0, 1476973457, 1477710695, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (210, 41, 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', 0, 1477713981, 1477713981, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (209, 185, 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', 0, 1477713939, 1477713939, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (208, 7, 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', 0, 1477713808, 1477713808, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (207, 69, 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', 0, 1477713770, 1477713770, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (212, 2, 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', 0, 1489049767, 1489049773, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (213, 70, 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', 0, 1490588610, 1490588610, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (214, 68, 'user', '消息管理', 'fa fa-fw fa-comments-o', 'module_admin', '', '_self', 0, 1520492129, 1520492129, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (215, 214, 'user', '消息列表', 'fa fa-fw fa-th-list', 'module_admin', 'user/message/index', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (216, 215, 'user', '新增', '', 'module_admin', 'user/message/add', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (217, 215, 'user', '编辑', '', 'module_admin', 'user/message/edit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (218, 215, 'user', '删除', '', 'module_admin', 'user/message/delete', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (219, 215, 'user', '启用', '', 'module_admin', 'user/message/enable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (220, 215, 'user', '禁用', '', 'module_admin', 'user/message/disable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (221, 215, 'user', '快速编辑', '', 'module_admin', 'user/message/quickedit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (222, 2, 'admin', '消息中心', 'fa fa-fw fa-comments-o', 'module_admin', 'admin/message/index', '_self', 0, 1520495992, 1520496254, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (223, 222, 'admin', '删除', '', 'module_admin', 'admin/message/delete', '_self', 0, 1520495992, 1520496263, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (224, 222, 'admin', '启用', '', 'module_admin', 'admin/message/enable', '_self', 0, 1520495992, 1520496270, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (225, 32, 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (226, 225, 'admin', '新增', '', 'module_admin', 'admin/icon/add', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (227, 225, 'admin', '编辑', '', 'module_admin', 'admin/icon/edit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (228, 225, 'admin', '删除', '', 'module_admin', 'admin/icon/delete', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (229, 225, 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (230, 225, 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (231, 225, 'admin', '快速编辑', '', 'module_admin', 'admin/icon/quickedit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (232, 225, 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', 0, 1520923368, 1520923368, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (233, 225, 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', 0, 1520931908, 1520931908, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (234, 20, 'user', '快速编辑', '', 'module_admin', 'user/index/quickedit', '_self', 0, 1526028258, 1526028258, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (235, 67, 'user', '快速编辑', '', 'module_admin', 'user/role/quickedit', '_self', 0, 1526028282, 1526028282, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (236, 0, 'cms', '门户', 'fa fa-fw fa-newspaper-o', 'module_admin', 'cms/index/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (237, 236, 'cms', '常用操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (238, 237, 'cms', '仪表盘', 'fa fa-fw fa-tachometer', 'module_admin', 'cms/index/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (239, 237, 'cms', '发布文档', 'fa fa-fw fa-plus', 'module_admin', 'cms/document/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (240, 237, 'cms', '文档列表', 'fa fa-fw fa-list', 'module_admin', 'cms/document/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (241, 240, 'cms', '编辑', '', 'module_admin', 'cms/document/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (242, 240, 'cms', '删除', '', 'module_admin', 'cms/document/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (243, 240, 'cms', '启用', '', 'module_admin', 'cms/document/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (244, 240, 'cms', '禁用', '', 'module_admin', 'cms/document/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (245, 240, 'cms', '快速编辑', '', 'module_admin', 'cms/document/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (246, 237, 'cms', '单页管理', 'fa fa-fw fa-file-word-o', 'module_admin', 'cms/page/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (247, 246, 'cms', '新增', '', 'module_admin', 'cms/page/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (248, 246, 'cms', '编辑', '', 'module_admin', 'cms/page/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (249, 246, 'cms', '删除', '', 'module_admin', 'cms/page/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (250, 246, 'cms', '启用', '', 'module_admin', 'cms/page/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (251, 246, 'cms', '禁用', '', 'module_admin', 'cms/page/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (252, 246, 'cms', '快速编辑', '', 'module_admin', 'cms/page/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (253, 237, 'cms', '回收站', 'fa fa-fw fa-recycle', 'module_admin', 'cms/recycle/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (254, 253, 'cms', '删除', '', 'module_admin', 'cms/recycle/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (255, 253, 'cms', '还原', '', 'module_admin', 'cms/recycle/restore', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (256, 236, 'cms', '内容管理', 'fa fa-fw fa-th-list', 'module_admin', '', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (257, 236, 'cms', '营销管理', 'fa fa-fw fa-money', 'module_admin', '', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (258, 257, 'cms', '广告管理', 'fa fa-fw fa-handshake-o', 'module_admin', 'cms/advert/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (259, 258, 'cms', '新增', '', 'module_admin', 'cms/advert/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (260, 258, 'cms', '编辑', '', 'module_admin', 'cms/advert/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (261, 258, 'cms', '删除', '', 'module_admin', 'cms/advert/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (262, 258, 'cms', '启用', '', 'module_admin', 'cms/advert/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (263, 258, 'cms', '禁用', '', 'module_admin', 'cms/advert/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (264, 258, 'cms', '快速编辑', '', 'module_admin', 'cms/advert/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (265, 258, 'cms', '广告分类', '', 'module_admin', 'cms/advert_type/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (266, 265, 'cms', '新增', '', 'module_admin', 'cms/advert_type/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (267, 265, 'cms', '编辑', '', 'module_admin', 'cms/advert_type/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (268, 265, 'cms', '删除', '', 'module_admin', 'cms/advert_type/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (269, 265, 'cms', '启用', '', 'module_admin', 'cms/advert_type/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (270, 265, 'cms', '禁用', '', 'module_admin', 'cms/advert_type/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (271, 265, 'cms', '快速编辑', '', 'module_admin', 'cms/advert_type/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (272, 257, 'cms', '滚动图片', 'fa fa-fw fa-photo', 'module_admin', 'cms/slider/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (273, 272, 'cms', '新增', '', 'module_admin', 'cms/slider/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (274, 272, 'cms', '编辑', '', 'module_admin', 'cms/slider/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (275, 272, 'cms', '删除', '', 'module_admin', 'cms/slider/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (276, 272, 'cms', '启用', '', 'module_admin', 'cms/slider/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (277, 272, 'cms', '禁用', '', 'module_admin', 'cms/slider/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (278, 272, 'cms', '快速编辑', '', 'module_admin', 'cms/slider/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (279, 257, 'cms', '友情链接', 'fa fa-fw fa-link', 'module_admin', 'cms/link/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (280, 279, 'cms', '新增', '', 'module_admin', 'cms/link/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (281, 279, 'cms', '编辑', '', 'module_admin', 'cms/link/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (282, 279, 'cms', '删除', '', 'module_admin', 'cms/link/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (283, 279, 'cms', '启用', '', 'module_admin', 'cms/link/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (284, 279, 'cms', '禁用', '', 'module_admin', 'cms/link/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (285, 279, 'cms', '快速编辑', '', 'module_admin', 'cms/link/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (286, 257, 'cms', '客服管理', 'fa fa-fw fa-commenting', 'module_admin', 'cms/support/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (287, 286, 'cms', '新增', '', 'module_admin', 'cms/support/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (288, 286, 'cms', '编辑', '', 'module_admin', 'cms/support/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (289, 286, 'cms', '删除', '', 'module_admin', 'cms/support/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (290, 286, 'cms', '启用', '', 'module_admin', 'cms/support/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (291, 286, 'cms', '禁用', '', 'module_admin', 'cms/support/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (292, 286, 'cms', '快速编辑', '', 'module_admin', 'cms/support/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (293, 236, 'cms', '门户设置', 'fa fa-fw fa-sliders', 'module_admin', '', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (294, 293, 'cms', '栏目分类', 'fa fa-fw fa-sitemap', 'module_admin', 'cms/column/index', '_self', 1, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (295, 294, 'cms', '新增', '', 'module_admin', 'cms/column/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (296, 294, 'cms', '编辑', '', 'module_admin', 'cms/column/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (297, 294, 'cms', '删除', '', 'module_admin', 'cms/column/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (298, 294, 'cms', '启用', '', 'module_admin', 'cms/column/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (299, 294, 'cms', '禁用', '', 'module_admin', 'cms/column/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (300, 294, 'cms', '快速编辑', '', 'module_admin', 'cms/column/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (301, 293, 'cms', '内容模型', 'fa fa-fw fa-th-large', 'module_admin', 'cms/model/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (302, 301, 'cms', '新增', '', 'module_admin', 'cms/model/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (303, 301, 'cms', '编辑', '', 'module_admin', 'cms/model/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (304, 301, 'cms', '删除', '', 'module_admin', 'cms/model/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (305, 301, 'cms', '启用', '', 'module_admin', 'cms/model/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (306, 301, 'cms', '禁用', '', 'module_admin', 'cms/model/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (307, 301, 'cms', '快速编辑', '', 'module_admin', 'cms/model/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (308, 301, 'cms', '字段管理', '', 'module_admin', 'cms/field/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (309, 308, 'cms', '新增', '', 'module_admin', 'cms/field/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (310, 308, 'cms', '编辑', '', 'module_admin', 'cms/field/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (311, 308, 'cms', '删除', '', 'module_admin', 'cms/field/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (312, 308, 'cms', '启用', '', 'module_admin', 'cms/field/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (313, 308, 'cms', '禁用', '', 'module_admin', 'cms/field/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (314, 308, 'cms', '快速编辑', '', 'module_admin', 'cms/field/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (315, 293, 'cms', '导航管理', 'fa fa-fw fa-map-signs', 'module_admin', 'cms/nav/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (316, 315, 'cms', '新增', '', 'module_admin', 'cms/nav/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (317, 315, 'cms', '编辑', '', 'module_admin', 'cms/nav/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (318, 315, 'cms', '删除', '', 'module_admin', 'cms/nav/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (319, 315, 'cms', '启用', '', 'module_admin', 'cms/nav/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (320, 315, 'cms', '禁用', '', 'module_admin', 'cms/nav/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (321, 315, 'cms', '快速编辑', '', 'module_admin', 'cms/nav/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (322, 315, 'cms', '菜单管理', '', 'module_admin', 'cms/menu/index', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (323, 322, 'cms', '新增', '', 'module_admin', 'cms/menu/add', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (324, 322, 'cms', '编辑', '', 'module_admin', 'cms/menu/edit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (325, 322, 'cms', '删除', '', 'module_admin', 'cms/menu/delete', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (326, 322, 'cms', '启用', '', 'module_admin', 'cms/menu/enable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (327, 322, 'cms', '禁用', '', 'module_admin', 'cms/menu/disable', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (328, 322, 'cms', '快速编辑', '', 'module_admin', 'cms/menu/quickedit', '_self', 0, 1546683238, 1546683238, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (329, 0, 'customer', '客户管理', 'fa fa-fw fa-user', 'module_admin', 'customer/admin/index', '_self', 0, 1546692553, 1546692553, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (330, 329, 'customer', '客户列表', 'fa fa-fw fa-list', 'module_admin', 'customer/customerlist/index', '_self', 0, 1546692676, 1550310030, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (331, 329, 'customer', '经期设置', 'fa fa-fw fa-th', 'module_admin', 'customer/periodlist/index', '_self', 0, 1546694614, 1550310030, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (332, 329, 'customer', '经期记录', 'fa fa-fw fa-align-left', 'module_admin', 'customer/menstrualist/index', '_self', 0, 1546694685, 1550310030, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (333, 329, 'customer', '留言列表', 'fa fa-fw fa-wechat', 'module_admin', 'customer/leavelist/index', '_self', 0, 1546695190, 1550310030, 4, 0, 0, '');
INSERT INTO `dp_admin_menu` VALUES (334, 333, 'customer', '留言回复', 'fa fa-fw fa-commenting', 'module_admin', 'customer/leavelist/reply', '_self', 0, 1546695269, 1550310030, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (335, 329, 'customer', '测试接口', 'fa fa-fw fa-windows', 'module_admin', 'api/index/index', '_self', 0, 1546695338, 1550310030, 6, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (336, 329, 'customer', '振宇测试接口', 'fa fa-fw fa-yc', 'module_admin', 'apil2/index/index', '_self', 0, 1547132435, 1550310030, 7, 0, 0, '');
INSERT INTO `dp_admin_menu` VALUES (337, 0, 'circle', '圈子管理', 'fa fa-fw fa-chrome', 'module_admin', 'circle/admin/index', '_self', 0, 1548565153, 1548725518, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (338, 337, 'circle', '圈子列表', 'fa fa-fw fa-th-list', 'module_admin', 'circle/circlelist/index', '_self', 0, 1548565296, 1548746167, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (339, 338, 'circle', '审核通过列表', '', 'module_admin', 'circle/circlelist/shlist', '_self', 0, 1548590905, 1548590905, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (340, 338, 'circle', '待审核列表', '', 'module_admin', 'circle/circlelist/dshlist', '_self', 0, 1548590925, 1548590925, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (341, 337, 'circle', '圈子类型', 'fa fa-fw fa-tasks', 'module_admin', 'circle/circlelist/circletype', '_self', 0, 1548591099, 1548746205, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (342, 341, 'circle', '圈子类型列表', '', 'module_admin', 'circle/circlelist/circletype', '_self', 0, 1548591528, 1548597065, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (344, 0, 'home', '主页管理', 'fa fa-fw fa-home', 'module_admin', 'home/admin/index', '_self', 0, 1548596535, 1548596535, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (345, 344, 'home', '轮播列表', 'fa fa-fw fa-list-ul', 'module_admin', 'home/advlist/index', '_self', 0, 1548596683, 1548596726, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (348, 342, 'circle', '添加类型', '', 'module_admin', 'circle/circlelist/add', '_self', 0, 1548598976, 1548598976, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (347, 345, 'home', '新增轮播图', 'fa fa-fw fa-plus-circle', 'module_admin', 'home/advlist/add', '_self', 0, 1548597485, 1548597537, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (351, 342, 'circle', '更改状态', '', 'module_admin', 'circle/circlelist/state', '_self', 0, 1548677669, 1548677669, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (350, 345, 'home', '轮播上架', 'fa fa-fw fa-arrow-up', 'module_admin', 'home/advlist/uppershelf', '_self', 1, 1548658896, 1548658896, 100, 0, 1, 'id');
INSERT INTO `dp_admin_menu` VALUES (352, 345, 'home', '轮播下架', 'fa fa-fw fa-arrow-down', 'module_admin', 'home/advlist/lowershelf', '_self', 1, 1548685781, 1548685781, 100, 0, 1, 'id');
INSERT INTO `dp_admin_menu` VALUES (353, 344, 'home', '盒子列表', 'fa fa-fw fa-list', 'module_admin', 'home/boxlist/index', '_self', 0, 1548686626, 1548686626, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (354, 353, 'home', '添加盒子', 'fa fa-fw fa-plus-circle', 'module_admin', 'home/boxlist/add', '_self', 0, 1548688800, 1548688800, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (355, 337, 'circle', 'zy测试接口', 'fa fa-fw fa-yc-square', 'module_admin', 'apil2/index/index', '_self', 0, 1548746070, 1548746078, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (357, 353, 'home', '编辑盒子', 'fa fa-fw fa-edit', 'module_admin', 'home/boxlist/edit', '_self', 0, 1548767247, 1548767724, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (359, 344, 'home', '盒子价格列表', 'fa fa-fw fa-yen', 'module_admin', 'home/boxlist/boxprice', '_self', 0, 1548774032, 1548774032, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (360, 353, 'home', '添加盒子价格', 'fa fa-fw fa-yen', 'module_admin', 'home/boxlist/addprice', '_self', 1, 1548774690, 1548775793, 100, 0, 1, 'box_id');
INSERT INTO `dp_admin_menu` VALUES (361, 353, 'home', '添加盒子品牌', 'fa fa-fw fa-diamond', 'module_admin', 'home/boxlist/addbrand', '_self', 0, 1549889947, 1549889947, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (362, 344, 'home', '盒子品牌', 'fa fa-fw fa-diamond', 'module_admin', 'home/boxlist/boxbrand', '_self', 0, 1549895523, 1549895523, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (363, 329, 'customer', '收货地址列表', 'fa fa-fw fa-indent', 'module_admin', 'customer/receiveaddress/index', '_self', 0, 1550309986, 1550310030, 5, 0, 1, '');

-- ----------------------------
-- Table structure for dp_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_message`;
CREATE TABLE `dp_admin_message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid_receive` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接收消息的用户id',
  `uid_send` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送消息的用户id',
  `type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息分类',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `read_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_module`;
CREATE TABLE `dp_admin_module`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息',
  `access` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '授权配置',
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为系统模块',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_module
-- ----------------------------
INSERT INTO `dp_admin_module` VALUES (1, 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1);
INSERT INTO `dp_admin_module` VALUES (2, 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1);
INSERT INTO `dp_admin_module` VALUES (3, 'cms', '门户', 'fa fa-fw fa-newspaper-o', '门户模块', 'CaiWeiMing', 'http://www.dolphinphp.com', '{\"summary\":0,\"contact\":\"<div class=\\\"font-s13 push\\\"><strong>\\u6cb3\\u6e90\\u5e02\\u5353\\u9510\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8<\\/strong><br \\/>\\r\\n\\u5730\\u5740\\uff1a\\u6cb3\\u6e90\\u5e02\\u6c5f\\u4e1c\\u65b0\\u533a\\u4e1c\\u73af\\u8def\\u6c47\\u901a\\u82d1D3-H232<br \\/>\\r\\n\\u7535\\u8bdd\\uff1a0762-8910006<br \\/>\\r\\n\\u90ae\\u7bb1\\uff1aadmin@zrthink.com<\\/div>\",\"meta_head\":\"\",\"meta_foot\":\"\",\"support_status\":1,\"support_color\":\"rgba(0,158,232,1)\",\"support_wx\":\"\",\"support_extra\":\"\"}', '{\"group\":{\"tab_title\":\"\\u680f\\u76ee\\u6388\\u6743\",\"table_name\":\"cms_column\",\"primary_key\":\"id\",\"parent_id\":\"pid\",\"node_name\":\"name\"}}', '1.0.0', 'cms.ming.module', 0, 1546683238, 1546683238, 100, 1);
INSERT INTO `dp_admin_module` VALUES (4, 'customer', '客户', 'fa fa-fw fa-user', '客户模块', 'WangWenFeng', '', '', '', '1.0.0', 'customer.feng.module', 0, 1546691727, 1546691943, 100, 1);
INSERT INTO `dp_admin_module` VALUES (5, 'circle', '圈子', 'fa fa-fw fa-user', '圈子模块', 'LinZhenYu', '', '', '', '1.0.0', 'customer.feng.module', 0, 1548563933, 1548563999, 100, 1);
INSERT INTO `dp_admin_module` VALUES (6, 'circle', '圈子', 'fa fa-fw fa-user', '圈子模块', 'LinZhenYu', '', NULL, NULL, '1.0.0', 'customer.feng.module', 0, 1548563962, 1548563962, 100, 1);
INSERT INTO `dp_admin_module` VALUES (7, 'home', '主页', 'fa fa-fw fa-user', '主页模块', 'WangWenFeng', '', NULL, NULL, '1.0.0', 'home.feng.module', 0, 1548596356, 1548596356, 100, 1);

-- ----------------------------
-- Table structure for dp_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_packet`;
CREATE TABLE `dp_admin_packet`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tables` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据表名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据包表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_plugin`;
CREATE TABLE `dp_admin_plugin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件描述',
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置信息',
  `version` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台管理',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_plugin
-- ----------------------------
INSERT INTO `dp_admin_plugin` VALUES (1, 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', 0, 1477757503, 1477757503, 100, 1);
INSERT INTO `dp_admin_plugin` VALUES (2, 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', 0, 1477755780, 1477755780, 100, 1);

-- ----------------------------
-- Table structure for dp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_role`;
CREATE TABLE `dp_admin_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级角色',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `access` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可登录后台',
  `default_module` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '默认访问模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_role
-- ----------------------------
INSERT INTO `dp_admin_role` VALUES (1, 0, '超级管理员', '系统默认创建的角色，拥有最高权限', '', 0, 1476270000, 1468117612, 1, 1, 0);

-- ----------------------------
-- Table structure for dp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_user`;
CREATE TABLE `dp_admin_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否绑定手机号码',
  `avatar` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '头像',
  `money` decimal(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `role` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `group` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '部门id',
  `signup_ip` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册ip',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_admin_user
-- ----------------------------
INSERT INTO `dp_admin_user` VALUES (1, 'admin', '超级管理员', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', 0, '', 0, 0, 0.00, 0, 1, 0, 0, 1476065410, 1551666674, 1551666674, 2015684944, 100, 1);
INSERT INTO `dp_admin_user` VALUES (2, 'lzy', 'lzy', '$2y$10$1qfV3hd/jnF9uivA7gytwu3axql5zK20p2xqOFWsFfIP7oBVHe/zy', '', 0, '', 0, 0, 0.00, 0, 1, 0, 0, 1547132824, 1548745953, 1548745953, 2015473867, 100, 1);

-- ----------------------------
-- Table structure for dp_circle_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `dp_circle_evaluate`;
CREATE TABLE `dp_circle_evaluate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `circle_id` int(11) NULL DEFAULT NULL COMMENT '圈子id',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `reply_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '回复个数',
  `fabulous_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '点赞个数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_circle_evaluate
-- ----------------------------
INSERT INTO `dp_circle_evaluate` VALUES (1, 9, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '评论1', NULL, '0', 'oTq7r4hx1B95EAeXtJjGZJ_24yVk,');
INSERT INTO `dp_circle_evaluate` VALUES (3, 9, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '评论3', NULL, '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (4, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '123456789', '0', 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ,');
INSERT INTO `dp_circle_evaluate` VALUES (5, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '222', '987654321', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (6, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '333', '1550058486', 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,', 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,');
INSERT INTO `dp_circle_evaluate` VALUES (7, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '444', '1550058829', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (8, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '555', '1550060313', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (9, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '777', '1550061330', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (10, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '666', '1550061410', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (11, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '888', '1550061577', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (12, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '999', '1550061788', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (13, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '123', '1550061864', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (14, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '1234', '1550061969', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (15, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '12345', '1550062448', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (16, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '123456', '1550062671', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (17, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '1234567', '1550062701', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (18, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '12345678', '1550062814', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (19, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '22222333', '1550062875', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (20, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '14321', '1550063052', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (21, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '54321', '1550063071', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (22, 10, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '', '1550063126', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (23, 6, 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', '111', '1551170486', '0', '0');
INSERT INTO `dp_circle_evaluate` VALUES (25, 12, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '1551240350', '0', '0');

-- ----------------------------
-- Table structure for dp_circle_list
-- ----------------------------
DROP TABLE IF EXISTS `dp_circle_list`;
CREATE TABLE `dp_circle_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL COMMENT '圈子类型',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布圈子的用户id',
  `photofile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '圈子发布的图片',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '圈子内容',
  `time` int(11) NULL DEFAULT NULL COMMENT '发布时间',
  `state` int(11) NULL DEFAULT 1 COMMENT '审核状态,0未审核，1审核',
  `evaluate_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '评论数量',
  `fabulous_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '点赞数量',
  `heart_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '爱心数量',
  `focus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否关注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_circle_list
-- ----------------------------
INSERT INTO `dp_circle_list` VALUES (4, 2, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190131/bfaf7638e2f1003d6d2f8e4d9b49b2af.jpg', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', 1548901344, 1, NULL, NULL, '', '0');
INSERT INTO `dp_circle_list` VALUES (6, 2, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190131/8d7a2e8fff6c0105e920e0d3dc093f1e.jpg', '嗯嗯嗯嗯嗯呃嗯哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦', 1548929418, 1, NULL, NULL, '', '');
INSERT INTO `dp_circle_list` VALUES (7, 3, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190131/2dd9644d41d1701b45351c3b1527ab04.jpg', '呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃', 1548933503, 1, NULL, NULL, '', 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,');
INSERT INTO `dp_circle_list` VALUES (8, 3, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190131/0eec12c58f232c6c739366a70b2d9f9c.jpg', '呜呜呜呜呜呜呜呜呜呜呜呜呜无无无无无无无无无无无无无无无无哇', 1548933567, 1, NULL, NULL, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,', 'oTq7r4hx1B95EAeXtJjGZJ_24yVk,');
INSERT INTO `dp_circle_list` VALUES (10, 3, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190201/54a6b58ae815c5682b9cfdbbfe488fa5.jpg,20190201/0a91487c4185fbea694cb0bd682b03c6.jpg', 'cesssssssssssssssssssssssssssssssssssssssssssss', 1549001523, 1, NULL, NULL, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,', 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,');
INSERT INTO `dp_circle_list` VALUES (11, 14, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190201/6f16ca21d30f1bc9c36d84c3607feab5.jpg,20190201/e0b3685fabb62114918e2a7dcbae00d9.jpg,20190201/711f517bb9d48bc76857ff6c8645e712.jpg', '呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐呐袅袅娜娜那你呢呢', 1549010998, 1, '0', '0', '', '0');
INSERT INTO `dp_circle_list` VALUES (12, 2, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190221/9737d86d31ba513c62cd731546781483.jpg,20190221/cb3cd700759d697d0bea39c7b0689fda.jpg,20190221/50fd8f507872ab4cb4aa6bbfb9ab179b.jpg', '这还是测试', 1550735368, 1, '0', '0', '', '0');
INSERT INTO `dp_circle_list` VALUES (13, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190227/a32ad8f3b3f2aec031762bed3b43c226.jpg', 'cs123', 1551257964, 1, '0', '0', '0', '0');
INSERT INTO `dp_circle_list` VALUES (14, 16, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '20190227/c6d6b446ee3d68be23f315bdb77f661c.jpg', 'cs2222', 1551258909, 1, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for dp_circle_reply
-- ----------------------------
DROP TABLE IF EXISTS `dp_circle_reply`;
CREATE TABLE `dp_circle_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluate_id` int(11) NULL DEFAULT NULL COMMENT '评论id',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复用户id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复时间',
  `fabulous_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '点赞数量',
  `reply_id` int(11) NULL DEFAULT NULL COMMENT '回复的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_circle_reply
-- ----------------------------
INSERT INTO `dp_circle_reply` VALUES (3, 4, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '1550128661', 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ,', NULL);
INSERT INTO `dp_circle_reply` VALUES (4, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '1550128850', 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,', NULL);
INSERT INTO `dp_circle_reply` VALUES (5, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '222', '1550404486', 'oY9bT5ORKpweSg0uwRkjDjt4FsZo,', NULL);
INSERT INTO `dp_circle_reply` VALUES (7, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '333', '1550404849', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (8, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '444', '1550405933', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (9, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '555', '1550405942', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (10, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '666', '1550405956', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (11, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '777', '1550472098', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (12, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '777', '1550472113', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (13, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '777', '1550472183', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (14, 23, 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', '111', '1551170495', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (15, 1, 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', '111', '1551172797', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (16, 4, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '222//@林振宇:111', '1551184600', '0', NULL);
INSERT INTO `dp_circle_reply` VALUES (18, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', 'ceshi', '1551193024', '0', 6);
INSERT INTO `dp_circle_reply` VALUES (19, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', 'cs', '1551193520', '0', 4);
INSERT INTO `dp_circle_reply` VALUES (20, 6, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', 'cs2', '1551193646', '0', 19);
INSERT INTO `dp_circle_reply` VALUES (21, 23, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '1551198501', '0', 0);
INSERT INTO `dp_circle_reply` VALUES (32, 5, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '1551256309', '0', 0);
INSERT INTO `dp_circle_reply` VALUES (33, 5, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', '111', '1551256310', '0', 0);

-- ----------------------------
-- Table structure for dp_circle_test
-- ----------------------------
DROP TABLE IF EXISTS `dp_circle_test`;
CREATE TABLE `dp_circle_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photofile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(10) NULL DEFAULT 0 COMMENT '0表示待审核，1表示审核通过',
  `circletype` int(255) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_circle_test
-- ----------------------------
INSERT INTO `dp_circle_test` VALUES (2, 'b', NULL, NULL, 1, NULL, '222', '234567890', NULL);
INSERT INTO `dp_circle_test` VALUES (3, 'c', NULL, NULL, 0, NULL, '333', '345678912', NULL);
INSERT INTO `dp_circle_test` VALUES (4, 'aaa', NULL, NULL, 0, NULL, '', '1547776072', NULL);
INSERT INTO `dp_circle_test` VALUES (5, 'aaa', NULL, NULL, 0, NULL, '', '1547776231', NULL);
INSERT INTO `dp_circle_test` VALUES (6, 'aaa', NULL, NULL, 0, NULL, '', '1547776295', NULL);
INSERT INTO `dp_circle_test` VALUES (30, 'aaa', NULL, '20190118/709a8b785f178868bf5854cee708a7af.jpg', 0, NULL, '黄总真棒', '1547793704', 0);
INSERT INTO `dp_circle_test` VALUES (29, 'aaa', NULL, '20190118/7e5ce52e6d6c15cc9e323714cf2380e0.jpg', 0, NULL, 'qqq', '1547793543', 0);
INSERT INTO `dp_circle_test` VALUES (31, 'aaa', NULL, '20190118/831035b0ab72c93cd91b13882835a323.jpg', 0, 1, '阿斯顿', '1547794924', 0);
INSERT INTO `dp_circle_test` VALUES (32, 'aaa', NULL, '20190118/a7fc0b9ea393555e485a7646a35f33f6.jpg', 0, 2, '111', '1547795020', 0);
INSERT INTO `dp_circle_test` VALUES (33, 'aaa', NULL, '20190118/5dfb4d3b5032e56fca04b337a1affae1.jpg', 0, 1, '111', '1547796085', 0);
INSERT INTO `dp_circle_test` VALUES (34, 'aaa', NULL, '20190118/b41cb99a28716f7ccc4ed3f263ccd2f5.jpg,20190118/98cb5fb3e7f42c791043d1e201bf15a7.jpg', 0, 0, '', '1547798752', 0);
INSERT INTO `dp_circle_test` VALUES (35, 'aaa', NULL, '20190118/e8798a4e4efb538f4eecd456dab0a6a4.jpg,20190118/162ebbc4d2de119cdb221b6130602011.jpg', 0, 1, 'aaaaaass', '1547799091', 0);
INSERT INTO `dp_circle_test` VALUES (36, 'aaa', NULL, '', 0, 0, 'qw请问', '1547803182', 0);
INSERT INTO `dp_circle_test` VALUES (37, 'aaa', NULL, '', 0, 2, '111eee', '1548513215', NULL);

-- ----------------------------
-- Table structure for dp_circle_type
-- ----------------------------
DROP TABLE IF EXISTS `dp_circle_type`;
CREATE TABLE `dp_circle_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_circle_type
-- ----------------------------
INSERT INTO `dp_circle_type` VALUES (2, '首页', 12456789);
INSERT INTO `dp_circle_type` VALUES (3, '体育', 987654321);
INSERT INTO `dp_circle_type` VALUES (4, '测试', 1548640073);
INSERT INTO `dp_circle_type` VALUES (13, '娱乐', 1548645203);
INSERT INTO `dp_circle_type` VALUES (14, '汽车', 1548730170);
INSERT INTO `dp_circle_type` VALUES (15, '明星', 1548730180);
INSERT INTO `dp_circle_type` VALUES (16, '科技', 1548745982);

-- ----------------------------
-- Table structure for dp_cms_advert
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_advert`;
CREATE TABLE `dp_cms_advert`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `tagname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位标识',
  `ad_type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告类型',
  `timeset` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间限制:0-永不过期,1-在设内时间内有效',
  `start_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告内容',
  `expcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过期显示内容',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_advert_type
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_advert_type`;
CREATE TABLE `dp_cms_advert_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_column
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_column`;
CREATE TABLE `dp_cms_column`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目名称',
  `model` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档模型id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `target` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字体图标',
  `index_template` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面模板',
  `list_template` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页模板',
  `detail_template` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页模板',
  `post_auth` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '投稿权限',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `hide` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `rank_auth` int(11) NOT NULL DEFAULT 0 COMMENT '浏览权限，-1待审核，0为开放浏览，大于0则为对应的用户角色id',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目属性：0-最终列表栏目，1-外部链接，2-频道封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_document
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_document`;
CREATE TABLE `dp_cms_document`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目id',
  `model` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档模型ID',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简略标题',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `flag` set('j','p','b','s','a','f','c','h') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义属性',
  `view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读量',
  `comment` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `good` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `bad` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '踩数',
  `mark` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏数量',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `trash` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回收站',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_field
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_field`;
CREATE TABLE `dp_cms_field`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认值',
  `options` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外选项',
  `tips` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提示说明',
  `fixed` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为固定字段',
  `show` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示',
  `model` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属文档模型id',
  `ajax_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 2 COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_cms_field
-- ----------------------------
INSERT INTO `dp_cms_field` VALUES (1, 'id', 'ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', 'ID', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480562978, 1480562978, 100, 1);
INSERT INTO `dp_cms_field` VALUES (2, 'cid', '栏目', 'select', 'int(11) UNSIGNED NOT NULL', '0', '', '请选择所属栏目', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480562978, 1480562978, 100, 1);
INSERT INTO `dp_cms_field` VALUES (3, 'uid', '用户ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563110, 1480563110, 100, 1);
INSERT INTO `dp_cms_field` VALUES (4, 'model', '模型ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563110, 1480563110, 100, 1);
INSERT INTO `dp_cms_field` VALUES (5, 'title', '标题', 'text', 'varchar(128) NOT NULL', '', '', '文档标题', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480575844, 1480576134, 1, 1);
INSERT INTO `dp_cms_field` VALUES (6, 'shorttitle', '简略标题', 'text', 'varchar(32) NOT NULL', '', '', '简略标题', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480575844, 1480576134, 1, 1);
INSERT INTO `dp_cms_field` VALUES (7, 'flag', '自定义属性', 'checkbox', 'set(\'j\',\'p\',\'b\',\'s\',\'a\',\'f\',\'h\',\'c\') NULL DEFAULT NULL', '', 'j:跳转\r\np:图片\r\nb:加粗\r\ns:滚动\r\na:特荐\r\nf:幻灯\r\nh:头条\r\nc:推荐', '自定义属性', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480671258, 1480671258, 100, 1);
INSERT INTO `dp_cms_field` VALUES (8, 'view', '阅读量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480563149, 1480563149, 100, 1);
INSERT INTO `dp_cms_field` VALUES (9, 'comment', '评论数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563189, 1480563189, 100, 1);
INSERT INTO `dp_cms_field` VALUES (10, 'good', '点赞数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563279, 1480563279, 100, 1);
INSERT INTO `dp_cms_field` VALUES (11, 'bad', '踩数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563330, 1480563330, 100, 1);
INSERT INTO `dp_cms_field` VALUES (12, 'mark', '收藏数量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563372, 1480563372, 100, 1);
INSERT INTO `dp_cms_field` VALUES (13, 'create_time', '创建时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563406, 1480563406, 100, 1);
INSERT INTO `dp_cms_field` VALUES (14, 'update_time', '更新时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563432, 1480563432, 100, 1);
INSERT INTO `dp_cms_field` VALUES (15, 'sort', '排序', 'text', 'int(11) NOT NULL', '100', '', '', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480563510, 1480563510, 100, 1);
INSERT INTO `dp_cms_field` VALUES (16, 'status', '状态', 'radio', 'tinyint(2) UNSIGNED NOT NULL', '1', '0:禁用\r\n1:启用', '', 0, 1, 0, '', '', '', '', '', 0, '', '', '', '', 1480563576, 1480563576, 100, 1);
INSERT INTO `dp_cms_field` VALUES (17, 'trash', '回收站', 'text', 'tinyint(2) UNSIGNED NOT NULL', '0', '', '', 0, 0, 0, '', '', '', '', '', 0, '', '', '', '', 1480563576, 1480563576, 100, 1);

-- ----------------------------
-- Table structure for dp_cms_link
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_link`;
CREATE TABLE `dp_cms_link`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1-文字链接，2-图片链接',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `logo` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '链接LOGO',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `sort` int(11) NOT NULL DEFAULT 100,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '有钱链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_menu`;
CREATE TABLE `dp_cms_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `column` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目id',
  `page` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单页id',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型：0-栏目链接，1-单页链接，2-自定义链接',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `css` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'css类',
  `rel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接关系网',
  `target` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '打开方式',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_cms_menu
-- ----------------------------
INSERT INTO `dp_cms_menu` VALUES (1, 1, 0, 0, 0, 2, '首页', 'cms/index/index', '', '', '_self', 1492345605, 1492345605, 100, 1);
INSERT INTO `dp_cms_menu` VALUES (2, 2, 0, 0, 0, 2, '关于我们', 'http://www.dolphinphp.com', '', '', '_self', 1492346763, 1492346763, 100, 1);
INSERT INTO `dp_cms_menu` VALUES (3, 3, 0, 0, 0, 2, '开发文档', 'http://www.kancloud.cn/ming5112/dolphinphp', '', '', '_self', 1492346812, 1492346812, 100, 1);
INSERT INTO `dp_cms_menu` VALUES (4, 3, 0, 0, 0, 2, '开发者社区', 'http://bbs.dolphinphp.com/', '', '', '_self', 1492346832, 1492346832, 100, 1);
INSERT INTO `dp_cms_menu` VALUES (5, 1, 0, 0, 0, 2, '二级菜单', 'http://www.dolphinphp.com', '', '', '_self', 1492347372, 1492347510, 100, 1);
INSERT INTO `dp_cms_menu` VALUES (6, 1, 5, 0, 0, 2, '子菜单', 'http://www.dolphinphp.com', '', '', '_self', 1492347388, 1492347520, 100, 1);

-- ----------------------------
-- Table structure for dp_cms_model
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_model`;
CREATE TABLE `dp_cms_model`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型标题',
  `table` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加表名称',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '模型类别：0-系统模型，1-普通模型，2-独立模型',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
  `system` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否系统模型',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_nav
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_nav`;
CREATE TABLE `dp_cms_nav`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '导航标识',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单标题',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_cms_nav
-- ----------------------------
INSERT INTO `dp_cms_nav` VALUES (1, 'main_nav', '顶部导航', 1492345083, 1492345083, 1);
INSERT INTO `dp_cms_nav` VALUES (2, 'about_nav', '底部关于', 1492346685, 1492346685, 1);
INSERT INTO `dp_cms_nav` VALUES (3, 'support_nav', '服务与支持', 1492346715, 1492346715, 1);

-- ----------------------------
-- Table structure for dp_cms_page
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_page`;
CREATE TABLE `dp_cms_page`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单页标题',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单页内容',
  `keywords` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面描述',
  `template` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板文件',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单页封面',
  `view` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读量',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单页表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_slider
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_slider`;
CREATE TABLE `dp_cms_slider`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '封面id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '滚动图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_cms_support
-- ----------------------------
DROP TABLE IF EXISTS `dp_cms_support`;
CREATE TABLE `dp_cms_support`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客服名称',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `msn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'msn',
  `taobao` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'taobao',
  `alibaba` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'alibaba',
  `skype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'skype',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_customer_forever_order
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_forever_order`;
CREATE TABLE `dp_customer_forever_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `box_id` int(11) NOT NULL COMMENT '盒子id',
  `sum_box` int(11) NOT NULL COMMENT '盒子总个数',
  `rest_box` int(11) NOT NULL COMMENT '剩余盒子的个数',
  `sum_price` decimal(10, 2) NOT NULL COMMENT '盒子总金额',
  `menstrual_volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '月经量',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子品牌',
  `status` int(11) NOT NULL COMMENT '支付状态0未支付1支付',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_forever_order
-- ----------------------------
INSERT INTO `dp_customer_forever_order` VALUES (5, '2019022487674', 'o37294ps5fky9t3frBDIAt8H20qM', 1, 12, 12, 368.00, '常量', '轻生活', 0, 1551000216);
INSERT INTO `dp_customer_forever_order` VALUES (7, '2019022627595', 'oTq7r4hx1B95EAeXtJjGZJ_24yVk', 1, 6, 6, 198.00, '常量', '安尔乐', 0, 1551160847);
INSERT INTO `dp_customer_forever_order` VALUES (8, '2019022617218', 'oTq7r4t7p9CnayG3tz2tazuBh9Tg', 1, 6, 6, 198.00, '常量', '安尔乐', 0, 1551167026);
INSERT INTO `dp_customer_forever_order` VALUES (38, '2019030465642', 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', 1, 6, 6, 198.00, '常量', '安尔乐', 0, 1551667196);

-- ----------------------------
-- Table structure for dp_customer_leave_message
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_leave_message`;
CREATE TABLE `dp_customer_leave_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `status` int(255) NOT NULL DEFAULT 0 COMMENT '状态0未回复1已回复',
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `reply_time` int(255) NOT NULL COMMENT '回复时间',
  `time` int(255) NOT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_leave_message
-- ----------------------------
INSERT INTO `dp_customer_leave_message` VALUES (1, 'openid20181115', '一辈子不用买卫生巾！', 1, '111', 1547129209, 1542692755);

-- ----------------------------
-- Table structure for dp_customer_list
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_list`;
CREATE TABLE `dp_customer_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单标题',
  `order_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单类型',
  `order_type2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单类型2',
  `status` int(255) NULL DEFAULT NULL COMMENT '订单状态(开启或关闭)',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件上传',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片上传',
  `beizhu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `beizhu2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注2',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_list
-- ----------------------------
INSERT INTO `dp_customer_list` VALUES (1, 11, '111', NULL, 'kl', 0, '19', '16', '1111', '<p>111</p>', '2018-11-28 00:00:00');

-- ----------------------------
-- Table structure for dp_customer_order_log
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_order_log`;
CREATE TABLE `dp_customer_order_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dp_customer_periodrecord
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_periodrecord`;
CREATE TABLE `dp_customer_periodrecord`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的id（关联user表）',
  `before` int(255) NOT NULL COMMENT '前一次月经时间(用户点错的时候用)',
  `start_time` int(255) NOT NULL COMMENT '经期开始的时间',
  `end_time` int(255) NULL DEFAULT NULL COMMENT '经期结束的时间',
  `yc_end_time` int(255) NOT NULL COMMENT '预测经期结束的时间',
  `isEnd` int(255) NOT NULL COMMENT '经期是否结束（0进行1结束）',
  `time` int(255) NOT NULL COMMENT '经期创建的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_periodrecord
-- ----------------------------
INSERT INTO `dp_customer_periodrecord` VALUES (34, 'o37294ljn4lWc4fJvad_alK4QGUc', 1547654400, 1452873600, 1547568000, 1547568000, 1, 1547692487);
INSERT INTO `dp_customer_periodrecord` VALUES (39, 'o37294ljn4lWc4fJvad_alK4QGUc', 1452873600, 1547568000, NULL, 1548000000, 0, 1547692575);
INSERT INTO `dp_customer_periodrecord` VALUES (44, 'o37294ljn4lWc4fJvad_alK4QGUc', 1547568000, 1544371200, 1547654400, 1547654400, 1, 1547693120);
INSERT INTO `dp_customer_periodrecord` VALUES (47, 'o37294j6lNVAAQbmkwxMVEhM1ejE', 1547136000, 1546444800, 1546876800, 1546876800, 1, 1547693712);
INSERT INTO `dp_customer_periodrecord` VALUES (67, 'o37294th7Qws9YlCRZMQw-z8EgvM', 1546617600, 1546617600, 1547136000, 1547136000, 1, 1547704986);
INSERT INTO `dp_customer_periodrecord` VALUES (71, 'o37294ps5fky9t3frBDIAt8H20qM', 1547136000, 1547136000, 1547654400, 1547654400, 1, 1547710321);
INSERT INTO `dp_customer_periodrecord` VALUES (73, 'o37294j6lNVAAQbmkwxMVEhM1ejE', 1546444800, 1546444800, 1546790400, 1546790400, 1, 1547723317);
INSERT INTO `dp_customer_periodrecord` VALUES (74, 'o37294j6lNVAAQbmkwxMVEhM1ejE', 1546444800, 1546444800, 1546790400, 1546790400, 1, 1547723335);
INSERT INTO `dp_customer_periodrecord` VALUES (81, 'o37294ps5fky9t3frBDIAt8H20qM', 0, 1545062400, 1545580800, 1545580800, 1, 1547789676);
INSERT INTO `dp_customer_periodrecord` VALUES (82, 'o37294ps5fky9t3frBDIAt8H20qM', 0, 1542643200, 1543075200, 1543075200, 1, 1547790495);
INSERT INTO `dp_customer_periodrecord` VALUES (93, 'o37294ps5fky9t3frBDIAt8H20qM', 1547136000, 1549555200, 1549987200, 1549987200, 1, 1550226308);

-- ----------------------------
-- Table structure for dp_customer_periodsetting
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_periodsetting`;
CREATE TABLE `dp_customer_periodsetting`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名字',
  `age` int(255) NOT NULL COMMENT '用户年龄',
  `sex` int(2) NOT NULL COMMENT '用户性别（0女生，1男生）',
  `isown` int(2) NOT NULL COMMENT '用户是自己还是帮别人绑定的（0自己，1帮别人绑定）',
  `before` int(255) NOT NULL COMMENT '前一次月经时间',
  `day` int(10) NOT NULL COMMENT '正常天数',
  `cycle` int(10) NOT NULL COMMENT '月经周期',
  `law` int(2) NOT NULL COMMENT '月经规律：0早来，1正常，2晚来',
  `ispregnant` int(2) NOT NULL DEFAULT 0 COMMENT '是否怀孕0否1是',
  `preproduction_date` int(255) NULL DEFAULT NULL COMMENT '预产期',
  `time` int(255) NOT NULL COMMENT '创建时间/更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_periodsetting
-- ----------------------------
INSERT INTO `dp_customer_periodsetting` VALUES (2, 'openid20181115', '小马', 18, 0, 0, 1543491359, 5, 28, 1, 1, 1542211200, 1539532800);
INSERT INTO `dp_customer_periodsetting` VALUES (18, 'o37294j6lNVAAQbmkwxMVEhM1ejE', '林喂羊', 18, 0, 0, 1546444800, 5, 28, 1, 0, NULL, 1547202096);
INSERT INTO `dp_customer_periodsetting` VALUES (20, 'o37294ps5fky9t3frBDIAt8H20qM', 'I Wf', 18, 0, 0, 1549555200, 6, 34, 1, 0, NULL, 1547202869);
INSERT INTO `dp_customer_periodsetting` VALUES (21, 'o37294th7Qws9YlCRZMQw-z8EgvM', 'I Sy', 18, 0, 0, 1546617600, 5, 28, 1, 0, NULL, 1547202887);
INSERT INTO `dp_customer_periodsetting` VALUES (22, 'o37294juVKdqyQYhalqoNnX2_f0Y', '林振宇', 18, 0, 0, 1547481600, 5, 28, 1, 0, NULL, 1547567620);
INSERT INTO `dp_customer_periodsetting` VALUES (23, 'o37294ljn4lWc4fJvad_alK4QGUc', '林weifeng', 18, 0, 0, 1546272000, 5, 29, 1, 0, NULL, 1547691966);
INSERT INTO `dp_customer_periodsetting` VALUES (24, 'o37294k6UA9KI5ntqziVGGo7PEaE', '安静。是明白', 18, 0, 0, 1574611200, 5, 28, 1, 0, NULL, 1551075663);
INSERT INTO `dp_customer_periodsetting` VALUES (25, 'oTq7r4hx1B95EAeXtJjGZJ_24yVk', '林育宁', 18, 0, 0, 1574697600, 5, 28, 1, 0, NULL, 1551160780);
INSERT INTO `dp_customer_periodsetting` VALUES (26, 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', 'I Wf', 18, 0, 0, 1548777600, 5, 28, 1, 0, NULL, 1551160835);

-- ----------------------------
-- Table structure for dp_customer_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_receive_address`;
CREATE TABLE `dp_customer_receive_address`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `is_default` int(11) NOT NULL COMMENT '是否为默认地址1是0否',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_receive_address
-- ----------------------------
INSERT INTO `dp_customer_receive_address` VALUES (4, 'o37294ps5fky9t3frBDIAt8H20qM', '王文峰', '18906050278', '福建省', '厦门市', '海沧区', '新垵村许厝村（许厝加油站）', 1, 1550213079);
INSERT INTO `dp_customer_receive_address` VALUES (5, 'o37294ps5fky9t3frBDIAt8H20qM', '王文峰', '15359230588', '福建省', '厦门市', '海沧区', '霞阳村西路(大榕树旁)', 0, 1550214269);
INSERT INTO `dp_customer_receive_address` VALUES (16, 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', '王文峰', '18906050278', '福建省', '厦门市', '海沧区', '许厝村', 1, 1551160112);

-- ----------------------------
-- Table structure for dp_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_customer_user`;
CREATE TABLE `dp_customer_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信openid',
  `wx_headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信头像',
  `wx_nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信昵称',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `price` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '账户余额',
  `integral` decimal(20, 0) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `time` int(255) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_customer_user
-- ----------------------------
INSERT INTO `dp_customer_user` VALUES (6, 'o37294ps5fky9t3frBDIAt8H20qM', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep4OL0PlLQicLhq0LuD5CpgbtYicRqlnOibvDbe2F7LndzR8GMM6rhXKfKxAuiaw3A4lfa0wrV8HbfkUA/132', 'I Wf', '18906050278', 0.00, 0, 1546785664);
INSERT INTO `dp_customer_user` VALUES (10, 'o37294juVKdqyQYhalqoNnX2_f0Y', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqeRT2v2xAOl5qhtNJRQ1yp5VbZXATs0y12p0OuZ7S4HhSZ3smRku5PARjNwO7wnNWiccY7WGO2B9A/132', '林振宇', '15906002950', 0.00, 0, 1547013964);
INSERT INTO `dp_customer_user` VALUES (11, 'openid20181115', 'http://wx1.sinaimg.cn/large/c3634183ly1fn5g0y0xe8j20dw0dw0th.jpg', 'I_Sy', '18906050288', 0.00, 0, 1547136892);
INSERT INTO `dp_customer_user` VALUES (12, 'o37294j6lNVAAQbmkwxMVEhM1ejE', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epuBmoicQ5X7a0jblL0Du4UqLpME83jt8qowDkqNPvyibShcRn3uia2gL4MKofcWd7oJuG1hvkeM0gOw/132', '林喂羊', '13806019729', 0.00, 0, 1547201393);
INSERT INTO `dp_customer_user` VALUES (14, 'o37294th7Qws9YlCRZMQw-z8EgvM', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ0K4Ea95u4mZTGDhLykMQkyT28VM91Qib96FQUDLIF6CLP2BzibcH4AvFQSNla9VucUpNKK3knKrEA/132', 'I Sy', '17359879859', 0.00, 0, 1547202017);
INSERT INTO `dp_customer_user` VALUES (15, 'o37294k6UA9KI5ntqziVGGo7PEaE', 'https://wx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM4rwiaVhPzRLvhNgtpVxejO2icWk8eCFGicl7WZwfUTe659VfBibYMibxDBBNODjpHBicdeaR0fNa9u3FLQ/132', '安静。是明白', NULL, 0.00, 0, 1547202577);
INSERT INTO `dp_customer_user` VALUES (16, 'oY9bT5ORKpweSg0uwRkjDjt4FsZo', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epBbnUZasrGz7eiczM7FpXojgjwdWREkOEJDialQ173bnIazXbpRyyic6qlEbomv3y8o14hpyX0zls8A/132', '林振宇', NULL, 0.00, 0, 1547455768);
INSERT INTO `dp_customer_user` VALUES (17, 'o37294kMHUpuWrqm2xUqzZYnoFmI', 'https://wx.qlogo.cn/mmopen/vi_32/BiaxB7teDfiauY2XS8fIQFw1tj43K7pTM3YZ01biabA56cLBzic3a70AWdzKoSoicIzJWQ7A6UrXEdlWh9F0xc4hL8g/132', 'lmx', NULL, 0.00, 0, 1547644805);
INSERT INTO `dp_customer_user` VALUES (18, 'o37294ljn4lWc4fJvad_alK4QGUc', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er8OCbeg5NLmWoHiaaIEaOl1dJ7qRs2la1YLaj3iageZekDLj0XXtSwhdWHjRyh3r6TcftvUpTUyBPw/132', '林weifeng', '13763865863', 0.00, 0, 1547645141);
INSERT INTO `dp_customer_user` VALUES (19, 'oTq7r4i_8tBu7iXB0xxJwgxZGylQ', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQhiaYibyADId8oK9BhosAAneNYXWJkrSqPUu7fKEWRKEXl6A3ZySXWBbQPmdciboiaiccYs7AbyEQUbA/132', 'I Wf', '18906050278', 0.00, 0, 1551158693);
INSERT INTO `dp_customer_user` VALUES (20, 'oTq7r4hx1B95EAeXtJjGZJ_24yVk', 'https://wx.qlogo.cn/mmhead/YiaWrPANvnKGDr7N6mV5icxic2KUmK2mXErqqf75WmdDT4/132', '林育宁', NULL, 0.00, 0, 1551160724);
INSERT INTO `dp_customer_user` VALUES (21, 'oTq7r4t7p9CnayG3tz2tazuBh9Tg', 'https://wx.qlogo.cn/mmhead/QfSa1iao7BUIH1XjR978mPicbzqDfc7cROQ4TjOa7r4f4/132', '吴台卿', NULL, 0.00, 0, 1551166737);

-- ----------------------------
-- Table structure for dp_home_advlist
-- ----------------------------
DROP TABLE IF EXISTS `dp_home_advlist`;
CREATE TABLE `dp_home_advlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fileId` int(11) NOT NULL COMMENT '图片路径Id海豚php用的',
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `status` int(255) NOT NULL COMMENT '是否显示',
  `time` int(255) NOT NULL COMMENT '添加时间',
  `jumpurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_home_advlist
-- ----------------------------
INSERT INTO `dp_home_advlist` VALUES (1, '轮播图1', 1, 'uploads/images/20190128/7aef9b6b6cc87ddc12894716aad8ed7c.jpg', 1, 1548645788, NULL);
INSERT INTO `dp_home_advlist` VALUES (2, '血拼', 3, 'uploads/images/20190128/27c06620f33846900b53b3d54851f497.png', 1, 1548662491, NULL);
INSERT INTO `dp_home_advlist` VALUES (3, '轮播3', 4, 'uploads/images/20190128/9fdc10af671b684cfa15ff3d06994b85.jpg', 0, 1548683722, NULL);
INSERT INTO `dp_home_advlist` VALUES (6, '轮播2', 2, 'uploads/images/20190128/1f994d1a6278b0ef6c3af59e812fd5cd.jpg', 0, 1548684018, NULL);
INSERT INTO `dp_home_advlist` VALUES (7, '推广免单', 19, 'uploads/images/20190130/ef69e060d77ee47f53d4fe5d9efb3b83.jpg', 1, 1548838697, NULL);

-- ----------------------------
-- Table structure for dp_home_boxbrand
-- ----------------------------
DROP TABLE IF EXISTS `dp_home_boxbrand`;
CREATE TABLE `dp_home_boxbrand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子id',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名字',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相应品牌的盒子内容,用。号分隔(换行)',
  `is_default` int(2) NOT NULL COMMENT '默认为0，第一次第一个为1',
  `time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_home_boxbrand
-- ----------------------------
INSERT INTO `dp_home_boxbrand` VALUES (1, '1', '安尔乐', '安尔乐品牌的卫生巾日用。安尔乐品牌的卫生巾夜用。安尔乐品牌的卫生巾护垫', 1, 1549951039);
INSERT INTO `dp_home_boxbrand` VALUES (2, '1', '自由点', '自由点品牌的卫生巾日用。自由点品牌的卫生巾夜用。自由点品牌的卫生巾护垫', 0, 1549952127);
INSERT INTO `dp_home_boxbrand` VALUES (3, '2', '苏菲', '苏菲品牌的卫生巾日用。苏菲品牌的卫生巾夜用。苏菲品牌的卫生巾护垫', 1, 1549952271);
INSERT INTO `dp_home_boxbrand` VALUES (4, '1', '轻生活', '轻生活品牌的卫生巾日用。轻生活品牌的卫生巾夜用。轻生活品牌的卫生巾护垫', 0, 1549952310);
INSERT INTO `dp_home_boxbrand` VALUES (5, '1', 'OBB', 'OBB品牌的卫生巾日用。OBB品牌的卫生巾夜用。OBB品牌的卫生巾护垫', 0, 1549952339);
INSERT INTO `dp_home_boxbrand` VALUES (6, '3', '苏菲(进口)', '苏菲(进口)品牌的卫生巾日用。苏菲(进口)品牌的卫生巾夜用。苏菲(进口)品牌的卫生巾护垫', 1, 1550203926);

-- ----------------------------
-- Table structure for dp_home_boxlist
-- ----------------------------
DROP TABLE IF EXISTS `dp_home_boxlist`;
CREATE TABLE `dp_home_boxlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子名字',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子简介',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子标签',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子内容',
  `cover_imgId` int(11) NOT NULL COMMENT '盒子封面Id(用于海豚php)',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子封面图片',
  `display_imgIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子介绍图片Id用，隔开(用于海豚php)',
  `display_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盒子介绍图片用，隔开',
  `time` int(11) NOT NULL COMMENT '创建时间(时间戳)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_home_boxlist
-- ----------------------------
INSERT INTO `dp_home_boxlist` VALUES (1, '实惠盒子', '超级划算的盒子', '优惠之选', '安尔乐品牌的卫生巾', 5, 'uploads/images/20190129/334440748d4d4cf4c90194aa210cd260.jpg', '6,7,8,9', 'uploads/images/20190129/7223a22b7cdfa8db68327b81cac10b4e.jpg,uploads/images/20190129/ba9ecdf129a90a28e8a1cb083ff08493.jpg,uploads/images/20190129/3a126e7e213c8282255632a805a8f72a.jpg,uploads/images/20190129/142094ef594bc1aee21b6a7940ca205c.jpg', 1548763491);
INSERT INTO `dp_home_boxlist` VALUES (2, '品质盒子', '非常有品质的盒子', '品质之选', '主要是苏菲卫生巾', 10, 'uploads/images/20190130/f3797d15bf6b2e3c3fe0c0086e30b729.jpg', '11,12,13,14', 'uploads/images/20190130/ffbe72a48f88e9cb3cc16ebeea1e956a.jpg,uploads/images/20190130/62afd30dace40c2d6f7d4c884ffd2026.jpg,uploads/images/20190130/6eadcbf40b59a71a0ae7049a4e1dd28c.jpg,uploads/images/20190130/b757524f27b72aa43c6005327732e84b.jpg', 1548781657);
INSERT INTO `dp_home_boxlist` VALUES (3, '尊享盒子', '给你带来尊享的体验', '尊贵之选', '进口苏菲产品', 20, 'uploads/images/20190130/85ed626e41d580e2b26a548cf975e120.jpg', '21,22,23,24', 'uploads/images/20190130/f459da2d397fb485921a822fef4ed5d1.jpg,uploads/images/20190130/f90e61931538572e6c0e68f75f2818db.jpg,uploads/images/20190130/53a840ab89902d2fead347c8a68a1a81.jpg,uploads/images/20190130/2d6e49bb4234cb128251dc94f1c40707.jpg', 1548839208);

-- ----------------------------
-- Table structure for dp_home_boxprice
-- ----------------------------
DROP TABLE IF EXISTS `dp_home_boxprice`;
CREATE TABLE `dp_home_boxprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_id` int(11) NOT NULL COMMENT '关联盒子',
  `month` int(11) NOT NULL COMMENT '购买盒子的月数',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买盒子的月数的中文',
  `price` decimal(11, 2) NOT NULL COMMENT '金额',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dp_home_boxprice
-- ----------------------------
INSERT INTO `dp_home_boxprice` VALUES (1, 1, 6, '半年', 198.00, 1548780299);
INSERT INTO `dp_home_boxprice` VALUES (2, 1, 12, '一年', 368.00, 1548781585);
INSERT INTO `dp_home_boxprice` VALUES (3, 2, 6, '半年', 338.00, 1548781987);
INSERT INTO `dp_home_boxprice` VALUES (4, 1, 36, '三年', 998.00, 1548784054);
INSERT INTO `dp_home_boxprice` VALUES (5, 2, 12, '一年', 668.00, 1548784135);
INSERT INTO `dp_home_boxprice` VALUES (7, 2, 36, '三年', 988.00, 1548784359);
INSERT INTO `dp_home_boxprice` VALUES (8, 3, 6, '半年', 538.00, 1548839322);
INSERT INTO `dp_home_boxprice` VALUES (9, 3, 12, '一年', 998.00, 1548839415);
INSERT INTO `dp_home_boxprice` VALUES (10, 3, 36, '三年', 1588.00, 1548839489);

SET FOREIGN_KEY_CHECKS = 1;
