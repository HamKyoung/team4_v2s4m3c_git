package dev.mvc.cormember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cormember.CormemberProc")
public class CormemberProc implements CormemberProcInter {
  @Autowired
  private CormemberDAOInter cormemberDAO;
  
  public CormemberProc() {
    System.out.println("--> CormemberProc created.");
  }

  @Override
  public int create(CormemberVO corVO) {
   int cnt = this.cormemberDAO.create(corVO);
    return cnt;
  }

  @Override
  public List<CormemberVO> list_memberno_asc() {
    List<CormemberVO> list = this.cormemberDAO.list_memberno_asc();
    return list;
  }

  @Override
  public CormemberVO read(int cor_memberno) {
    CormemberVO corVO = this.cormemberDAO.read(cor_memberno);
    return corVO;
  }

  
  @Override
  public int delete(int cor_memberno) {
    int cnt = this.cormemberDAO.delete(cor_memberno);
    return cnt;
  }

  @Override
  public int id_check(String cor_id) {
    int id_check = this.cormemberDAO.id_check(cor_id);
    return id_check;
  }

  @Override
  public int update(CormemberVO corVO) {
    int cnt = this.cormemberDAO.update(corVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashmap) {
    int passwd_cnt = this.cormemberDAO.passwd_check(hashmap);
    return passwd_cnt;
  }

  @Override
  public int update_passwd(CormemberVO corVO) {
    int cnt = this.cormemberDAO.update_passwd(corVO);
    return cnt;
  }

  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.cormemberDAO.login(map);
    return cnt;
  }

  @Override
  public CormemberVO readById(String cor_id) {
    CormemberVO cormemberVO = this.cormemberDAO.readById(cor_id);
    return cormemberVO;
  }
  
  public boolean isMember(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    
    String cor_id = (String)session.getAttribute("cor_id");
    
    if (cor_id != null){
      sw = true;  // 로그인 한 경우
    }
    return sw;
  }  


}
