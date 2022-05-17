<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

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
