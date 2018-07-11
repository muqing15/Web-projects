package cn.video.utils;

import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 22:25 2018/6/18
 * @Description:
 */

public class JedisUtil {


    private static JedisPool jedisPool = null;
    private static int MAX_ACTIVE = 1024;
    private static int MAX_IDLE = 200;

    private JedisUtil() {

    }

    /*
     redis.host
     redis.port
     */
    static {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxIdle(MAX_IDLE);
        jedisPoolConfig.setMaxTotal(MAX_ACTIVE);
        String host = PropertyUtil.getProperty("redis.host");
        int port = Integer.valueOf(PropertyUtil.getProperty("redis.port"));
        jedisPool = new JedisPool(jedisPoolConfig, host, port);

    }

    /**
     * 从jedis连接池中获取获取jedis对象
     */
    private static Jedis getJedis() {
        return jedisPool.getResource();
    }


    public static String get(String key) {
        Jedis util = getJedis();
        String value = null;
        try {
            value = util.get(key);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            returnJedis(util);
        }
        return value;
    }

    public static Long incr(String key) {
        Jedis util = getJedis();
        try {
            return util.incr(key);
        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            returnJedis(util);
        }
        return 0L;
    }

    public static String set(String key, String value) {
        Jedis util = getJedis();
        try {
            return util.set(key, value);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            returnJedis(util);
        }
        return "0";
    }
    /**
     * 向Set添加一条记
     */
    public static long sadd(String key, String member) {
        Jedis jedis = getJedis();
        long s = jedis.sadd(key, member);
        returnJedis(jedis);
        return s;
    }

    /**
     * 获取给定key中元素个数
     */
    public static long scard(String key) {
        Jedis sjedis = getJedis();
        long len = sjedis.scard(key);
        returnJedis(sjedis);
        return len;
    }

    public static long smove(String srckey, String dstkey, String member) {
        Jedis jedis = getJedis();
        long s = jedis.smove(srckey, dstkey, member);
        returnJedis(jedis);
        return s;
    }

    /**
     * 添加sorted set
     */
    public static void zadd(String key, String value, double score) {
        Jedis jedis = getJedis();
        jedis.zadd(key, score, value);
        returnJedis(jedis);
    }

    /**
     * 返回指定位置的集合元素,0为第一个元素，-1为最后一个元素
     */
    public static Set<String> zrange(String key, int start, int end) {
        Jedis jedis = getJedis();
        Set<String> set = jedis.zrange(key, start, end);
        returnJedis(jedis);
        return set;
    }

    /**
     * 获取给定区间的元素，原始按照权重由高到低排序
     */
    public static Set<String> zrevrange(String key, int start, int end) {
        Jedis jedis = getJedis();
        Set<String> set = jedis.zrevrange(key, start, end);
        returnJedis(jedis);
        return set;
    }

    /**
     * 删除
     */
    public static long del(String key) {
        Jedis jedis = getJedis();
        long s = jedis.del(key);
        returnJedis(jedis);
        return s;
    }

    /**
     * 从集合中删除成员
     */
    public static long zrem(String key, String... value) {
        Jedis jedis = getJedis();
        long s = jedis.zrem(key, value);
        returnJedis(jedis);
        return s;
    }


    public static void returnResource(Jedis jedis, boolean isBroken) {
        if (jedis == null) {
            return;
        }
        if (isBroken) {
            jedisPool.returnBrokenResource(jedis);
        } else {
            jedisPool.returnResource(jedis);
        }
    }

    /**
     * 获取总数量
     */
    public static long zcard(String key) {
        Jedis jedis = getJedis();
        long count = jedis.zcard(key);
        returnJedis(jedis);
        return count;
    }

    /**
     * 是否存在KEY
     */
    public static boolean exists(String key) {
        Jedis jedis = getJedis();
        boolean exists = jedis.exists(key);
        returnJedis(jedis);
        return exists;
    }

    /**
     * 设置失效时间
     */
    public static void expire(String key, int seconds) {
        Jedis jedis = getJedis();
        jedis.expire(key, seconds);
        returnJedis(jedis);
    }


    /**
     * 回收jedis(放到finally中)
     */
    private static void returnJedis(Jedis jedis) {
        if (null != jedis && null != jedisPool) {
            jedisPool.returnResource(jedis);
        }
    }
}
