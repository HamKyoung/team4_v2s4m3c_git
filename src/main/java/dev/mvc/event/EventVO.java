package dev.mvc.event;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/*CREATE TABLE event(
    eventno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    eve_title                         VARCHAR2(80)     NOT NULL,
    eve_content                       VARCHAR2(800)    NOT NULL,
    eve_visible                       CHAR(1)    NOT NULL,
    eve_date                          DATE     NOT NULL,
    eve_pic                           VARCHAR2(500)    NULL ,
    eve_thumb                         VARCHAR2(100)    NULL ,
    eve_size                          NUMBER(10)     NULL 
*/

public class EventVO {
  private int eventno; // ¸®ºä ¹øÈ£
  private String eve_title="";
  private String eve_content="";
  private String eve_visible="";
  private String eve_date;
  private String eve_pic;
  private String eve_thumb;
  private long eve_size;
  private MultipartFile eve_picMF;
  public int getEventno() {
    return eventno;
  }
  public void setEventno(int eventno) {
    this.eventno = eventno;
  }
  public String getEve_title() {
    return eve_title;
  }
  public void setEve_title(String eve_title) {
    this.eve_title = eve_title;
  }
  public String getEve_content() {
    return eve_content;
  }
  public void setEve_content(String eve_content) {
    this.eve_content = eve_content;
  }
  public String getEve_visible() {
    return eve_visible;
  }
  public void setEve_visible(String eve_visible) {
    this.eve_visible = eve_visible;
  }
  public String getEve_date() {
    return eve_date;
  }
  public void setEve_date(String eve_date) {
    this.eve_date = eve_date;
  }
  public String getEve_pic() {
    return eve_pic;
  }
  public void setEve_pic(String eve_pic) {
    this.eve_pic = eve_pic;
  }
  public String getEve_thumb() {
    return eve_thumb;
  }
  public void setEve_thumb(String eve_thumb) {
    this.eve_thumb = eve_thumb;
  }
  public long getEve_size() {
    return eve_size;
  }
  public void setEve_size(long eve_size) {
    this.eve_size = eve_size;
  }
  public MultipartFile getEve_picMF() {
    return eve_picMF;
  }
  public void setEve_picMF(MultipartFile eve_picMF) {
    this.eve_picMF = eve_picMF;
  }
  
  
  

  
  
}
