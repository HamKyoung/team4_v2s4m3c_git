package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.ResolverUtil.IsA;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class AdminCont {
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProc adminProc;

  public AdminCont() {
    System.out.println("--> AdminCont created.");
  }
  
  
  /**
   * 로그인 폼
   * @return
   */
  // http://localhost:9090/team4/admin/login.do 
  @RequestMapping(value = "/admin/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
  
    mav.setViewName("/admin/login_form");
    return mav;
  }

  /**
   * 로그인 처리
   * @return
   */
  // http://localhost:9090/team4/admin/login.do 
  @RequestMapping(value = "/admin/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                                HttpServletResponse response,
                                                HttpSession session,
                                                String id, 
                                                String passwd) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    
    boolean sw = adminProc.admin_check(map);
    if (sw == true) { // 로그인 성공
      session.setAttribute("id", id);
      session.setAttribute("passwd", passwd);
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/admin/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/admin/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/admin/logout_msg.jsp");
    
    return mav;
  }
  
  
  
}
