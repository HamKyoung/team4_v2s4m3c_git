package dev.mvc.pass_self;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.attachfile.AttachfileProcInter;
import dev.mvc.comintro.ComIntroProc;
import dev.mvc.comintro.ComIntroVO;
import dev.mvc.cormember.CormemberProc;
import dev.mvc.cormember.CormemberVO;
import dev.mvc.genmember.GenmemberProc;
import dev.mvc.ps_attachfile.Ps_attachfileProcInter;
import dev.mvc.ps_attachfile.Ps_attachfileVO;



@Controller
public class Pass_selfCont {
  
  @Autowired
  @Qualifier("dev.mvc.cormember.CormemberProc")
  private CormemberProc cormemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.pass_self.Pass_selfProc")
  private Pass_selfProcInter pass_selfProc;
  
  @Autowired
  @Qualifier("dev.mvc.comintro.ComIntroProc")
  private ComIntroProc comintroProc;
  
  @Autowired
  @Qualifier("dev.mvc.ps_attachfile.Ps_attachfileProc")
  private Ps_attachfileProcInter ps_attachfileProc;
  
  public Pass_selfCont() {
    System.out.println("--> Pass_selfCont created.");
  }
  
  /**
   * �⑷꺽 ������ �깅�
   * @return
   */
  @RequestMapping(value = "/pass_self/create", method = RequestMethod.GET)
  public ModelAndView create(int cormemberno) {
    ModelAndView mav = new ModelAndView();

    ComIntroVO comintroVO = this.comintroProc.read(cormemberno);
    System.out.println(comintroVO);
    String com_name = comintroVO.getCom_name();
    int comno = comintroVO.getComno();
    
    mav.addObject("comno", comno);
    mav.addObject("com_name", com_name);
    mav.setViewName("/pass_self/create");
    return mav; // forward
  }
  
  /**
   * �⑷꺽 ������ �깅� 泥�由�
   * @param pass_selfVO
   * @return
   */
  @RequestMapping(value = "/pass_self/create.do", method = RequestMethod.POST)
  public ModelAndView create(Pass_selfVO pass_selfVO) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/pass_self/create_msg"); 

    int cnt = this.pass_selfProc.create(pass_selfVO);
    mav.addObject("cnt", cnt);

    return mav;
  }
  
  /**
   * �⑷꺽 ������ 紐⑸�
   * @return
   */
  @RequestMapping(value = "/pass_self/list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/pass_self/list");

    
    boolean genlogin = false;
    boolean corlogin = false; 
    
    if (genmemberProc.isMember(session)) { // �쇰����� 濡�洹몄�� �� 寃쎌��
      genlogin = true;
    }
    
    if (cormemberProc.isMember(session)) {
      corlogin = true;
    }

    mav.addObject("genlogin", genlogin);
    mav.addObject("corlogin", corlogin);
    
    List<Pass_selfVO> list = this.pass_selfProc.list();
    
    mav.addObject("list", list);
    
    return mav; // forward
  }
  
  /**
   * �⑷꺽������ 議고��
   * @param 
   * @return
   */
  @RequestMapping(value = "/pass_self/read.do", method = RequestMethod.GET)
  public ModelAndView read(int pass_self_no) {
    ModelAndView mav = new ModelAndView();
    
    Pass_selfVO pass_selfVO = this.pass_selfProc.read(pass_self_no);
    mav.addObject("pass_selfVO", pass_selfVO);
    
    List<Ps_attachfileVO> attachfile_list = this.ps_attachfileProc.list_by_pass_self_no(pass_self_no);
    mav.addObject("attachfile_list", attachfile_list);
    
    mav.setViewName("/pass_self/read");
    return mav;
  }
  
  
  /**
   * �⑷꺽������ ������ 議고��
   * @param 
   * @return
   */
  @RequestMapping(value = "/pass_self/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int pass_self_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/pass_self/read_update"); 

    Pass_selfVO pass_selfVO = this.pass_selfProc.read_update(pass_self_no);
    mav.addObject("pass_selfVO", pass_selfVO);
    
    List<Pass_selfVO> list = this.pass_selfProc.list();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * �⑷꺽������ ������ 議고��
   * @param 
   * @return
   */
  @RequestMapping(value = "/pass_self/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int pass_self_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/pass_self/read_delete"); 

    Pass_selfVO pass_selfVO = this.pass_selfProc.read(pass_self_no);
    mav.addObject("pass_selfVO", pass_selfVO);

    List<Pass_selfVO> list = this.pass_selfProc.list();
    mav.addObject("list", list);

    return mav; // forward
  }
   
  /**
   * �⑷꺽������ ���� 泥�由�
   * @param 
   * @return
   */
  @RequestMapping(value = "/pass_self/update.do", method = RequestMethod.POST)
  public ModelAndView update(Pass_selfVO pass_selfVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.pass_selfProc.update(pass_selfVO);
    mav.addObject("cnt", cnt);

    mav.setViewName("/pass_self/update_msg"); 

    return mav;
  }

  /**
   * �⑷꺽������ ���� 泥�由�
   * @param
   * @return
   */
  @RequestMapping(value = "/pass_self/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int pass_self_no) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.pass_selfProc.delete(pass_self_no);
    mav.addObject("cnt", cnt);

    mav.setViewName("/pass_self/delete_msg"); 

    return mav;
  }

}
