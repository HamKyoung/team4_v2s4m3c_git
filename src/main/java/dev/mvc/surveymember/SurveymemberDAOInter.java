package dev.mvc.surveymember;

import java.util.List;

public interface SurveymemberDAOInter {
  
  /**
   * 등록
   * @param surveyitemVO
   * @return
   */
  public int create(SurveymemberVO surveymemberVO);
  
  /**
   * 목록
   * @return
   */
  public List<Survey_genVO> list();
  
  /**
   * 조회
   * @param sur_itemno
   * @return
   */
  public SurveymemberVO read(int sur_memberno);
  
  /**
   * 수정
   * @param surveyitemVO
   * @return
   */
  public int update(SurveymemberVO surveymemberVO);
  
  /**
   * 삭제
   * @param sur_itemno
   * @return
   */
  public int delete(int sur_memberno);
  
  /**
   * 설문조사 참여 체크
   * @param gen_memberno
   * @return
   */
  public int survey_check(int gen_memberno);
}
