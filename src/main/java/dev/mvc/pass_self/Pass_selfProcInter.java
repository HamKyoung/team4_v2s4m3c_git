package dev.mvc.pass_self;

import java.util.List;

import dev.mvc.questions.QuesVO;


public interface Pass_selfProcInter {
  
  /**
   * 합격자소서 등록
   * 
   * @param quesVO
   * @return
   */
  public int create(Pass_selfVO pass_selfVO);
  
  /**
   * 합격자소서 목록
   * @param pass_self_no
   * @return
   */
  public List<Pass_selfVO> list();
  
  /**
   * 합격자소서 조회
   * @param 
   * @return
   */
  public Pass_selfVO read(int pass_self_no);
  
  /**
   * 합격자소서 수정용 조회
   * @param ques_no
   * @return
   */
  public Pass_selfVO read_update(int pass_self_no);
  
  /**
   * 합격자소서 수정
   * 
   * @param 
   * @return
   */
  public int update(Pass_selfVO pass_selfVO);

  /**
   * 합격자소서 삭제
   * 
   * @param ques_no
   * @return
   */
  public int delete(int pass_self_no);

}
