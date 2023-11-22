## `webman-blog` 基于 [EasyAdmin8-webman(thinkphp分支)](https://github.com/wolf-leo/EasyAdmin8-webman/tree/thinkphp/) 开源博客程序

[![GitHub](https://img.shields.io/badge/webman--blog-%40wolfcode-red?style=flat-square)](https://www.wolfcode.net)
[![GitHub](https://img.shields.io/github/last-commit/wolf-leo/webman-blog.svg?style=flat-square)](https://github.com/wolf-leo/webman-blog/commits/main)
[![GitHub](https://img.shields.io/github/license/wolf-leo/webman-blog?style=flat-square)](https://github.com/wolf-leo/webman-blog)

## 演示站

- 请访问 [http://blog.easyadmin8.top](http://blog.easyadmin8.top)

## 程序简介

- 🚀 **全程自动安装，不需要手动创建数据库、不需要新建任何文件**
- 🔧 依赖 `webman` 搭建【 需要 php>=8.0，建议 `php8.1` `php8.2` | MySQL>=5.7，建议 `MySQL8.0` 】
- 📄 `webman` 官方文档地址：[https://www.workerman.net/doc/webman/](https://www.workerman.net/doc/webman/)
- 💙 程序默认关闭 `app_debug` ，如需调试，请自行前往根目录中的 `.env` 文件配置
- ⭐ 程序默认静默安装数据库，默认数据库名 `my_blog_ea8`
- 🤗  __默认启用 `template_002` 模板，可在 `.env` 文件中配置 `DEFAULT_TEMPLATE` 【目前可选 `template_001` `template_002` 】__

## 配置说明

- 📌 安装前请先将 `.example.env` 文件重命名为 `.env`，然后配置`.env` 文件相关信息
    - 主要修改 `DB_USERNAME` （数据库用户） 和 `DB_PASSWORD` （数据库密码） 两个参数值
    - 程序默认数据库名 `my_blog_ea8` 如果不喜欢，可在安装程序中修改数据库名称参数，`.env`中修改 `DB_DATABASE` 参数值
    - 程序默认端口 `8787`，如果不喜欢，可在`.env`中修改 `APP_PORT` 参数值

## 样式参考

![](public/static/template_002/images/wolfcode.png)

## 如何运行

- 将代码 `下载` 或者 `git clone` 到本地，放入到预设路径（例如 `/www/wwwroot/yourpath`下）
    - 在 `/www/wwwroot/yourpath` 下运行 `php start.php start -d`
- 运行前请先确认`PHP`版本是否`>=8.0`，可以运行 `php -v` 查看
- 后续更新相关组件请先确认`composer`版本是否`>2.0`并且绑定的`PHP`版本是否`>=8.0`，可以运行 `composer show --platform` 查看

- 相关命令的区别

> `debug` 方式运行 【 调试模式 | 用于开发调试 】
>
> > ```php start.php start```
>
> `daemon` 方式运行 【 守护模式 | 用于正式环境 】
>
> > ```php start.php start -d```
>
> `restart` 服务重启 【 该命令相当于先 stop 后 start 】
>
> > ```php start.php restart```    # 重启后进入调试模式
>
>> ```php start.php restart -d``` # 重启后进入守护模式
>
> `reload` 代码重载 【 该命令不会中断当前服务 】
>
> > ```php start.php rload```

- 启动后访问 `http://127.0.0.1:8787` 即可，其中端口号跟 `APP_PORT` 参数值相同
- 如需外网访问，搭配 `Nginx` 进行反向代理即可
- **切换默认模板后没有效果，可以用 `php start.php restart -d` 重启项目**

```
server {

    server_name 站点域名;
    listen 80;
    root /your_blog_path/public;

    location / {
    
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        
        if (!-f $request_filename){
            proxy_pass http://127.0.0.1:8787;   # 端口 8787 必须跟 APP_PORT 参数值一致
        }
        
    }
    
}
  ```

- 配置后访问 `http://你的域名/` 即可
- 后台地址，在主访问域名后面+ `/admin` 即可，例如 `http://你的域名/admin` ，后台账号 `admin` 密码 `123456`
- ### 特别提醒
    - **尽量不要在 `Windows` 系统下运行该程序，建议使用 `Linux` 环境运行**
    - **不做向下版本兼容，如需要其他版本，请自行兼容开发**
    - **如果出现 PHP Fatal error:  Uncaught Error: Call to undefined function pcntl_signal()，请到 `php.ini` 配置文件中删除对应禁用函数即可，或者宝塔用户可在 php版本管理的 `禁用函数` 中自行删除**

## 免责声明

> 任何用户在使用 `EasyAdmin8` 后台框架前，请您仔细阅读并透彻理解本声明。您可以选择不使用`EasyAdmin8`后台框架，若您一旦使用`EasyAdmin8`后台框架，您的使用行为即被视为对本声明全部内容的认可和接受。

* `EasyAdmin8`后台框架是一款开源免费的后台快速开发框架 ，主要用于更便捷地开发后台管理；其尊重并保护所有用户的个人隐私权，不窃取任何用户计算机中的信息。更不具备用户数据存储等网络传输功能。

* 您承诺秉着合法、合理的原则使用`EasyAdmin8`后台框架，不利用`EasyAdmin8`后台框架进行任何违法、侵害他人合法利益等恶意的行为，亦不将`EasyAdmin8`后台框架运用于任何违反我国法律法规的 Web 平台。

* 任何单位或个人因下载使用`EasyAdmin8`后台框架而产生的任何意外、疏忽、合约毁坏、诽谤、版权或知识产权侵犯及其造成的损失 (包括但不限于直接、间接、附带或衍生的损失等)，本开源项目不承担任何法律责任。

* 用户明确并同意本声明条款列举的全部内容，对使用`EasyAdmin8`后台框架可能存在的风险和相关后果将完全由用户自行承担，本开源项目不承担任何法律责任。

* 任何单位或个人在阅读本免责声明后，应在《MIT 开源许可证》所允许的范围内进行合法的发布、传播和使用`EasyAdmin8`后台框架等行为，若违反本免责声明条款或违反法律法规所造成的法律责任(包括但不限于民事赔偿和刑事责任），由违约者自行承担。

* 如果本声明的任何部分被认为无效或不可执行，其余部分仍具有完全效力。不可执行的部分声明，并不构成我们放弃执行该声明的权利。

* 本开源项目有权随时对本声明条款及附件内容进行单方面的变更，并以消息推送、网页公告等方式予以公布，公布后立即自动生效，无需另行单独通知；若您在本声明内容公告变更后继续使用的，表示您已充分阅读、理解并接受修改后的声明内容。

## LICENSE

- MIT
