<?php

namespace app\common\exception;

use Webman\Http\Request;
use Webman\Http\Response;
use Throwable;
use Webman\Exception\ExceptionHandler;

class Handler extends ExceptionHandler
{
    public $dontReport = [];

    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    public function render(Request $request, Throwable $exception): Response
    {
        return parent::render($request, $exception);
    }

}