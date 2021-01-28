package dev.mvc.jobsup;

/*
    jobsupno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    recruitno                             NUMBER(10)     NOT NULL,
    gen_memberno                    NUMBER(7)    NOT NULL,  
    res_no                                NUMBER(10)     NOT NULL,
    jobsup_title                      VARCHAR2(300)    NOT NULL,
    jobsup_msg                        VARCHAR2(1000)     NOT NULL,
    jobsup_date                       DATE     NOT NULL,
*/

public class JobsupVO {
  /** 구직 신청 번호 */
  private int jobsupno;
  /** 채용 번호 */
  private int recruitno;
  /** 회원 번호 */
  private int gen_memberno;
  /** 이력서 번호 */
  private int res_no;
  /** 지원 제목 */
  private String jobsup_title = "";
  /** 지원 메세지 */
  private String jobsup_msg = "";
  /** 지원 등록일 */
  private String jobsup_date = "";
  public int getJobsupno() {
    return jobsupno;
  }
  public void setJobsupno(int jobsupno) {
    this.jobsupno = jobsupno;
  }
  public int getRecruitno() {
    return recruitno;
  }
  public void setRecruitno(int recruitno) {
    this.recruitno = recruitno;
  }
  public int getGen_memberno() {
    return gen_memberno;
  }
  public void setGen_memberno(int gen_memberno) {
    this.gen_memberno = gen_memberno;
  }
  public int getRes_no() {
    return res_no;
  }
  public void setRes_no(int res_no) {
    this.res_no = res_no;
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
