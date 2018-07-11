package AllTest;

import cn.video.utils.JedisUtil;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 19:56 2018/7/6
 * @Description:
 */

public class RedisUtilTest {
    public static void main(String[] args) {
        JedisUtil.sadd("test", "test1");
    }

}
