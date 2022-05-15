<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\service\UploadService;
use app\model\SystemAdmin;
use Respect\Validation\Exceptions\ValidationException;
use support\Request;
use support\Response;
use Respect\Validation\Validator;
use think\facade\Cache;

class Ajax extends AdminBase
{
    public function beforeAction()
    {
        $this->checkLogin = false;
        parent::beforeAction();
        if ('POST' !== \request()->method()) return $this->apiError('错误的请求方式');
    }

    public function init(): Response
    {
        if (!$this->checkLogin()) return $this->apiError('请先登录');
        $json   = file_get_contents(app_path() . DIRECTORY_SEPARATOR . 'admin' . DIRECTORY_SEPARATOR . 'extend' . DIRECTORY_SEPARATOR . 'init.json');
        $result = json_decode($json, true);
        return $this->apiSuccess($result);
    }

    public function login(Request $request): Response
    {
        $post = $request->post();
        try {
            Validator::input($post, [
                'username' => Validator::alnum()->length(3, 64)->setName('用户名'),
                'password' => Validator::length(6, 64)->setName('密码'),
                'captcha'  => Validator::length(4, 4)->setName('验证码'),
            ]);
        } catch (ValidationException $e) {
            return $this->apiError($e->getMessage());
        }
        $username = $post['username'];
        $password = $post['password'];
        $captcha  = $post['captcha'];
        if ($captcha != Cache::instance()->get('captcha')) return $this->apiError('验证码错误');
        $where[] = ['username', '=', $username];
        $admin   = SystemAdmin::where($where)->findOrEmpty()->toArray();
        if (empty($admin)) return $this->apiError('账号不存在');
        $checkPwd = password_verify($password . $admin['salt'], $admin['password']);
        if (!$checkPwd) return $this->apiError('账号/密码错误');
        Cache::instance()->delete('captcha');
        if ($admin['status'] != 1) return $this->apiError('当前用户状态异常');
        Cache::instance()->set('admin', $admin, 3600 * 3); // 默认缓存3小时 有需要的话可以自己需改值
        return $this->apiSuccess();
    }

    public function upload(Request $request): Response
    {
        $type = $request->get('type', 'default');
        $file = $request->file();
        $file = array_values($file)[0] ?? '';
        if (empty($file)) return $this->apiError('上传失败');
        $upload_config = sysConfig('upload');
        $upload_type   = $upload_config['upload_type'] ?? 'local';
        $check         = ['ext' => $file->getUploadExtension(), 'size' => $file->getSize(),];
        try {
            Validator::input($check, [
                'ext'  => Validator::in(explode(',', $upload_config['upload_allow_ext']))->setName('文件后缀'),
                'size' => Validator::max($upload_config['upload_allow_size'])->setName('文件大小'),
            ]);
        } catch (ValidationException $e) {
            return $this->apiError($e->getMessage());
        }
        $_rs  = UploadService::instance()->setConfig($upload_config)->$upload_type($file, $type);
        $code = $_rs['code'] ?? 0;
        if ($code == 0) {
            return $this->apiError($_rs['data'] ?? '');
        } else {
            return $type == 'editor' ? json($_rs['data'] ?? []) : $this->apiSuccess($_rs['data'] ?? '');
        }
    }
}
