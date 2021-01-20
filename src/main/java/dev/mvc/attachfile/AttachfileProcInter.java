package dev.mvc.attachfile;

import java.util.List;

public interface AttachfileProcInter {
  /**
   * ���� ���  
   * @param attachfileVO
   * @return
   */
  public int create(AttachfileVO attachfileVO);
  
  /**
   * ��ü �̹��� ���
   * @return
   */
  public List<AttachfileVO> list();
  
  /**
   * ��ȸ
   * @param attachfileno
   * @return
   */
  public AttachfileVO read(int recruitno);
  
  /**
   * recruitno�� ���� ���� ���
   * @param recruitno
   * @return
   */
  public List<AttachfileVO> list_by_recruitno(int recruitno);
  
  /**
   * ����
   * @param attachfileno
   * @return
   */
  public int delete(int attachfileno);
  
  /**
   * recruitno�� ī��Ʈ
   * @param recruitno
   * @return
   */
  public int count_by_recruitno(int recruitno);

  /**
   * recruitno�� ����
   * @param recruitno
   * @return
   */
  public int delete_by_recruitno(int recruitno);

}