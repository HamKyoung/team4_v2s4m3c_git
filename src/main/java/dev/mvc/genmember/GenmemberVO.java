package dev.mvc.genmember;

/*
    gen_memberno                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    gen_id                            VARCHAR2(50)     NOT NULL UNIQUE ,
    gen_passwd                        VARCHAR2(20)     NOT NULL,
    gen_name                          VARCHAR2(20)     NOT NULL,
    gen_resident                      VARCHAR2(13)     NOT NULL,
    gen_sex                           VARCHAR2(10)     NOT NULL,
    gen_phone                         VARCHAR2(20)     NOT NULL,
    gen_zipcode                       VARCHAR2(5)    NULL ,
    gen_addr                          VARCHAR2(100)    NULL ,
    gen_addr1                         VARCHAR2(50)     NULL ,
    gen_mail                          VARCHAR2(50)     NOT NULL,
    gen_date                          DATE     NOT NULL
*/

public class GenmemberVO {
  /** 일반 회원 번호*/
  private int gen_memberno = 0;
  /** 일반 회원 아이디*/
  private String gen_id ="";
  /** 일반 회원 비밀번호*/
  private String gen_passwd ="";
  /** 일반 회원 이름*/
  private String gen_name ="";
  /** 일반 회원 주민번호*/
  private String gen_resident ="";
  /** 일반 회원 성별*/
  private String gen_sex ="";
  /** 일반 회원 전화번호*/
  private String gen_phone ="";
  /** 일반 회원 우편 번호*/
  private String gen_zipcode ="";
  /** 일반 회원 주소*/
  private String gen_addr ="";
  /** 일반 회원 주소1*/
  private String gen_addr1 ="";
  /** 일반 회원 메일*/
  private String gen_mail ="";
  /** 일반 회원 가입일*/
  private String gen_date ="";
  
  
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }
  public String getGen_id() {
    return gen_id;
  }
  public void setGen_id(String gen_id) {
    this.gen_id = gen_id;
  }
  public String getGen_passwd() {
    return gen_passwd;
  }
  public void setGen_passwd(String gen_passwd) {
    this.gen_passwd = gen_passwd;
  }
  public String getGen_name() {
    return gen_name;
  }
  public void setGen_name(String gen_name) {
    this.gen_name = gen_name;
  }
  public String getGen_resident() {
    return gen_resident;
  }
  public void setGen_resident(String gen_resident) {
    this.gen_resident = gen_resident;
  }
  public String getGen_sex() {
    return gen_sex;
  }
  public void setGen_sex(String gen_sex) {
    this.gen_sex = gen_sex;
  }
  public String getGen_phone() {
    return gen_phone;
  }
  public void setGen_phone(String gen_phone) {
    this.gen_phone = gen_phone;
  }
  public String getGen_zipcode() {
    return gen_zipcode;
  }
  public void setGen_zipcode(String gen_zipcode) {
    this.gen_zipcode = gen_zipcode;
  }
  public String getGen_addr() {
    return gen_addr;
  }
  public void setGen_addr(String gen_addr) {
    this.gen_addr = gen_addr;
  }
  public String getGen_addr1() {
    return gen_addr1;
  }
  public void setGen_addr1(String gen_addr1) {
    this.gen_addr1 = gen_addr1;
  }
  public String getGen_mail() {
    return gen_mail;
  }
  public void setGen_mail(String gen_mail) {
    this.gen_mail = gen_mail;
  }
  public String getGen_date() {
    return gen_date;
  }
  public void setGen_date(String gen_date) {
    this.gen_date = gen_date;
  }
  
 
  
  
}
