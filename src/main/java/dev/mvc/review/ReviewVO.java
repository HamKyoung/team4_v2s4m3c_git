package dev.mvc.review;

import java.util.Date;

/* CREATE TABLE com_review(
    rev_no                                NUMBER(10)     NOT NULL    PRIMARY KEY,
    com_name                          VARCHAR2(50)     NOT NULL,
    rev_title                             VARCHAR2(50)     NOT NULL,
    rev_score                         NUMBER(10)     DEFAULT 0     NOT NULL,
    rev_depart                        VARCHAR2(50)     NOT NULL,
    rev_content                       VARCHAR2(1000)     NOT NULL,
    rev_visible                       CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rev_good                          NUMBER(10)     NOT NULL,
    rev_bad                               NUMBER(10)     NOT NULL,
    rev_date                              DATE     NOT NULL,
    rev_cnt                                   NUMBER(10)     NOT NULL,
    comno                                 NUMBER(10)     NULL,
    gen_memberno                   NUMBER(7)     NULL,
    */

public class ReviewVO {
  private int rev_no; // ¸®ºä ¹øÈ£
  private String com_name="";
  private String rev_title="";
  private int rev_score;
  private String rev_depart="";
  private String rev_content="";
  private String rev_visible="";
  private int rev_good;
  private int rev_bad;
  private String rev_date="";
  private int rev_cnt;
  private int comno;
  private int gen_memberno;
  
  public int getRev_no() {
    return rev_no;
  }
  public void setRev_no(int rev_no) {
    this.rev_no = rev_no;
  }
  public String getCom_name() {
    return com_name;
  }
  public void setCom_name(String com_name) {
    this.com_name = com_name;
  }
  public String getRev_title() {
    return rev_title;
  }
  public void setRev_title(String rev_title) {
    this.rev_title = rev_title;
  }
  public int getRev_score() {
    return rev_score;
  }
  public void setRev_score(int rev_score) {
    this.rev_score = rev_score;
  }
  public String getRev_depart() {
    return rev_depart;
  }
  public void setRev_depart(String rev_depart) {
    this.rev_depart = rev_depart;
  }
  public String getRev_content() {
    return rev_content;
  }
  public void setRev_content(String rev_content) {
    this.rev_content = rev_content;
  }
  public String getRev_visible() {
    return rev_visible;
  }
  public void setRev_visible(String rev_visible) {
    this.rev_visible = rev_visible;
  }
  public int getRev_good() {
    return rev_good;
  }
  public void setRev_good(int rev_good) {
    this.rev_good = rev_good;
  }
  public int getRev_bad() {
    return rev_bad;
  }
  public void setRev_bad(int rev_bad) {
    this.rev_bad = rev_bad;
  }
  public String getRev_date() {
    return rev_date;
  }
  public void setRev_date(String rev_date) {
    this.rev_date = rev_date;
  }
  public int getRev_cnt() {
    return rev_cnt;
  }
  public void setRev_cnt(int rev_cnt) {
    this.rev_cnt = rev_cnt;
  }
  public int getComno() {
    return comno;
  }
  public void setComno(int comno) {
    this.comno = comno;
  }
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }

  
  
  
}
