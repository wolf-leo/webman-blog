<?php

namespace app\admin\controller\blog;

use app\admin\model\Options;
use app\common\controller\AdminController;
use app\common\services\annotation\ControllerAnnotation;
use app\common\services\annotation\NodeAnnotation;
use support\Request;
use support\Response;

/**
 * @ControllerAnnotation(title="文章配置")
 */
class OptionsController extends AdminController
{

    public function initialize()
    {
        parent::initialize();
        $this->model = new Options();
    }

    /**
     * @NodeAnnotation(title="配置")
     */
    public function config(Request $request): Response
    {
        if (!$request->isAjax()) {
            $row = Options::getDefaultConfig();
            return $this->fetch('', compact('row'));
        }
        $post            = $request->post();
        $data['content'] = json_encode($post, JSON_UNESCAPED_UNICODE);
        $save            = $this->model->where('type', 'blog')->update($data);
        return $save ? $this->success() : $this->error('操作失败或者数据没有发生变化改变');
    }

}
