package cn.video.service;

import EnvSiteTest.BaseTest;
import cn.video.pojo.Video;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:44 2018/6/17
 * @Description:
 */

public class VideoServiceTest extends BaseTest {

    @Autowired
    private VideoService videoService;

    @Test
    public void t1() {

        List<Video> videos = videoService.selectPagedAllVideosByType(0, 2,1);
        System.out.println(videos.size());
        for (Video video : videos) {
            System.out.println(video);

        }
    }
    
    @Test
    public void r1(){
        System.out.println(videoService.getVideoById(1));

    }

    @Test
    public void test2() {
        List<Video> videos = videoService.selectPagedAllVideosByType(0, 10, 1);
        for (Video video : videos) {
            System.out.println(video);

        }
    }

    @Test
    public void test3() {
        List<Video> kk = videoService.searchVideoByKW("宝");
        for (Video video : kk) {
            System.out.println(video);

        }
    }
}