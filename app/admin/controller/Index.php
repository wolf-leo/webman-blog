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
use app\model\SystemAdmin;
use Respect\Validation\Exceptions\ValidationException;
use Respect\Validation\Validator;
use support\Request;
use support\Response;
use think\facade\Cache;
use think\helper\Str;

class Index extends AdminBase
{
    public function beforeAction()
    {
        parent::beforeAction();
        if (!$this->isLogin) {
            if ('POST' == \request()->method()) return $this->apiError('当前登录状态已失效，请刷新页面重新登录');
            return redirect('/admin/login/');
        }
    }

    public function index(Request $request): Response
    {
        return $this->admin_tpl();
    }

    public function welcome(Request $request): Response
    {
        return $this->admin_tpl();
    }

    public function changePwd(Request $request): Response
    {
        $post = $request->post();
        if (empty($post)) return $this->admin_tpl();
        try {
            Validator::input($post, [
                'password'  => Validator::length(6, 64)->setName('新密码'),
                'password2' => Validator::length(6, 64)->setName('确认密码'),
            ]);
        } catch (ValidationException $e) {
            return $this->apiError($e->getMessage());
        }
        if ($post['password2'] !== $post['password']) return $this->apiError('两次密码不一致');
        $admin    = Cache::instance()->get('admin');
        $salt     = Str::random();
        $password = adminPasswordAuth($post['password2'], $salt);
        SystemAdmin::updateDataCache(['id' => $admin['id']], compact('password', 'salt'));
        Cache::instance()->delete('admin');
        $this->isLogin = false;
        return $this->apiSuccess();
    }

}
