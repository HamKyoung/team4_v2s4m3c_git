package dev.mvc.ps_attachfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Ps_attachfileVO {
  
//  ps_attachfileno                   NUMBER(10)     NOT NULL    PRIMARY KEY,
//  pass_self_no                      NUMBER(7)    NOT NULL,
//  ps_fname                          VARCHAR2(100)    NOT NULL,
//  ps_upname                         VARCHAR2(100)    NOT NULL,
//  ps_thumb                          VARCHAR2(100)    NULL ,
//  ps_fsize                          NUMBER(10)     NOT NULL,
//  ps_rdate                          DATE     NOT NULL,

  private int ps_attachfileno;
  private int pass_self_no;
  private String ps_fname;
  private String ps_upname;
  private String ps_thumb;
  private long ps_fsize;
  private String ps_rdate;
  
  private List<MultipartFile> fnamesMF;
  
  private String flabel;

  public int getPs_attachfileno() {
    return ps_attachfileno;
  }

  public void setPs_attachfileno(int ps_attachfileno) {
    this.ps_attachfileno = ps_attachfileno;
  }

  public int getPass_self_no() {
    return pass_self_no;
  }

  public void setPass_self_no(int pass_self_no) {
    this.pass_self_no = pass_self_no;
  }

  public String getPs_fname() {
    return ps_fname;
  }

  public void setPs_fname(String ps_fname) {
    this.ps_fname = ps_fname;
  }

  public String getPs_upname() {
    return ps_upname;
  }

  public void setPs_upname(String ps_upname) {
    this.ps_upname = ps_upname;
  }

  public String getPs_thumb() {
    return ps_thumb;
  }

  public void setPs_thumb(String ps_thumb) {
    this.ps_thumb = ps_thumb;
  }

  public long getPs_fsize() {
    return ps_fsize;
  }

  public void setPs_fsize(long ps_fsize) {
    this.ps_fsize = ps_fsize;
  }

  public String getPs_rdate() {
    return ps_rdate;
  }

  public void setPs_rdate(String ps_rdate) {
    this.ps_rdate = ps_rdate;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

  public String getFlabel() {
    return flabel;
  }

  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }   
  
  
  
}








