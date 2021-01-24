package dev.mvc.resume;

import org.springframework.web.multipart.MultipartFile;

/*CREATE TABLE mem_res(
    res_no                            NUMBER(10)            NOT NULL     PRIMARY KEY,
    gen_name                          VARCHAR2(20)            NOT NULL,
    res_phone                         VARCHAR2(60)            NOT NULL,
    res_mail                            VARCHAR2(200)       NOT NULL,
    res_intro                             VARCHAR2(800)       NOT NULL,
    res_school                           VARCHAR2(80)           NOT NULL,
    res_major                            VARCHAR2(100)        NOT NULL,
    res_lice                            VARCHAR2(50)            NULL,
    res_lice_lev                        VARCHAR2(30)            NULL ,
    res_work                            CLOB                        DEFAULT 0    NULL ,
    res_web                             VARCHAR2(100)       NULL ,
    res_visible                             CHAR(1)                   DEFAULT 'Y'  NOT NULL,
    res_date                          DATE                        NOT NULL,
    res_pic                               VARCHAR2(100)       NULL ,
    res_thumb                           VARCHAR2(100)       NULL ,
    res_size                              NUMBER(10)            NULL ,
    gen_memberno                    NUMBER(7)               NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
*/

public class ResumeVO {
  private int res_no;
  private String gen_name="";
  private String res_phone="";
  private String res_mail="";
  private String res_intro="";
  private String res_school="";
  private String res_major="";
  private String res_lice="";
  private String res_lice_lev="";
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
  public String getRes_mail() {
    return res_mail;
  }
  public void setRes_mail(String res_mail) {
    this.res_mail = res_mail;
  }
  public String getRes_intro() {
    return res_intro;
  }
  public void setRes_intro(String res_intro) {
    this.res_intro = res_intro;
  }
  public String getRes_school() {
    return res_school;
  }
  public void setRes_school(String res_school) {
    this.res_school = res_school;
  }
  public String getRes_major() {
    return res_major;
  }
  public void setRes_major(String res_major) {
    this.res_major = res_major;
  }
  public String getRes_lice() {
    return res_lice;
  }
  public void setRes_lice(String res_lice) {
    this.res_lice = res_lice;
  }
  public String getRes_lice_lev() {
    return res_lice_lev;
  }
  public void setRes_lice_lev(String res_lice_lev) {
    this.res_lice_lev = res_lice_lev;
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
    
  
}
