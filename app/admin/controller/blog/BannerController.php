<?php

namespace app\admin\controller\blog;

use app\admin\model\Banner;
use app\common\controller\AdminController;
use app\common\services\annotation\ControllerAnnotation;
use app\common\services\annotation\NodeAnnotation;
use support\Request;
use support\Response;

/**
 * @ControllerAnnotation(title="轮播图管理")
 */
class BannerController extends AdminController
{

    public function initialize()
    {
        parent::initialize();
        $this->model = new Banner();
        $notes       = Banner::$notes;
        $this->assign(compact('notes'));
    }

}
