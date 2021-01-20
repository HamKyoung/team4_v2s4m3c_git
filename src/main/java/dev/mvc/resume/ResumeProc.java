package dev.mvc.resume;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;



@Component("dev.mvc.resume.ResumeProc")
public class ResumeProc implements ResumeProcInter{
  @Autowired
  private ResumeDAOInter resumeDAO;

  @Override
  public int create(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.create(resumeVO);
    return cnt;
  }

  @Override
  public List<ResumeVO> list_all() {
    List<ResumeVO> list = this.resumeDAO.list_all();
    return list;
  }

  @Override
  public ResumeVO read(int res_no) {
    ResumeVO resumeVO = this.resumeDAO.read(res_no);
    
    String res_intro = resumeVO.getRes_intro();
    String res_work = resumeVO.getRes_work();
    
    res_intro = Tool.convertChar(res_intro);  // 특수 문자 처리
    res_work = Tool.convertChar(res_work);
    
    resumeVO.setRes_intro(res_intro);
    resumeVO.setRes_work(res_work);
    
    return resumeVO;
  }

}
