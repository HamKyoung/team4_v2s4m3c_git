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
  public List<JobnwsVO> list_newsno_asc() {
    List<JobnwsVO> list = this.jobnwsDAO.list_newsno_asc();
    return list;
  }

  @Override
  public JobnwsVO read(int newsno) {
   JobnwsVO jobnwsVO = this.jobnwsDAO.read(newsno);
   
   String news_title = jobnwsVO.getNews_title();
   String news_content = jobnwsVO.getNews_content();
   
   news_title = Tool.convertChar(news_title);  // 특수 문자 처리
   news_content = Tool.convertChar(news_content);
   
   jobnwsVO.setNews_title(news_title);
   jobnwsVO.setNews_content(news_content);
   
    return jobnwsVO;
  }

  @Override
  public int update(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update(jobnwsVO);
    return cnt;
  }

  @Override
  public JobnwsVO read_update(int newsno) {
    JobnwsVO jobnwsVO = this.jobnwsDAO.read(newsno);
    return jobnwsVO;
  }




  @Override
  public int delete(int newsno) {
    int cnt = this.jobnwsDAO.delete(newsno);
    return cnt;
  }

  @Override
  public int delete(JobnwsVO jobnwsVO) {
  int cnt = this.jobnwsDAO.delete(jobnwsVO);
    return cnt;
  }

  @Override
  public int news_passwd_check(HashMap hashMap) {
    int news_passwd_cnt = this.jobnwsDAO.news_passwd_check(hashMap);
    return news_passwd_cnt;
  }

  @Override
  public int update_cnt(int newsno) {
    int cnt = this.jobnwsDAO.update_cnt(newsno);
    return cnt;
  }

  @Override
  public int update_good(int newsno) {
    int cnt = this.jobnwsDAO.update_good(newsno);
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