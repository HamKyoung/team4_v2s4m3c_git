package dev.mvc.recruit;

import org.springframework.web.multipart.MultipartFile;

public class RecruitVO {

  private int recruitno;
  private int cateno;
  private int comno;
  private int seqno;

  private String title = "";
  private String content = "";
  private String homepage = "";
  private String visible = "";
  //private int recom;  //추천수
  
  //private String ip = "";
  
  private String passwd = ""; // 패스워드
  
  private String word = ""; //검색어 
  
  private String rdate = ""; //등록 날짜
  
  private String sdate = ""; //접수 시작일
  
  private String edate = ""; //접수 마감일
  
  /** 이미지 */
  private String file1 = ""; // preview 이미지 preview 
  
  private String thumb1 = ""; // 저장된 파일 사이즈
  
  private long size1;
  /**
   이미지 MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
      value='' placeholder="파일 선택" multiple="multiple">*/
  
  private MultipartFile file1MF;
  public int getRecruitno() {
    return recruitno;
  }
  public void setRecruitno(int recruitno) {
    this.recruitno = recruitno;
  }
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
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  } 
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getHomepage() {
    return homepage;
  }
  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getSdate() {
    return sdate;
  }
  public void setSdate(String sdate) {
    this.sdate = sdate;
  }
  public String getEdate() {
    return edate;
  }
  public void setEdate(String edate) {
    this.edate = edate;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  
  
  
}
