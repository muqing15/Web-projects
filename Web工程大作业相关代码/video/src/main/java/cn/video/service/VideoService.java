package cn.video.service;

import cn.video.mapper.VideoMapper;
import cn.video.pojo.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 21:16 2018/6/17
 * @Description:
 */

@Service
public class VideoService {

    @Autowired
    private VideoMapper videoMapper;

    /**
     *分页查询所有的video
     * @param startPage 分页起始页
     * @param pageSize 大小
     * @param type     类型
     */
    public  List<Video> selectPagedAllVideosByType(Integer startPage, Integer pageSize, Integer type) {
        return videoMapper.selectAllVideosPaged(startPage, pageSize,type);
    }

    /**
     * 根据id查询信息
     */
    public Video getVideoById(Integer id) {

        return videoMapper.getVideoById(id);
    }

    /**
     * 根据关键字查询
     */
    public List<Video> searchVideoByKW(String kw) {
        return videoMapper.searchVideoByKW(kw);
    }
}
