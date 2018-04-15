package com.neusoft.domain;

/**
 * Created by ttc on 2018/3/19.
 */

import java.sql.Timestamp;
public class ArticleInfo {
      private Integer id;
      private String title;
      private String html_content;
      private String markdown_content;
      private Timestamp createtime;
      private Integer userid;
      private Integer viewcount;
    private Integer cate_id;

    public Integer getCate_id() {
        return cate_id;
    }

    public void setCate_id(Integer cate_id) {
        this.cate_id = cate_id;
    }

    public Integer getViewcount() {
        return viewcount;
    }

    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHtml_content() {
        return html_content;
    }

    public void setHtml_content(String html_content) {
        this.html_content = html_content;
    }

    public String getMarkdown_content() {
        return markdown_content;
    }

    public void setMarkdown_content(String markdown_content) {
        this.markdown_content = markdown_content;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }


}
