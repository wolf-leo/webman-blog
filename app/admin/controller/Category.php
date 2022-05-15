<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use support\Request;
use support\Response;
use think\db\exception\PDOException;
use app\model\Category as CategoryModel;

class Category extends AdminBase
{
    protected array $notes = [];

    public function beforeAction()
    {
        parent::beforeAction();
        $this->notes = CategoryModel::$notes;
        if (!$this->isLogin) {
            if ('POST' == \request()->method()) return $this->apiError('当前登录状态已失效，请刷新页面重新登录');
            return redirect('/admin/login/');
        }
    }

    public function index(Request $request): Response
    {
        if (empty($request->post())) return $this->admin_tpl(['notes' => $this->notes]);
        list($page, $limit, $where) = $this->argsWhere($request);
        $data  = CategoryModel::getList($where, '*', 'id desc', $page, $limit);
        $count = CategoryModel::getCount($where);
        $res   = compact('data', 'count') + ['code' => 0];
        return json($res);
    }

    public function edit(Request $request): Response
    {
        $post    = $request->post();
        $id      = $request->get('id', 0);
        $where[] = ['id', '=', $id];
        if (empty($post)) {
            $info = [];
            if ($id) $info = CategoryModel::getOne($where);
            $notes = $this->notes;
            return $this->admin_tpl(compact('id', 'info', 'notes'));
        }
        try {
            if (!$id) {
                $save = CategoryModel::insertDataCache($post);
            } else {
                $save = CategoryModel::updateDataCache($where, $post);
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
            CategoryModel::where('id', 'IN', $ids)->delete();
            return $this->apiSuccess();
        } catch (PDOException $exception) {
            return $this->apiError($exception->getMessage());
        }
    }
}
