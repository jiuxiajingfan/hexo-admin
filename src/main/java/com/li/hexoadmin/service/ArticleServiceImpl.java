package com.li.hexoadmin.service;

import com.li.hexoadmin.dao.ArticleMapper;
import com.li.hexoadmin.pojo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    private ArticleMapper articleMapper;

    public void setArticleMapper(ArticleMapper articleMapper) {
        this.articleMapper = articleMapper;
    }

    @Override
    public int addArticle(Article article) {
        return articleMapper.addArticle(article);
    }

    @Override
    public int deleteArticleByID(int id) {
        return articleMapper.deleteArticleByID(id);
    }

    @Override
    public int updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }

    @Override
    public Article queryArticleByID(int id) {
        return articleMapper.queryArticleByID(id);
    }

    @Override
    public List<Article> queryArticleByTitle(String title) {
        return articleMapper.queryArticleByTitle(title);
    }

    @Override
    public List<Article> queryAllArticle() {
        return articleMapper.queryAllArticle();
    }
}
