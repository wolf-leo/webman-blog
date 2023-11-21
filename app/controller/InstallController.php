<?php

namespace app\controller;

use app\common\traits\JumpTrait;
use support\Request;
use support\Response;
use support\Db;
use think\facade\Cache;

class InstallController
{
    use JumpTrait;

    public function index(Request $request): Response
    {
        $isInstall   = false;
        $installPath = config_path() . DIRECTORY_SEPARATOR . 'install' . DIRECTORY_SEPARATOR;
        $errorInfo   = null;
        if (is_file($installPath . 'lock' . DIRECTORY_SEPARATOR . 'install.lock')) {
            $isInstall = true;
            $errorInfo = '已安装系统，如需重新安装请删除文件：/config/install/lock/install.lock，或者删除 /install 路由';
        } elseif (version_compare(phpversion(), '8.0.0', '<')) {
            $errorInfo = 'PHP版本不能小于8.0.0';
        } elseif (!extension_loaded("PDO")) {
            $errorInfo = '当前未开启PDO，无法进行安装';
        }
        if (!$request->isAjax()) {
            $currentHost = '://';
            $result      = compact('errorInfo', 'currentHost', 'isInstall');
            return view('install', $result);
        }
        if ($errorInfo) return $this->error($errorInfo);
        $charset = 'utf8mb4';

        $post       = $request->post();
        $cover      = $post['cover'] == 1;
        $database   = $post['database'];
        $hostname   = $post['hostname'];
        $hostport   = $post['hostport'];
        $dbUsername = $post['db_username'];
        $dbPassword = $post['db_password'];
        $prefix     = $post['prefix'];
        $adminUrl   = $post['admin_url'];
        $username   = $post['username'];
        $password   = $post['password'];
        // 参数验证
        $validateError = null;
        // 判断是否有特殊字符
        $check = preg_match('/[0-9a-zA-Z]+$/', $adminUrl, $matches);
        if (!$check) {
            $validateError = '后台地址不能含有特殊字符, 只能包含字母或数字。';
            return $this->error($validateError);
        }

        if (strlen($adminUrl) < 2) {
            $validateError = '后台的地址不能小于2位数';
        } elseif (strlen($password) < 5) {
            $validateError = '管理员密码不能小于5位数';
        } elseif (strlen($username) < 4) {
            $validateError = '管理员账号不能小于4位数';
        }
        if (!empty($validateError)) return $this->error($validateError);
        $config = [
            "driver"   => 'mysql',
            "host"     => $hostname,
            "database" => $database,
            "port"     => $hostport,
            "username" => $dbUsername,
            "password" => $dbPassword,
            "prefix"   => $prefix,
            "charset"  => $charset,
        ];
        // 检测数据库连接
        $checkConnect = $this->checkConnect($config);
        if ($checkConnect instanceof Response) {
            $result = json_decode($checkConnect->rawBody(), true);
            return $this->error($result['data']['msg'] ?? '未知错误');
        }
        // 检测数据库是否存在
        if (!$cover && $this->checkDatabase($database)) return $this->error('数据库已存在，请选择覆盖安装或者修改数据库名');
        // 创建数据库
        $createDatabase = $this->createDatabase($database, $config);
        if ($createDatabase instanceof Response) {
            $result = json_decode($createDatabase->rawBody(), true);
            return $this->error($result['data']['msg'] ?? '未知错误');
        }
        // 导入sql语句等等
        $config  = array_merge($config, ['database' => $database]);
        $install = $this->install($username, $password, $config, $adminUrl);
        if ($install instanceof Response) {
            $result = json_decode($install->rawBody(), true);
            return $this->error($result['data']['msg'] ?? '未知错误');
        }
        return $this->success('系统安装成功，正在跳转登录页面');
    }

    protected function install(string $username, string $password, array $config): bool|Response
    {
        $installPath = config_path() . DIRECTORY_SEPARATOR . 'install' . DIRECTORY_SEPARATOR;
        $sqlPath     = file_get_contents($installPath . 'sql' . DIRECTORY_SEPARATOR . 'install.sql');
        $sqlArray    = $this->parseSql($sqlPath, $config['prefix'], 'ea_');
        $conn        = mysqli_connect($config['host'], $config['username'], $config['password'], null, $config['port']);
        try {
            mysqli_select_db($conn, $config['database']);
            foreach ($sqlArray as $sql) {
                mysqli_query($conn, $sql);
            }
            $_password = password($password);
            $tableName = 'system_admin';
            $update    = [
                'username'    => $username,
                'head_img'    => '/static/admin/images/head.jpg',
                'password'    => $_password,
                'create_time' => time(),
                'update_time' => time()
            ];
            foreach ($update as $_k => $_up) {
                mysqli_query($conn, "UPDATE {$config['prefix']}{$tableName} SET {$_k} = '{$_up}' WHERE id = 1");
            }
            mysqli_close($conn);
            //  处理安装文件
            !is_dir($installPath) && @mkdir($installPath);
            !is_dir($installPath . 'lock' . DIRECTORY_SEPARATOR) && @mkdir($installPath . 'lock' . DIRECTORY_SEPARATOR);
            @file_put_contents($installPath . 'lock' . DIRECTORY_SEPARATOR . 'install.lock', date('Y-m-d H:i:s'));
        } catch (\Exception|\PDOException|\Throwable $e) {
            $data = [
                'code' => 0,
                'msg'  => "系统安装失败：" . $e->getMessage(),
            ];
            return $this->error('', $data);
        }
        Cache::clear();
        return true;
    }

    protected function parseSql($sql = '', $to = '', $from = ''): array
    {
        list($pure_sql, $comment) = [[], false];
        $sql = explode("\n", trim(str_replace(["\r\n", "\r"], "\n", $sql)));
        foreach ($sql as $key => $line) {
            if ($line == '') {
                continue;
            }
            if (preg_match("/^(#|--)/", $line)) {
                continue;
            }
            if (preg_match("/^\/\*(.*?)\*\//", $line)) {
                continue;
            }
            if (str_starts_with($line, '/*')) {
                $comment = true;
                continue;
            }
            if (str_ends_with($line, '*/')) {
                $comment = false;
                continue;
            }
            if ($comment) {
                continue;
            }
            if ($from != '') {
                $line = str_replace('`' . $from, '`' . $to, $line);
            }
            if ($line == 'BEGIN;' || $line == 'COMMIT;') {
                continue;
            }
            array_push($pure_sql, $line);
        }
        //$pure_sql = implode($pure_sql, "\n");
        $pure_sql = implode("\n", $pure_sql);
        return explode(";\n", $pure_sql);
    }

    protected function createDatabase($database, $config): bool
    {
        try {
            $con = mysqli_connect($config['host'] ?? '127.0.0.1', $config['username'] ?? 'root', $config['password'] ?? '', null, $config['port'] ?? '');
            mysqli_query($con, "CREATE DATABASE IF NOT EXISTS `{$database}` DEFAULT CHARACTER SET {$config['charset']} COLLATE=utf8mb4_general_ci");
            mysqli_close($con);
        } catch (\Throwable $e) {
            return false;
        }
        return true;
    }

    protected function checkDatabase($database): bool
    {
        try {
            $check = Db::select("SELECT * FROM information_schema.schemata WHERE schema_name='{$database}'");
        } catch (\Throwable $exception) {
            $check = false;
        }
        if (empty($check)) {
            return false;
        } else {
            return true;
        }
    }

    protected function checkConnect(array $config): bool|Response
    {
        try {
            $con          = mysqli_connect($config['host'] ?? '127.0.0.1', $config['username'] ?? 'root', $config['password'] ?? '', null, $config['port'] ?? '');
            $res          = mysqli_query($con, 'select VERSION()');
            $mysqlVersion = mysqli_fetch_row($res);
            mysqli_close($con);
            $_version = $mysqlVersion[0] ?? 0;
            if (version_compare($_version, '5.7.0', '<')) {
                $data = [
                    'code' => 0,
                    'msg'  => 'mysql版本最低要求 5.7.x',
                ];
                return $this->error('', $data);
            }
        } catch (\Throwable $e) {
            $data = [
                'code' => 0,
                'msg'  => $e->getMessage()
            ];
            return $this->error('', $data);
        }
        return true;
    }

}
