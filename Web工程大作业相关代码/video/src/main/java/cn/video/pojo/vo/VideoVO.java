package cn.video.pojo.vo;

import cn.video.pojo.Video;

import java.util.Date;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 19:57 2018/7/7
 * @Description:
 */

public class VideoVO extends Video {

    private String dateStr;
    private String creatorName;


    public VideoVO() {
    }

    public VideoVO(int id, String vname, String url, String picture, int type, Date createDate, int created_by, int playbackTimes, String dateStr) {
        super(id, vname, url, picture, type, createDate, created_by, playbackTimes);
        this.dateStr = dateStr;
    }

    public VideoVO(int id, String vname, String url, String picture, int type, Date createDate, int created_by, int playbackTimes, String dateStr, String creatorName) {
        super(id, vname, url, picture, type, createDate, created_by, playbackTimes);
        this.dateStr = dateStr;
        this.creatorName = creatorName;
    }

    public String getDateStr() {
        return dateStr;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

}
