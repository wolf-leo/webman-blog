<?php
/**
 * This file is part of webman.
 *
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

Route::group('/common', function () {
    Route::any('/[{path:.+}]', function ($request) {
        return view('404');
    });
});


Route::get('/page/1', function () {
    return redirect('/');
});

Route::get('/page/1/', function () {
    return redirect('/');
});

Route::get('/page/{page:\d+}/', [app\controller\IndexController::class, 'index']);

Route::get('/category/{id:\d+}', function ($request, $id) {
    return redirect("/category/{$id}/");
});

Route::get('/category/{id:\d+}/page/1', function ($request, $id) {
    return redirect("/category/{$id}/");
});

Route::get('/category/{id:\d+}/page/1/', function ($request, $id) {
    return redirect("/category/{$id}/");
});

Route::get('/category/{id:\d+}/', [app\controller\CategoryController::class, 'index']);

Route::get('/category/{id:\d+}/page/{page:\d+}/', [app\controller\CategoryController::class, 'index']);

Route::get('/info/{id:\d+}', function ($request, $id) {
    return redirect("/info/{$id}/");
});

Route::get('/info/{id:\d+}/', [app\controller\InfoController::class, 'index']);

Route::get('/about/me', function () {
    return redirect("/about/me/");
});

Route::get('/about/me/', [app\controller\InfoController::class, 'about_me']);