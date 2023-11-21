<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace app\common\controller;

use app\admin\model\Article;
use app\admin\model\Category;
use app\admin\model\Options;
use support\Response;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

class BlogController
{
    /**
     * @param array $assign
     * @return Response
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    protected function blog_tpl(array $assign = []): Response
    {
        $controllerClass = explode('\\', request()->controller);
        $controller      = strtolower(str_replace('Controller', '', array_pop($controllerClass)));
        $action          = request()->action;
        $template        = env('DEFAULT_TEMPLATE', 'template_001') . '/' . $controller . '/' . $action;
        $category        = Category::getColumn(['status' => 1], 'title', 'id', 'sort desc,id asc');
        $map[]           = ['status', '=', 1];
        $popular_list    = Article::getList($map, 'id,title,img,desc,c_time,article_date,category_id', 'click desc,id desc', 1, 10);
        $blogConfig      = Options::getDefaultConfig();
        $assign          = $assign + compact('category', 'controller', 'action', 'popular_list', 'blogConfig');
        return view($template, $assign);
    }

    protected function jump404(): Response
    {
        return view('404');
    }
}
