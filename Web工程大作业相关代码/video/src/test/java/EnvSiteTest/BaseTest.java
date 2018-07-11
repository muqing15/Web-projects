package EnvSiteTest;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:51 2018/6/15
 * @Description:
 */

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试基类
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"classpath*:spring/application*.xml",})

public abstract class BaseTest {


}
