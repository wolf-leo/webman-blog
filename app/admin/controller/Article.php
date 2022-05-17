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
use think\db\exception\PDOException;
use app\model\Article as ArticleModel;
use app\model\Category as CategoryModel;

class Article extends AdminBase
{
    protected array $notes    = [];
    protected array $category = [];

    public function beforeAction()
    {
        parent::beforeAction();
        $this->notes    = ArticleModel::$notes;
        $this->category = CategoryModel::getColumn([], 'title', 'id', 'id asc');
        if (!$this->isLogin) {
            return redirect('/admin/login/');
        }
    }

    public function index(Request $request): Response
    {
        $category = $this->category;
        if (empty($request->post())) return $this->admin_tpl(['notes' => $this->notes, 'category' => $this->category]);
        list($page, $limit, $where) = $this->argsWhere($request);
        $data  = ArticleModel::getListByWith($where, '*', 'id desc', ['categoryInfo'], $page, $limit);
        $count = ArticleModel::getCount($where);
        $res   = compact('data', 'category', 'count') + ['code' => 0];
        return json($res);
    }

    public function edit(Request $request): Response
    {
        $post    = $request->post();
        $id      = $request->get('id', 0);
        $where[] = ['id', '=', $id];
        if (empty($post)) {
            $info = [];
            if ($id) $info = ArticleModel::getOne($where);
            $notes    = $this->notes;
            $category = $this->category;
            return $this->admin_tpl(compact('id', 'info', 'notes', 'category'));
        }
        $post['article_date'] = $post['article_date'] ?: date('Y-m-d');
        $post['desc']         = $post['desc'] ?: mb_substr(strip_tags($post['content']), 0, 100, 'utf-8');
        $post['desc']         = str_replace(PHP_EOL, '', $post['desc']);
        try {
            if (!$id) {
                $save = ArticleModel::insertDataCache($post);
            } else {
                $save = ArticleModel::updateDataCache($where, $post);
            }
            return $save ? $this->apiSuccess() : $this->apiError('操作失败或者数据没有改变');
        } catch (PDOException $exception) {
            return $this->apiError($exception->getMessage());
        }
    }

    public function delete(Request $request): Response
    {
        $id = $request->post('id', 0);
        if ($id) {
            $ids = (array)$id;
        } else {
            $ids = $request->post('ids', []);
        }
        if (empty($ids)) return $this->apiError();
        try {
            ArticleModel::where('id', 'IN', $ids)->delete();
            return $this->apiSuccess();
        } catch (PDOException $exception) {
            return $this->apiError($exception->getMessage());
        }
    }
}
