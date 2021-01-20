package dev.mvc.surveymember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.surveymember.SurveymemberProc")
public class SurveymemberProc implements SurveymemberProcInter {
  @Autowired
  private SurveymemberDAOInter surveymemberDAO;
  
  public SurveymemberProc() {
    System.out.println("--> SurveyitemProc created.");
  }

  @Override
  public int create(SurveymemberVO surveymemberVO) {
    int cnt = this.surveymemberDAO.create(surveymemberVO);
    return cnt;
  }

  @Override
  public List<Survey_genVO> list() {
    List<Survey_genVO> list = this.surveymemberDAO.list();
    return list;
  }

  @Override
  public SurveymemberVO read(int sur_memberno) {
    SurveymemberVO surveymemberVO = this.surveymemberDAO.read(sur_memberno);
    return surveymemberVO;
  }

  @Override
  public int update(SurveymemberVO surveymemberVO) {
    int cnt = this.surveymemberDAO.update(surveymemberVO);
    return cnt;
  }

  @Override
  public int delete(int sur_memberno) {
    int cnt = this.surveymemberDAO.delete(sur_memberno);
    return cnt;
  }

  
  
}
