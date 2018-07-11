package cn.video.controller;

import cn.video.constants.UserConstant;
import cn.video.pojo.Comment;
import cn.video.pojo.CommentRes;
import cn.video.pojo.User;
import cn.video.service.CommentService;
import cn.video.utils.ServerRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 10:38 2018/6/17
 * @Description: 用户评论
 */

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "comment", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public CommentRes getComments(@RequestParam(value = "content", required = true) String content,
                                 @RequestParam(value = "videoid", required = true) String videoid, HttpSession session) {

        System.out.println(content);
        System.out.println(videoid);
        System.out.println("-------------------------------");
        User sessionUser = (User) session.getAttribute(UserConstant.CURRENT_USER);
       /* if (sessionUser == null) {
            return new CommentRes("-1", "");
        }*/
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setVideoId(Integer.valueOf(videoid));
        comment.setUserId(sessionUser.getId());
        comment.setDate(new Date());
        int count = -1;
        try {
            count = commentService.insertComment(comment);
        } catch (Exception e) {
            e.printStackTrace();
        }

        CommentRes commentRes = new CommentRes();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        commentRes.setDate(sdf.format(new Date()));
        commentRes.setUser_head(sessionUser.getHead_picture());
        commentRes.setUser_name(sessionUser.getName());
        return commentRes;
    }
}
