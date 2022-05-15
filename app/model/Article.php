<?php

namespace app\model;

use app\traits\ModelTrait;
use think\Model;
use think\model\relation\HasOne;

class Article extends Model
{
    use ModelTrait;

    public static array $notes = [
        'status' => [
            1 => '正常', 2 => '禁用',
        ],
    ];

    public function categoryInfo(): HasOne
    {
        return $this->hasOne(Category::class, 'id', 'c_id')->field('id,title');
    }

    public static function incClick(int $id = 0, int $i = 1)
    {
        return self::where('id', $id)->inc('click', $i)->update();
    }
}