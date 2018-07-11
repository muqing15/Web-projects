package cn.video.pojo.vo;

import cn.video.pojo.Comment;
import cn.video.pojo.User;

import java.util.Date;

public class CommentVO extends Comment {
    public String userHeadPic;
    public String userName;
    public String dateStr;
    public CommentVO(Integer userId, Integer videoId, String content, Date date, String userHeadPic) {
        super(userId, videoId, content, date);
        this.userHeadPic = userHeadPic;
    }

    public CommentVO() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getUserHeadPic() {
        return userHeadPic;
    }

    public void setUserHeadPic(String userHeadPic) {
        this.userHeadPic = userHeadPic;
    }
}
