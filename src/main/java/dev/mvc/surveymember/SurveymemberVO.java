package dev.mvc.surveymember;

public class SurveymemberVO {
//  sur_memberno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
//  sur_itemno                        NUMBER(10)     NOT NULL,
//  gen_memberno                      NUMBER(7)    NOT NULL,
//  rdate                             DATE     NOT NULL,

  private int sur_memberno=0;
  private int sur_itemno=0;
  private int gen_memberno=0;
  private String rdate = "";
  
  public int getSur_memberno() {
    return sur_memberno;
  }
  public void setSur_memberno(int sur_memberno) {
    this.sur_memberno = sur_memberno;
  }
  public int getSur_itemno() {
    return sur_itemno;
  }
  public void setSur_itemno(int sur_itemno) {
    this.sur_itemno = sur_itemno;
  }
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
