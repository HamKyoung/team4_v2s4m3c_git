package dev.mvc.notice;

import org.springframework.web.multipart.MultipartFile;

/*
notice_no                         NUMBER(10)     NOT NULL    PRIMARY KEY,
notice_name                       VARCHAR2(50)     NOT NULL,
notice_con                        VARCHAR2(225)    NOT NULL,
notice_views                      NUMBER(10)     DEFAULT 0     NOT NULL,
notice_visible                    CHAR(1)    DEFAULT 'N'     NOT NULL,
notice_date                       DATE     NOT NULL
*/
public class NoticeVO {
  private int notice_no = 0;               /** 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙호 */
  private String notice_name = "";      /** 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 */
  private String notice_con = "";        /** 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 */
  private int notice_seqno = 0;
  private int notice_views = 0;          /** 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙회占쏙옙 */
  private String notice_visible = "";    /** 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 */
  private String notice_date = "";     /** 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� */
  private String notice_word = "";
  
  private String notice_file1 = "";
  private String notice_thumb1 = "";
  private long notice_size1;
  
  private MultipartFile notice_file1MF;
  
  public String getNotice_file1() {
    return notice_file1;
  }
  public void setNotice_file1(String notice_file1) {
    this.notice_file1 = notice_file1;
  }
  public String getNotice_thumb1() {
    return notice_thumb1;
  }
  public void setNotice_thumb1(String notice_thumb1) {
    this.notice_thumb1 = notice_thumb1;
  }
  public long getNotice_size1() {
    return notice_size1;
  }
  public void setNotice_size1(long notice_size1) {
    this.notice_size1 = notice_size1;
  }
  public MultipartFile getNotice_file1MF() {
    return notice_file1MF;
  }
  public void setNotice_file1MF(MultipartFile notice_file1MF) {
    this.notice_file1MF = notice_file1MF;
  }
  public int getNotice_no() {
    return notice_no;
  }
  public void setNotice_no(int notice_no) {
    this.notice_no = notice_no;
  }
  public String getNotice_name() {
    return notice_name;
  }
  public void setNotice_name(String notice_name) {
    this.notice_name = notice_name;
  }
  public String getNotice_con() {
    return notice_con;
  }
  public void setNotice_con(String notice_con) {
    this.notice_con = notice_con;
  }
  public int getNotice_seqno() {
    return notice_seqno;
  }
  public void setNotice_seqno(int notice_seqno) {
    this.notice_seqno = notice_seqno;
  }
  public int getNotice_views() {
    return notice_views;
  }
  public void setNotice_views(int notice_views) {
    this.notice_views = notice_views;
  }
  public String getNotice_visible() {
    return notice_visible;
  }
  public void setNotice_visible(String notice_visible) {
    this.notice_visible = notice_visible;
  }
  public String getNotice_date() {
    return notice_date;
  }
  public void setNotice_date(String notice_date) {
    this.notice_date = notice_date;
  }
  public String getNotice_word() {
    return notice_word;
  }
  public void setNotice_word(String notice_word) {
    this.notice_word = notice_word;
  }
  
  
  
  
}
