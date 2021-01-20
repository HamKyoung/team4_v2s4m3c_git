package dev.mvc.attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.attachfile.AttachfileProc")
public class AttachfileProc implements AttachfileProcInter {
  @Autowired  // DI, Spring framework�� �ڵ� ������ DAO�� �ڵ� �Ҵ��.
  private AttachfileDAOInter attachfileDAO;
  
  public AttachfileProc(){
    System.out.println("--> AttachfileProc created.");
  }
  
  @Override
  public int create(AttachfileVO attachfileVO) {
    int cnt = this.attachfileDAO.create(attachfileVO);
    return cnt;
  }
  
  @Override
  public List<AttachfileVO> list() {
    List<AttachfileVO> list= this.attachfileDAO.list();
    return list;
  }
  
  @Override
  public AttachfileVO read(int recruitno) {
    AttachfileVO attachfileVO = this.attachfileDAO.read(recruitno);
    return attachfileVO;
  }
  
  /**
   * ÷�� ���� ���, ���� �뷮 ���� ���
   */
  @Override
  public List<AttachfileVO> list_by_recruitno(int recruitno) {
    List<AttachfileVO> list = attachfileDAO.list_by_recruitno(recruitno);
    for (AttachfileVO attachfileVO : list) {
      long fsize = attachfileVO.getFsize();
      String flabel = Tool.unit(fsize);  // ���� ���� ����
      attachfileVO.setFlabel(flabel);
    }
    return list;
  }
  
  @Override
  public int delete(int attachfileno) {
    int cnt = this.attachfileDAO.delete(attachfileno);
    return cnt;
  }
  
  @Override
  public int count_by_recruitno(int recruitno) {
    int cnt = this.attachfileDAO.count_by_recruitno(recruitno);
    return cnt;
  }
  
  @Override
  public int delete_by_recruitno(int recruitno) {
    int cnt = this.attachfileDAO.delete_by_recruitno(recruitno);
    return cnt;
  }
  
}