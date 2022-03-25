package com.li.hexoadmin.service;

import com.li.hexoadmin.pojo.Article;

import java.util.List;


public interface ArticleService {
    int addArticle(Article article);
    int deleteArticleByID(int id);
    int updateArticle(Article article);
    Article queryArticleByID(int id);
    List<Article> queryArticleByTitle(String title);
    List<Article> queryAllArticle();
}
