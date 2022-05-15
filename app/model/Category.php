<?php

namespace app\model;

use app\traits\ModelTrait;
use think\Model;

class Category extends Model
{
    use ModelTrait;

    public static array $notes = [
        'status' => [
            1 => '正常', 2 => '禁用',
        ],
    ];
}