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

class Options extends BaseModel
{
    use ModelTrait;

    /**
     * @param string $type
     * @return array
     */
    public static function getDefaultConfig(string $type = 'blog'): array
    {
        $info = self::where('type', $type)->value('content');
        return $info ? json_decode($info, true) : [];
    }
}