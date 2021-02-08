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
   * @param jobnwsno
   * @return
   */
  public int update_cnt(int jobnwsno);
 
  
  /**
   * �̹��� ����
   * @param jobnwsVO
   * @return
   */
  public int update_img(JobnwsVO jobnwsVO);
}

