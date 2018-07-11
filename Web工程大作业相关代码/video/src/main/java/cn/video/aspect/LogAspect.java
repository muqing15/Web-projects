package cn.video.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 22:02 2018/6/16
 * @Description:
 */
@Aspect
@Component
public class LogAspect {
    private Logger logger = LoggerFactory.getLogger(LogAspect.class);

    /*记录所有的 */
    @Before("execution(* cn.video.controller.*Controller.*(..))")
    public void before(JoinPoint point) {
        StringBuilder sb = new StringBuilder();
        //获取所有的参数
        for (Object arg : point.getArgs()) {
            sb.append(arg.toString() + "_");
        }
        //统计时间
        logger.info("begin time" + new Date());
        logger.info("visit args " + sb.toString());
    }

    @After("execution(* cn.video.controller.*Controller.*(..))")
    public void after(JoinPoint point) {
        logger.info("end time" + new Date());
        logger.info("leave ");
    }

}
