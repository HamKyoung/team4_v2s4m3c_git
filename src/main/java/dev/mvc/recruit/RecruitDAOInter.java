package dev.mvc.recruit;

import java.util.HashMap;
import java.util.List;


public interface RecruitDAOInter {
  /**
   * 등록
   * @param recruitVO
   * @return
   */
  public int create(RecruitVO recruitVO);
  
  /**
   * 모든 카테고리의 등록된 글목록
   * @return
   */
  public List<RecruitVO> list_all();
  
  /**
   * 특정 카테고리의 등록된 글목록
   * @return
   */
  public List<RecruitVO> list_by_cateno(int cateno);
  
  /**
   * 조회
   * @param recruitno
   * @return
   */
  public RecruitVO read(int recruitno);
  
  /**
   * 수정 처리
   * @param recruitVO
   * @return
   */
  public int update(RecruitVO recruitVO);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  /**
   * 삭제
   * @param contentsno
   * @return
   */
  public int delete(int recruitno);
}
