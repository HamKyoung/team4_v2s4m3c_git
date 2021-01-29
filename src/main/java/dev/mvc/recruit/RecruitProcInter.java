package dev.mvc.recruit;

import java.util.HashMap;
import java.util.List;

public interface RecruitProcInter {
  /**
   * ���
   * @param recruitVO
   * @return
   */
  public int create(RecruitVO recruitVO);
  
  /**
   * ��� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<RecruitVO> list_all();
  
  /**
   * Ư�� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<RecruitVO> list_by_cateno(int cateno);
  
  /**
   * ��ȸ
   * @param recruitno
   * @return
   */
  public RecruitVO read(int recruitno);
  
  /**
   * ������ ��ȸ
   * @param contentsno
   * @return
   */
  public RecruitVO read_update(int recruitno);
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  public int update(RecruitVO recruitVO);
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  /**
   * ����
   * @param contentsno
   * @return
   */
  public int delete(int recruitno);
  
  /**
   * �̹��� ���
   * @param contentsVO
   * @return
   */
  public int img_create(RecruitVO recruitVO);
  
  /**
   * �̹��� ����
   * @param contentsVO
   * @return
   */
  public int img_update(RecruitVO recruitVO);

  /**
   * �̹��� ����
   * @param contentsVO
   * @return
   */
  public int img_delete(RecruitVO recruitVO);

}
