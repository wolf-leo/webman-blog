<?php

return [
    'controller_namespace' => 'app\admin\controller\\',

    // 超级管理员ID
    'super_admin_id'       => 1,

    // 后台默认路径
    'admin_alias_name'     => 'admin',
    // 是否开启后台域名绑定
    'admin_domain_status'  => getenv('EASYADMIN.ADMIN_DOMAIN_STATUS') == 'true',
    // 后台域名绑定地址
    'admin_domain'         => getenv('EASYADMIN.ADMIN_DOMAIN'),

    // 不需要验证登录的控制器
    'no_login_controller'  => [
        'login',
    ],

    // 不需要验证登录的节点
    'no_login_node'        => [
        'login/index',
        'login/out',
    ],

    // 不需要验证权限的控制器
    'no_auth_controller'   => [
        'ajax',
        'login',
        'index',
    ],

    // 不需要验证权限的节点
    'no_auth_node'         => [
        'login/index',
        'login/out',
    ],

    //上传类型
    'upload_types'         => [
        'local' => '本地存储',
        'oss'   => '阿里云oss',
        'cos'   => '腾讯云cos',
        'qnoss' => '七牛云'
    ],

    // 默认编辑器
    'editor_types'         => [
        'ueditor'  => '百度编辑器',
        'ckeditor' => 'CK编辑器',
    ],
];
