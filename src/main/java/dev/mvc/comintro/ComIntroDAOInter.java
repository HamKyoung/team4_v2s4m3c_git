package dev.mvc.comintro;

import java.util.List;

import dev.mvc.comintro.ComIntroVO;

public interface ComIntroDAOInter {
  
  /**
   * 등록
   * @param comIntroVO
   * @return
   */
  public int create(ComIntroVO comIntroVO);
  
  /**
   * 목록
   * @return
   */
  public List<ComIntroVO> list_all();
  
 /**
  * 조회
  * @param comno
  * @return
  */
  public ComIntroVO read(int comno);
  
  
  /**
   * 수정 처리
   * @param comintroVO
   * @return
   */
  public int update(ComIntroVO comintroVO);
  
  /**
   * 삭제 처리 
   * @param comno
   * @return
   */
  public int delete(int comno);
  
  
  /**
   * visible 수정
   * @param comintroVO
   * @return
   */
  public int update_visible(ComIntroVO comintroVO);
  
  /**
   * 목록
   * @return
   */
  public List<ComIntroVO> list_seqno_asc();

}
