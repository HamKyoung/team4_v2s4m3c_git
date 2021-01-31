package dev.mvc.jobattach;

import java.util.List;

public interface JobattachDAOInter {
  /**
   * ���� ���  
   * @param jobattachVO
   * @return
   */
  public int create(JobattachVO jobattachVO);
  
  /**
   * ��ü �̹��� ���
   * @return
   */
  public List<JobattachVO> list();
  
  /**
   * ��ȸ
   * @param jobattachno
   * @return
   */
  public JobattachVO read(int jobattachno);
  
  /**
   * jobnwsno�� ���� ���� ���
   * @param jobnwsno
   * @return
   */
  public List<JobattachVO> list_by_jobnwsno(int jobnwsno);
  
  /**
   * ����
   * @param jobattachno
   * @return
   */
  public int delete(int jobattachno);
  
  /**
   * jobnwsno�� ī��Ʈ
   * @param jobnwsno
   * @return
   */
  public int count_by_jobnwsno(int jobnwsno);

  /**
   * jobnwsno�� ����
   * @param jobnwsno
   * @return
   */
  public int delete_by_jobnwsno(int jobnwsno);
  
  
}



