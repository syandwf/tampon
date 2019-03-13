<?php
/**
 * 模块信息
 */
return [
    // 模块名[必填]
    'name'        => 'circle',
    // 模块标题[必填]
    'title'       => '圈子',
    // 模块唯一标识[必填]，格式：模块名.开发者标识.module
    'identifier'  => 'customer.feng.module',
    // 开发者[必填]
    'author'      => 'LinZhenYu',
    // 版本[必填],格式采用三段式：主版本号.次版本号.修订版本号
    'version'     => '1.0.0',
    // 模块描述[必填] 
    'description' => '圈子模块',
    //字体图标
    'icon'        => 'fa fa-fw fa-user',
    // 模块依赖[可选]，格式[[模块名, 模块唯一标识, 依赖版本, 对比方式]]
    'need_module' => [
        // ['admin', 'admin.dolphinphp.module', '1.0.0']
    ],
    // 插件依赖[可选]，格式[[插件名, 插件唯一标识, 依赖版本, 对比方式]]
    'need_plugin' => [],
    // 数据表[有数据库表时必填]
    'table' => [
        
    ],
    // 原始数据库表前缀
    // 用于在导入模块sql时，将原有的表前缀转换成系统的表前缀
    // 一般模块自带sql文件时才需要配置
    'database_prefix' => 'dp_',
    // 模块参数配置
    'config' => [],
    
];