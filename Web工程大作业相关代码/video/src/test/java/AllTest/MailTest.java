package AllTest;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 12:18 2018/6/17
 * @Description:
 */

public class MailTest {
    /**
     * Host：邮箱服务器主机。
     *
     * Port：端口号。
     *
     * Username：发件方账户。
     *
     * Password：密码，qq邮箱的话此处设置16位授权码，不是邮箱密码，切记！
     *
     * mail.smtp.auth:认证机制开关，记得开启。
     *
     * mail.smtp.starttls.enable：TLS通讯协议开关，连接qq的SMTP服务器，需使用此通讯协议。
     *
     * mail.smtp.timeout ：连接超时时间，单位毫秒。
     *
     * 发送文本消息用SimpleMailMessage类
     *
     * 它的几个重要属性说明如下：
     *
     * From发件方的账户，和Username的值相同
     *
     * To收件方
     *
     * Subject邮件主题
     *
     * Text邮件内容
     */
    public  static  void simpleMailSend(String email,String subject,String msg) {
        //创建邮件发送服务器
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.qq.com");
//      mailSender.setPort(465);
        mailSender.setUsername("675019392@qq.com");
        mailSender.setPassword("wrnjykvyzfiobebe");
        //加认证机制
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.auth", true);
        javaMailProperties.put("mail.smtp.starttls.enable", true);
        javaMailProperties.put("mail.smtp.timeout", 10000);
        mailSender.setJavaMailProperties(javaMailProperties);
        //创建邮件内容
        SimpleMailMessage message=new SimpleMailMessage();
        message.setFrom("675019392@qq.com");
        message.setTo(email);
        message.setSubject(subject);
        message.setText(msg);
        //发送邮件
//        mailSender.send(message);
    }

    public static void main(String[] args) {
//        simpleMailSend("littlepandazeq@aliyun.com", "test", "asf");
        simpleMailSend("675019392@qq.com", "test", "zhangenqishinibaba");
    }
}
