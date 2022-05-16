<?php

namespace app\middleware;

use Webman\MiddlewareInterface;
use Webman\Http\Response;
use Webman\Http\Request;

/**
 * Class InstallCheck 博客程序首次安装检测
 *
 * @package app\middleware
 */
class InstallCheck implements MiddlewareInterface
{
    public function process(Request $request, callable $handler): Response
    {
        $lock_file = base_path() . DIRECTORY_SEPARATOR . 'extend' . DIRECTORY_SEPARATOR . 'install.lock';
        if (!file_exists($lock_file)) {
            $dbHost    = env('db_host');
            $dbUser    = env('db_username');
            $dbPwd     = env('db_password');
            $dbPort    = env('db_port');
            $dbCharset = env('db_charset');
            $dbName    = env('db_database');
            try {
                $conn = mysqli_connect($dbHost, $dbUser, $dbPwd, null, $dbPort);
                mysqli_query($conn, "SET NAMES {$dbCharset}");
                if (!mysqli_select_db($conn, $dbName)) {
                    if (!mysqli_query($conn, "CREATE DATABASE IF NOT EXISTS `{$dbName}` DEFAULT CHARACTER SET {$dbCharset};")) {
                        $errorMsg = "数据库{$dbName} 不存在，也没权限创建新的数据库！";
                        mysqli_close($conn);
                        return response($errorMsg, 400);
                    }
                }
            } catch (\Exception $e) {
                $errorMsg = "连接 MySQL 失败: " . mysqli_connect_error() . $e->getMessage();
                return response($errorMsg, 400);
            }
        }
        return $handler($request);
    }
}