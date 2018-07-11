package cn.video.pojo;

public class CommentRes {

    private String date;
    private String user_head;
    private String user_name;


    public CommentRes(String date, String count) {
        this.date = date;
    }

    public CommentRes() {
    }

    public String getUser_head() {
        return user_head;
    }

    public void setUser_head(String user_head) {
        this.user_head = user_head;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
