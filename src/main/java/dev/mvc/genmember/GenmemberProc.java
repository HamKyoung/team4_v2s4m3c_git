package dev.mvc.genmember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.cormember.CormemberVO;

@Component("dev.mvc.genmember.GenmemberProc")
public class GenmemberProc implements GenmemberProcInter{
  @Autowired
  private GenmemberDAOInter genmemberDAO;
  
  public GenmemberProc() {
    System.out.println("--> GenmemberProc created.");
  }

  @Override
  public int create(GenmemberVO genVO) {
    int cnt = this.genmemberDAO.create(genVO);
    return cnt;
  }

  @Override
  public List<GenmemberVO> list_memberno_asc() {
    List<GenmemberVO> list = this.genmemberDAO.list_memberno_asc();
    return list;
  }
  
  @Override
  public GenmemberVO read(int gen_memberno) {
    GenmemberVO genVO = this.genmemberDAO.read(gen_memberno);
    return genVO;
  }
  
  @Override
  public int delete(int gen_memberno) {
    int cnt = this.genmemberDAO.delete(gen_memberno);
    return cnt;
  }
  
  @Override
  public int id_check(String gen_id) {
    int id_check = this.genmemberDAO.id_check(gen_id);
    return id_check;
  }

  @Override
  public int update(GenmemberVO genVO) {
    int cnt = this.genmemberDAO.update(genVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = this.genmemberDAO.passwd_check(hashMap);
    return passwd_cnt;
  }
  
  @Override
  public int update_passwd(GenmemberVO genVO) {
    int passwd_cnt = this.genmemberDAO.update_passwd(genVO);
    return passwd_cnt;
  }
  
  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.genmemberDAO.login(map);
    return cnt;
  }

  @Override
  public GenmemberVO readById(String gen_id) {
    GenmemberVO genmemberVO = this.genmemberDAO.readById(gen_id);
    return genmemberVO;
  }
  
  public boolean isMember(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    
    String gen_id = (String)session.getAttribute("gen_id");
    
    if (gen_id != null){
      sw = true;  // 로그인 한 경우
    }
    return sw;
  }  

}
