package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewDAOInter {
  
  /**
   * 등록
   * @return 등록된 갯수
   */
  public int create (ReviewVO reviewVO); 
  
  /**
   * 목록
   * @return
   */
  public List<ReviewVO> list_rev_no();
  
  public List<ReviewVO> list_comno(HashMap<String, Object> map);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int rev_no, int search_count, int nowPage, String word);

  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 조회
   * @return
   */
  public ReviewVO read(int rev_no);
  
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  public int update(ReviewVO reviewVO);
  
  /**
   * 삭제 처리 
   * @param rev_no
   * @return
   */
  public int delete(int rev_no);




}
