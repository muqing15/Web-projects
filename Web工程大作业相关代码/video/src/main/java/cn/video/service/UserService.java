package cn.video.service;

import cn.video.mapper.UserCollectionMapper;
import cn.video.mapper.UserMapper;
import cn.video.pojo.User;
import cn.video.pojo.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:44 2018/6/15
 * @Description:
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserCollectionMapper collectionMapper;

    public List<User> getAllUser() {
        return userMapper.queryAll();
    }

    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }
    public User selectById(Integer id){
        return userMapper.selectById(id);
    }
    public User selectByPhone(String phone) {
        return userMapper.selectByPhone(phone);
    }

    public User selectByName(String name) {
        return userMapper.selectByName(name);
    }

    public List<Video> getUserCollectionVideos(Integer userId) {
        return collectionMapper.selectCollectionVideos(userId);
    }

    public List<Video> selectUploadedVideo(Integer userId) {
        return userMapper.selectUploadedVideo(userId);
    }

    public List<User> selectFollowedUser(Integer userId){
        return userMapper.selectFollowedUser(userId);
    }

}

