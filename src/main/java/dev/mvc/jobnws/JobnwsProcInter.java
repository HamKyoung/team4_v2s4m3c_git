package dev.mvc.jobnws;

import java.util.HashMap;
import java.util.List;



public interface JobnwsProcInter {
  
  /**
   * 등록
   * @param jobnwsVO
   * @return 등록된 갯수
   */
  public int create(JobnwsVO jobnwsVO);
  
  /**
   * 목록
   * @return list
   */
  public List<JobnwsVO> list_newsno_asc();
  
  /**
   * 조회, 수정폼
   * @param jobnwsno
   * @return
   */
  public JobnwsVO read(int newsno);
  
  /**
   * 수정 처리
   * @param jobnwsVO
   * @return
   */
  public int update(JobnwsVO jobnwsVO);
  
  /**
   * 수정용 조회 
   * @param newsno
   * @return
   */
  public JobnwsVO read_update(int newsno);
    
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int news_passwd_check(HashMap hashMap);
  
  
  /**
   * 삭제
   * @param newsno
   * @return
   */
  public int delete(int newsno);
  
  /**
   * 삭제 처리
   * @param jobnwsVO
   * @return
   */
  public int delete(JobnwsVO jobnwsVO);
  
  /**
   * 조회수 증가
   * @param newsno
   * @return
   */
  public int update_cnt(int newsno);
  
  /**
   * 추천수 증가
   * @param newsno
   * @return
   */
  public int update_good(int newsno);
  
  /**
   * 이미지 등록
   * @param jobnwsVO
   * @return
   */
  public int img_create(JobnwsVO jobnwsVO);
  
  /**
   * 이미지 변경
   * @param jobnwsVO
   * @return
   */
  public int update_img(JobnwsVO jobnwsVO);
  
  /**
   * 이미지 삭제
   * @param jobnwsVO
   * @return
   */
  public int img_delete(JobnwsVO jobnwsVO);
  

}
  



 