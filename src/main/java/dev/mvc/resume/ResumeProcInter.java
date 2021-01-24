package dev.mvc.resume;

import java.util.HashMap;
import java.util.List;

public interface ResumeProcInter {
  
  /**
   * 등록
   * @param resumeVO
   * @return
   */
  public int create(ResumeVO resumeVO);
  
  /**
   * 모든 카테고리의 등록된 글목록
   * @return
   */
  public List<ResumeVO> list();

  /**
   * 조회
   */
  public ResumeVO read(int res_no);
  
  /**
   * 수정용 폼
   * @param res_no
   * @return
   */
  public ResumeVO read_update(int res_no);

  /**
   * 수정
   * @param resumeVO
   * @return
   */      
  public int update(ResumeVO resumeVO);

  /**
   * 삭제
   * @param res_no
   * @return
   */
  public int delete(int res_no);

  /**
   * 이미지 삭제
   * @param resumeVO
   * @return
   */
  public int delete_img(ResumeVO resumeVO);

  /**
   * 공개 여부
   * @param resumeVO
   * @return
   */
  public int update_visible(ResumeVO resumeVO);

  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * 페이징, 검색
   * @param map
   * @return
   */
  public List<ResumeVO> list_resno_seqno_asc(HashMap<String, Object> map);

  /**
   * 이미지 검색
   * @param resumeVO
   * @return
   */
  public int update_img(ResumeVO resumeVO);

  /**
   * 페이징 박스
   * @param listFile
   * @param search_count
   * @param nowPage
   * @param res_work
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String res_work);

}
