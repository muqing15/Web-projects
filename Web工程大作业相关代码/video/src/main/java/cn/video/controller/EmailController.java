package cn.video.controller;

import cn.video.constants.SMSConstant;
import cn.video.utils.ServerRes;
import org.apache.commons.lang3.StringUtils;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 22:20 2018/6/18
 * @Description:
 */
@Controller
public class EmailController {
    /**
     * @Author: xiaoqiZh
     * @Date: Created in 12:18 2018/6/17
     * @Description:
     */

    /**
     * Host：邮箱服务器主机。
     * <p>
     * Port：端口号。
     * <p>
     * Username：发件方账户。
     * <p>
     * Password：密码，qq邮箱的话此处设置16位授权码，不是邮箱密码，切记！
     * <p>
     * mail.smtp.auth:认证机制开关，记得开启。
     * <p>
     * mail.smtp.starttls.enable：TLS通讯协议开关，连接qq的SMTP服务器，需使用此通讯协议。
     * <p>
     * mail.smtp.timeout ：连接超时时间，单位毫秒。
     * <p>
     * 发送文本消息用SimpleMailMessage类
     * <p>
     * 它的几个重要属性说明如下：
     * <p>
     * From发件方的账户，和Username的值相同
     * <p>
     * To收件方
     * <p>
     * Subject邮件主题
     * <p>
     * Text邮件内容
     */

    private static final String SUBJECT = "VIDEO";
    //todo:邮箱内容为html代码

    private static final String MSG = "";

    @RequestMapping(value = "send_mail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ServerRes simpleMailSend(@RequestParam("email") String email, HttpSession session) {
        //创建邮件发送服务器
        System.out.println(email);
        System.out.println("------------------------");
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.qq.com");
//      mailSender.setPort(465);
        mailSender.setUsername("675019392@qq.com");
        mailSender.setPassword("wrnjykvyzfiobebe");
        //加认证机制
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.auth", true);
        javaMailProperties.put("mail.smtp.starttls.enable", true);
        javaMailProperties.put("mail.smtp.timeout", 5000);
        mailSender.setJavaMailProperties(javaMailProperties);
        //创建邮件内容
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("675019392@qq.com");
        message.setTo(email);
        message.setSubject(SUBJECT);
        int four = getFour();
        message.setText(MSG+four);
        //发送邮件
        mailSender.send(message);
        session.setAttribute("email_code", String.valueOf(four));
        return null;
    }

    @RequestMapping(value = "verify_mail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ServerRes verify(@RequestParam("code") String code, HttpSession session) {
        String emial_code = (String) session.getAttribute(SMSConstant.SMS_CODE);
        if (!StringUtils.equals(emial_code, code)) {
            return  ServerRes.getCorrectData("1");
        } else {
            return  ServerRes.getCorrectData("0");
        }
    }
    public int getFour() {
        Random rand = new Random();
        return 1000 + rand.nextInt(9000);
    }

//        public static void main(String[] args) {
//            simpleMailSend("littlepandazeq@aliyun.com", "test", "我看看对不对");
//        }
    }


