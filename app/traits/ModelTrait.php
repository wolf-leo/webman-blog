<?php
declare (strict_types = 1);

namespace app\traits;

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
     * @param  array   $where
     * @param  string  $field
     * @param  int     $expire
     * @return array
     */
    final public static function getOne(array $where, string $field = '', int $expire = 1800): array
    {
        return self::where($where)->field($field)->cache(true, $expire, 'model_' . self::getTableName())->findOrEmpty()->toArray();
    }

    /**
     * @param  array   $where
     * @param  string  $field
     * @param  int     $expire
     * @param  null    $default
     * @return mixed
     */
    final public static function getField(array $where, string $field = '*', int $expire = 1800, $default = null)
    {
        $value = self::where($where)->cache(true, $expire, 'model_' . self::getTableName())->value($field, $default);
        return $value ?: 0;
    }

    /**
     * @param  array   $where
     * @param  string  $field
     * @param  mixed   $order
     * @param  int     $expire
     * @param  null    $default
     * @return mixed
     */
    final public static function getFieldByOrder(array $where, string $field = '*', $order = '', int $expire = 1800, $default = null)
    {
        $value = self::where($where)->order($order)->cache(true, $expire, 'model_' . self::getTableName())->value($field, $default);
        return $value ?: 0;
    }

    /**
     * @param  array  $where
     * @param  int    $expire
     * @return int
     */
    public static function getCount(array $where, int $expire = 1800): int
    {
        return self::where($where)->cache(true, $expire, 'model_' . self::getTableName())->count();
    }

    /**
     * @param  array   $where
     * @param  string  $field
     * @param  mixed   $order
     * @param  int     $page
     * @param  int     $listRows
     * @param  int     $expire
     * @return array
     */
    final public static function getList(array $where, string $field = '*', $order = '', int $page = 1, int $listRows = 20, int $expire = 1800)
    {
        return self::where($where)->field($field)->order($order)->page($page, $listRows)->cache(true, $expire, 'model_' . self::getTableName())->select()->toArray();
    }

    /**
     * @param  array   $where
     * @param  string  $field
     * @param  mixed   $order
     * @param  mixed   $with
     * @param  int     $page
     * @param  int     $listRows
     * @param  int     $expire
     * @return array
     */
    final public static function getListByWith(array $where, string $field = '*', $order = '', $with = '', int $page = 1, int $listRows = 20, int $expire = 1800): array
    {
        return self::where($where)->with($with)->field($field)->order($order)->page($page, $listRows)->cache(true, $expire, 'model_' . self::getTableName())->select()->toArray();
    }

    /**
     * @param  array   $where
     * @param  string  $field
     * @param  string  $key
     * @param  mixed   $order
     * @param  int     $page
     * @param  int     $listRows
     * @param  int     $expire
     * @return array
     */
    final public static function getColumn(array $where, string $field = '*', string $key = '', $order = '', int $page = 1, int $listRows = 20, int $expire = 120): array
    {
        return self::where($where)->order($order)->page($page, $listRows)->cache(true, $expire, 'model_' . self::getTableName())->column($field, $key);
    }

    /**
     * @param  array  $where
     * @param  array  $data
     * @return mixed
     */
    final public static function updateDataCache(array $where, array $data)
    {
        Cache::instance()->tag('model_' . self::getTableName())->clear();
        $data['u_time'] = date('Y-m-d H:i:s');
        return self::strict(false)->where($where)->update($data);
    }

    /**
     * @param  array  $data
     * @return int|string
     */
    final public static function insertDataCache(array $data)
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