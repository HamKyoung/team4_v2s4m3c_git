package dev.mvc.jobnws;

import java.util.HashMap;
import java.util.List;



public interface JobnwsProcInter {
  
  /**
   * ���
   * @param jobnwsVO
   * @return ��ϵ� ����
   */
  public int create(JobnwsVO jobnwsVO);
  
  /**
   * ���
   * @return list
   */
   public List<JobnwsVO> list_jobnwsno_asc(); 
  
  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public List<JobnwsVO> list_by_jobnwsno_search_paging(HashMap<String, Object> map);
 
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */
  String pagingBox(String listFile, int search_count, int nowPage, String jobnws_title);
  
  /**
   * �˻� + ����¡ ��� + Admin join
   * @param map
   * @return
   */
  public List<Jobnws_AdminVO> list_by_jobnwsno_search_paging_join(HashMap<String, Object> map);
  
  /**
   * ��ȸ, ������
   * @param jobnwsno
   * @return
   */
  public JobnwsVO read(int jobnwsno);
  
  /**
   * ���� ó��
   * @param jobnwsVO
   * @return
   */
  public int update(JobnwsVO jobnwsVO);
  
  /**
   * ������ ��ȸ 
   * @param jobnwsno
   * @return
   */
  public JobnwsVO read_update(int jobnwsno);
    
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int jobnws_passwd_check(HashMap hashMap);
  
  
  /**
   * ����
   * @param jobnwsno
   * @return
   */
  public int delete(int jobnwsno);
  
  /**
   * ���� ó��
   * @param jobnwsVO
   * @return
   */
  public int delete(JobnwsVO jobnwsVO);
  
  /**
   * ��ȸ�� ����
   * @return
   */
  public int increaseCnt(int jobnwsno);    
  
  /**
   * �̹��� ���
   * @param jobnwsVO
   * @return
   */
  public int img_create(JobnwsVO jobnwsVO);
  
  /**
   * �̹��� ����
   * @param jobnwsVO
   * @return
   */
  public int update_img(JobnwsVO jobnwsVO);
  
  /**
   * �̹��� ����
   * @param jobnwsVO
   * @return
   */
  public int img_delete(JobnwsVO jobnwsVO);

}
  



 