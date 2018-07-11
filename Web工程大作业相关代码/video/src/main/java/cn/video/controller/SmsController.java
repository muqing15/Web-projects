package cn.video.controller;

import cn.video.constants.SMSConstant;
import cn.video.utils.ServerRes;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 12:19 2018/6/16
 * @Description:
 */


@Controller
public class SmsController {
    private Logger logger = LoggerFactory.getLogger(SmsController.class);

    @RequestMapping(value = "sms_verify")
    @ResponseBody
    public ServerRes manageSMS(@RequestParam(required = true)String phone,HttpSession session) {

        String testUsername = "15771711308"; //在短信宝注册的用户名
        String testPassword = "zhang2995218"; //在短信宝注册的密码
//        String testPhone = "15771711308";
        String codeV = String.valueOf(getFour());
        String testContent = "【video】您的验证码是" + codeV +
                ",５分钟内有效。若非本人操作请忽略此消息。";
        // 注意测试时，也请带上公司简称或网站签名，发送正规内容短信。千万不要发送无意义的内容：例如 测一下、您好。否则可能会收不到
        String httpUrl = "http://api.smsbao.com/sms";
        StringBuffer httpArg = new StringBuffer();
        httpArg.append("u=").append(testUsername).append("&");
        httpArg.append("p=").append(md5(testPassword)).append("&");
        httpArg.append("m=").append(phone).append("&");
        httpArg.append("c=").append(encodeUrlString(testContent, "UTF-8"));

        String result = request(httpUrl, httpArg.toString());
        // 保存到session中
        //todo:把验证码改成随机的
        session.setAttribute(SMSConstant.SMS_CODE, codeV);
        logger.info("已经发送");
        logger.info(codeV);
        logger.info(result);
        System.out.println("已经发送");
        String codeAttribute = (String) session.getAttribute(SMSConstant.SMS_CODE);
        System.out.println(codeAttribute);
        System.out.println(result);
        if (result.equals("0")) {
            return ServerRes.getError("0");
        } else {
            return ServerRes.getError("1");
        }
    }


    @RequestMapping(value = "sms_2verify")
    @ResponseBody
    public ServerRes sms_2verify(@RequestParam(required = true)String code,HttpSession session) {
        String sms_codeTrue = (String) session.getAttribute(SMSConstant.SMS_CODE);
        if (!StringUtils.equals(sms_codeTrue, code)) {
            return  ServerRes.getCorrectData("1");
        } else {
            return  ServerRes.getCorrectData("0");
        }
    }
    /**
     *   产生[1000,9999]的随机数
     */
    public int getFour() {
        Random rand = new Random();
        return 1000 + rand.nextInt(9000);
    }
    public static String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?" + httpArg;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = reader.readLine();
            if (strRead != null) {
                sbf.append(strRead);
                while ((strRead = reader.readLine()) != null) {
                    sbf.append("\n");
                    sbf.append(strRead);
                }
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String md5(String plainText) {
        StringBuffer buf = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return buf.toString();
    }

    public static String encodeUrlString(String str, String charset) {
        String strret = null;
        if (str == null)
            return str;
        try {
            strret = java.net.URLEncoder.encode(str, charset);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return strret;
    }
}
