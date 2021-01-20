package dev.mvc.comcate;

import java.util.List;

public interface ComCateDAOInter {
  
  /**
   * 등록
   * @param comcateVO
   * @return
   */
  public int create(ComCateVO comcateVO);
  
  /**
   * 목록
   * @return
   */
  public List<ComCateVO> list_cateno_asc();
 
  /**
   * 목록 - 출력순서 정렬
   * @return
   */
  public List<ComCateVO> list_seqno_asc();
  
  /**
   * 카테고리 그룹별 목록
   * @return categrpno 카테고리 그룹 번호
   */
  public List<ComCateVO> list_by_comno(int comno);
  
  /**
   * 조회,수정폼
   * @param cateno 카테고리 번호, PK
   * @return
   */
  public ComCateVO read(int cateno);
  
  /**
   * 수정 처리
   * @param cateVO
   * @return
   */
  public int update(ComCateVO comcateVO);
  
  /**
   * 삭제 처리 
   * @param cateno
   * @return
   */
  public int delete(int cateno);
  
  /**
   * 출력 순서 상향
   * @param cateno
   * @return 처리된 레코드 갯수
   */
  public int  update_seqno_up(int cateno);

  /**
   * 출력 순서 하향
   * @param cateno
   * @return 처리된 레코드 갯수
   */
  public int  update_seqno_down(int cateno); 
  
  /**
   * visible 수정
   * @param comcateVO
   * @return
   */
  public int update_visible(ComCateVO comcateVO);
  

  /**
   *  통합 VO 기반 join
   * @return
   */
  public List<ComIntro_ComCate_join> list_join();  
  
  /**
   * 글 수 증가
   * @return
   */
  public int increaseCnt(int cateno);    

  /**
   * 글 수 감소
   * @return
   */
  public int decreaseCnt(int cateno);

}
