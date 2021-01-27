package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

public interface EventProcInter {
  
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
   * ������ ��
   * @param eventno
   * @return
   */
  public EventVO read_update(int eventno);

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
   * �̹��� ����
   * @param eventVO
   * @return
   */
  public int delete_img(EventVO eventVO);

  /**
   * ���� ����
   * @param eventVO
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
   * @param eventVO
   * @return
   */
  public int update_img(EventVO eventVO);

  /**
   * ����¡ �ڽ�
   * @param listFile
   * @param search_count
   * @param nowPage
   * @param eve_content
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String eve_content);

}
