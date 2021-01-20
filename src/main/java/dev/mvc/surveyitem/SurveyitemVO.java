package dev.mvc.surveyitem;

import org.springframework.web.multipart.MultipartFile;

/*
sur_itemno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
surveyno                          NUMBER(10)     NOT NULL,
itemseq                           NUMBER(2) DEFAULT 1  NOT NULL,
item                              VARCHAR2(200)    NOT NULL,
itemfile                          VARCHAR2(100)    NULL,
itemcnt                           NUMBER(7) DEFAULT 0  NOT NULL
*/

public class SurveyitemVO {
  /** 설문조사 항목 번호*/
  public int sur_itemno=0;
  /** 설문조사 번호*/
  public int surveyno;
  /** 설문조사 항목 출력 순서*/
  public int itemseq=1;
  /** 설문조사 항목 */
  public String item="";
  /** 설문조사 항목 파일*/
  public String itemfile="";
  /** 설문조사 항목 선택 인원*/
  public int itemcnt=0;
  
  private MultipartFile itemfileMF;
  
  
  public int getSur_itemno() {
    return sur_itemno;
  }
  public void setSur_itemno(int sur_itemno) {
    this.sur_itemno = sur_itemno;
  }
  public int getSurveyno() {
    return surveyno;
  }
  public void setSurveyno(int surveyno) {
    this.surveyno = surveyno;
  }
  public int getItemseq() {
    return itemseq;
  }
  public void setItemseq(int itemseq) {
    this.itemseq = itemseq;
  }
  public String getItem() {
    return item;
  }
  public void setItem(String item) {
    this.item = item;
  }
  public String getItemfile() {
    return itemfile;
  }
  public void setItemfile(String itemfile) {
    this.itemfile = itemfile;
  }
  public int getItemcnt() {
    return itemcnt;
  }
  public void setItemcnt(int itemcnt) {
    this.itemcnt = itemcnt;
  }
  public MultipartFile getItemfileMF() {
    return itemfileMF;
  }
  public void setItemfileMF(MultipartFile itemfileMF) {
    this.itemfileMF = itemfileMF;
  }

  
  
  

}
