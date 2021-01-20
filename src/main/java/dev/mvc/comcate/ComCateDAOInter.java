package dev.mvc.comcate;

import java.util.List;

public interface ComCateDAOInter {
  
  /**
   * ���
   * @param comcateVO
   * @return
   */
  public int create(ComCateVO comcateVO);
  
  /**
   * ���
   * @return
   */
  public List<ComCateVO> list_cateno_asc();
 
  /**
   * ��� - ��¼��� ����
   * @return
   */
  public List<ComCateVO> list_seqno_asc();
  
  /**
   * ī�װ� �׷캰 ���
   * @return categrpno ī�װ� �׷� ��ȣ
   */
  public List<ComCateVO> list_by_comno(int comno);
  
  /**
   * ��ȸ,������
   * @param cateno ī�װ� ��ȣ, PK
   * @return
   */
  public ComCateVO read(int cateno);
  
  /**
   * ���� ó��
   * @param cateVO
   * @return
   */
  public int update(ComCateVO comcateVO);
  
  /**
   * ���� ó�� 
   * @param cateno
   * @return
   */
  public int delete(int cateno);
  
  /**
   * ��� ���� ����
   * @param cateno
   * @return ó���� ���ڵ� ����
   */
  public int  update_seqno_up(int cateno);

  /**
   * ��� ���� ����
   * @param cateno
   * @return ó���� ���ڵ� ����
   */
  public int  update_seqno_down(int cateno); 
  
  /**
   * visible ����
   * @param comcateVO
   * @return
   */
  public int update_visible(ComCateVO comcateVO);
  

  /**
   *  ���� VO ��� join
   * @return
   */
  public List<ComIntro_ComCate_join> list_join();  
  
  /**
   * �� �� ����
   * @return
   */
  public int increaseCnt(int cateno);    

  /**
   * �� �� ����
   * @return
   */
  public int decreaseCnt(int cateno);

}
