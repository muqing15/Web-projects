package cn.video.service;

import cn.video.mapper.ColumnMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 18:00 2018/7/7
 * @Description:
 */

@Service
public class ColumnService {

    @Autowired
    private ColumnMapper columnMapper;

    /**
     * @param id 分类id
     */
    public String slectNameByid(Integer id) {
        return columnMapper.slectNameByid(id);
    }
}
