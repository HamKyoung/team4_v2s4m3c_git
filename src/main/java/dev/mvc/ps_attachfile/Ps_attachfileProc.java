package dev.mvc.ps_attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.ps_attachfile.Ps_attachfileVO;

@Component("dev.mvc.ps_attachfile.Ps_attachfileProc")
public class Ps_attachfileProc implements Ps_attachfileProcInter {
  @Autowired
  private Ps_attachfileDAOInter ps_attachfileDAO;
  
  public Ps_attachfileProc(){
    System.out.println("--> Ps_attachfileProc created.");
  }

  @Override
  public int create(Ps_attachfileVO ps_attachfileVO) {
    int cnt = this.ps_attachfileDAO.create(ps_attachfileVO);
    return cnt;
  }

  @Override
  public List<Ps_attachfileVO> list() {
    List<Ps_attachfileVO> list = this.ps_attachfileDAO.list();
    System.out.println("Proc" + list);
    return list;
  }
  
  @Override
  public List<Ps_attachfileVO> list_by_pass_self_no(int pass_self_no) {
    List<Ps_attachfileVO> list_by_pass_self_no = this.ps_attachfileDAO.list_by_pass_self_no(pass_self_no);
    return list_by_pass_self_no;
  }

  @Override
  public Ps_attachfileVO read(int ps_attachfileno) {
    Ps_attachfileVO ps_attachfileVO = this.ps_attachfileDAO.read(ps_attachfileno);
    return ps_attachfileVO;
  }
  
  @Override
  public int delete(int ps_attachfileno) {
    int cnt = this.ps_attachfileDAO.delete(ps_attachfileno);
    return cnt;
  }

  
  
  
}
