<h1 align="center">
    <a href="">
         <code>wolfcode-blog</code> 基于 <code>webman</code> 开源博客程序
    </a>
</h1>

### 程序简介

- #### 依赖`webman`搭建【 需要 php>=7.4，建议 `php8.1` | MySQL>=5.7，建议 `MySQL8.0` 】
- #### `webman` 官方文档地址：[https://www.workerman.net/doc/webman/](https://www.workerman.net/doc/webman/)
- #### 程序默认关闭 `app_debug` ，如需调试，请自行前往根目录中的 `.env` 文件配置
- #### 程序默认静默安装数据库，默认数据库名 `my_blog_2022`

### 配置说明

- #### 请先配置根目录下 `.env` 文件里以 `[DB_]` 开头的数据库连接信息
    - #### 主要修改的是 `DB_USERNAME` 和 `DB_PASSWORD` 两个参数值
- #### 如需外网访问，搭配 `Nginx` 进行反向代理即可

### 如何运行

- #### 将代码 `下载` 或者 `git clone` 到本地，放入到预设路径（例如 `/www/wwwroot/yourpath`下）
    - #### 在 `/www/wwwroot/yourpath` 下运行 `php start.php start -d`
- #### 运行前请先确认php版本，可以运行 `php -v` 查看

- #### 相关命令的区别

#### `debug` 方式运行 【 调试模式 | 用于开发调试 】

> > ```php start.php start```
> #### `daemon` 方式运行 【 守护模式 | 用于正式环境 】
>> ```php start.php start -d```
> #### `restart` 服务重启 【 该命令相当于先 stop 后 start 】
> > ```php start.php restart```    # 重启后进入调试模式
>
>> ```php start.php restart -d``` # 重启后进入守护模式
> #### `reload` 代码重载 【 该命令不会中断当前服务 】
>> ```php start.php rload```

- #### <font color="red">特别提醒
    - #### 尽量不要在 `Windows` 系统下运行该程序，建议使用 `Linux` 环境运行
    - #### 程序底层已做好 `php8+` 兼容，请谨慎使用全局的 `composer update`
    - #### 不做向下版本兼容，如需要其他版本，请自行兼容开发
    - #### 如果出现 PHP Fatal error:  Uncaught Error: Call to undefined function pcntl_signal()，请到 `php.ini` 配置文件中删除对应禁用函数即可，或者宝塔用户可在 php版本管理的 `禁用函数` 中自行删除 </font>

## LICENSE

- #### GNU General Public License v3.0
    - #### 个人使用免费，商用运营请遵循协议
