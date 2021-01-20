package dev.mvc.questions;

public class QuesVO {
//  ques_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
//  gen_memberno                      NUMBER(7)    NULL ,
//  ques_title                        VARCHAR2(200)    NOT NULL,
//  ques_con                          CLOB     NOT NULL,
//  ques_date                         DATE     NOT NULL,
//  ques_views                        NUMBER(10)     DEFAULT 0     NOT NULL,
//  ques_passwd                       VARCHAR2(10)     NOT NULL,
  
  private int ques_no = 0;
  private int gen_memberno = 0;
  private String ques_title = "";
  private String ques_con = "";
  private String ques_date = "";
  private int ques_views = 0;
  private String ques_passwd = "";
  
  // general_member table
  private String gen_name;
  
  public int getQues_no() {
    return ques_no;
  }
  public void setQues_no(int ques_no) {
    this.ques_no = ques_no;
  }
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }
  public String getQues_title() {
    return ques_title;
  }
  public void setQues_title(String ques_title) {
    this.ques_title = ques_title;
  }
  public String getQues_con() {
    return ques_con;
  }
  public void setQues_con(String ques_con) {
    this.ques_con = ques_con;
  }
  public String getQues_date() {
    return ques_date;
  }
  public void setQues_date(String ques_date) {
    this.ques_date = ques_date;
  }
  public int getQues_views() {
    return ques_views;
  }
  public void setQues_views(int ques_views) {
    this.ques_views = ques_views;
  }
  public String getQues_passwd() {
    return ques_passwd;
  }
  public void setQues_passwd(String ques_passwd) {
    this.ques_passwd = ques_passwd;
  }
  public String getGen_name() {
    return gen_name;
  }
  public void setGen_name(String gen_name) {
    this.gen_name = gen_name;
  }
  
  

}







