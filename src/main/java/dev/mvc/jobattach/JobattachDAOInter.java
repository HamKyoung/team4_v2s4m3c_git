package dev.mvc.jobattach;

import java.util.List;

public interface JobattachDAOInter {
  /**
   * 파일 등록  
   * @param jobattachVO
   * @return
   */
  public int create(JobattachVO jobattachVO);
  
  /**
   * 전체 이미지 목록
   * @return
   */
  public List<JobattachVO> list();
  
  /**
   * 조회
   * @param jobattachno
   * @return
   */
  public JobattachVO read(int jobattachno);
  
  /**
   * jobnwsno에 따른 파일 목록
   * @param jobnwsno
   * @return
   */
  public List<JobattachVO> list_by_jobnwsno(int jobnwsno);
  
  /**
   * 삭제
   * @param jobattachno
   * @return
   */
  public int delete(int jobattachno);
  
  /**
   * jobnwsno별 카운트
   * @param jobnwsno
   * @return
   */
  public int count_by_jobnwsno(int jobnwsno);

  /**
   * jobnwsno별 삭제
   * @param jobnwsno
   * @return
   */
  public int delete_by_jobnwsno(int jobnwsno);
  
  
}



