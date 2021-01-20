package dev.mvc.comintro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.comintro.ComIntroProc")
public class ComIntroProc implements ComIntroProcInter{
  @Autowired
  private ComIntroDAOInter comintroDAO;
  
  public ComIntroProc() {
    System.out.println("--> ComIntroProc created.");
  }

  @Override
  public int create(ComIntroVO comIntroVO) {
    int cnt =this.comintroDAO.create(comIntroVO);
    return cnt;
  }

  @Override
  public List<ComIntroVO> list_all() {
    List<ComIntroVO> list = this.comintroDAO.list_all();
    return list;
  }

  @Override
  public ComIntroVO read(int comno) {
    ComIntroVO comintroVO = this.comintroDAO.read(comno);
    return comintroVO;
  }

  
  @Override
  public int update(ComIntroVO comintroVO) {
    int cnt = this.comintroDAO.update(comintroVO);
    return cnt;
  }
  
  @Override
  public int delete(int comno) {
    int cnt = this.comintroDAO.delete(comno);
    return cnt;
  }

  @Override
  public int update_visible(ComIntroVO comintroVO) {
    if (comintroVO.getVisible().equalsIgnoreCase("Y")) {
      comintroVO.setVisible("N");
    } else {
      comintroVO.setVisible("Y");
    }
    
    int cnt = this.comintroDAO.update_visible(comintroVO);
    return cnt;
  }

  @Override
  public List<ComIntroVO> list_seqno_asc() {
    List<ComIntroVO> list = this.comintroDAO.list_seqno_asc();
    return null;
  }
 

}
