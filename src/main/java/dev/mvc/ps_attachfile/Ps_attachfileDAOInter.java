package dev.mvc.ps_attachfile;

import java.util.List;


public interface Ps_attachfileDAOInter {

  /**
   * 
   * @param ps_attachfileVO
   * @return
   */
  public int create(Ps_attachfileVO ps_attachfileVO);
  
  /**
   * ��ü ÷������ ���
   * @return
   */
  public List<Ps_attachfileVO> list();
  
  /**
   * �� �� ÷������ ���
   * @return
   */
  public List<Ps_attachfileVO> list_by_pass_self_no(int pass_self_no);
  
  /**
   * ��ȸ
   * @param ps_attachfileno
   * @return
   */
  public Ps_attachfileVO read(int ps_attachfileno);
  
  /**
   * �θ� ���̺� �� ����
   * @param ps_attachfileno
   * @return
   */
  public int delete(int ps_attachfileno);
}