package cn.video.mapper;
import cn.video.pojo.User;
import cn.video.pojo.Video;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface  UserMapper {
    List<User> queryAll();

    Integer insertUser(User user);

    User selectByPhone(String phone);

    @Select("select * from users where id = #{id}")
    User selectById(Integer id);

    @Select("select * from users where name = #{name}")
    User selectByName(String name);


    @Select("SELECT * from videos\n" +
            "WHERE videos.id in(\n" +
            "SELECT  user_upload.video_id\t\n" +
            "FROM   user_upload\n" +
            "WHERE  user_id = #{userId} )")
    List<Video> selectUploadedVideo(Integer userId);


    @Select("SELECT * \n" +
            "from users\n" +
            "WHERE id IN (\n" +
            "SELECT  user_follewed.followed_id\n" +
            "FROM  user_follewed\n" +
            "WHERE  user_id = #{userId})")
    List<User> selectFollowedUser(Integer userId);

}
