package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

public interface EventDAOInter {

  /**
   * 등록
   * @param EventVO
   * @return
   */
  public int create(EventVO eventVO);
  
  /**
   * 모든 카테고리의 등록된 글목록
   * @return
   */
  public List<EventVO> list();

  /**
   * 조회
   */
  public EventVO read(int eventno);
  
  /**
   * 수정
   * @param EventVO
   * @return
   */      
  public int update(EventVO eventVO);

  /**
   * 삭제
   * @param res_no
   * @return
   */
  public int delete(int eventno);
    
  /**
   * 공개 여부
   * @param EventVO
   * @return
   */
  public int update_visible(EventVO eventVO);

  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * 페이징, 검색
   * @param map
   * @return
   */
  public List<EventVO> list_eventno_seqno_asc(HashMap<String, Object> map);

  /**
   * 이미지 검색
   * @param EventVO
   * @return
   */
  public int update_img(EventVO eventVO);
}
