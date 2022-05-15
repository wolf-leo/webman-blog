<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use Gregwar\Captcha\CaptchaBuilder;
use Gregwar\Captcha\PhraseBuilder;
use support\Request;
use support\Response;
use think\facade\Cache;

class Out extends AdminBase
{
    public function beforeAction()
    {
        $this->checkLogin = false;
        parent::beforeAction();
    }

    public function captcha(Request $request): Response
    {
        $phraseBuilder = new PhraseBuilder(4, '0123456789');
        // 初始化验证码类
        $builder = new CaptchaBuilder(null, $phraseBuilder);
        // 生成验证码
        $builder->build();
        Cache::instance()->set('captcha', strtolower($builder->getPhrase()));
        // 获得验证码图片二进制数据
        $img_content = $builder->get();
        // 输出验证码二进制数据
        return response($img_content, 200, ['Content-Type' => 'image/jpeg']);
    }
}
