<?php

namespace app\controller;

use app\common\controller\BlogBase;
use app\model\Article;
use support\Request;
use support\Response;

class Info extends BlogBase
{
    public function index(Request $request, $id = 0): Response
    {
        if (empty($id)) return $this->jump404();
        $where[] = ['status', '=', 1];
        $where[] = ['id', '=', $id];
        $info    = Article::getOne($where, 'id,title,img,desc,c_time,article_date,c_id,content,click');
        if (empty($info)) return $this->jump404();
        Article::incClick($id); // 增加 点击 次数
        $map[] = ['status', '=', 1];
        $map[] = ['id', '<>', $id];
        $map[] = ['c_id', '=', $info['c_id']];
        $more  = Article::getList($map, 'id,title,img,desc,c_time,article_date,c_id', 'article_date desc,id desc', 1, 6);
        return $this->blog_tpl(compact('info', 'more'));
    }

    public function about_me(Request $request, $id = 0): Response
    {
        $info = sysConfig('about');
        return $this->blog_tpl(compact('info'));
    }
}
