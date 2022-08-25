<?php

use think\facade\Cache;
use think\facade\Db;

Cache::instance()->config(config('thinkcache'));
Db::setCache(Cache::instance()->store());

return [
    'default'     => 'mysql',
    'connections' => [
        'mysql' => [
            // 数据库类型
            'type'            => 'mysql',
            // 服务器地址
            'hostname'        => env('DB_HOST', ''),
            // 数据库名
            'database'        => env('DB_DATABASE', ''),
            // 数据库用户名
            'username'        => env('DB_USERNAME', ''),
            // 数据库密码
            'password'        => env('DB_PASSWORD', ''),
            // 数据库连接端口
            'hostport'        => env('DB_PORT', ''),
            // 数据库连接参数
            'params'          => [],
            // 数据库编码默认采用utf8
            'charset'         => env('DB_CHARSET', 'utf8mb4'),
            // 数据库表前缀
            'prefix'          => '',
            // 断线重连
            'break_reconnect' => true,
            // 关闭SQL监听日志
            'trigger_sql'     => false,
        ],
    ],
];
