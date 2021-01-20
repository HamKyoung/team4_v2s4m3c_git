package dev.mvc.resume;

import java.util.List;

public interface ResumeDAOInter {
  
  /**
   * 등록
   * @param resumeVO
   * @return
   */
  public int create(ResumeVO resumeVO);
  
  /**
   * 모든 카테고리의 등록된 글목록
   * @return
   */
  public List<ResumeVO> list_all();

  /**
   * 조회
   */
  public ResumeVO read(int res_no);


}
