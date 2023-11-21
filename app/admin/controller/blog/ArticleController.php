<?php

namespace app\admin\controller\blog;

use app\admin\model\Article;
use app\admin\model\Category;
use app\common\controller\AdminController;
use app\common\services\annotation\ControllerAnnotation;
use app\common\services\annotation\NodeAnnotation;
use support\Request;
use support\Response;

/**
 * @ControllerAnnotation(title="文章列表")
 */
class ArticleController extends AdminController
{

    public function initialize()
    {
        parent::initialize();
        $this->model       = new Article();
        $notes             = Article::$notes;
        $notes['category'] = Category::getColumn([], 'title', 'id');
        $this->assign(compact('notes'));
    }

    /**
     * @NodeAnnotation(title="添加")
     */
    public function add(Request $request): Response
    {
        if ($request->isAjax()) {
            $post = $request->post();
            try {
                $post['article_date'] = $post['article_date'] ?: date('Y-m-d');
                $post['desc']         = $post['desc'] ?: mb_substr(strip_tags($post['content']), 0, 100, 'utf-8');
                $post['desc']         = str_replace(PHP_EOL, '', $post['desc']);
                $post['c_time']       = date('Y-m-d H:i:s');
                $save                 = $this->model->save($post);
            } catch (\Exception $e) {
                return $this->error('保存失败:' . $e->getMessage());
            }
            return $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        return $this->fetch();
    }

    /**
     * @NodeAnnotation(title="编辑")
     */
    public function edit(Request $request): Response
    {
        $id  = (int)$request->input('id');
        $row = $this->model->find($id);
        if (empty($row)) return $this->error('数据不存在');
        if ($request->isAjax()) {
            $post                 = $request->post();
            $post['article_date'] = $post['article_date'] ?: date('Y-m-d');
            $post['desc']         = $post['desc'] ?: mb_substr(strip_tags($post['content']), 0, 100, 'utf-8');
            $post['desc']         = str_replace(PHP_EOL, '', $post['desc']);
            $post['u_time']       = date('Y-m-d H:i:s');
            try {
                $save = $row->save($post);
            } catch (\PDOException|\Exception $e) {
                return $this->error('保存失败:' . $e->getMessage());
            }
            return $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign(compact('row'));
        return $this->fetch();
    }
}
