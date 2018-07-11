package cn.video.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 19:34 2018/7/6
 * @Description:
 */

public class PropertyUtil {

    private static Properties properties = null;

    static {
        InputStream inputStream = null;
        try {
            // 加载配置属性
            inputStream = PropertyUtil.class.getClassLoader().getResourceAsStream("properties/" + "redis.properties");
            properties = new Properties();
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getProperty(String key) {

        return properties.getProperty(key);
    }

    public static Properties getProperties() {
        return properties;
    }

/*
    for test
     */
//    public static void main(String[] args) {
//        String property = PropertyUtil.getProperty("redis.host");
//        System.out.println(property);
//    }
}
