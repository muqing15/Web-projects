package cn.video.controller;

import cn.video.constants.RegularExpression;
import cn.video.constants.SMSConstant;
import cn.video.constants.UserConstant;
import cn.video.pojo.User;
import cn.video.pojo.Video;
import cn.video.service.UserService;
import cn.video.utils.ServerRes;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 23:19 2018/7/7
 * @Description:
 */

@Controller
public class UserController {

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/center")
    public String userCenter(@RequestParam(defaultValue = "-1", required = false) Integer userId, Model model, HttpSession session) {

            /*model.addAttribute("show_user_id", userId);
            User user = (User) session.getAttribute(UserConstant.CURRENT_USER);
            user.getId()==userId ?*/
        session.setAttribute("for_id", userId);
        System.out.println(userId);

            return "center";
    }


    /**
     * 用户注册 @param phone 手机号@param password 密码@param verify_password 确认密码@param smsCode 短信验证码
     */
    @RequestMapping(value = "register", method = {RequestMethod.GET, RequestMethod.POST})
    public String register(@RequestParam(required = false) String phone,
                           @RequestParam(required = false) String email,
                           @RequestParam(required = true) String name,
                           @RequestParam(required = true) String password,
                           @RequestParam(required = true) String verify_password,
                           @RequestParam(required = false) String signature,
                          /* @RequestParam(required = false) String smsCode,*/
                           Model model,
                           HttpSession session) {
        logger.info("用户登陆" + phone);

        System.out.println(name);

        if (StringUtils.isEmpty(phone) || StringUtils.isEmpty(password) || StringUtils.isEmpty(verify_password)
                || StringUtils.isEmpty(phone) ) {
            //就是验证失败了
            model.addAttribute("errorMessage", "用户名或者密码或验证码不能为空");
            return "register";
        }
        //手机号的正则表达式验证
        if (!isMobile(phone)) {
            model.addAttribute("errorMessage", "手机号格式错误");
            return "register";
        }
        //判断该用户不存在
        User u = userService.selectByPhone(phone);
        if (u != null) {
            model.addAttribute("errorMessage", "该用户已经存在");
            return "register";
        }
        if (!StringUtils.equals(password, verify_password)) {
            model.addAttribute("errorMessage", "两次密码不一致");
            return "register";
        }
        if (name.length() > 50) {
            return "register";
        }

        //todo:判断smsCode与session中的一致与否
        User user = new User();
        user.setHead_picture(UserConstant.User_Head_Picture);
        user.setName(name);
        String md5Passwd = DigestUtils.md5DigestAsHex(password.getBytes());
        user.setPassword(md5Passwd);
        user.setPhone(phone);
        String sms_code = (String) session.getAttribute(SMSConstant.SMS_CODE);

        int c = 0;
        try {
            c = userService.insertUser(user);
        } catch (Exception e) {
            logger.error("数据库插入数据失败" + e);
        }
        if (c != 1) {
            logger.error("数据库插入数据失败");
            throw new RuntimeException("数据库插入数据失败");
        }
        //然后要放到session中  重新查询 放到session中
        User user1 = userService.selectByName(user.getName());
        session.setAttribute(UserConstant.CURRENT_USER, user1);
        return "center";
    }

    @RequestMapping(value = "login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(@RequestParam(required = true) String name,
                        @RequestParam(required = true) String password,
                        Model model,
                        HttpSession session) {
        User user = userService.selectByName(name);
        //如果没该用户
        if (user == null) {
            model.addAttribute("errorMessage", "该用户名不存在");
            return "login";
        }
        //如果密码不一致
        String rawPasswdMd5 = user.getPassword();
        String passwd = DigestUtils.md5DigestAsHex(password.getBytes());

        if (!StringUtils.equals(rawPasswdMd5, passwd)) {
            model.addAttribute("errorMessage", "密码错误");
            return "login";
        }

        session.setAttribute(UserConstant.CURRENT_USER, user);
        return "center";
    }


  /*  @RequestMapping(value = "verify", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String login(HttpSession session) {
        String code = (String) session.getAttribute(SMSConstant.SMS_CODE);
//        ServerRes sr = new ServerRes();
        return "";
    }*/

    @RequestMapping(value = "my_collection", method = {RequestMethod.GET, RequestMethod.POST})
    public String my_collection(HttpSession session, Model model,@RequestParam(required = false,defaultValue = "-1")  Integer userId) {

        User sessionUser = (User) session.getAttribute(UserConstant.CURRENT_USER);
        System.out.println(sessionUser.getId());
        Integer targetId = userId == -1 ? sessionUser.getId() : userId;
        List<Video> collectionVideo = userService.getUserCollectionVideos(targetId);
        model.addAttribute("my_collection_video", collectionVideo);
        for (Video video : collectionVideo) {
            System.out.println(video);
        }
        return "user_collection";
    }


    @RequestMapping(value = "my_upload", method = {RequestMethod.GET, RequestMethod.POST})
    public String my_upload(HttpSession session, Model model,@RequestParam(required = false,defaultValue = "-1")  Integer userId) {
        User sessionUser = (User) session.getAttribute(UserConstant.CURRENT_USER);
        Integer targetId = userId == -1 ? sessionUser.getId() : userId;
        List<Video> videos = userService.selectUploadedVideo(targetId);
        model.addAttribute("my_upload_video", videos);
        return "user_upload";
    }


    /**
     * 这里应该关注的是用户
     *
     * @param session
     * @param model
     */
    @RequestMapping(value = "my_attention", method = {RequestMethod.GET, RequestMethod.POST})
    public String my_attention(HttpSession session, Model model,@RequestParam(required = false,defaultValue = "-1")  Integer userId) {
        //todo   注意这里是 关注的用户  这里就应该是 用户的头像
        User sessionUser = (User) session.getAttribute(UserConstant.CURRENT_USER);
        Integer targetId = userId == -1 ? sessionUser.getId() : userId;
        System.out.println("----------------" + targetId);

        List<User> users = userService.selectFollowedUser(targetId);

        model.addAttribute("followed_user", users);
        return "user_attention";
    }

    @RequestMapping(value = "to_login", method = {RequestMethod.GET, RequestMethod.POST})
    public String to_login() {
        return "login";
    }


    @RequestMapping(value = "to_register", method = {RequestMethod.GET, RequestMethod.POST})
    public String to_register() {
        return "register";
    }

    @RequestMapping(value = "to_mail_register", method = {RequestMethod.GET, RequestMethod.POST})
    public String mail_register() {
        return "mail_registerr";
    }

    @RequestMapping(value = "to_phone_register", method = {RequestMethod.GET, RequestMethod.POST})
    public String to_phone_register() {
        return "register";
    }

    /**
     * 校验手机号
     */
    public static boolean isMobile(String mobile) {
        return Pattern.matches(RegularExpression.REGEX_MOBILE, mobile);
    }
}
