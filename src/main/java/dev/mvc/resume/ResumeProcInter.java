package dev.mvc.resume;

import java.util.HashMap;
import java.util.List;

public interface ResumeProcInter {
  
  /**
   * ���
   * @param resumeVO
   * @return
   */
  public int create(ResumeVO resumeVO);
  
  /**
   * ��� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<ResumeVO> list();

  /**
   * ��ȸ
   */
  public ResumeVO read(int res_no);
  
  /**
   * ������ ��
   * @param res_no
   * @return
   */
  public ResumeVO read_update(int res_no);

  /**
   * ����
   * @param resumeVO
   * @return
   */      
  public int update(ResumeVO resumeVO);

  /**
   * ����
   * @param res_no
   * @return
   */
  public int delete(int res_no);

  /**
   * �̹��� ����
   * @param resumeVO
   * @return
   */
  public int delete_img(ResumeVO resumeVO);

  /**
   * ���� ����
   * @param resumeVO
   * @return
   */
  public int update_visible(ResumeVO resumeVO);

  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * ����¡, �˻�
   * @param map
   * @return
   */
  public List<ResumeVO> list_resno_seqno_asc(HashMap<String, Object> map);

  /**
   * �̹��� �˻�
   * @param resumeVO
   * @return
   */
  public int update_img(ResumeVO resumeVO);

  /**
   * ����¡ �ڽ�
   * @param listFile
   * @param search_count
   * @param nowPage
   * @param res_work
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String res_work);

}
