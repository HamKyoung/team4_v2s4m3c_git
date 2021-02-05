package dev.mvc.jobsup;

import java.util.List;

import dev.mvc.jobnws.JobnwsVO;


// MyBATIS�� <mapper namespace="dev.mvc.jobnws.JobnwsDAOInter">�� ���� 
public interface JobsupDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
  
  /**
   * ���
   * @param jobnsupVO
   * @return ��ϵ� ����
   */
  public int create(JobsupVO jobsupVO);
  
  /**
   * ���
   * @return
   */
  public List<JobsupVO> list_jobsupno_asc();
  
  /**
   * ��ȸ, ������
   * @param jobsupno
   * @return
   */
  public JobsupVO read(int jobsupno);
  
  /**
   * ���� ó��
   * @param jobsupVO
   * @return
   */
  public int update(JobsupVO jobsupVO);
  
  /**
   * ������ ��ȸ 
   * @param jobsupno
   * @return
   */
  public JobsupVO read_update(int jobsupno);
  
  /**
   * ����
   * @param jobsupno
   * @return
   */
  public int delete(int jobsupno);
  
  /**
   * ���� ó��
   * @param jobnwsVO
   * @return
   */
  public int delete(JobnwsVO jobnwsVO);
  
}

