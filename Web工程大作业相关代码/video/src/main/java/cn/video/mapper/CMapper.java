package cn.video.mapper;

import cn.video.pojo.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:52 2018/6/17
 * @Description:
 */


@Mapper
public interface CMapper {

    @Select("select * from comments")
    List<Comment> selectAll();

    @Insert("insert into users(phone,password) values(#{phone},#{password})")
    int insert(@Param("phone") String phone, @Param("password") String password);
}
