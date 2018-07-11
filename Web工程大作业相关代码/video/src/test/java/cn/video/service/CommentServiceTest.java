package cn.video.service;

import EnvSiteTest.BaseTest;
import cn.video.controller.CommentController;
import cn.video.pojo.Comment;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class CommentServiceTest extends BaseTest {
    @Autowired
    private CommentService commentService;

    @Test
    public void comment() {
        List<Comment> comments = commentService.selectAllByVideoId(1, 0);
        for (Comment comment : comments) {
            System.out.println(comment);

        }
    }

    @Test
    public void test1() throws ParseException {
        Comment comment = new Comment();
        comment.setVideoId(1);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date parse = sdf.parse("2017-11-10");
        comment.setDate(new Date());
        comment.setUserId(1);
        comment.setContent("asdasdasd");
        int i = commentService.insertComment(comment);
        System.out.println(i);

    }


}