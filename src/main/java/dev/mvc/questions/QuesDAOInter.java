package dev.mvc.questions;

import java.util.HashMap;
import java.util.List;

public interface QuesDAOInter {

  /**
   * 질문 등록
   * 
   * @param quesVO
   * @return
   */
  public int create(QuesVO quesVO);

  /**
   * 질문 목록
   * 
   * @return
   */
  public List<QuesVO> list_ques_no_desc();

  /**
   * 질문 조회
   * 
   * @param ques_no
   * @return
   */
  public QuesVO read(int ques_no);

  /**
   * 질문 수정
   * 
   * @param quesVO
   * @return
   */
  public int update(QuesVO quesVO);

  /**
   * 질문 삭제
   * 
   * @param ques_no
   * @return
   */
  public int delete(int ques_no);

  /**
   * 패스워드 체크
   * 
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);

}
