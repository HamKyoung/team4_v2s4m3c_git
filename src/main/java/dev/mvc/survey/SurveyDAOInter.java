package dev.mvc.survey;

import java.util.HashMap;
import java.util.List;

import dev.mvc.surveyitem.SurveyitemVO;

public interface SurveyDAOInter {
  
  /**
   * 등록
   * @param surveyVO
   * @return
   */
  public int create(SurveyVO surveyVO);
  
  /**
   * 목록
   * @return
   */
  public List<SurveyVO> list();
  
  /**
   * 조회
   * @param surveyno
   * @return
   */
  public SurveyVO read(int surveyno);
  
  /**
   * 수정
   * @param surveyVO
   * @return
   */
  public int update(SurveyVO surveyVO);
  
  /**
   * 삭제
   * @param surveyno
   * @return
   */
  public int delete(int surveyno);
  
  /**
   * 검색 목록
   * @param hashMap
   * @return
   */
  public List<SurveyVO> list_by_search(HashMap<String, Object> hashMap);
  
  /**
   * 검색한 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
}
