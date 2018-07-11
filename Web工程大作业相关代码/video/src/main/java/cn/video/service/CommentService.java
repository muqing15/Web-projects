package cn.video.service;

import cn.video.mapper.CommentMapper;
import cn.video.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:42 2018/6/17
 * @Description:
 */

@Service
public class CommentService {

    @Autowired
    private CommentMapper mapper;

    /**
     * 根据视频查询所有的评论
     * page 是从0 开始的
     */
    public List<Comment> selectAllByVideoId(Integer videoId, Integer page) {
        return mapper.selectAllByVideoId(videoId, page);
    }

    public int insertComment(Comment comment) {
        return  mapper.insertComment(comment);
    }
}
