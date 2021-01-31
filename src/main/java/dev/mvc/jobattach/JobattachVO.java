package dev.mvc.jobattach;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class JobattachVO {
  /*
    jobattachno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
    jobnwsno                   NUMBER(10)         NULL ,
    jobattach_fname                             VARCHAR2(100)         NOT NULL,
    jobattach_fupname                      VARCHAR2(100)         NOT NULL,
    jobattach_thumb                         VARCHAR2(100)         NULL ,
    jobattach_fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
    jobattach_date                           DATE     NOT NULL,
   */
  /** 뉴스파일 번호 */
  private int jobattachno;
  /** 뉴스글 번호(FK) */
  private int jobnwsno;
  /** 원본 파일명 */
  private String jobattach_fname;
  /** 업로드된 파일명 */
  private String jobattach_fupname;
  /** Thumb 이미지 */
  private String jobattach_thumb;
  /** 파일 크기 */
  private long jobattach_fsize;
  /** 등록일 */
  private String jobattach_date;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
  private List<MultipartFile> jobattach_fnamesMF;
  
  // private MultipartFile fnamesMF;  // 하나의 파일 처리
  
  /** 파일 단위 출력 */
  private String jobattach_flabel;

  public int getJobattachno() {
    return jobattachno;
  }

  public void setJobattachno(int jobattachno) {
    this.jobattachno = jobattachno;
  }

  public int getJobnwsno() {
    return jobnwsno;
  }

  public void setJobnwsno(int jobnwsno) {
    this.jobnwsno = jobnwsno;
  }

  public String getJobattach_fname() {
    return jobattach_fname;
  }

  public void setJobattach_fname(String jobattach_fname) {
    this.jobattach_fname = jobattach_fname;
  }

  public String getJobattach_fupname() {
    return jobattach_fupname;
  }

  public void setJobattach_fupname(String jobattach_fupname) {
    this.jobattach_fupname = jobattach_fupname;
  }

  public String getJobattach_thumb() {
    return jobattach_thumb;
  }

  public void setJobattach_thumb(String jobattach_thumb) {
    this.jobattach_thumb = jobattach_thumb;
  }

  public long getJobattach_fsize() {
    return jobattach_fsize;
  }

  public void setJobattach_fsize(long jobattach_fsize) {
    this.jobattach_fsize = jobattach_fsize;
  }

  public String getJobattach_date() {
    return jobattach_date;
  }

  public void setJobattach_date(String jobattach_date) {
    this.jobattach_date = jobattach_date;
  }

  public List<MultipartFile> getJobattach_fnamesMF() {
    return jobattach_fnamesMF;
  }

  public void setJobattach_fnamesMF(List<MultipartFile> jobattach_fnamesMF) {
    this.jobattach_fnamesMF = jobattach_fnamesMF;
  }

  public String getJobattach_flabel() {
    return jobattach_flabel;
  }

  public void setJobattach_flabel(String jobattach_flabel) {
    this.jobattach_flabel = jobattach_flabel;
  }   
  
 
}

