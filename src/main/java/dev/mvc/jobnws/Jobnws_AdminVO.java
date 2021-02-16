package dev.mvc.jobnws;

import org.springframework.web.multipart.MultipartFile;

/*
    jobnwsno                            NUMBER(30)     NOT NULL,
    adminno                              NUMBER(30)    NOT NULL,
    jobnws_title                        VARCHAR2(1000)     NOT NULL,
    jobnws_content                      CLOB     NOT NULL,
    jobnws_url                          VARCHAR2(500)    NOT NULL,
    jobnws_passwd                       VARCHAR2(15)     NOT NULL,
    jobnws_cnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    jobnws_good                         NUMBER(10)     DEFAULT 0     NOT NULL,
    jobnws_coment                       VARCHAR2(1000)     NULL ,
    jobnws_date                         DATE     NOT NULL,
    jobnws_file1                        VARCHAR2(100)    NULL ,
    jobnws_thumb1                       VARCHAR2(100)    NULL ,
    jobnws_size1                        NUMBER(10)     DEFAULT 0     NULL,
 */
public class Jobnws_AdminVO {
  /** 뉴스 번호*/
  private int jobnwsno = 0;
  /** 관리자 번호*/
  private int adminno = 0;
  /** 뉴스 제목 */
  private String jobnws_title = "";
  /** 뉴스 내용 */
  private String jobnws_content = "";
  /** 뉴스 출처 */
  private String jobnws_url = "";
  /** 뉴스 조회수*/
  private int jobnws_cnt = 0;
  /** 뉴스 비밀번호*/ 
  private String jobnws_passwd = "";
  /** 뉴스 등록일 */
  private String jobnws_date = "";
  /** 뉴스 메인 이미지 */
  private String jobnws_file1 = "";
  /** 뉴스 메인 이미지 Preview */
  private String jobnws_thumb1 = "";
  /** 뉴스 메인 이미지 크기 */
  private long jobnws_size1;
  
  private MultipartFile jobnws_file1MF;
  
  /** id를 aid로 사용 */
  private String aid; 

  public String getAid() {
    return aid;
  }

  public void setAid(String aid) {
    this.aid = aid;
  }

  public int getJobnwsno() {
    return jobnwsno;
  }

  public void setJobnwsno(int jobnwsno) {
    this.jobnwsno = jobnwsno;
  }

  public int getAdminno() {
    return adminno;
  }

  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }

  public String getJobnws_title() {
    return jobnws_title;
  }

  public void setJobnws_title(String jobnws_title) {
    this.jobnws_title = jobnws_title;
  }

  public String getJobnws_content() {
    return jobnws_content;
  }

  public void setJobnws_content(String jobnws_content) {
    this.jobnws_content = jobnws_content;
  }

  public String getJobnws_url() {
    return jobnws_url;
  }

  public void setJobnws_url(String jobnws_url) {
    this.jobnws_url = jobnws_url;
  }

  public int getJobnws_cnt() {
    return jobnws_cnt;
  }

  public void setJobnws_cnt(int jobnws_cnt) {
    this.jobnws_cnt = jobnws_cnt;
  }

  public String getJobnws_passwd() {
    return jobnws_passwd;
  }

  public void setJobnws_passwd(String jobnws_passwd) {
    this.jobnws_passwd = jobnws_passwd;
  }

  public String getJobnws_date() {
    return jobnws_date;
  }

  public void setJobnws_date(String jobnws_date) {
    this.jobnws_date = jobnws_date;
  }

  public String getJobnws_file1() {
    return jobnws_file1;
  }

  public void setJobnws_file1(String jobnws_file1) {
    this.jobnws_file1 = jobnws_file1;
  }

  public String getJobnws_thumb1() {
    return jobnws_thumb1;
  }

  public void setJobnws_thumb1(String jobnws_thumb1) {
    this.jobnws_thumb1 = jobnws_thumb1;
  }

  public long getJobnws_size1() {
    return jobnws_size1;
  }

  public void setJobnws_size1(long jobnws_size1) {
    this.jobnws_size1 = jobnws_size1;
  }

  public MultipartFile getJobnws_file1MF() {
    return jobnws_file1MF;
  }

  public void setJobnws_file1MF(MultipartFile jobnws_file1MF) {
    this.jobnws_file1MF = jobnws_file1MF;
  }
} 