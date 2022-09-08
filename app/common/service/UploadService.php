<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace app\common\service;

use OSS\Core\OssException;
use OSS\OssClient;
use Qcloud\Cos\Client;
use think\helper\Str;
use Webman\File;

class UploadService
{
    public static   $_instance = null;
    protected array $options   = [];

    public static function instance(): ?UploadService
    {
        if (!static::$_instance) static::$_instance = new static();
        return static::$_instance;
    }

    /**
     * @param  array  $options
     * @return $this
     */
    public function setConfig(array $options = []): UploadService
    {
        $this->options = $options;
        return $this;
    }

    /**
     * @return array
     */
    public function getConfig(): array
    {
        return $this->options;
    }

    /**
     * @param  File    $file
     * @param  string  $base_path
     * @return string
     */
    protected function setFilePath(File $file, string $base_path = ''): string
    {
        $path = date('Ymd') . '/' . Str::random(3) . time() . Str::random() . '.' . $file->getUploadExtension();
        return $base_path . $path;
    }

    /**
     * 阿里云OSS
     *
     * @param  File    $file
     * @param  string  $type
     * @return array
     */
    public function oss(File $file, string $type = ''): array
    {
        $config          = $this->getConfig();
        $accessKeyId     = $config['oss_access_key_id'];
        $accessKeySecret = $config['oss_access_key_secret'];
        $endpoint        = $config['oss_endpoint'];
        $bucket          = $config['oss_bucket'];
        if ($file->isValid()) {
            $object = $this->setFilePath($file, 'blog-static/');
            try {
                $ossClient       = new OssClient($accessKeyId, $accessKeySecret, $endpoint);
                $_rs             = $ossClient->putObject($bucket, $object, file_get_contents($file->getRealPath()));
                $oss_request_url = $_rs['oss - request - url'] ?? '';
                if (empty($oss_request_url)) return ['code' => 0, 'data' => '上传至OSS失败'];
                $oss_request_url = str_replace('http://', 'https://', $oss_request_url);
            } catch (OssException $e) {
                return ['code' => 0, 'data' => $e->getMessage()];
            }

            $data = $type == 'editor' ? ['state' => 'success', 'msg' => $oss_request_url, 'name' => ''] : ['url' => $oss_request_url];
            return ['code' => 1, 'data' => $data];
        }
        $data = '上传失败';
        return ['code' => 0, 'data' => $data];
    }

    /**
     * 腾讯云COS
     *
     * @param  File    $file
     * @param  string  $type
     * @return array
     */
    public function cos(File $file, string $type = ''): array
    {
        $config    = $this->getConfig();
        $secretId  = $config['cos_secret_id'];              //替换为用户的 secretId，请登录访问管理控制台进行查看和管理，https://console.cloud.tencent.com/cam/capi
        $secretKey = $config['cos_secret_key'];             //替换为用户的 secretKey，请登录访问管理控制台进行查看和管理，https://console.cloud.tencent.com/cam/capi
        $region    = $config['cos_region'];                 //替换为用户的 region，已创建桶归属的region可以在控制台查看，https://console.cloud.tencent.com/cos5/bucket
        if ($file->isValid()) {
            $cosClient = new Client(
                [
                    'region'      => $region,
                    'schema'      => 'http',
                    'credentials' => ['secretId' => $secretId, 'secretKey' => $secretKey,
                    ],
                ]);
            try {
                $object   = $this->setFilePath($file, 'blog-static/');
                $result   = $cosClient->upload(
                    $config['cos_bucket'],         //存储桶名称，由BucketName-Appid 组成，可以在COS控制台查看 https://console.cloud.tencent.com/cos5/bucket
                    $object,                       //此处的 key 为对象键
                    file_get_contents($file->getRealPath())
                );
                $location = $result['Location'] ?? '';
                if (empty($location)) return ['code' => 0, 'data' => '上传至COS失败'];
                $location = 'https://' . $location;
            } catch (\Exception $e) {
                return ['code' => 0, 'data' => $e->getMessage()];
            }
            $data = $type == 'editor' ? ['state' => 'success', 'msg' => $location, 'name' => ''] : ['url' => $location];
            return ['code' => 1, 'data' => $data];
        }
        $data = '上传失败';
        return ['code' => 0, 'data' => $data];
    }

    /**
     * 本地存储
     *
     * @param  File    $file
     * @param  string  $type
     * @return array
     */
    public function local(File $file, string $type = ''): array
    {
        if ($file->isValid()) {
            $base_path = '/upload/';
            $file_path = $this->setFilePath($file);
            $file_url  = $base_path . $file_path;
            $file->move(public_path() . $file_url);
            $data = $type == 'editor' ? ['state' => 'success', 'msg' => $file_url, 'name' => ''] : ['url' => $file_url];
            return ['code' => 1, 'data' => $data];
        }
        $data = '上传失败';
        return ['code' => 0, 'data' => $data];
    }

}
