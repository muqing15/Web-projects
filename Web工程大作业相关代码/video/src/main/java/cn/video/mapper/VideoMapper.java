package cn.video.mapper;

import cn.video.pojo.Video;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:16 2018/6/17
 * @Description:
 */

@Mapper
public interface VideoMapper {
    /**
     *  分页根据type查询所有的video
     *  按照类型
     */
    @Select(" select * from videos where type  = #{type}  limit #{startPage},#{pageSize};")
    List<Video> selectAllVideosPaged(@Param("startPage") int startPage, @Param("pageSize") int pageSize, @Param("type") Integer type);

    /**
     * 根据id查询video的所有信息
     */
    @Select("select * from  videos where id = #{id}")
    Video getVideoById(Integer id);


    /**
     * 根据关键字查询
     * @param kw 关键字
     */
    @Select("SELECT * \n" +
            "FROM videos\n" +
            "WHERE vname LIKE  CONCAT('%',#{kw},'%') ")
    List<Video> searchVideoByKW(String kw);
}
