package AllTest;

import EnvSiteTest.BaseTest;
import cn.video.pojo.User;
import cn.video.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:50 2018/6/15
 * @Description:
 */

public class MybatisTest extends BaseTest {
    /**
     * 环境成功与否测试
     */
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
