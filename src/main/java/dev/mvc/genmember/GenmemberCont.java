package dev.mvc.genmember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProc;
import dev.mvc.cormember.CormemberVO;


@Controller
public class GenmemberCont {
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProc adminProc;
  
  public GenmemberCont() {
    System.out.println("--> GenmemberCont created.");
  }
  
  /**
   * ID 중복 체크, JSON 출력
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/genmember/checkID.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String checkID(String gen_id) {
    int cnt = this.genmemberProc.id_check(gen_id);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  
  /**
   * 일반 회원 등록 http://localhost:9090/team4/genmember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/create"); // /webapp/team4/genmember/create.jsp

    return mav; // forward
  }
  
  /**
   * 회원 등록 처리 http://localhost:9090/team4/genmember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/create.do", method = RequestMethod.POST)
  public ModelAndView create(GenmemberVO genVO, HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/create_msg"); // /webapp/genmember/create_msg.jsp

    int id_check = this.genmemberProc.id_check(genVO.getGen_id());

    if (id_check >= 1) {
      mav.setViewName("/genmember/id_check"); // /webapp/team4/genmember/create.jsp
      mav.addObject("id_check", id_check);
    } else {
      int cnt = this.genmemberProc.create(genVO);
      mav.addObject("cnt", cnt);
    }
    return mav; // forward
  }

  /**
   * 일반 회원 목록 http://localhost:9090/team4/genmember/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<GenmemberVO> list = genmemberProc.list_memberno_asc();
      
      mav.addObject("list", list);
      mav.setViewName("/genmember/list"); // /webapp/genmember/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   * 회원 조회 http://localhost:9090/team4/genmember/read.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/read.do", method = RequestMethod.GET)
  public ModelAndView read(int gen_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/read"); // /webapp/genmember/read.jsp

    GenmemberVO genVO = this.genmemberProc.read(gen_memberno);
    mav.addObject("genVO", genVO);


    return mav; // forward
  }
  
  /**
   * 일반 회원 수정 http://localhost:9090/team4/genmember/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/update.do", method = RequestMethod.GET)
  public ModelAndView update(int gen_memberno) {
    ModelAndView mav = new ModelAndView();
    
    GenmemberVO genVO = this.genmemberProc.read(gen_memberno); 
    mav.addObject("genVO", genVO);
    
    mav.setViewName("/genmember/update"); // /webapp/team4/genmember/create.jsp

    return mav; // forward
  }
  
  /**
   * 회원 수정 처리 http://localhost:9090/team4/genmember/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/update.do", method = RequestMethod.POST)
  public ModelAndView update(GenmemberVO genVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/update_msg"); 

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("gen_memberno", genVO.getGen_memberno());
    hashMap.put("gen_passwd", genVO.getGen_passwd());
    
    int id_check = 0;      // 아이디 중복 갯수
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    id_check = this.genmemberProc.id_check(genVO.getGen_id());
    passwd_cnt = this.genmemberProc.passwd_check(hashMap);
    
    if(id_check >= 1) {
      mav.setViewName("/genmember/id_check"); 
      mav.addObject("id_check", id_check);
    }else if (passwd_cnt == 1 && id_check == 0) { // 패스워드 일치와 아이디 중복이 없을경우 글 수정
      cnt = this.genmemberProc.update(genVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
    


    return mav; // forward
  }
  
  /**
   * 회원 탈퇴 폼 http://localhost:9090/team4/genmember/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int gen_memberno) {
    ModelAndView mav = new ModelAndView();
    
    GenmemberVO genVO = this.genmemberProc.read(gen_memberno);
    mav.addObject("genVO", genVO);
    
    mav.setViewName("/genmember/delete"); // /webapp/team4/genmember/delete.jsp

    return mav; // forward
  }
  
  /**
   * 회원 탈퇴
   * @param genVO
   * @return
   */
  @RequestMapping(value = "/genmember/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(GenmemberVO genVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/delete_msg"); // /webapp/genmember/delete_msg.jsp
    
    int gen_memberno = genVO.getGen_memberno();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("gen_memberno", gen_memberno);
    hashMap.put("gen_passwd", genVO.getGen_passwd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.genmemberProc.passwd_check(hashMap); 
        
    if (passwd_cnt == 1 ) { // 패스워드 일치와 아이디 중복이 없을경우 글 수정
      cnt = this.genmemberProc.delete(gen_memberno);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장

    return mav;
  }
  
  /**
   * 비밀번호 변경 폼
   * @param gen_memberno
   * @return
   */
  @RequestMapping(value = "/genmember/update_passwd.do", method = RequestMethod.GET)
  public ModelAndView update_passwd(int gen_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/update_passwd"); // /webapp/team4/passwd_change.jsp
    
    GenmemberVO genVO = this.genmemberProc.read(gen_memberno);
    mav.addObject("genVO", genVO);
    
    return mav;
  }
  
  /**
   * 비밀번호 변경 처리 http://localhost:9090/team4/genmember/update_passwd.do
   * 
   * @return
   */
  @RequestMapping(value = "/genmember/update_passwd.do", method = RequestMethod.POST)
  public ModelAndView update_passwd(GenmemberVO genVO ,HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/genmember/update_passwd_msg"); // /webapp/team4/passwd_change.jsp
    
    int gen_memberno = genVO.getGen_memberno();
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;     
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("gen_memberno", gen_memberno);
    hashMap.put("gen_passwd", genVO.getGen_passwd());
    
    String passwd = req.getParameter("update_passwd");
    System.out.println(passwd);
    String passwd_check = req.getParameter("update_passwd_check");
    System.out.println(passwd_check);
    boolean sw = passwd.equals(passwd_check);
    System.out.println(sw);
    
    passwd_cnt = this.genmemberProc.passwd_check(hashMap);
    
    if(passwd_cnt == 1) {
      if(sw == true) {
        genVO.setGen_passwd(passwd);
        System.out.println(passwd);
        cnt = this.genmemberProc.update_passwd(genVO);
      }
    }
    mav.addObject("cnt", cnt);
    mav.addObject("passwd_cnt", passwd_cnt);
    
    return mav; // forward
  }
  
  /**
   * 로그인 폼
   * @return
   */
  // http://localhost:9090/resort/genmember/login.do 
  @RequestMapping(value = "/genmember/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
  
    mav.setViewName("/genmember/login_form");
    return mav;
  }

  /**
   * 로그인 처리
   * @return
   */
  // http://localhost:9090/team4/genmember/login.do 
  @RequestMapping(value = "/genmember/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpSession session,
                                            String gen_id, 
                                            String gen_passwd) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("gen_id", gen_id);
    map.put("gen_passwd", gen_passwd);
    
    int count = genmemberProc.login(map);
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      GenmemberVO genmemberVO = genmemberProc.readById(gen_id);
      session.setAttribute("genmemberno", genmemberVO.getGen_memberno());
      session.setAttribute("gen_id", gen_id);
      session.setAttribute("gen_name", genmemberVO.getGen_name());
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/genmember/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/genmember/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/genmember/logout_msg.jsp");
    
    return mav;
  }
  
  
  

}
