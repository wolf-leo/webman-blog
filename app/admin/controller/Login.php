<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use support\Request;
use support\Response;
use think\facade\Cache;

class Login extends AdminBase
{
    public function beforeAction()
    {
        $this->checkLogin = false;
        parent::beforeAction();

    }

    public function index(Request $request): Response
    {
        if ($this->checkLogin()) return redirect('/admin/index');
        return $this->admin_tpl();
    }

    public function out(Request $request): Response
    {
        Cache::instance()->delete('admin');
        $this->isLogin = false;
        return redirect('/admin/login');
    }
}
