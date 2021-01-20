package dev.mvc.comcate;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.comcate.ComCateProc")
public class ComCateProc implements ComCateProcInter{
  @Autowired
  private ComCateDAOInter comcateDAO;
  
  public ComCateProc() {
    System.out.println("--> ComCateProc created.");
  }

  @Override
  public int create(ComCateVO comcateVO) {
    int cnt =this.comcateDAO.create(comcateVO);
    return cnt;
  }

  @Override
  public List<ComCateVO> list_cateno_asc() {
    List<ComCateVO> list = this.comcateDAO.list_cateno_asc();
    return list;
  }

  @Override
  public List<ComCateVO> list_seqno_asc() {
    List<ComCateVO> list = this.comcateDAO.list_seqno_asc();
    return list;
  }

  @Override
  public List<ComCateVO> list_by_comno(int comno) {
    List<ComCateVO> list =this.comcateDAO.list_by_comno(comno);
    return list;
  }

  @Override
  public ComCateVO read(int cateno) {
    ComCateVO comcateVO = this.comcateDAO.read(cateno);
    return comcateVO;
  }

  @Override
  public int update(ComCateVO comcateVO) {
    int cnt = this.comcateDAO.update(comcateVO);
    return cnt;
  }

  @Override
  public int delete(int cateno) {
    int cnt = this.comcateDAO.delete(cateno);
    return cnt;
  }
  
  @Override
  public int update_seqno_up(int cateno) {
    int cnt = this.comcateDAO.update_seqno_up(cateno);
    return cnt;
  }

  @Override
  public int update_seqno_down(int cateno) {
    int cnt = this.comcateDAO.update_seqno_down(cateno);
    return cnt;
  }
  
  @Override
  public int update_visible(ComCateVO comcateVO) {
    if (comcateVO.getCate_visible().equalsIgnoreCase("Y")) {
      comcateVO.setCate_visible("N");
    } else {
      comcateVO.setCate_visible("Y");
    }
        
    int cnt = this.comcateDAO.update_visible(comcateVO);
    return cnt;
  }

  @Override
  public List<ComIntro_ComCate_join> list_join() {
    List<ComIntro_ComCate_join> list = this.comcateDAO.list_join();
    return list;
  }
  
  @Override
  public int increaseCnt(int cateno) {
    int cnt = this.comcateDAO.increaseCnt(cateno);
    return cnt;
  }

  @Override
  public int decreaseCnt(int cateno) {
    int cnt = this.comcateDAO.decreaseCnt(cateno);
    return cnt;
  }


}
