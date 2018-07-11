package cn.video.pojo;


import java.util.Date;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:59 2018/6/17
 * @Description:
 */

public class Comment {
    /**
     * id
     * 评论的用户id
     * 视频名称
     * 内容
     * 日期
     */
    private Integer id;
    private Integer userId;
    private Integer videoId;
    private String  content;
    private Date date;

    public Comment(Integer userId, Integer videoId, String content, Date date) {
        this.userId = userId;
        this.videoId = videoId;
        this.content = content;
        this.date = date;
    }

    public Comment() {
    }


    @Override
    public String toString() {
        return
                "id=" + id +
                        ", userId=" + userId +
                        ", videoId=" + videoId +
                        ", content='" + content + '\'' +
                        ", date='" + date + '\'';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
