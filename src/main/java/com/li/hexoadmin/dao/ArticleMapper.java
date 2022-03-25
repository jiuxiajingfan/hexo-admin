package com.li.hexoadmin.dao;

import com.li.hexoadmin.pojo.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {
    int addArticle(Article article);
    int deleteArticleByID(@Param("articleID")int id);
    int updateArticle(Article article);
    Article queryArticleByID(@Param("articleID")int id);
    List<Article> queryArticleByTitle(@Param("articleTitle")String title);
    List<Article> queryAllArticle();
}
