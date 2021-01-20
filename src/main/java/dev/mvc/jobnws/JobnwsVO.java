package dev.mvc.jobnws;

import org.springframework.web.multipart.MultipartFile;

/*
    newsno                            NUMBER(30)     NOT NULL,
    news_title                        VARCHAR2(100)    NOT NULL,
    news_content                      VARCHAR2(100)    NOT NULL,
    news_url                          VARCHAR2(50)     NOT NULL,
    news_passwd                       VARCHAR2(15)     NOT NULL,
    news_cnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    news_good                         NUMBER(10)     DEFAULT 0     NOT NULL,
    news_coment                       VARCHAR2(100)    NULL ,
    news_date                         DATE     NOT NULL,
    news_file1                        VARCHAR2(100)    NULL ,
    news_thumb1                       VARCHAR2(100)    NULL ,
    news_size1                        NUMBER(10)     DEFAULT 0     NULL 
 */
public class JobnwsVO {
  /** ���� ��ȣ*/
  private int newsno = 0;
  /** ���� ���� */
  private String news_title = "";
  /** ���� ���� */
  private String news_content = "";
  /** ���� ��ó */
  private String news_url = "";
  /** ���� ��ȸ��*/
  private int news_cnt = 0;
  /** ���� ��õ��*/
  private int news_good = 0;
  /** ���� ���� */
  private String news_coment = "";
  /** ���� ��й�ȣ*/ 
  private String news_passwd = "";
  /** ���� ����� */
  private String news_date = "";
  /** ���� ���� �̹��� */
  private String news_file1 = "";
  /** ���� ���� �̹��� Preview */
  private String news_thumb1 = "";
  /** ���� ���� �̹��� ũ�� */
  private long news_size1;
  
  private MultipartFile news_file1MF;

  public int getNewsno() {
    return newsno;
  }

  public void setNewsno(int newsno) {
    this.newsno = newsno;
  }

  public String getNews_title() {
    return news_title;
  }

  public void setNews_title(String news_title) {
    this.news_title = news_title;
  }

  public String getNews_content() {
    return news_content;
  }

  public void setNews_content(String news_content) {
    this.news_content = news_content;
  }

  public String getNews_url() {
    return news_url;
  }

  public void setNews_url(String news_url) {
    this.news_url = news_url;
  }

  public int getNews_cnt() {
    return news_cnt;
  }

  public void setNews_cnt(int news_cnt) {
    this.news_cnt = news_cnt;
  }

  public int getNews_good() {
    return news_good;
  }

  public void setNews_good(int news_good) {
    this.news_good = news_good;
  }

  public String getNews_coment() {
    return news_coment;
  }

  public void setNews_coment(String news_coment) {
    this.news_coment = news_coment;
  }

  public String getNews_passwd() {
    return news_passwd;
  }

  public void setNews_passwd(String news_passwd) {
    this.news_passwd = news_passwd;
  }

  public String getNews_date() {
    return news_date;
  }

  public void setNews_date(String news_date) {
    this.news_date = news_date;
  }

  public String getNews_file1() {
    return news_file1;
  }

  public void setNews_file1(String news_file1) {
    this.news_file1 = news_file1;
  }

  public String getNews_thumb1() {
    return news_thumb1;
  }

  public void setNews_thumb1(String news_thumb1) {
    this.news_thumb1 = news_thumb1;
  }

  public long getNews_size1() {
    return news_size1;
  }

  public void setNews_size1(long news_size1) {
    this.news_size1 = news_size1;
  }

  public MultipartFile getNews_file1MF() {
    return news_file1MF;
  }

  public void setNews_file1MF(MultipartFile news_file1MF) {
    this.news_file1MF = news_file1MF;
  }


  
} 