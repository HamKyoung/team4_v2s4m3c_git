package dev.mvc.cormember;

/*
    cor_memberno                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    cor_id                            VARCHAR2(50)     NOT NULL UNIQUE,
    cor_passwd                        VARCHAR2(20)     NOT NULL,
    cor_name                          VARCHAR2(20)     NOT NULL,
    cor_resident                      VARCHAR2(13)     NOT NULL,
    cor_sex                           VARCHAR2(10)     NOT NULL,
    cor_phone                         VARCHAR2(20)     NOT NULL,
    cor_zipcode                       VARCHAR2(5)    NULL ,
    cor_addr                          VARCHAR2(100)    NULL ,
    cor_addr1                         VARCHAR2(50)     NULL ,
    cor_mail                          VARCHAR2(50)     NOT NULL,
    cor_date                          DATE     NOT NULL
*/

public class CormemberVO {
  /**기업 회원 번호*/
  private int cor_memberno = 0;
  /**기업 회원 아이디*/
  private String cor_id ="";
  /**기업 회원 비밀 번호*/
  private String cor_passwd ="";
  /**기업 회원 이름*/
  private String cor_name ="";
  /**기업 회원 생년월일*/
  private String cor_resident ="";
  /**기업 회원 성별*/
  private String cor_sex ="";
  /**기업 전화 번호 */
  private String cor_phone ="";
  /**기업 회원 우편 번호*/
  private String cor_zipcode ="";
  /**기업 회원 주소*/
  private String cor_addr ="";
  /**기업 회원 주소1*/
  private String cor_addr1 ="";
  /**기업 회원 이메일*/
  private String cor_mail ="";
  /**기업 회원 가입일*/
  private String cor_date ="";
  
  
  public int getCor_memberno() {
    return cor_memberno;
  }
  public void setCor_memberno(int cor_memberno) {
    this.cor_memberno = cor_memberno;
  }
  public String getCor_id() {
    return cor_id;
  }
  public void setCor_id(String cor_id) {
    this.cor_id = cor_id;
  }
  public String getCor_passwd() {
    return cor_passwd;
  }
  public void setCor_passwd(String cor_passwd) {
    this.cor_passwd = cor_passwd;
  }
  public String getCor_name() {
    return cor_name;
  }
  public void setCor_name(String cor_name) {
    this.cor_name = cor_name;
  }
  public String getCor_resident() {
    return cor_resident;
  }
  public void setCor_resident(String cor_resident) {
    this.cor_resident = cor_resident;
  }
  public String getCor_sex() {
    return cor_sex;
  }
  public void setCor_sex(String cor_sex) {
    this.cor_sex = cor_sex;
  }
  public String getCor_phone() {
    return cor_phone;
  }
  public void setCor_phone(String cor_phone) {
    this.cor_phone = cor_phone;
  }
  public String getCor_zipcode() {
    return cor_zipcode;
  }
  public void setCor_zipcode(String cor_zipcode) {
    this.cor_zipcode = cor_zipcode;
  }
  public String getCor_addr() {
    return cor_addr;
  }
  public void setCor_addr(String cor_addr) {
    this.cor_addr = cor_addr;
  }
  public String getCor_addr1() {
    return cor_addr1;
  }
  public void setCor_addr1(String cor_addr1) {
    this.cor_addr1 = cor_addr1;
  }
  public String getCor_mail() {
    return cor_mail;
  }
  public void setCor_mail(String cor_mail) {
    this.cor_mail = cor_mail;
  }
  public String getCor_date() {
    return cor_date;
  }
  public void setCor_date(String cor_date) {
    this.cor_date = cor_date;
  }
  
  
  
}
