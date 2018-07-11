package cn.video.utils;



/**
 * @Author: xiaoqiZh
 * @Date: Created in 16:08 2018/6/16
 * @Description:
 */

public class ServerRes<T> {
    /**
     * 0 代表正确
     * 1 代表出错
     */
    public String errorCode;
    /**
     * 错误信息
     */
    public String errorMessage;
    public T data;

    public ServerRes(String errorCode, String errorMessage, T data) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
        this.data = data;
    }

    public ServerRes(String errorCode, String errorMessage) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
        this.data = null;
    }

    public static ServerRes getCorrectData(String errorMessage) {
        return new ServerRes("0", errorMessage);
    }

    public static ServerRes getError(String errorMessage) {
        return new ServerRes("1", errorMessage);
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
