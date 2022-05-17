<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace app\controller;

use app\common\controller\BlogBase;
use app\model\Article;
use JasonGrimes\Paginator;
use support\Request;
use support\Response;

class Category extends BlogBase
{
    public function index(Request $request, $id = 0, $page = 1): Response
    {
        if (empty($id)) return $this->jump404();
        $map[]        = ['status', '=', 1];
        $map[]        = ['id', '=', $id];
        $categoryInfo = \app\model\Category::getOne($map);
        if (empty($categoryInfo)) return $this->jump404();
        $limit   = 10;
        $where[] = ['status', '=', 1];
        $where[] = ['category_id', '=', $id];
        $list    = Article::getList($where, 'id,title,img,desc,c_time,article_date,category_id', 'id desc', $page, $limit);
        if (empty($list)) return redirect("/category/{$id}/");
        $paginator = new Paginator(Article::getCount($where), $limit, $page, "/category/{$id}/page/(:num)/");
        $paginator->setPreviousText('上页');
        $paginator->setNextText('下页');
        $paginator->setMaxPagesToShow(5);
        return $this->blog_tpl(compact('list', 'paginator', 'categoryInfo'));
    }
}
