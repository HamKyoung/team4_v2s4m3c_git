package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewDAOInter {
  
  /**
   * ���
   * @return ��ϵ� ����
   */
  public int create (ReviewVO reviewVO); 

  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * ���
   * @return
   */
  public List<ReviewVO> list_rev_no(HashMap<String, Object> map);
  
  /**
   * JOIN ���
   * @return
   */
  public List<Review_comintroVO> list_join();
  
  public List<ReviewVO> list_comno(HashMap<String, Object> map);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String com_name);
  
  /**
   * ��ȸ
   * @return
   */
  public ReviewVO read(int rev_no);
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  public int update(ReviewVO reviewVO);
  
  /**
   * ���� ó�� 
   * @param rev_no
   * @return
   */
  public int delete(int rev_no);




}
