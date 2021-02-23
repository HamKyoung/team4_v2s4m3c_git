package dev.mvc.recruit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface RecruitDAOInter {
  /**
   * ���
   * @param recruitVO
   * @return
   */
  public int create(RecruitVO recruitVO);
  
  /**
   * ��� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<RecruitVO> list_all();
  
  /**
   * Ư�� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<RecruitVO> list_by_cateno(int cateno);
  
  /**
   * ��ȸ
   * @param recruitno
   * @return
   */
  public RecruitVO read(int recruitno);
  
  /**
   * ���� ó��
   * @param recruitVO
   * @return
   */
  public int update(RecruitVO recruitVO);
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  /**
   * ����
   * @param contentsno
   * @return
   */
  public int delete(int recruitno);
  
  /**
   * �̹��� ����
   * @param recruitVO
   * @return
   */
  public int update_img(RecruitVO recruitVO);
  
  /**
   * ī�װ��� �˻� ���
   * @param hashMap
   * @return
   */
  public List<RecruitVO> list_by_cateno_search(HashMap<String, Object> hashMap);

  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public ArrayList<RecruitVO>
  list_by_cateno_search_paging(HashMap<String, Object> map);
  
}
