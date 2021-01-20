package dev.mvc.answer;

import java.util.List;

public interface AnsDAOInter {
  
  /**
   * 답변 등록
   * @param ansVO
   * @return
   */
  public int create(AnsVO ansVO);
  
  /**
   * 답변 목록
   * @return
   */
  public List<AnsVO> list_ans_no_asc();
  
  /**
   * 답변 조회
   * @param ans_no
   * @return
   */
  public AnsVO read(int ans_no);
  
  /**
   * 답변 수정
   * @param ans_no
   * @return
   */
  public int update(AnsVO ansVO);

  /**
   * 답변 삭제
   * @param ansVO
   * @return
   */
  public int delete(int ans_no);
  
  /**
   * 
   * @param ques_no
   * @return
   */
  public int ans_cnt(int ques_no);
}









