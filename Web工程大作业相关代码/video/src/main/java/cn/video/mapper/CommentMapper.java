package cn.video.mapper;

import cn.video.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:29 2018/6/17
 * @Description:
 */

public interface CommentMapper {
    /**
     * 根据视频查询所有的评论
     * 默认pageSize为 10
     */
    @Select("select *\n" +
            "from comments\n" +
            "WHERE videoId = #{videoId} \n" +
            "LIMIT #{page},10 ")
    List<Comment> selectAllByVideoId(@Param("videoId") Integer videoId, @Param("page")Integer page);

    int insertComment(Comment comment);
}
