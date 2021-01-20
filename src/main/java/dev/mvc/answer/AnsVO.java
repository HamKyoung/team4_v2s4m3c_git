package dev.mvc.answer;

public class AnsVO {
//  ans_no NUMBER(10) NOT NULL PRIMARY KEY,
//  ques_no NUMBER(10),
//  ans_title VARCHAR2(200) NOT NULL,
//  ans_con CLOB NOT NULL,
//  ans_date DATE NOT NULL,
//  ans_views NUMBER(10) DEFAULT 0 NOT NULL,
  
  private int ans_no = 0;
  private int ques_no = 0;
  private String ans_title = "";
  private String ans_con = "";
  private String ans_date = "";
  private int ans_views = 0;
  public int getAns_no() {
    return ans_no;
  }
  public void setAns_no(int ans_no) {
    this.ans_no = ans_no;
  }
  public int getQues_no() {
    return ques_no;
  }
  public void setQues_no(int ques_no) {
    this.ques_no = ques_no;
  }
  public String getAns_title() {
    return ans_title;
  }
  public void setAns_title(String ans_title) {
    this.ans_title = ans_title;
  }
  public String getAns_con() {
    return ans_con;
  }
  public void setAns_con(String ans_con) {
    this.ans_con = ans_con;
  }
  public String getAns_date() {
    return ans_date;
  }
  public void setAns_date(String ans_date) {
    this.ans_date = ans_date;
  }
  public int getAns_views() {
    return ans_views;
  }
  public void setAns_views(int ans_views) {
    this.ans_views = ans_views;
  }
  
  
  
}
