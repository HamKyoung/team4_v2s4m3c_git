package dev.mvc.jobsup;

/*
jobsupno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
gen_memberno                      NUMBER(7)    NOT NULL ,
comno                           NUMBER(10)     NOT NULL ,
jobsup_title                      VARCHAR2(300)    NOT NULL,
jobsup_msg                        VARCHAR2(1000)     NOT NULL,
jobsup_date                       DATE     NOT NULL,
*/

public class JobsupVO {
  /** ���� ��û ��ȣ */
  private int jobsupno;
  /** ȸ�� ��ȣ */
  private int gen_memberno;
  /** ȸ�� �Ұ� ��ȣ */
  private int comno;
  /** ���� ���� */
  private String jobsup_title = "";
  /** ���� �޼��� */
  private String jobsup_msg = "";
  /** ���� ����� */
  private String jobsup_date = "";
  public int getJobsupno() {
    return jobsupno;
  }
  public void setJobsupno(int jobsupno) {
    this.jobsupno = jobsupno;
  }
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }
  public int getComno() {
    return comno;
  }
  public void setComno(int comno) {
    this.comno = comno;
  }
  public String getJobsup_title() {
    return jobsup_title;
  }
  public void setJobsup_title(String jobsup_title) {
    this.jobsup_title = jobsup_title;
  }
  public String getJobsup_msg() {
    return jobsup_msg;
  }
  public void setJobsup_msg(String jobsup_msg) {
    this.jobsup_msg = jobsup_msg;
  }
  public String getJobsup_date() {
    return jobsup_date;
  }
  public void setJobsup_date(String jobsup_date) {
    this.jobsup_date = jobsup_date;
  }
  
}
