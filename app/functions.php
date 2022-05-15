<?php
/**
 * Here is your custom functions.
 */
function adminPasswordAuth(string $password, string $salt): string
{
    return password_hash($password . $salt, PASSWORD_BCRYPT);
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