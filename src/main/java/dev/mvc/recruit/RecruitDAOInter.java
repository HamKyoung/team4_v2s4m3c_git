package dev.mvc.recruit;

import java.util.ArrayList;
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
  
  /**
   * 이미지 변경
   * @param recruitVO
   * @return
   */
  public int update_img(RecruitVO recruitVO);
  
  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<RecruitVO> list_by_cateno_search(HashMap<String, Object> hashMap);

  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<RecruitVO>
  list_by_cateno_search_paging(HashMap<String, Object> map);
  
}
