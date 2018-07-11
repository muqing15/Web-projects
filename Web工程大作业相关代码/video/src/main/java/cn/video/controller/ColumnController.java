package cn.video.controller;

import cn.video.pojo.Video;
import cn.video.pojo.vo.VideoVO;
import cn.video.service.UserService;
import cn.video.service.VideoService;
import cn.video.utils.JedisUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 15:52 2018/7/7
 * @Description:
 *              分栏目进行接收
 */

@Controller
public class ColumnController {

    @Autowired
    private VideoService videoService;

    @Autowired
    private  UserService userService;

    private static String PLAYBACK_TIMES = "playback_";
    private  static SimpleDateFormat sdf = new SimpleDateFormat("yyyy:mm:dd");

    @RequestMapping(value = "/column")
    public String getColumn(@RequestParam(value = "startPage", defaultValue = "0") String startPage,
                            @RequestParam(value = "type",required = true) String type,
                            Model model) {
        //根据分组查询
        //默认查询个数为 10
        List<Video> videos = videoService.selectPagedAllVideosByType(Integer.valueOf(startPage), 10, Integer.valueOf(type));
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





}
