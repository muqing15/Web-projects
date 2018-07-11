package cn.video.service;

import EnvSiteTest.BaseTest;
import cn.video.pojo.User;
import cn.video.pojo.Video;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 19:26 2018/7/7
 * @Description:
 */

public class UserServiceTest  extends BaseTest {
    @Autowired
    private UserService userService;

    @Test
    public void t1() {
        User u = new User();
        u.setPhone("15771711308");
        u.setPassword("12312123121312");

        int i = userService.insertUser(u);
        System.out.println(i);

    }

    @Test
    public void test1() {
        User user = userService.selectById(1);
        System.out.println(user);

    }

    @Test
    public void test3() {
        User user = userService.selectByName("zhangsan");
        System.out.println(user);

    }

    @Test
    public void test4() {
        List<Video> videos = userService.getUserCollectionVideos(1);
        for (Video video : videos) {
            System.out.println(video);
        }
    }

    @Test
    public void test5() {
        List<Video> videos = userService.selectUploadedVideo(1);
        for (Video video : videos) {
            System.out.println(video);
        }
    }

}