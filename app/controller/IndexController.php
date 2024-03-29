<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace app\controller;

use app\common\controller\BlogController;
use app\admin\model\Article;
use app\admin\model\Banner;
use JasonGrimes\Paginator;
use support\Request;
use support\Response;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

class IndexController extends BlogController
{
    /**
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function index(Request $request, $page = 1): Response
    {
        $limit   = 10;
        $where[] = ['status', '=', 1];
        $list    = Article::getList($where, 'id,title,img,desc,c_time,article_date,category_id', 'article_date desc,id desc', $page, $limit);
        if (empty($list)) return redirect('/');
        $banner    = Banner::getList($where, 'id,title,img,link,target,desc', 'sort desc,id desc', 1, 10);
        $paginator = new Paginator(Article::getCount($where), $limit, $page, '/page/(:num)/');
        $paginator->setPreviousText('上页');
        $paginator->setNextText('下页');
        $paginator->setMaxPagesToShow(5);
        return $this->blog_tpl(compact('list', 'banner', 'paginator'));
    }
}
