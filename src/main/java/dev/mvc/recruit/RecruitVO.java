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
  //private int recom;  //��õ��
  
  //private String ip = "";
  
  private String passwd = ""; // �н�����
  
  private String word = ""; //�˻��� 
  
  private String rdate = ""; //��� ��¥
  
  private String sdate = ""; //���� ������
  
  private String edate = ""; //���� ������
  
  /** �̹��� */
  private String file1 = ""; // preview �̹��� preview 
  
  private String thumb1 = ""; // ����� ���� ������
  
  private long size1;
  /**
   �̹��� MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
      value='' placeholder="���� ����" multiple="multiple">*/
  
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
