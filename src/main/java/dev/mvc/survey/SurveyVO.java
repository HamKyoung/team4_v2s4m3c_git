package dev.mvc.survey;

import org.springframework.web.multipart.MultipartFile;

//surveyno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
//topic                             VARCHAR2(200)    NOT NULL,
//startdate                         VARCHAR2(10)     NOT NULL,
//enddate                           VARCHAR2(10)     NOT NULL,
//poster                            VARCHAR2(100)    NULL,
//cnt                               NUMBER(7)    NULL ,
//continueyn                        CHAR(1)    NOT NULL

public class SurveyVO {
  /**설문조사 번호*/
  private int surveyno = 0;
  /**설문조사 주제*/
  private String topic = "";
  /**설문조사 시작날짜*/
  private String startdate = "";
  /**설문조사 종료날짜*/
  private String enddate = "";
  /**설문조사 포스터*/
  private String poster = "";
  /**설문조사 참여인원*/
  private int cnt = 0;
  /**설문조사 진행여부*/
  private String continueyn = "";
  
  private MultipartFile posterMF;
  
  
  public int getSurveyno() {
    return surveyno;
  }
  public void setSurveyno(int surveyno) {
    this.surveyno = surveyno;
  }
  public String getTopic() {
    return topic;
  }
  public void setTopic(String topic) {
    this.topic = topic;
  }
  public String getStartdate() {
    return startdate;
  }
  public void setStartdate(String startdate) {
    this.startdate = startdate;
  }
  public String getEnddate() {
    return enddate;
  }
  public void setEnddate(String enddate) {
    this.enddate = enddate;
  }
  public String getPoster() {
    return poster;
  }
  public void setPoster(String poster) {
    this.poster = poster;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getContinueyn() {
    return continueyn;
  }
  public void setContinueyn(String continueyn) {
    this.continueyn = continueyn;
  }
  public MultipartFile getPosterMF() {
    return posterMF;
  }
  public void setPosterMF(MultipartFile posterMF) {
    this.posterMF = posterMF;
  }
  
  
}
