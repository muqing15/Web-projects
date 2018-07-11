package cn.video.controller;

import cn.video.constants.UserConstant;
import cn.video.mapper.UserCollectionMapper;
import cn.video.pojo.Comment;
import cn.video.pojo.User;
import cn.video.pojo.UserCollection;
import cn.video.pojo.Video;
import cn.video.pojo.vo.CommentVO;
import cn.video.pojo.vo.VideoVO;
import cn.video.service.CommentService;
import cn.video.service.UserService;
import cn.video.service.VideoService;
import cn.video.utils.JedisUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * @Author: xiaoqiZh
 * @Date: Created in 15:59 2018/7/7
 * @Description:
 *               播放具体的视频
 */

@Controller
public class VideosController {

    @Autowired
    public VideoService videoService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserCollectionMapper userCollectionMapper;

    private  static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
    private static String PLAYBACK_TIMES = "playback";

    @RequestMapping(value = "/video")
    public String getColumn(@RequestParam(value = "videoid") String videoId,
                            @RequestParam(value = "page", required = false, defaultValue = "0") String page,
                            Model model) {

        Video video = videoService.getVideoById(Integer.valueOf(videoId));
        System.out.println(videoId);
        System.out.println(video.getUrl());
        int cur =JedisUtil.incr(PLAYBACK_TIMES + videoId).intValue();
        video.setPlaybackTimes(cur);
        model.addAttribute("video", video);
        List<CommentVO> commentVOS = new ArrayList<>();
        List<Comment> comments = commentService.selectAllByVideoId(Integer.valueOf(videoId), Integer.valueOf(page));
        for (Comment comment : comments) {
            Integer userId = comment.getUserId();
            User user = userService.selectById(userId);
            String formatDate = sdf.format(comment.getDate());
//            String formatDate = comment.getDate().toString();
            CommentVO commentVO = new CommentVO();
            commentVO.setUserHeadPic(user.getHead_picture());
            commentVO.setUserName(user.getName());
            commentVO.setDateStr(formatDate);
            BeanUtils.copyProperties(comment, commentVO);
            commentVOS.add(commentVO);
        }
        model.addAttribute("comments", commentVOS);

        String s = JedisUtil.get(videoId + "_like_count");
        System.out.println("------------------------------------");
        System.out.println(s);
        if (s == null) {
            model.addAttribute("likeCounts", 0);
        } else {
            model.addAttribute("likeCounts", Integer.valueOf(s));
        }
        return "single";
    }


    @RequestMapping(value = "search")
    public String  search(@RequestParam(value = "kw") String kw, Model model) {
        System.out.println(kw);
        List<Video> videos = videoService.searchVideoByKW(kw);
        //进行覆盖即可
        List<VideoVO> videoVOList = new ArrayList<>();
        for (Video video : videos) {
            VideoVO vo = new VideoVO();
            BeanUtils.copyProperties(video, vo);
            Date createDate = video.getCreateDate();
            String format = sdf.format(createDate);
            vo.setDateStr(format);
            Optional<String> s = Optional.ofNullable(JedisUtil.get(PLAYBACK_TIMES + video.getId()));
            String name = userService.selectById(vo.getCreated_by()).getName();
            System.out.println(name);
            vo.setCreatorName(name);
            /*
            如果如果为null 那么就返回0次
             */
            vo.setPlaybackTimes(Integer.valueOf(s.orElse("0")));
            videoVOList.add(vo);
        }
        model.addAttribute("videos", videoVOList);
        return "gallery";
    }


    @RequestMapping(value = "like")
    public void  likeVideo(@RequestParam(value = "videoid", required = true) Integer videoId) {
        String v = String.valueOf(videoId);
        System.out.println(videoId+"***********");
        String key = v + "_like_count";
        boolean exists = JedisUtil.exists(key);
        if (!exists) {
            JedisUtil.set(key, "1");
        } else {
            JedisUtil.incr(key);
        }
    }


    /**
     * 收藏collection
     * @param videoId 视频id
     */
    @RequestMapping(value = "collection")
    public void follow(@RequestParam(value = "videoId") Integer videoId, HttpSession session) {
        System.out.println(videoId+"***********");
        UserCollection userCollection = new UserCollection();
        userCollection.setVideoId(videoId);
        User user = (User) session.getAttribute(UserConstant.CURRENT_USER);
        userCollection.setUserId(user.getId());
        userCollectionMapper.addCollection(userCollection);
    }



}
