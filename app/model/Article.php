<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

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
        return $this->hasOne(Category::class, 'id', 'category_id')->field('id,title');
    }

    public static function incClick(int $id = 0, int $i = 1)
    {
        return self::where('id', $id)->inc('click', $i)->update();
    }
}