package dev.mvc.recruit;

import java.util.ArrayList;
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
  
  /**
   * ī�װ��� �˻� ���
   * @param hashMap
   * @return
   */
  public List<RecruitVO> list_by_cateno_search(HashMap<String, Object> hashMap);  
    
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> map);
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public List<RecruitVO>
  list_by_cateno_search_paging(HashMap<String, Object> map);

  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int comno, int search_count, int nowPage, String word);



}
