package cn.video.controller;

import cn.video.constants.RegularExpression;
import cn.video.constants.UserConstant;
import cn.video.pojo.User;
import cn.video.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.regex.Pattern;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:06 2018/6/15
 * @Description:
 */

@Controller
public class IndexController {
    private Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Autowired
    private UserService userService;


    @RequestMapping(value = {"/", "index"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String on() {
        logger.info("用户访问");
        return "index";
    }



//    @RequestMapping(value = "/mainPage", method = {RequestMethod.GET,RequestMethod.POST})
//    public String mainPage() {
//        return "mainpage";
//    }



}
