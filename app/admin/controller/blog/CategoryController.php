<?php

namespace app\admin\controller\blog;

use app\admin\model\Category;
use app\common\controller\AdminController;
use app\common\services\annotation\ControllerAnnotation;
use app\common\services\annotation\NodeAnnotation;

/**
 * @ControllerAnnotation(title="分类管理")
 */
class CategoryController extends AdminController
{

    public function initialize()
    {
        parent::initialize();
        $this->model = new Category();
        $notes       = Category::$notes;
        $this->assign(compact('notes'));
    }

}
