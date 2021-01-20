package dev.mvc.resume;

import org.springframework.web.multipart.MultipartFile;

/** CREATE TABLE mem_res(
    res_no                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    gen_name                          VARCHAR2(20)     NOT NULL,
    res_phone                         VARCHAR2(60)     NOT NULL,
    res_mail1                         VARCHAR2(200)    NOT NULL,
    res_mail2                         VARCHAR2(200)    NOT NULL,
    res_title                         VARCHAR2(30)        NOT NULL,
    res_intro                         LONG                    NOT NULL,
    res_work                        VARCHAR2(1000)    DEFAULT 0    NULL ,
    res_web                         VARCHAR2(100)   NULL ,
    res_visible                     CHAR(1)               DEFAULT 'Y'  NOT NULL,
    res_date                          DATE                    NOT NULL,
    res_pic                           VARCHAR2(100)    NULL ,
    res_thumb                       VARCHAR2(100)    NULL ,
    res_size                          NUMBER(10)             NULL ,
    gen_memberno                NUMBER(7)            NULL ,
    cor_memberno                NUMBER(7)            NULL ,
        
CREATE TABLE res_scho(
    res_scho_no                    NUMBER(10)                   NOT NULL       PRIMARY KEY,
    res_scname                     VARCHAR2(80)               NOT NULL,
    res_major1                        VARCHAR2(100)           NOT NULL,
    res_major2                      VARCHAR2(100)           NULL ,
    res_gotin                         VARCHAR2(50)                NOT NULL,
    res_grad                        VARCHAR2(50)                NOT NULL,
    res_no                            NUMBER(10)                    NULL ,
    FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
    
CREATE TABLE res_lice(
    res_lice_no                    NUMBER(10)    NOT NULL       PRIMARY KEY,
    res_lice1                         VARCHAR2(50)     NULL      ,
    res_lice1_lev                     VARCHAR2(30)     NULL ,
    res_lice2                         VARCHAR2(50)     NULL,
    res_lice2_lev                     VARCHAR2(30)     NULL ,
    res_no                            NUMBER(10)     NULL ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
    */

public class ResumeVO {
  private int res_no;
  private String gen_name="";
  private String res_phone="";
  private String res_mail1="";
  private String res_mail2="";
  private String res_title="";
  private String res_intro="";
  private String res_work="";
  private String res_web="";
  private String res_visible="";
  private String res_date="";
  private String res_pic="";
  private String res_thumb="";
  private long res_size;
  private MultipartFile res_picMF;
  private int gen_memberno;
  private int cor_memberno;
  
  /** 학력정보 테이블 res_scho */
  private int res_scho_no;
  private String res_scname="";
  private String res_major1="";
  private String res_major2="";
  private String res_gotin="";
  private String res_grad="";
  
  /**  자격증 테이블 res_lice */
  private int res_lice_no;
  private String res_lice1="";
  private String res_lice1_lev="";
  private String res_lice2="";
  private String res_lice2_lev="";
  
  
  public int getRes_no() {
    return res_no;
  }
  public void setRes_no(int res_no) {
    this.res_no = res_no;
  }
  public String getGen_name() {
    return gen_name;
  }
  public void setGen_name(String gen_name) {
    this.gen_name = gen_name;
  }
  public String getRes_phone() {
    return res_phone;
  }
  public void setRes_phone(String res_phone) {
    this.res_phone = res_phone;
  }
  public String getRes_mail1() {
    return res_mail1;
  }
  public void setRes_mail1(String res_mail1) {
    this.res_mail1 = res_mail1;
  }
  public String getRes_mail2() {
    return res_mail2;
  }
  public void setRes_mail2(String res_mail2) {
    this.res_mail2 = res_mail2;
  }
  public String getRes_title() {
    return res_title;
  }
  public void setRes_title(String res_title) {
    this.res_title = res_title;
  }
  public String getRes_intro() {
    return res_intro;
  }
  public void setRes_intro(String res_intro) {
    this.res_intro = res_intro;
  }
  public String getRes_work() {
    return res_work;
  }
  public void setRes_work(String res_work) {
    this.res_work = res_work;
  }
  public String getRes_web() {
    return res_web;
  }
  public void setRes_web(String res_web) {
    this.res_web = res_web;
  }
  public String getRes_visible() {
    return res_visible;
  }
  public void setRes_visible(String res_visible) {
    this.res_visible = res_visible;
  }
  public String getRes_date() {
    return res_date;
  }
  public void setRes_date(String res_date) {
    this.res_date = res_date;
  }
  public String getRes_pic() {
    return res_pic;
  }
  public void setRes_pic(String res_pic) {
    this.res_pic = res_pic;
  }
  public String getRes_thumb() {
    return res_thumb;
  }
  public void setRes_thumb(String res_thumb) {
    this.res_thumb = res_thumb;
  }
  public long getRes_size() {
    return res_size;
  }
  public void setRes_size(long res_size) {
    this.res_size = res_size;
  }
  public MultipartFile getRes_picMF() {
    return res_picMF;
  }
  public void setRes_picMF(MultipartFile res_picMF) {
    this.res_picMF = res_picMF;
  }
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }
  public int getCor_memberno() {
    return cor_memberno;
  }
  public void setCor_memberno(int cor_memberno) {
    this.cor_memberno = cor_memberno;
  }
  public int getRes_scho_no() {
    return res_scho_no;
  }
  public void setRes_scho_no(int res_scho_no) {
    this.res_scho_no = res_scho_no;
  }
  public String getRes_scname() {
    return res_scname;
  }
  public void setRes_scname(String res_scname) {
    this.res_scname = res_scname;
  }
  public String getRes_major1() {
    return res_major1;
  }
  public void setRes_major1(String res_major1) {
    this.res_major1 = res_major1;
  }
  public String getRes_major2() {
    return res_major2;
  }
  public void setRes_major2(String res_major2) {
    this.res_major2 = res_major2;
  }
  public String getRes_gotin() {
    return res_gotin;
  }
  public void setRes_gotin(String res_gotin) {
    this.res_gotin = res_gotin;
  }
  public String getRes_grad() {
    return res_grad;
  }
  public void setRes_grad(String res_grad) {
    this.res_grad = res_grad;
  }
  public int getRes_lice_no() {
    return res_lice_no;
  }
  public void setRes_lice_no(int res_lice_no) {
    this.res_lice_no = res_lice_no;
  }
  public String getRes_lice1() {
    return res_lice1;
  }
  public void setRes_lice1(String res_lice1) {
    this.res_lice1 = res_lice1;
  }
  public String getRes_lice1_lev() {
    return res_lice1_lev;
  }
  public void setRes_lice1_lev(String res_lice1_lev) {
    this.res_lice1_lev = res_lice1_lev;
  }
  public String getRes_lice2() {
    return res_lice2;
  }
  public void setRes_lice2(String res_lice2) {
    this.res_lice2 = res_lice2;
  }
  public String getRes_lice2_lev() {
    return res_lice2_lev;
  }
  public void setRes_lice2_lev(String res_lice2_lev) {
    this.res_lice2_lev = res_lice2_lev;
  }

  
  
 
    
  
}
