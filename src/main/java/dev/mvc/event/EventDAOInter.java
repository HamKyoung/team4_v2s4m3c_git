package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

public interface EventDAOInter {

  /**
   * ���
   * @param EventVO
   * @return
   */
  public int create(EventVO eventVO);
  
  /**
   * ��� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<EventVO> list();

  /**
   * ��ȸ
   */
  public EventVO read(int eventno);
  
  /**
   * ����
   * @param EventVO
   * @return
   */      
  public int update(EventVO eventVO);

  /**
   * ����
   * @param res_no
   * @return
   */
  public int delete(int eventno);
    
  /**
   * ���� ����
   * @param EventVO
   * @return
   */
  public int update_visible(EventVO eventVO);

  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * ����¡, �˻�
   * @param map
   * @return
   */
  public List<EventVO> list_eventno_seqno_asc(HashMap<String, Object> map);

  /**
   * �̹��� �˻�
   * @param EventVO
   * @return
   */
  public int update_img(EventVO eventVO);
}
