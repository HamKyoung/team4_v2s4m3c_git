package dev.mvc.re_calendar;

public class Re_calendarVO {
//  calendar_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
//  RECRUITNO                         NUMBER(10)     NULL ,
//  c_rdate                           VARCHAR2(50)     NOT NULL,
//  c_edate                           VARCHAR2(50)     NOT NULL,
//  c_title                           VARCHAR2(300)    NOT NULL,
//  c_cnt                             NUMBER(10)     DEFAULT 0     NOT NULL,
//  c_date                            DATE     NOT NULL,
  
  
  private int calendar_no = 0;
  private int RECRUITNO = 0;
  private String c_rdate = "";
  private String c_edate = "";
  private String c_title = "";
  private int c_cnt = 0;
  private String c_date = "";
  public int getCalendar_no() {
    return calendar_no;
  }
  public void setCalendar_no(int calendar_no) {
    this.calendar_no = calendar_no;
  }
  public int getRECRUITNO() {
    return RECRUITNO;
  }
  public void setRECRUITNO(int rECRUITNO) {
    RECRUITNO = rECRUITNO;
  }
  public String getC_rdate() {
    return c_rdate;
  }
  public void setC_rdate(String c_rdate) {
    this.c_rdate = c_rdate;
  }
  public String getC_edate() {
    return c_edate;
  }
  public void setC_edate(String c_edate) {
    this.c_edate = c_edate;
  }
  public String getC_title() {
    return c_title;
  }
  public void setC_title(String c_title) {
    this.c_title = c_title;
  }
  public int getC_cnt() {
    return c_cnt;
  }
  public void setC_cnt(int c_cnt) {
    this.c_cnt = c_cnt;
  }
  public String getC_date() {
    return c_date;
  }
  public void setC_date(String c_date) {
    this.c_date = c_date;
  }
  
  
  

}







