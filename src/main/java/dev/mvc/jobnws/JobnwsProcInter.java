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
   public List<JobnwsVO> list_jobnwsno_asc(); 
  
  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<JobnwsVO> list_by_jobnwsno_search_paging(HashMap<String, Object> map);
 
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param cateno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */
  String pagingBox(String listFile, int search_count, int nowPage, String jobnws_title);
  
  /**
   * 검색 + 페이징 목록 + Admin join
   * @param map
   * @return
   */
  public List<Jobnws_AdminVO> list_by_jobnwsno_search_paging_join(HashMap<String, Object> map);
  
  /**
   * 조회, 수정폼
   * @param jobnwsno
   * @return
   */
  public JobnwsVO read(int jobnwsno);
  
  /**
   * 수정 처리
   * @param jobnwsVO
   * @return
   */
  public int update(JobnwsVO jobnwsVO);
  
  /**
   * 수정용 조회 
   * @param jobnwsno
   * @return
   */
  public JobnwsVO read_update(int jobnwsno);
    
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int jobnws_passwd_check(HashMap hashMap);
  
  
  /**
   * 삭제
   * @param jobnwsno
   * @return
   */
  public int delete(int jobnwsno);
  
  /**
   * 삭제 처리
   * @param jobnwsVO
   * @return
   */
  public int delete(JobnwsVO jobnwsVO);
  
  /**
   * 조회수 증가
   * @return
   */
  public int increaseCnt(int jobnwsno);    
  
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
  



 