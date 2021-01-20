package dev.mvc.answer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.answer.AnsProc")
public class AnsProc implements AnsProcInter {
  @Autowired
  private AnsDAOInter ansDAO;
  
  public AnsProc() {
    System.out.println("--> AnsProc created.");
  }

  @Override
  public int create(AnsVO ansVO) {
    int cnt = this.ansDAO.create(ansVO);
    return cnt;
  }
  
  @Override
  public List<AnsVO> list_ans_no_asc() {
    List<AnsVO> list = this.ansDAO.list_ans_no_asc();
    return list;
  }

  @Override
  public AnsVO read(int ans_no) {
    AnsVO ansVO = this.ansDAO.read(ans_no);
    
    String ans_title = ansVO.getAns_title();
    String ans_con = ansVO.getAns_con();
    
    ans_title = Tool.convertChar(ans_title);
    ans_con = Tool.convertChar(ans_con);
    
    ansVO.setAns_title(ans_title);
    ansVO.setAns_con(ans_con);
    
    return ansVO;
  }

  @Override
  public AnsVO read_update(int ans_no) {
    AnsVO ansVO = this.ansDAO.read(ans_no);
    return ansVO;
  }

  @Override
  public int update(AnsVO ansVO) {
    int cnt = this.ansDAO.update(ansVO);
    return cnt;
  }

  @Override
  public int delete(int ans_no) {
    int cnt = this.ansDAO.delete(ans_no);
    return cnt;
  }

  @Override
  public int ans_cnt(int ques_no) {
    int cnt = this.ansDAO.ans_cnt(ques_no);
    return cnt;
  }
  
  
}









