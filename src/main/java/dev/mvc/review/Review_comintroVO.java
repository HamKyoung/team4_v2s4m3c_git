package dev.mvc.review;

import java.util.Date;

public class Review_comintroVO {
  private int rev_no; // ¸®ºä ¹øÈ£
  private String com_name="";
  private String rev_title="";
  private int rev_score;
  private String  homepage="";
  
  
  public int getRev_no() {
    return rev_no;
  }
  public void setRev_no(int rev_no) {
    this.rev_no = rev_no;
  }
  public String getCom_name() {
    return com_name;
  }
  public void setCom_name(String com_name) {
    this.com_name = com_name;
  }
  public String getRev_title() {
    return rev_title;
  }
  public void setRev_title(String rev_title) {
    this.rev_title = rev_title;
  }
  public int getRev_score() {
    return rev_score;
  }
  public void setRev_score(int rev_score) {
    this.rev_score = rev_score;
  }
  public String getHomepage() {
    return homepage;
  }
  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }

  
  
  
}
