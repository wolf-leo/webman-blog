<?php

namespace app\controller;

use app\common\controller\BlogBase;
use app\model\Article;
use app\model\Banner;
use JasonGrimes\Paginator;
use support\Request;
use support\Response;

class Index extends BlogBase
{
    public function index(Request $request, $page = 1): Response
    {
        $limit   = 10;
        $where[] = ['status', '=', 1];
        $list    = Article::getList($where, 'id,title,img,desc,c_time,article_date,c_id', 'article_date desc,id desc', $page, $limit);
        if (empty($list)) return redirect('/');
        $banner    = Banner::getList($where, 'id,title,img,link,target,desc', 'id desc', 1, 10);
        $paginator = new Paginator(Article::getCount($where), $limit, $page, '/page/(:num)/');
        $paginator->setPreviousText('上页');
        $paginator->setNextText('下页');
        $paginator->setMaxPagesToShow(5);
        return $this->blog_tpl(compact('list', 'banner', 'paginator'));
    }
}
