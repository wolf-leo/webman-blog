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
use app\model\Options;
use support\Request;
use support\Response;
use think\db\exception\PDOException;
use think\facade\Cache;

class System extends AdminBase
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

    public function edit(Request $request): Response
    {
        $type = $request->get('type', '');
        if (empty($type)) return $this->apiError();
        $post    = $request->post();
        $where[] = ['type', '=', $type];
        $data    = ['type' => $type, 'content' => json_encode($post, JSON_UNESCAPED_UNICODE | JSON_PRESERVE_ZERO_FRACTION | JSON_NUMERIC_CHECK),];
        $info    = Options::getOne($where);
        try {
            if ($info) Options::updateDataCache($where, $data); else Options::insertDataCache($data);
            Cache::instance()->tag('sysConfig')->clear();
        } catch (PDOException $exception) {
            return $this->apiError($exception->getMessage());
        }
        return $this->apiSuccess();
    }
}
