package dev.mvc.recruit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface RecruitProcInter {
  /**
   * 등록
   * @param recruitVO
   * @return
   */
  public int create(RecruitVO recruitVO);
  
  /**
   * 모든 카테고리의 등록된 글목록
   * @return
   */
  public List<RecruitVO> list_all();
  
  /**
   * 특정 카테고리의 등록된 글목록
   * @return
   */
  public List<RecruitVO> list_by_cateno(int cateno);
  
  /**
   * 조회
   * @param recruitno
   * @return
   */
  public RecruitVO read(int recruitno);
  
  /**
   * 수정용 조회
   * @param contentsno
   * @return
   */
  public RecruitVO read_update(int recruitno);
  
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  public int update(RecruitVO recruitVO);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  /**
   * 삭제
   * @param contentsno
   * @return
   */
  public int delete(int recruitno);
  
  /**
   * 이미지 등록
   * @param contentsVO
   * @return
   */
  public int img_create(RecruitVO recruitVO);
  
  /**
   * 이미지 수정
   * @param contentsVO
   * @return
   */
  public int img_update(RecruitVO recruitVO);

  /**
   * 이미지 삭제
   * @param contentsVO
   * @return
   */
  public int img_delete(RecruitVO recruitVO);
  
  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<RecruitVO> list_by_cateno_search(HashMap<String, Object> hashMap);  
    
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> map);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<RecruitVO>
  list_by_cateno_search_paging(HashMap<String, Object> map);

  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int comno, int search_count, int nowPage, String word);



}
