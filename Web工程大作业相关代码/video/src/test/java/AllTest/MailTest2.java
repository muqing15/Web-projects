package AllTest;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailTest2 {
    public static void main(String[] args) {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.163.com");//指定用来发送Email的邮件服务器主机名
        mailSender.setPort(25);//默认端口，标准的SMTP端口
        mailSender.setUsername("13032988146@163.com");//用户名
        mailSender.setPassword("1478963250whf");//密码
//        return mailSender;
        SimpleMailMessage message = new SimpleMailMessage();//消息构造器
        message.setFrom("13032988146@163.com");//发件人
        message.setTo("675019392@qq.com");//收件人
        message.setSubject("Spring Email Test");//主题
        message.setText("hello world!!");//正文
        mailSender.send(message);
        System.out.println("邮件发送完毕");
    }
}
