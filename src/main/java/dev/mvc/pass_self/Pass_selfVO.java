package dev.mvc.pass_self;

public class Pass_selfVO {
  
  //  pass_self_no                      NUMBER(7)    NOT NULL    PRIMARY KEY,
  //  comno                             NUMBER(10)     NULL ,
  //  cor_memberno                      NUMBER(7)    NULL ,
  //  pass_self_title                   VARCHAR2(200)    NOT NULL,
  //  pass_self_item1                   VARCHAR2(100)    NOT NULL,
  //  pass_self_item2                   VARCHAR2(100)    NULL ,
  //  pass_self_item3                   VARCHAR2(100)    NULL ,
  //  pass_self_item4                   VARCHAR2(100)    NULL ,
  //  pass_self_item5                   VARCHAR2(100)    NULL ,
  //  pass_self_ans1                    VARCHAR2(2000)     NOT NULL,
  //  pass_self_ans2                    VARCHAR2(2000)     NULL ,
  //  pass_self_ans3                    VARCHAR2(2000)     NULL ,
  //  pass_self_ans4                    VARCHAR2(2000)     NULL ,
  //  pass_self_ans5                    VARCHAR2(2000)     NULL ,
  //  pass_self_date                    DATE     NOT NULL,
  //  pass_self_views                   NUMBER(10)     DEFAULT 0     NOT NULL,
  
  private int pass_self_no = 0;
  private int comno = 0;
  private int cor_memberno = 0;
  private String pass_self_title = "";
  private String pass_self_item1 = "";
  private String pass_self_item2 = "";
  private String pass_self_item3 = "";
  private String pass_self_item4 = "";
  private String pass_self_item5 = "";
  private String pass_self_ans1 = "";
  private String pass_self_ans2 = "";
  private String pass_self_ans3 = "";
  private String pass_self_ans4 = "";
  private String pass_self_ans5 = "";
  private String pass_self_date = "";
  private int pass_self_views = 0;
  
  // conpany_intro table
  private String com_name;
  
  public int getPass_self_no() {
    return pass_self_no;
  }
  public void setPass_self_no(int pass_self_no) {
    this.pass_self_no = pass_self_no;
  }
  public int getComno() {
    return comno;
  }
  public void setComno(int comno) {
    this.comno = comno;
  }
  public int getCor_memberno() {
    return cor_memberno;
  }
  public void setCor_memberno(int cor_memberno) {
    this.cor_memberno = cor_memberno;
  }
  public String getPass_self_title() {
    return pass_self_title;
  }
  public void setPass_self_title(String pass_self_title) {
    this.pass_self_title = pass_self_title;
  }
  public String getPass_self_item1() {
    return pass_self_item1;
  }
  public void setPass_self_item1(String pass_self_item1) {
    this.pass_self_item1 = pass_self_item1;
  }
  public String getPass_self_item2() {
    return pass_self_item2;
  }
  public void setPass_self_item2(String pass_self_item2) {
    this.pass_self_item2 = pass_self_item2;
  }
  public String getPass_self_item3() {
    return pass_self_item3;
  }
  public void setPass_self_item3(String pass_self_item3) {
    this.pass_self_item3 = pass_self_item3;
  }
  public String getPass_self_item4() {
    return pass_self_item4;
  }
  public void setPass_self_item4(String pass_self_item4) {
    this.pass_self_item4 = pass_self_item4;
  }
  public String getPass_self_item5() {
    return pass_self_item5;
  }
  public void setPass_self_item5(String pass_self_item5) {
    this.pass_self_item5 = pass_self_item5;
  }
  public String getPass_self_ans1() {
    return pass_self_ans1;
  }
  public void setPass_self_ans1(String pass_self_ans1) {
    this.pass_self_ans1 = pass_self_ans1;
  }
  public String getPass_self_ans2() {
    return pass_self_ans2;
  }
  public void setPass_self_ans2(String pass_self_ans2) {
    this.pass_self_ans2 = pass_self_ans2;
  }
  public String getPass_self_ans3() {
    return pass_self_ans3;
  }
  public void setPass_self_ans3(String pass_self_ans3) {
    this.pass_self_ans3 = pass_self_ans3;
  }
  public String getPass_self_ans4() {
    return pass_self_ans4;
  }
  public void setPass_self_ans4(String pass_self_ans4) {
    this.pass_self_ans4 = pass_self_ans4;
  }
  public String getPass_self_ans5() {
    return pass_self_ans5;
  }
  public void setPass_self_ans5(String pass_self_ans5) {
    this.pass_self_ans5 = pass_self_ans5;
  }
  public String getPass_self_date() {
    return pass_self_date;
  }
  public void setPass_self_date(String pass_self_date) {
    this.pass_self_date = pass_self_date;
  }
  public int getPass_self_views() {
    return pass_self_views;
  }
  public void setPass_self_views(int pass_self_views) {
    this.pass_self_views = pass_self_views;
  }
  public String getCom_name() {
    return com_name;
  }
  public void setCom_name(String com_name) {
    this.com_name = com_name;
  }

  

}
