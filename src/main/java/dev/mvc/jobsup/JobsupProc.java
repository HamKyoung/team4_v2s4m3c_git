package dev.mvc.jobsup;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.jobnws.JobnwsVO;

@Component("dev.mvc.jobsup.JobsupProc")
public class JobsupProc implements JobsupProcInter {
  
 @Autowired
 private JobsupDAOInter jobsupDAO;
  
  public JobsupProc() {
    System.out.println("--> JobnwsProc created");
  }

  @Override
  public int create(JobsupVO jobsupVO) {
    int cnt = this.jobsupDAO.create(jobsupVO);
    return cnt;
  }

  @Override
  public List<JobsupVO> list_jobsupno_asc() {
    List<JobsupVO> list = this.jobsupDAO.list_jobsupno_asc();
    return list;
  }

  @Override
  public JobsupVO read(int jobsupno) {
    JobsupVO jobsupVO = this.jobsupDAO.read(jobsupno);
    return jobsupVO;
  }

  @Override
  public int update(JobsupVO jobsupVO) {
    int cnt = this.jobsupDAO.update(jobsupVO);
    return cnt;
  }

  @Override
  public JobsupVO read_update(int jobsupno) {
    JobsupVO jobsupVO = this.jobsupDAO.read(jobsupno);
    return jobsupVO;
  }

  @Override
  public int delete(int jobsupno) {
    int cnt = this.jobsupDAO.delete(jobsupno);
    return cnt;
  }

  @Override
  public int delete(JobsupVO jobsupVO) {
    int cnt = this.jobsupDAO.delete(jobsupVO);
    return cnt;
  }
  
  
}