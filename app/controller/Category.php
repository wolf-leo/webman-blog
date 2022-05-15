<?php

namespace app\controller;

use app\common\controller\BlogBase;
use app\model\Article;
use app\model\Banner;
use JasonGrimes\Paginator;
use support\Request;
use support\Response;

class Category extends BlogBase
{
    public function index(Request $request, $id = 0, $page = 1): Response
    {
        if (empty($id)) return $this->jump404();
        if ($id == 3) return redirect('https://www.wolfcode.net');
        $map[]        = ['status', '=', 1];
        $map[]        = ['id', '=', $id];
        $categoryInfo = \app\model\Category::getOne($map);
        if (empty($categoryInfo)) return $this->jump404();
        $limit   = 10;
        $where[] = ['status', '=', 1];
        $where[] = ['c_id', '=', $id];
        $list    = Article::getList($where, 'id,title,img,desc,c_time,article_date,c_id', 'id desc', $page, $limit);
        if (empty($list)) return redirect("/category/{$id}/");
        $paginator = new Paginator(Article::getCount($where), $limit, $page, "/category/{$id}/page/(:num)/");
        $paginator->setPreviousText('上页');
        $paginator->setNextText('下页');
        $paginator->setMaxPagesToShow(5);
        return $this->blog_tpl(compact('list', 'paginator', 'categoryInfo'));
    }
}
