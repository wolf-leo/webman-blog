<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

function adminPasswordAuth(string $password, string $salt): string
{
    return password_hash($password . $salt, PASSWORD_BCRYPT);
}

function sql_split($sql): array
{
    $sql       = preg_replace("/TYPE=(InnoDB|MyISAM|MEMORY)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\1 DEFAULT CHARSET=utf8mb4", $sql);
    $sql       = str_replace("\r", "\n", $sql);
    $ret       = array();
    $num       = 0;
    $quirkiest = explode(";\n", trim($sql));
    unset($sql);
    foreach ($quirkiest as $query) {
        $ret[$num] = '';
        $queries   = explode("\n", trim($query));
        $queries   = array_filter($queries);
        foreach ($queries as $query) {
            $str1 = substr($query, 0, 1);
            if ($str1 != '#' && $str1 != '-')
                $ret[$num] .= $query;
        }
        $num++;
    }
    return $ret;
}

if (!function_exists('sysConfig')) {
    function sysConfig($type, $name = null, $default = '')
    {
        $where[] = ['type', '=', $type];
        $value   = empty($name) ? \think\facade\Cache::instance()->get("sysConfig_{$type}") : \think\facade\Cache::instance()->get("sysConfig_{$type}_{$name}");
        if (empty($value)) {
            $content = \app\model\Options::where($where)->value('content');
            $value   = json_decode($content, true);
            if (empty($value)) return $default;
            if (!empty($name)) {
                $value = $value[$name] ?? '';
                if (empty($value)) return $default;
                \think\facade\Cache::instance()->tag('sysConfig')->set("sysConfig_{$type}_{$name}", $value, 3600);
            } else {
                \think\facade\Cache::instance()->tag('sysConfig')->set("sysConfig_{$type}", $value, 3600);
            }
        }
        return $value;
    }
}