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
use support\Request;
use support\Response;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

class InfoController extends BlogController
{
    /**
     * @throws ModelNotFoundException
     * @throws DataNotFoundException
     * @throws DbException
     */
    public function index(Request $request, $id = 0): Response
    {
        if (empty($id)) return $this->jump404();
        $where[] = ['status', '=', 1];
        $where[] = ['id', '=', $id];
        $info    = Article::getOne($where, 'id,title,img,desc,c_time,article_date,category_id,content,click');
        if (empty($info)) return $this->jump404();
        Article::incClick($id); // 增加 点击 次数
        $map[] = ['status', '=', 1];
        $map[] = ['id', '<>', $id];
        $map[] = ['category_id', '=', $info['category_id']];
        $more  = Article::getList($map, 'id,title,img,desc,c_time,article_date,category_id', 'article_date desc,id desc', 1, 6);
        return $this->blog_tpl(compact('info', 'more'));
    }

    /**
     * @throws ModelNotFoundException
     * @throws DataNotFoundException
     * @throws DbException
     */
    public function about_me(Request $request): Response
    {
        return $this->blog_tpl();
    }
}
