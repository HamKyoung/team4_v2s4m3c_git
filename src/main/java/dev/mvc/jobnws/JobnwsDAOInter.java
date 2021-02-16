package dev.mvc.jobnws;


import java.util.HashMap;
import java.util.List;




// MyBATIS�� <mapper namespace="dev.mvc.jobnws.JobnwsDAOInter">�� ���� 
public interface JobnwsDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
  
  /**
   * ���
   * @param jobnwsVO
   * @return ��ϵ� ����
   */
  public int create(JobnwsVO jobnwsVO);
  
  /**
   * ���
   * @return
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
   * �̹��� ����
   * @param jobnwsVO
   * @return
   */
  public int update_img(JobnwsVO jobnwsVO);
}

