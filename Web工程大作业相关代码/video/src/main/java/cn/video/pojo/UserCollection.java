package cn.video.pojo;

public class UserCollection {

    private Integer videoId;
    private Integer userId;

    public UserCollection(Integer videoId, Integer userId) {
        this.videoId = videoId;
        this.userId = userId;
    }

    public UserCollection() {
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
