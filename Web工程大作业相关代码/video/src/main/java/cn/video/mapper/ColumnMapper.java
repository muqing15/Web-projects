package cn.video.mapper;

import cn.video.pojo.Video;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 18:00 2018/7/7
 * @Description:
 */

@Mapper
public interface ColumnMapper {

    /**
     * @param id 分类id
     * @return
     */
    @Select("select  name  from column_type where id = #{id}")
    String slectNameByid(Integer id);


}
