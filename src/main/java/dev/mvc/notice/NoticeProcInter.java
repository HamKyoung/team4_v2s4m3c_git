package dev.mvc.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public interface NoticeProcInter {
  
  /**
   * 怨듭��ы�� �깅�
   * <insert id="create" parameterType="NoticeVO"> 
   * @param noticeVO
   * @return int
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * 카테고리별 검색 레코드 갯수
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
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String notice_word);
  
  /**
   * 怨듭��ы�� 議고��
   * @param notice_no , PK湲곗�
   * @return
   */
  public NoticeVO read(int notice_no);
  
  /**
   * ������ 議고��
   * @param notice_no
   * @return
   */
  public NoticeVO read_update(int notice_no);
  
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
  public int delete(int categrp_no);
  
  /**
   * 怨듭��ы�� �대�몄� ����
   * @param noticeVO
   * @return
   */
  public int delete_img(NoticeVO noticeVO);
  
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
