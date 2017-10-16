import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;

@ContextConfiguration(locations = { "/log4j2.xml" })
public class MyTest {
    /*@Autowired
    private UserServiceImpl userService;*/
    @Test
    public void test1(){
        Logger logger = LogManager.getLogger("com.yunyang.pagehelper.controller.Login");
        logger.trace("trace level");
        logger.debug("debug level");
        logger.info("info level");
        logger.warn("warn level");
        logger.error("error level");
       /* Logger logger2 = LogManager.getLogger("mylog2");
        logger2.trace(" logger2 trace level");
        logger2.debug("logger2 debug level");
        logger2.info("logger2 info level");
        logger2.warn("logger2 warn level");
        logger2.error("logger2 error level");*/
       /* try {
            String a = userService.turnToMd5("123");
            System.out.println(a);
        } catch (Exception e) {
            e.printStackTrace();
        }*/
        /*User user =userService.getUserInfo("zhangsan","1b115d01a16bf363a8da2f588b3a0297");
        System.out.print(user.getAccount());*/
    }
}
