package dev.mvc.jobnws;
 
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

 
@Component("dev.mvc.jobnws.JobnwsProc")
public class JobnwsProc implements JobnwsProcInter {
  
 @Autowired
 private JobnwsDAOInter jobnwsDAO;
  
  public JobnwsProc() {
    System.out.println("--> JobnwsProc created");
  }

  @Override
  public int create(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.create(jobnwsVO);
    return cnt;
  }
  
  @Override
  public List<JobnwsVO> list_jobnwsno_asc() {
    List<JobnwsVO> list = this.jobnwsDAO.list_jobnwsno_asc();
    return list;
  }

  @Override
  public JobnwsVO read(int jobnwsno) {
   JobnwsVO jobnwsVO = this.jobnwsDAO.read(jobnwsno);
   
   String jobnws_title = jobnwsVO.getJobnws_title();
   String jobnws_content = jobnwsVO.getJobnws_content();
   
   jobnws_title = Tool.convertChar(jobnws_title);  // 특수 문자 처리
   jobnws_content = Tool.convertChar(jobnws_content);
   
   jobnwsVO.setJobnws_title(jobnws_title);
   jobnwsVO.setJobnws_content(jobnws_content);
   
    return jobnwsVO;
  }

  @Override
  public int update(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update(jobnwsVO);
    return cnt;
  }

  @Override
  public JobnwsVO read_update(int jobnwsno) {
    JobnwsVO jobnwsVO = this.jobnwsDAO.read(jobnwsno);
    return jobnwsVO;
  }




  @Override
  public int delete(int jobnwsno) {
    int cnt = this.jobnwsDAO.delete(jobnwsno);
    return cnt;
  }

  @Override
  public int delete(JobnwsVO jobnwsVO) {
  int cnt = this.jobnwsDAO.delete(jobnwsVO);
    return cnt;
  }

  @Override
  public int jobnws_passwd_check(HashMap hashMap) {
    int jobnws_passwd_cnt = this.jobnwsDAO.jobnws_passwd_check(hashMap);
    return jobnws_passwd_cnt;
  }

  @Override
  public int update_cnt(int jobnwsno) {
    int cnt = this.jobnwsDAO.update_cnt(jobnwsno);
    return cnt;
  }


  @Override
  public int update_img(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update_img(jobnwsVO);
    return cnt;
  }

  @Override
  public int img_create(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update_img(jobnwsVO);
    return cnt;
  }
  
  @Override
  public int img_delete(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update_img(jobnwsVO);
    return cnt;
  }

}