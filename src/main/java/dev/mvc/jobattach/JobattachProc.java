package dev.mvc.jobattach;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.jobnws.JobnwsDAOInter;
import dev.mvc.tool.Tool;

@Component("dev.mvc.jobattach.JobattachProc")
public class JobattachProc implements JobattachProcInter {
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private JobattachDAOInter jobattachDAO;
  
  public JobattachProc(){

  }

  @Override
  public int create(JobattachVO jobattachVO) {
    int cnt = this.jobattachDAO.create(jobattachVO);
    
    return cnt;
  }

  @Override
  public List<JobattachVO> list() {
    List<JobattachVO> list= this.jobattachDAO.list();
    return list;
  }
  
  @Override
  public JobattachVO read(int jobattachno) {
    JobattachVO jobattachVO = this.jobattachDAO.read(jobattachno);
    
    return jobattachVO;
  }

  /**
   * 첨부 파일 목록, 파일 용량 단위 출력
   */
  @Override
  public List<JobattachVO> list_by_jobnwsno(int jobnwsno) {
    List<JobattachVO> list = jobattachDAO.list_by_jobnwsno(jobnwsno);
    for (JobattachVO jobattachVO : list) {
      long jobattach_fsize = jobattachVO.getJobattach_fsize();
      String jobattach_flabel = Tool.unit(jobattach_fsize);  // 파일 단위 적용
      jobattachVO.setJobattach_flabel(jobattach_flabel);
    }
    return list;
  }
  
  @Override
  public int delete(int jobattachno) {
    int cnt = this.jobattachDAO.delete(jobattachno);
    return cnt;
    
  }

  @Override
  public int count_by_jobnwsno(int jobnwsno) {
    int cnt = this.jobattachDAO.count_by_jobnwsno(jobnwsno);
    return cnt;
  }

  @Override
  public int delete_by_jobnwsno(int jobnwsno) {
    int cnt = this.jobattachDAO.delete_by_jobnwsno(jobnwsno);
    return cnt;
  }
  
}




