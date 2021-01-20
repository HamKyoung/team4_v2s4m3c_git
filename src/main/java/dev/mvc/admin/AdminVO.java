package dev.mvc.admin;

/*
    adminno                     NUMBER(7)    NOT NULL    PRIMARY KEY,
    id                            VARCHAR2(50)     NOT NULL UNIQUE,
    passwd                        VARCHAR2(20)     NOT NULL,
    name                          VARCHAR2(20)     NOT NULL
*/

public class AdminVO {
  /**관리자 번호*/
  private int adminno = 0;
  /**관리자 아이디*/
  private String id ="";
  /**관리자 비밀 번호*/
  private String passwd ="";
  /**관리자 이름*/
  private String name ="";
  
  
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  
}
