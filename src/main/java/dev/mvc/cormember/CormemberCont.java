package dev.mvc.cormember;

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



@Controller
public class CormemberCont {
  @Autowired
  @Qualifier("dev.mvc.cormember.CormemberProc")
  private CormemberProc cormemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProc adminProc;

  public CormemberCont() {
    System.out.println("--> CormemberCont created.");
  }
  
  /**
   * ID 중복 체크, JSON 출력
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cormember/checkID.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String checkID(String cor_id) {
    int cnt = this.cormemberProc.id_check(cor_id);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * 등록 폼 http://localhost:9090/team4/cormember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/create"); // /webapp/team4/create.jsp

    return mav; // forward
  }

  /**
   * 등록 처리 http://localhost:9090/team4/cormember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/create.do", method = RequestMethod.POST)
  public ModelAndView create(CormemberVO corVO, HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/create_msg"); // /webapp/categrp/create_msg.jsp

    int id_check = this.cormemberProc.id_check(corVO.getCor_id());

    if (id_check >= 1) {
      mav.setViewName("/cormember/id_check");
      mav.addObject("id_check", id_check);
    } else {
      int cnt = this.cormemberProc.create(corVO);
      mav.addObject("cnt", cnt);
    }

    return mav; // forward
  }

  /**
   * 기업 회원 목록 http://localhost:9090/team4/cormember/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<CormemberVO> list = cormemberProc.list_memberno_asc();
      
      mav.addObject("list", list);
      mav.setViewName("/cormember/list"); // /webapp/cormember/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   * 회원 정보 조회 http://localhost:9090/team4/cormember/read.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cor_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/read"); // /webapp/cormember/read.jsp

    CormemberVO corVO = this.cormemberProc.read(cor_memberno);
    mav.addObject("corVO", corVO);


    return mav; // forward
  }
  
  /**
   * 회원 수정 폼 http://localhost:9090/team4/cormember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int cor_memberno) {
    ModelAndView mav = new ModelAndView();
    
    CormemberVO corVO = this.cormemberProc.read(cor_memberno);
    mav.addObject("corVO", corVO);
    
    mav.setViewName("/cormember/update"); // /webapp/team4/update.jsp

    return mav; // forward
  }
  
  /**
   * 회원 수정 처리 http://localhost:9090/team4/cormember/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/update.do", method = RequestMethod.POST)
  public ModelAndView update(CormemberVO corVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/update_msg"); // /webapp/categrp/update_msg.jsp
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("cor_memberno", corVO.getCor_memberno());
    hashMap.put("cor_passwd", corVO.getCor_passwd());
    
    int id_check = 0;      // 아이디 중복 갯수
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    id_check = this.cormemberProc.id_check(corVO.getCor_id());
    passwd_cnt = this.cormemberProc.passwd_check(hashMap);
    
    if(id_check >= 1) {
      mav.setViewName("/genmember/id_check"); 
      mav.addObject("id_check", id_check);
    }else if (passwd_cnt == 1 && id_check == 0) { // 패스워드 일치하면 수정
      cnt = this.cormemberProc.update(corVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
    
    return mav; // forward
  }
  
  /**
   * 회원 탈퇴 폼 http://localhost:9090/team4/cormember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cor_memberno) {
    ModelAndView mav = new ModelAndView();
    
    CormemberVO corVO = this.cormemberProc.read(cor_memberno);
    mav.addObject("corVO", corVO);
    
    mav.setViewName("/cormember/delete"); // /webapp/team4/update.jsp

    return mav; // forward
  }
  
   
  /**
   * 회원 탈퇴
   * @param cor_memberno
   * @return
   */
  @RequestMapping(value = "/cormember/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CormemberVO corVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/delete_msg"); // /webapp/cormember/delete_msg.jsp
    
    int cor_memberno = corVO.getCor_memberno();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("cor_memberno", cor_memberno);
    hashMap.put("cor_passwd", corVO.getCor_passwd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.cormemberProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1 ) { // 패스워드 일치와 아이디 중복이 없을경우 글 수정
      cnt = this.cormemberProc.delete(cor_memberno);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장

    return mav;
  }
  /**
   * 비밀번호 변경 폼
   * @param cor_memberno
   * @return
   */
  @RequestMapping(value = "/cormember/update_passwd.do", method = RequestMethod.GET)
  public ModelAndView update_passwd(int cor_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/update_passwd"); // /webapp/team4/passwd_change.jsp
    
    CormemberVO corVO = this.cormemberProc.read(cor_memberno);
    mav.addObject("corVO", corVO);
    
    return mav;
  }
  
  /**
   * 비밀번호 변경 처리 http://localhost:9090/team4/cormember/passwd_change.do
   * 
   * @return
   */
  @RequestMapping(value = "/cormember/update_passwd.do", method = RequestMethod.POST)
  public ModelAndView update_passwd(CormemberVO corVO ,HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cormember/update_passwd_msg"); // /webapp/team4/passwd_change.jsp
    
    int cor_memberno = corVO.getCor_memberno();
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;     
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("cor_memberno", cor_memberno);
    hashMap.put("cor_passwd", corVO.getCor_passwd());
    
    String passwd = req.getParameter("update_passwd");
    String passwd_check = req.getParameter("update_passwd_check");
    
    boolean sw = passwd.equals(passwd_check);

    passwd_cnt = this.cormemberProc.passwd_check(hashMap);
    
    if(passwd_cnt == 1) {
      if(sw == true) {
        corVO.setCor_passwd(passwd);
        cnt = this.cormemberProc.update_passwd(corVO);
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
  // http://localhost:9090/resort/member/login.do 
  @RequestMapping(value = "/cormember/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
  
    mav.setViewName("/cormember/login_form");
    return mav;
  }

  /**
   * 로그인 처리
   * @return
   */
  // http://localhost:9090/team4/cormember/login.do 
  @RequestMapping(value = "/cormember/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpSession session,
                                            String cor_id, 
                                            String cor_passwd) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("cor_id", cor_id);
    map.put("cor_passwd", cor_passwd);
    
    int count = cormemberProc.login(map);
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      CormemberVO cormemberVO = cormemberProc.readById(cor_id);
      session.setAttribute("cormemberno", cormemberVO.getCor_memberno());
      session.setAttribute("cor_id", cor_id);
      session.setAttribute("cor_name", cormemberVO.getCor_name());
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/cormember/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/cormember/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/cormember/logout_msg.jsp");
    
    return mav;
  }
  
  
  
}
