<?php
/**
 * 人生一场虚空大梦，韶华白首，不过转瞬。惟有BUG恒在，往复循环，不曾更改。
 *
 * @author    wolfcode<wolfcode@88.com>
 * @link      https://www.wolfcode.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

declare (strict_types=1);

namespace app\traits;

use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\db\exception\PDOException;
use think\facade\Cache;

trait  ModelTrait
{
    /**
     * @return string
     */
    final public static function getTableName(): string
    {
        return (new self())->getName();
    }

    /**
     * @param array $where
     * @param string $field
     * @return array
     */
    final public static function getOne(array $where, string $field = ''): array
    {
        return self::where($where)->field($field)->findOrEmpty()->toArray();
    }

    /**
     * @param array $where
     * @param string $field
     * @param null $default
     * @return mixed
     */
    final public static function getField(array $where, string $field = '*', $default = null): mixed
    {
        $value = self::where($where)->value($field, $default);
        return $value ?: 0;
    }

    /**
     * @param array $where
     * @param string $field
     * @param mixed $order
     * @param null $default
     * @return mixed
     */
    final public static function getFieldByOrder(array $where, string $field = '*', mixed $order = '', $default = null): mixed
    {
        $value = self::where($where)->order($order)->value($field, $default);
        return $value ?: 0;
    }

    /**
     * @param array $where
     * @return int
     * @throws DbException
     */
    public static function getCount(array $where): int
    {
        return self::where($where)->count();
    }

    /**
     * @param array $where
     * @param string $field
     * @param mixed $order
     * @param int $page
     * @param int $listRows
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    final public static function getList(array $where, string $field = '*', mixed $order = '', int $page = 1, int $listRows = 20): array
    {
        return self::where($where)->field($field)->order($order)->page($page, $listRows)->select()->toArray();
    }

    /**
     * @param array $where
     * @param string $field
     * @param mixed $order
     * @param mixed $with
     * @param int $page
     * @param int $listRows
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    final public static function getListByWith(array $where, string $field = '*', mixed $order = '', mixed $with = '', int $page = 1, int $listRows = 20): array
    {
        return self::where($where)->with($with)->field($field)->order($order)->page($page, $listRows)->select()->toArray();
    }

    /**
     * @param array $where
     * @param string $field
     * @param string $key
     * @param mixed $order
     * @param int $page
     * @param int $listRows
     * @return array
     */
    final public static function getColumn(array $where, string $field = '*', string $key = '', mixed $order = '', int $page = 1, int $listRows = 20, int $expire = 120): array
    {
        return self::where($where)->order($order)->page($page, $listRows)->column($field, $key);
    }

    /**
     * @param array $where
     * @param array $data
     * @return mixed
     * @throws DbException
     */
    final public static function updateDataCache(array $where, array $data): mixed
    {
        Cache::instance()->tag('model_' . self::getTableName())->clear();
        $data['u_time'] = date('Y-m-d H:i:s');
        return self::strict(false)->where($where)->update($data);
    }

    /**
     * @param array $data
     * @return int|string
     */
    final public static function insertDataCache(array $data): int|string
    {
        Cache::instance()->tag('model_' . self::getTableName())->clear();
        $data['c_time'] = date('Y-m-d H:i:s');
        return (new self())->strict(false)->insertGetId($data);
    }

    /**
     * @return string
     */
    final public static function getSql(): string
    {
        return (new self())->getLastSql();
    }
}