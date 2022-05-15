<?php

namespace app\middleware;

use Webman\MiddlewareInterface;
use Webman\Http\Response;
use Webman\Http\Request;

/**
 * Class InstallCheck 博客程序首次安装检测
 * @package app\middleware
 */
class InstallCheck implements MiddlewareInterface
{
    public function process(Request $request, callable $next): Response
    {
        $lock_file = base_path() . DIRECTORY_SEPARATOR . 'extend' . DIRECTORY_SEPARATOR . 'install.lock';
        if (!file_exists($lock_file)) {

        }
        return $next($request);
    }
}