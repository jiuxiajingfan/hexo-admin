package com.li.hexoadmin.controller;

import com.alibaba.fastjson.JSON;
import com.li.hexoadmin.pojo.Article;
import com.li.hexoadmin.service.ArticleService;
import com.li.hexoadmin.service.UserService;
import com.li.hexoadmin.utils.operateFile;
import com.li.hexoadmin.utils.address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class ArticleController {

    @Autowired
    @Qualifier("articleServiceImpl")
    private ArticleService articleService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService user;

    @RequestMapping("/tologin")
    public String toLogin(){
        return "Login";
    }

    @RequestMapping("login")
    @ResponseBody
    public String login(String Username, String UserPWD, HttpSession session){
        String msg="";
        if(user.checkUser(Username,UserPWD)==null) {
            msg = "error";
        }else {
            session.setAttribute("userInfo",Username);
            msg="right";
        }
        return JSON.toJSONString(msg);
    }

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/toqueryall")
    @ResponseBody
    public String toqueryall(){
        List<Article> articles = articleService.queryAllArticle();
        return JSON.toJSONString(articles);
    }

    @RequestMapping("/allarticles")
    public String allarticles(Model model){
        List<Article> articles = articleService.queryAllArticle();
        model.addAttribute("list",articles);
        return "allarticle";
    }


    @RequestMapping("/addarticle")
    public String addarticle(){
        return "addarticle";
    }

    @RequestMapping("/add")
    public String add(String articleTitle,String articleTime,String articleBody,boolean sendNow ,String Uuid,String articleTag){
        int flag=1;
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        Article article = new Article();
        Date date=null;
        String uuid= UUID.randomUUID().toString();
        if(Uuid!="") {
            flag=0;
            uuid = Uuid;
        }
        if(articleTime.equals("")) articleTime = ft.format(new Date());
        try {
             date = ft.parse(articleTime);
        } catch (ParseException e) {
            date=new Date();
            e.printStackTrace();
        }
        article.setArticleTag(articleTag);
        article.setArticleBody(articleBody);
        article.setArticleTitle(articleTitle);
        article.setArticleTime(date);
        article.setUuid(uuid);
        if(sendNow)  operateFile.operate(address.add,article);
        if(flag == 1)articleService.addArticle(article);
        else articleService.updateArticle(article);
        return "redirect:/admin/allarticles";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        articleService.deleteArticleByID(id);
        return "redirect:/admin/allarticles";
    }

    @RequestMapping("/update")
    public String update(Model model,int id){
        Article article = articleService.queryArticleByID(id);
        model.addAttribute("article",article);
        return "update";

    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("userInfo");
        return  "redirect:/admin/tologin";
    }

    @RequestMapping("updatepwd")
    public String updatepwd(){
        return "updatepwd";
    }

    @RequestMapping("change")
    @ResponseBody
    public String change(String UserName,String UserPWD){
        int i = user.updatePWD(UserName, UserPWD);
        String msg="";
        if(i==1) msg="ok";
        else msg="no";
        return JSON.toJSONString(msg);
    }
}
