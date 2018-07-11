package cn.video.pojo;


import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.Date;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:59 2018/6/17
 * @Description:
 */


public class Video {
    /**
     * 视频id
     *
     * 视频名称
     *视频url
     * 视频主图
     * 足球是1 篮球是0
     */
    private int id;
    private String vname;
    private String url;
    private String picture;
    private int type;
    private Date createDate;
    private int created_by;
    private int playbackTimes;




    public Video() {
    }

    public Video(int id, String vname, String url, String picture, int type, Date createDate, int created_by, int playbackTimes) {
        this.id = id;
        this.vname = vname;
        this.url = url;
        this.picture = picture;
        this.type = type;
        this.createDate = createDate;
        this.created_by = created_by;
        this.playbackTimes = playbackTimes;
    }


    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getPlaybackTimes() {
        return playbackTimes;
    }

    public void setPlaybackTimes(int playbackTimes) {
        this.playbackTimes = playbackTimes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("vname", vname)
                .append("url", url)
                .append("picture", picture)
                .append("type", type)
                .append("createDate", createDate)
                .append("created_by", created_by)
                .append("playbackTimes", playbackTimes)
                .toString();
    }
}
