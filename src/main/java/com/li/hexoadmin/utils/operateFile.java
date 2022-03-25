package com.li.hexoadmin.utils;

import com.li.hexoadmin.pojo.Article;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class  operateFile {
    public static void operate(String address, Article article){
        String filepath=address+article.getUuid()+".md";
        File file = new File(filepath);
        if(!file.exists()) {
            try {
                file.createNewFile();

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        FileWriter fw = null;
        try {
            fw = new FileWriter(filepath);
            fw.write("---\n" +
                    "title: "+article.getArticleTitle()+"\n" +
                    "date: "+getDateTime(article.getArticleTime())+"\n"+
                    "tag: "+article.getArticleTag()+"\n"+
                    "---\n");
            fw.write(article.getArticleBody());

        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }




    }
    public static String getDateTime(Date now) {
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleFormat.format(now);

    }
}
