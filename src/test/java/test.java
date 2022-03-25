
import com.li.hexoadmin.pojo.Article;
import com.li.hexoadmin.pojo.User;
import com.li.hexoadmin.service.ArticleService;
import com.li.hexoadmin.service.UserService;
import com.li.hexoadmin.service.UserServiceImpl;
import com.li.hexoadmin.utils.operateFile;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.UUID;

public class test {


    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        ArticleService articleServiceImpl = context.getBean("articleServiceImpl", ArticleService.class);
        String uuid= UUID.randomUUID().toString();
        System.out.println(uuid);

        for (Article article : articleServiceImpl.queryAllArticle()) {
            operateFile.operate("E://docs",article);
        }
    }
@Test
    public void test2(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userSerciceImpl = context.getBean("userServiceImpl", UserService.class);
        if(userSerciceImpl.checkUser("admin", "1234569")==null)
            System.out.println("未找到");
        else
            System.out.println(userSerciceImpl.checkUser("admin", "123456789"));

}


}
