<?php

namespace Jenssegers\Blade;

use Illuminate\Container\Container;

class Application extends Container
{
    public function getNamespace()
    {
        return 'app\\';
    }
}
