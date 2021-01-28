package dev.mvc.comintro;

/*
CREATE TABLE COM_INTRO(
    COMNO                             NUMBER(7)    NOT NULL    PRIMARY KEY,
    COR_MEMBERNO                      NUMBER(7)    NULL ,
    COM_NAME                          VARCHAR2(1000)     NOT NULL,
    COM_FORM                          VARCHAR2(1000)     NOT NULL,
    COM_TYPE                          VARCHAR2(1000)     NOT NULL,
    SALES                             VARCHAR2(50)     NOT NULL,
    HOMEPAGE                          VARCHAR2(1000)     NOT NULL,
    ADDRESS                           VARCHAR2(1000)     NOT NULL,
    NUM_PEOPLE                        VARCHAR2(50)     NOT NULL,
    EDATE                             VARCHAR2(500)    NOT NULL,
    CEO_NAME                         VARCHAR2(1000)    NOT NULL,
    VISIBLE                           CHAR(1)   DEFAULT 'Y'  NOT NULL,
        FOREIGN KEY (COR_MEMBERNO) REFERENCES  corporate_member(COR_MEMBERNO)
);
*/
public class ComIntroVO {

  private int comno;
  private int  cor_memberno;
  private String  com_name="";
  private String  com_form="";
  private String  com_type="";
  private String  sales="";
  private String  homepage="";
  private String  address="";
  private String  num_people="";
  private String  edate="";
  private String  ceo_name="";
  private String visible = "";
  

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
  public String getCom_name() {
    return com_name;
  }
  public void setCom_name(String com_name) {
    this.com_name = com_name;
  }
  public String getCom_form() {
    return com_form;
  }
  public void setCom_form(String com_form) {
    this.com_form = com_form;
  }
  public String getCom_type() {
    return com_type;
  }
  public void setCom_type(String com_type) {
    this.com_type = com_type;
  }
  public String getSales() {
    return sales;
  }
  public void setSales(String sales) {
    this.sales = sales;
  }
  public String getHomepage() {
    return homepage;
  }
  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
  public String getNum_people() {
    return num_people;
  }
  public void setNum_people(String num_people) {
    this.num_people = num_people;
  }
  public String getEdate() {
    return edate;
  }
  public void setEdate(String edate) {
    this.edate = edate;
  }
  public String getCeo_name() {
    return ceo_name;
  }
  public void setCeo_name(String ceo_name) {
    this.ceo_name = ceo_name;
  }  
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  
}
