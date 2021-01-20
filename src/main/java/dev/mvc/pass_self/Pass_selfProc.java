package dev.mvc.pass_self;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.pass_self.Pass_selfProc")
public class Pass_selfProc implements Pass_selfProcInter{
  @Autowired
  private Pass_selfDAOInter pass_selfDAO;
  
  public Pass_selfProc() {
    System.out.println("--> Pass_selfProc created.");
  }
  
  @Override
  public int create(Pass_selfVO pass_selfVO) {
    int cnt = this.pass_selfDAO.create(pass_selfVO);
    return cnt;
  }

  @Override
  public List<Pass_selfVO> list() {
    List<Pass_selfVO> list = this.pass_selfDAO.list();
    return list;
  }

  @Override
  public Pass_selfVO read(int pass_self_no) {
    Pass_selfVO pass_selfVO = this.pass_selfDAO.read(pass_self_no);
    return pass_selfVO;
  }
  
  @Override
  public Pass_selfVO read_update(int pass_self_no) {
    Pass_selfVO pass_selfVO = this.pass_selfDAO.read(pass_self_no);
    return pass_selfVO;
  }


  @Override
  public int update(Pass_selfVO pass_selfVO) {
    int cnt = this.pass_selfDAO.update(pass_selfVO);
    return cnt;
  }

  @Override
  public int delete(int pass_self_no) {
    int cnt = this.pass_selfDAO.delete(pass_self_no);
    return cnt;
  }



}











