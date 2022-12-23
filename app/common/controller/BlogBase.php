<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace app\common\controller;

use app\model\Article;
use app\model\Category;
use support\Response;

class BlogBase
{
    /**
     * @param  array  $assign
     * @return Response
     */
    protected function blog_tpl(array $assign = []): Response
    {
        $controllerClass = request()->controller;
        $controller      = strtolower(substr($controllerClass, strrpos($controllerClass, '\\') + 1));
        $action          = request()->action;
        $template        = env('DEFAULT_TEMPLATE', 'template_001') . '/' . $controller . '/' . $action;
        $category        = Category::getColumn(['status' => 1], 'title', 'id', 'sort desc,id asc');
        $map[]           = ['status', '=', 1];
        $popular_list    = Article::getList($map, 'id,title,img,desc,c_time,article_date,category_id', 'click desc,id desc', 1, 10);
        $assign          = $assign + compact('category', 'controller', 'action', 'popular_list');
        return view($template, $assign);
    }

    protected function jump404(): Response
    {
        return view('public/404');
    }
}
