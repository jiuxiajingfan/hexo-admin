package com.li.hexoadmin.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Article {
    private int articleID;
    private String articleTitle;
    private String articleBody;
    private String articleTag;
    private String articleTip;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date articleTime;
    private String uuid;


    public Article() {
    }

    public Article(int articleID, String articleTitle, String articleBody, String articleTag, String articleTip, Date articleTime, String uuid) {
        this.articleID = articleID;
        this.articleTitle = articleTitle;
        this.articleBody = articleBody;
        this.articleTag = articleTag;
        this.articleTip = articleTip;
        this.articleTime = articleTime;
        this.uuid = uuid;
    }

    public String getArticleTip() {
        return articleTip;
    }

    public void setArticleTip(String articleTip) {
        this.articleTip = articleTip;
    }

    public String getArticleTag() {
        return articleTag;
    }

    public void setArticleTag(String articleTag) {
        this.articleTag = articleTag;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public String getArticleBody() {
        return articleBody;
    }

    public String getUuid() {
        return uuid;
    }

    public int getArticleID() {
        return articleID;
    }

    public Date getArticleTime() {
        return articleTime;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public void setArticleBody(String articleBody) {
        this.articleBody = articleBody;
    }

    public void setArticleTime(Date articleTime) {
        this.articleTime = articleTime;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

}
