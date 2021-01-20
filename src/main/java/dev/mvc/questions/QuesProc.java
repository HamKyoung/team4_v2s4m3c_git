package dev.mvc.questions;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.questions.QuesProc")
public class QuesProc implements QuesProcInter{
  @Autowired
  private QuesDAOInter quesDAO;
  
  public QuesProc() {
    System.out.println("--> QuesProc created.");
  }

  /**
   * 吏�臾� �깅�
   * @param quesVO
   * @return
   */
  @Override
  public int create(QuesVO quesVO) {
    int cnt = this.quesDAO.create(quesVO);
    return cnt;
  }
  
  /**
   * 吏�臾� 紐⑸�
   * @return
   */
  @Override
  public List<QuesVO> list_ques_no_desc() {
    List<QuesVO> list = this.quesDAO.list_ques_no_desc();
    return list;
  }

  /**
   * 吏�臾� 議고��
   * @param ques_no
   * @return
   */
  @Override
  public QuesVO read(int ques_no) {
    QuesVO quesVO = this.quesDAO.read(ques_no);
    
    String ques_title = quesVO.getQues_title();
    String ques_con = quesVO.getQues_con();
    
    ques_title = Tool.convertChar(ques_title);
    ques_con = Tool.convertChar(ques_con);
    
    quesVO.setQues_title(ques_title);
    quesVO.setQues_con(ques_con);
    
    return quesVO;
  }
  
  /**
   * 吏�臾� ������ 議고��
   * @param ques_no
   * @return
   */
  @Override
  public QuesVO read_update(int ques_no) {
    QuesVO quesVO = this.quesDAO.read(ques_no);
    return quesVO;
  }

  /**
   * 吏�臾� ����
   * @param quesVO
   * @return
   */
  @Override
  public int update(QuesVO quesVO) {
    int cnt = this.quesDAO.update(quesVO);
    return cnt;
  }

  /**
   * 吏�臾� ����
   * @param ques_no
   * @return
   */
  @Override
  public int delete(int ques_no) {
    int cnt = this.quesDAO.delete(ques_no);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = this.quesDAO.passwd_check(hashMap);
    return passwd_cnt;
  }
  

}







