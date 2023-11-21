<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

namespace app\admin\model;

use app\model\BaseModel;
use app\traits\ModelTrait;
use think\db\exception\DbException;
use think\model\relation\HasOne;

class Article extends BaseModel
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

    /**
     * @throws DbException
     */
    public static function incClick(int $id = 0, int $i = 1): int|Article|\think\db\Query
    {
        return self::where('id', $id)->inc('click', $i)->update();
    }
}