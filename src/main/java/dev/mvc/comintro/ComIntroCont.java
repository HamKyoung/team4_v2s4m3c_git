package dev.mvc.comintro;

import java.util.HashMap;
import java.util.List;
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

import dev.mvc.cormember.CormemberProc;
import dev.mvc.genmember.GenmemberProc;

@Controller
public class ComIntroCont {
  
  @Autowired
  @Qualifier("dev.mvc.cormember.CormemberProc")
  private CormemberProc cormemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.comintro.ComIntroProc")
  private ComIntroProcInter comintroProc;

  public ComIntroCont() {
    System.out.println("--> ComIntroCont created.");
  }
  
  /**
   * 등록폼 http://localhost:9090/team4/comintro/create.do
   * @return
   */
  @RequestMapping(value = "/comintro/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comintro/create"); // /webapp/comintro/create.jsp

    return mav; // forward
  }
  
  /**
   * 등록처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/comintro/create.do", method = RequestMethod.POST)
  public ModelAndView create(ComIntroVO comintroVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comintro/create_msg");

    int cnt = this.comintroProc.create(comintroVO);
    mav.addObject("cnt", cnt);

    return mav;
  }
  
  /**
   * 목록 http://localhost:9090/team4/comintro/list_all.do
   * @return
   */
    @RequestMapping(value = "/comintro/list_all.do", method = RequestMethod.GET)
    public ModelAndView list(HttpSession session) {     
      ModelAndView mav = new ModelAndView();

      //mav.setViewName("/comintro/list_all"); // /webapp/contents/list_all.jsp
      mav.setViewName("/comintro/list_ajax"); // /webapp/contents/list_ajax.jsp

      boolean genlogin = false;
      boolean corlogin = false;
      
      if (genmemberProc.isMember(session)) { 
        genlogin = true;
      }
      
      if (cormemberProc.isMember(session)) {
        corlogin = true;
      }
      
      mav.addObject("genlogin", genlogin);
      mav.addObject("corlogin", corlogin);
      
      List<ComIntroVO> list = this.comintroProc.list_all();
      mav.addObject("list",list);
      
      return mav; // forward 
    }
   

  
  // http://localhost:9090/team4/comintro/read.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/comintro/read.do", method=RequestMethod.GET )
  public ModelAndView read(int comno) {
    ModelAndView mav = new ModelAndView();

    ComIntroVO comintroVO = this.comintroProc.read(comno);
    mav.addObject("comintroVO", comintroVO); // request.setAttribute("comintroVO", comintroVO);

    
    mav.setViewName("/comintro/read"); // /webapp/comintro/read.jsp
    return mav;
  }
  
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/comintro/update.do", method=RequestMethod.GET )
  public ModelAndView update(int comno) {
    ModelAndView mav = new ModelAndView();
    
    ComIntroVO comintroVO = this.comintroProc.read(comno);// 수정용 읽기
    mav.addObject("comintroVO", comintroVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/comintro/update"); // webapp/comintro/update.jsp
    
    return mav;
  }
  
  /**
   * 수정 처리
   * @param comintroVO
   * @return
   */
  @RequestMapping(value="/comintro/update.do", method=RequestMethod.POST )
  public ModelAndView update(ComIntroVO comintroVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/comintro/update_msg"); // webapp/comintro/update_msg.jsp
    
    int cnt =this.comintroProc.update(comintroVO);
    mav.addObject("cnt", cnt); // request에 저장
         
    return mav;
  }

  /**
   * 삭제폼 http://localhost:9090/team4/comintro/delete.do
   * @return
   */
  @RequestMapping(value = "/comintro/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int comno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comintro/delete"); // /webapp/comintro/delete.jsp

    ComIntroVO comintroVO = this.comintroProc.read(comno);
    mav.addObject("comintroVO", comintroVO);

    List<ComIntroVO> list = this.comintroProc.list_all();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 삭제 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/comintro/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(ComIntroVO comintroVO) {
    ModelAndView mav = new ModelAndView();
    int comno = comintroVO.getComno();
    
    String com_name = this.comintroProc.read(comno).getCom_name();
    mav.addObject("com_name",com_name);

    int cnt = this.comintroProc.delete(comno);            // 수정된 레코드 갯수 
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/comintro/delete_msg"); // webapp/cate/delete_msg.jsp

    return mav;
  }

    
  
  /**
   * 출력모드 변경
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/comintro/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(ComIntroVO comintroVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.comintroProc.update_visible(comintroVO);
    mav.addObject("cnt", cnt); // request에 저장

    if (cnt == 1) { 
      mav.setViewName("redirect:/comintro/list_all.do"); // request 객체가 전달이 안됨. 
    } else {
      ComIntroVO vo = this.comintroProc.read(comintroVO.getComno());
      String name = vo.getCom_name();
      mav.addObject("name", name);
      mav.setViewName("/comintro/update_visible_msg"); // /comintro/update_visible_msg.jsp
    }
    return mav;
  }

}
