package cn.video.mapper;

import cn.video.pojo.UserCollection;
import cn.video.pojo.Video;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserCollectionMapper {

    @Select("SELECT * from videos \n" +
            "WHERE videos.id in \n" +
            "(\n" +
            "SELECT user_collection.video_id\n" +
            "FROM  user_collection\n" +
            "WHERE user_id = #{userId}\n" +
            ") ")
    List<Video> selectCollectionVideos(Integer userId);

    @Insert("insert into user_collection(video_id,user_id) values(#{videoId},#{userId})")
    int addCollection(UserCollection userCollection);

}
