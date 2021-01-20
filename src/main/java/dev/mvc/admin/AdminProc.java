package dev.mvc.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import dev.mvc.cormember.CormemberDAOInter;

@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {
  @Autowired
  private AdminDAOInter adminDAO;
  
  public AdminProc() {
    System.out.println("--> AdminProc created.");
  }

  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.adminDAO.login(map);
    return cnt;
  }
  
  /**
   * 관리자 인지 검사
   * @param info
   * @param id
   * @return
   */
  @Override
  public boolean admin_check(Map<String, Object> map) {
    boolean sw = false;
    int cnt = adminDAO.login(map);
    if(cnt == 1) {
      sw = true;
    }
    return sw;
  }
  
  /**
   * 현재 로그인된 상태인지 체크
   */
  @Override
  public boolean isAdmin(HttpSession session){
    boolean sw = false;
    
    String id = (String)session.getAttribute("id");
    
    if (id != null){
      sw = true;
    }
    return sw;
  }

  @Override
  public AdminVO readById(String id) {
    AdminVO adminVO = this.adminDAO.readById(id);
    return adminVO;
  }

  




  
}