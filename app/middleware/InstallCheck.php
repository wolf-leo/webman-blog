<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

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
        $base_path = base_path() . DIRECTORY_SEPARATOR . 'extend' . DIRECTORY_SEPARATOR;
        $lock_file = $base_path . 'install.lock';
        if (file_exists($lock_file)) {
            return $handler($request);
        }
        if (version_compare(PHP_VERSION, '7.4.0', '<')) {
            $errorMsg = "PHP版本需要7.4或者以上，推荐8.1+";
            return response($errorMsg, 400);
        }
        $db_base_data = $base_path . 'database.sql';
        $sql_data     = $base_path . 'sqldata.sql';
        if (file_exists($db_base_data) === false) {
            $errorMsg = "数据库基础获取异常，请确认{$db_base_data}文件是否存在";
            return response($errorMsg, 400);
        }
        if (file_exists($sql_data) === false) {
            $errorMsg = "数据库基础获取异常，请确认{$sql_data}文件是否存在";
            return response($errorMsg, 400);
        }
        $dbHost    = env('db_host');
        $dbUser    = env('db_username');
        $dbPwd     = env('db_password');
        $dbPort    = env('db_port');
        $dbCharset = env('db_charset');
        $dbName    = env('db_database');
        try {
            $conn = mysqli_connect($dbHost, $dbUser, $dbPwd, null, $dbPort);
            mysqli_query($conn, "SET NAMES {$dbCharset}");
            $initDb = mysqli_select_db($conn, $dbName);
            if (!$initDb) {
                if (!mysqli_query($conn, "CREATE DATABASE IF NOT EXISTS `{$dbName}` DEFAULT CHARACTER SET {$dbCharset};")) {
                    $errorMsg = "数据库{$dbName} 不存在，也没权限创建新的数据库！";
                    mysqli_close($conn);
                    return response($errorMsg, 400);
                }
            }
            // 先建表
            $db_data   = file_get_contents($db_base_data);
            $sqlFormat = sql_split($db_data);
            $counts    = count($sqlFormat);
            mysqli_select_db($conn, $dbName);
            for ($index = 0; $index < $counts; $index++) {
                $sql = trim($sqlFormat[$index]);
                if (strstr($sql, 'CREATE TABLE')) {
                    mysqli_query($conn, $sql);
                }
                $index++;
            }
            $sql2 = file_get_contents($sql_data);
            $exp  = array_filter(explode('INSERT INTO', ($sql2)));
            foreach ($exp as $value) {
                $query_sql = 'INSERT INTO ' . htmlspecialchars_decode($value);
                mysqli_query($conn, $query_sql);
            }
            mysqli_close($conn);
            @touch($lock_file);
            return $handler($request);
        } catch (\Exception $e) {
            $errorMsg = "连接 MySQL 失败: " . mysqli_connect_error() . $e->getMessage();
            return response($errorMsg, 400);
        }
    }
}