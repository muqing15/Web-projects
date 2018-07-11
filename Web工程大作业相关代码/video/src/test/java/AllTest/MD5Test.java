package AllTest;

import org.springframework.util.DigestUtils;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 17:47 2018/6/16
 * @Description:
 */

public class MD5Test {
    public static void main(String[] args) {
        String s = "123456";
        String s1 = DigestUtils.md5DigestAsHex(s.getBytes());
        System.out.println(s1);
        System.out.println("e10adc3949ba59abbe56e057f20f883e".equals(s1));
    }
}
