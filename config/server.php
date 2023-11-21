<?php
/**
 * This file is part of webman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author    walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link      http://www.workerman.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

return [
    'listen'           => 'http://0.0.0.0:' . env('APP_PORT', 8787),
    'transport'        => 'tcp',
    'context'          => [],
    'name'             => 'webman',
    'count'            => cpu_count() * 4,
    'user'             => '',
    'group'            => '',
    'reusePort'        => false,
    'event_loop'       => '',
    'stop_timeout'     => 2,
    'pid_file'         => runtime_path() . '/webman.pid',
    'status_file'      => runtime_path() . '/webman.status',
    'stdout_file'      => runtime_path() . '/logs/stdout.log',
    'log_file'         => runtime_path() . '/logs/workerman.log',
    'max_package_size' => 100 * 1024 * 1024, // 系统最大限制上传文件大小，如果修改，需要重启服务
];
