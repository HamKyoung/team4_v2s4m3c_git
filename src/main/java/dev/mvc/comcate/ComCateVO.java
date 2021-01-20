package dev.mvc.comcate;
/*
CREATE TABLE com_cate(
    cateno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    comno                           NUMBER(10)     NULL ,
    cate_name                      VARCHAR2(100)     NOT NULL,
    cate_seqno                     NUMBER(10)    DEFAULT 0     NOT NULL,
    cate_visible                     CHAR(1)     DEFAULT 'Y'     NOT NULL,
    cate_date                        DATE    NOT NULL,
    cate_cnt                         NUMBER(10)    DEFAULT 0     NOT NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno)
);
*/
public class ComCateVO {

  private int cateno;  

  private int comno;

  private String cate_name;

  private int cate_seqno;

  private String cate_visible;

  private String cate_date;

  private int cate_cnt;

  public int getCateno() {
    return cateno;
  }

  public void setCateno(int cateno) {
    this.cateno = cateno;
  }

  public int getComno() {
    return comno;
  }

  public void setComno(int comno) {
    this.comno = comno;
  }

  public String getCate_name() {
    return cate_name;
  }

  public void setCate_name(String cate_name) {
    this.cate_name = cate_name;
  }

  public int getCate_seqno() {
    return cate_seqno;
  }

  public void setCate_seqno(int cate_seqno) {
    this.cate_seqno = cate_seqno;
  }

  public String getCate_visible() {
    return cate_visible;
  }

  public void setCate_visible(String cate_visible) {
    this.cate_visible = cate_visible;
  }

  public String getCate_date() {
    return cate_date;
  }

  public void setCate_date(String cate_date) {
    this.cate_date = cate_date;
  }

  public int getCate_cnt() {
    return cate_cnt;
  }

  public void setCate_cnt(int cate_cnt) {
    this.cate_cnt = cate_cnt;
  }
}
