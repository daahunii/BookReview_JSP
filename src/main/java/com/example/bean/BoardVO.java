package com.example.bookreview.bean;

import java.io.File;
import java.util.Date;

public class BoardVO {
    private int seq;
    private String title;
    private String content;

    private String youtuber;

    private String link;

    private int views;

    private Date regdate;

    private String photo;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getYoutuber() {
        return youtuber;
    }

    public void setYoutuber(String youtuber) {
        this.youtuber = youtuber;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }



    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }


    public String getImgSrc(){
        return "http://img.youtube.com/vi/" + this.link.substring(32) + "/mqdefault.jpg";

    }


    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
