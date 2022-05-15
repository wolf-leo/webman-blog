<?php

namespace app\common\controller;

use support\Request;
use support\Response;
use think\facade\Cache;

class AdminBase
{
    public bool $checkLogin = true;
    public bool $isLogin    = false;

    public function beforeAction()
    {
        if ($this->checkLogin) return $this->checkLogin();
    }

    /**
     * @param  array  $assign
     * @return Response
     */
    public function admin_tpl(array $assign = []): Response
    {
        $controllerClass = request()->controller;
        $controller      = strtolower(substr($controllerClass, strrpos($controllerClass, '\\') + 1));
        $action_name     = request()->action;
        $template        = $controller . '/' . $action_name;
        $base_assign     = [
            'static_version' => sysConfig('site', 'site_version', '1.0.0'),
        ];
        $assign          = $assign + $base_assign;
        return view($template, $assign);
    }

    protected function checkLogin(): bool
    {
        $admin         = Cache::instance()->get('admin');
        $this->isLogin = (bool)$admin;
        return $this->isLogin;
    }

    public function apiSuccess(array $data = [], string $msg = '操作成功', int $code = 1): Response
    {
        $arr = compact('msg', 'code', 'data');
        return json($arr);
    }

    public function apiError(string $msg = '操作失败', int $code = 0): Response
    {
        $arr = compact('msg', 'code');
        return json($arr);
    }

    public function argsWhere(Request $request): array
    {
        $post    = $request->post();
        $page    = isset($post['page']) && !empty($post['page']) ? $post['page'] : 1;
        $limit   = isset($post['limit']) && !empty($post['limit']) ? $post['limit'] : 15;
        $filters = isset($post['filter']) && !empty($post['filter']) ? $post['filter'] : '{}';
        $ops     = isset($post['op']) && !empty($post['op']) ? $post['op'] : '{}';
        $filters = json_decode($filters, true);
        $ops     = json_decode($ops, true);
        $where   = [];
        foreach ($filters as $key => $val) {
            if (in_array($key, ['page', 'limit'])) continue;
            $op = isset($ops[$key]) && !empty($ops[$key]) ? $ops[$key] : '%*%';
            switch (strtolower($op)) {
                case '=':
                    $where[] = [$key, '=', $val];
                    break;
                case '%*%':
                    $where[] = [$key, 'LIKE', "%{$val}%"];
                    break;
                case '*%':
                    $where[] = [$key, 'LIKE', "{$val}%"];
                    break;
                case '%*':
                    $where[] = [$key, 'LIKE', "%{$val}"];
                    break;
                case 'range':
                    $where[] = [$key, 'BETWEEN', explode(' - ', $val)];
                    break;
                default:
                    $where[] = [$key, $op, "%{$val}"];
                    break;
            }
        }
        $where = array_values($where);
        return [$page, $limit, $where];
    }
}