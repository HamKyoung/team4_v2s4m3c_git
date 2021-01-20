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
  public List<JobnwsVO> list_newsno_asc();
  
  /**
   * ��ȸ, ������
   * @param jobnwsno
   * @return
   */
  public JobnwsVO read(int newsno);
  
  /**
   * ���� ó��
   * @param jobnwsVO
   * @return
   */
  public int update(JobnwsVO jobnwsVO);
  
  /**
   * ������ ��ȸ 
   * @param newsno
   * @return
   */
  public JobnwsVO read_update(int newsno);
    
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int news_passwd_check(HashMap hashMap);
  
  
  /**
   * ����
   * @param newsno
   * @return
   */
  public int delete(int newsno);
  
  /**
   * ���� ó��
   * @param jobnwsVO
   * @return
   */
  public int delete(JobnwsVO jobnwsVO);
  
  /**
   * ��ȸ�� ����
   * @param newsno
   * @return
   */
  public int update_cnt(int newsno);
  
  /**
   * ��õ�� ����
   * @param newsno
   * @return
   */
  public int update_good(int newsno);
  
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
  



 