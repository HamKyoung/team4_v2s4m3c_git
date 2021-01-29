package dev.mvc.surveyitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SurveyitemDAOInter {
  
  /**
   * 등록
   * @param surveyitemVO
   * @return
   */
  public int create(SurveyitemVO surveyitemVO);
  
  /**
   * 목록
   * @return
   */
  public List<SurveyitemVO> list();
  
  /**
   * 조회
   * @param sur_itemno
   * @return
   */
  public SurveyitemVO read(int sur_itemno);
  
  /**
   * 수정
   * @param surveyitemVO
   * @return
   */
  public int update(SurveyitemVO surveyitemVO);
  
  /**
   * 카운트
   * @param surveyitemVO
   * @return
   */
  public int update_cnt(Map map);
  
  /**
   * 삭제
   * @param sur_itemno
   * @return
   */
  public int delete(int sur_itemno);
  
  /**
   * 검색 목록
   * @param hashMap
   * @return
   */
  public List<SurveyitemVO> list_by_search(HashMap<String, Object> hashMap);
  
  /**
   * 검색한 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 부모키별 갯수 산출
   * @param surveyno
   * @return
   */
  public int count_by_surveyno(int surveyno);
  
  /**
   * 부모키를 이용한 모든 레코드 삭제
   * @param surveyno
   * @return
   */
  public int delete_by_surveyno(int surveyno);
}
