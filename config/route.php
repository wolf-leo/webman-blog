<?php
/**
 * This file is part of webman.
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author    walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link      http://www.workerman.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

use Webman\Route;

Route::get('/page/1', function() {
    return redirect('/');
});
Route::get('/page/1/', function() {
    return redirect('/');
});
Route::get('/category/{id:\d+}/page/1', function($request, $id) {
    return redirect("/category/{$id}/");
});
Route::get('/category/{id:\d+}/page/1/', function($request, $id) {
    return redirect("/category/{$id}/");
});
Route::get('/page/{page:\d+}/', [app\controller\Index::class, 'index']);
Route::get('/category/{id:\d+}/', [app\controller\Category::class, 'index']);
Route::get('/category/{id:\d+}/page/{page:\d+}/', [app\controller\Category::class, 'index']);
Route::get('/info/{id:\d+}/', [app\controller\Info::class, 'index']);
Route::get('/about/me/', [app\controller\Info::class, 'about_me']);


