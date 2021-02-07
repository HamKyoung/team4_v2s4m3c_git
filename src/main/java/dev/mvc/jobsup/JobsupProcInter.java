package dev.mvc.jobsup;

import java.util.List;

import dev.mvc.jobnws.JobnwsVO;

public interface JobsupProcInter {
  
  /**
   * 등록
   * @param jobnsupVO
   * @return 등록된 갯수
   */
  public int create(JobsupVO jobsupVO);
  
  /**
   * 목록
   * @return
   */
  public List<JobsupVO> list_jobsupno_asc();
  
  /**
   * 조회, 수정폼
   * @param jobsupno
   * @return
   */
  public JobsupVO read(int jobsupno);
  
  /**
   * 수정 처리
   * @param jobsupVO
   * @return
   */
  public int update(JobsupVO jobsupVO);
  
  /**
   * 수정용 조회 
   * @param jobsupno
   * @return
   */
  public JobsupVO read_update(int jobsupno);
  
  /**
   * 삭제
   * @param jobsupno
   * @return
   */
  public int delete(int jobsupno);
  
  /**
   * 삭제 처리
   * @param jobsupVO
   * @return
   */
  public int delete(JobsupVO jobsupVO);
 
}
  



 