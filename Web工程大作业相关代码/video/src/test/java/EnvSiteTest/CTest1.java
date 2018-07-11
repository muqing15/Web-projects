package EnvSiteTest;

import cn.video.pojo.User;
import cn.video.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 15:47 2018/6/17
 * @Description:
 */

public class CTest1 extends BaseTest {
    @Autowired
    private UserService userService;

    @Test
    public void test1() {
        List<User> allUser = userService.getAllUser();
        for (User user : allUser) {
            System.out.println(user);
        }
    }
}
