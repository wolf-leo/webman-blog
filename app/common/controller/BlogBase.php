<?php

namespace app\common\controller;

use app\model\Article;
use app\model\Category;
use support\Response;

class BlogBase
{
    /**
     * @param array $assign
     * @return Response
     */
    public function blog_tpl(array $assign = []): Response
    {
        $controllerClass = request()->controller;
        $controller      = strtolower(substr($controllerClass, strrpos($controllerClass, '\\') + 1));
        $action          = request()->action;
        $template        = $controller . '/' . $action;
        $category        = Category::getColumn(['status' => 1], 'title', 'id', 'sort desc,id asc');
        $map[]           = ['status', '=', 1];
        $popular_list    = Article::getList($map, 'id,title,img,desc,c_time,article_date,category_id', 'click desc,id desc', 1, 10);
        $assign          = $assign + compact('category', 'controller', 'action', 'popular_list');
        return view($template, $assign);
    }

    public function jump404(): Response
    {
        return view('public/404');
    }
}