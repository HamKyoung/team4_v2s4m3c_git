package dev.mvc.jobsup;

import java.util.List;


// MyBATIS의 <mapper namespace="dev.mvc.jobnws.JobnwsDAOInter">에 선언 
public interface JobsupDAOInter {
  // 매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.
  
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
  
}

