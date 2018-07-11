package cn.video.utils;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 19:37 2018/7/7
 * @Description:
 */

public class JedisUtilTest {

    @Test
    public void test1() {
//         JedisUtil.set("123_asd", "1");
//        JedisUtil.incr("123_asd");
        String asdas = JedisUtil.get("123_asd");
        System.out.println(asdas);
//        JedisUtil.set("playback_" + 1, "1");
//        JedisUtil.set("playback_" + 2, "1");
//        JedisUtil.set("playback_" + 3, "1");
    }

}