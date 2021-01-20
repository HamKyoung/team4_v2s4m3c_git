package dev.mvc.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface AdminDAOInter {
  
  /**
   * 관리자인지 검사
   * @param session
   * @return
   */
  public boolean isAdmin(HttpSession session);
  
  /**
   * 관리자 로그인
   * @param map
   * @return
   */
  public int login(Map<String, Object> map);
  
  /**
   * 관리자 정보 조회
   * @param id
   * @return
   */
  public AdminVO readById(String id);
    
}