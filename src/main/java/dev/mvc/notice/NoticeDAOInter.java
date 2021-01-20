package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface NoticeDAOInter {
  
  /**
   * 怨듭��ы�� �깅�
   * <insert id="create" parameterType="NoticeVO"> 
   * @param noticeVO
   * @return int
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  /**
   * 怨듭��ы�� 紐⑸�
   * <select id="list_notice_no_asc" resultType="NoticeVO">
   * @return list
   */
  public List<NoticeVO> list_notice_seqno_asc(HashMap<String, Object> map);
  
  /**
   * 怨듭��ы�� 議고��
   * @param notice_no , PK湲곗�
   * @return
   */
  public NoticeVO read(int notice_no);
  
  /**
   * 怨듭��ы�� ����
   *   <update id="update" parameterType="NoticeVO"> 
   * @param noticeVO
   * @return int
   */
  public int update(NoticeVO noticeVO);
  
  /**
   * 怨듭��ы�� �대�몄� ����
   * @param noticeVO
   * @return
   */
  public int update_img(NoticeVO noticeVO);
  
  /**
   * 怨듭��ы�� ����
   *   <delete id="delete" parameterType="int">
   * @param notice_no
   * @return int
   */
  public int delete(int notice_no);
  
  /**
   * �곗������ ����
   * @param notice_no
   * @return int
   */
  public int update_seqno_up(int notice_no);
  
  /**
   * �곗������ ����
   * @param notice_no
   * @return int
   */
  public int update_seqno_down(int notice_no);
  
  /**
   * 異��ν���� 蹂���
   * @param noticeVO
   * @return int
   */
  public int update_visible(NoticeVO noticeVO);

  
  

}
