package dev.mvc.jobnws;


import java.util.HashMap;
import java.util.List;




// MyBATIS의 <mapper namespace="dev.mvc.jobnws.JobnwsDAOInter">에 선언 
public interface JobnwsDAOInter {
  // 매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.
  
  /**
   * 등록
   * @param jobnwsVO
   * @return 등록된 갯수
   */
  public int create(JobnwsVO jobnwsVO);
  
  /**
   * 목록
   * @return
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
   * 이미지 변경
   * @param jobnwsVO
   * @return
   */
  public int update_img(JobnwsVO jobnwsVO);
}

