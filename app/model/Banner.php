<?php

namespace app\model;

use app\traits\ModelTrait;
use think\Model;

class Banner extends Model
{
    use ModelTrait;

    public static array $notes = [
        'status' => [
            1 => '正常', 2 => '禁用',
        ],
        'target' => [
            1 => '_self', 2 => '_blank',
        ],
    ];
}