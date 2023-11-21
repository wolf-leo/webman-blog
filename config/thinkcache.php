<?php

/**
 * 如果你看到了这里 想用到缓存
 * 建议使用 redis 缓存
 * 因为 file 缓存会出现很多问题
 */
return [
    'default' => 'file',
    'stores'  => [
        'file'  => [
            'type'      => 'File',
            // 缓存保存目录
            'path'      => runtime_path() . '/cache/',
            // 缓存前缀
            'prefix'    => '',
            // 缓存有效期 0表示永久缓存
            'expire'    => 0,
            'serialize' => ['serialize', 'unserialize'],
        ],
        'redis' => [
            'type'      => 'redis',
            'host'      => '127.0.0.1',
            'port'      => 6379,
            'prefix'    => '',
            'expire'    => 0,
            'serialize' => ['serialize', 'unserialize'],
        ],
    ],
];