package dev.mvc.comintro;

import java.util.List;

import dev.mvc.comintro.ComIntroVO;

public interface ComIntroDAOInter {
  
  /**
   * ���
   * @param comIntroVO
   * @return
   */
  public int create(ComIntroVO comIntroVO);
  
  /**
   * ���
   * @return
   */
  public List<ComIntroVO> list_all();
  
 /**
  * ��ȸ
  * @param comno
  * @return
  */
  public ComIntroVO read(int comno);
  
  
  /**
   * ���� ó��
   * @param comintroVO
   * @return
   */
  public int update(ComIntroVO comintroVO);
  
  /**
   * ���� ó�� 
   * @param comno
   * @return
   */
  public int delete(int comno);
  
  
  /**
   * visible ����
   * @param comintroVO
   * @return
   */
  public int update_visible(ComIntroVO comintroVO);
  
  /**
   * ���
   * @return
   */
  public List<ComIntroVO> list_seqno_asc();

}
