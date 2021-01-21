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
   * ��õ�� ����
   * @param jobnwsno
   * @return
   */
  public int update_good(int jobnwsno);
  
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
  



 