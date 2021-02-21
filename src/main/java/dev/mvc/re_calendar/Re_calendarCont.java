package dev.mvc.re_calendar;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProc;
import dev.mvc.answer.AnsProcInter;
import dev.mvc.comcate.ComCateProcInter;
import dev.mvc.comintro.ComIntroProcInter;
import dev.mvc.cormember.CormemberProc;
import dev.mvc.genmember.GenmemberProc;
import dev.mvc.genmember.GenmemberVO;
import dev.mvc.questions.QuesVO;
import dev.mvc.recruit.RecruitProcInter;

@Controller
public class Re_calendarCont {
  @Autowired
  @Qualifier("dev.mvc.re_calendar.Re_calendarProc")
  private Re_calendarProcInter re_calendarProc;
  
  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
  private RecruitProcInter recruitProc;
  
  @Autowired
  @Qualifier("dev.mvc.comcate.ComCateProc")
  private ComCateProcInter comcateProc;
  
  @Autowired
  @Qualifier("dev.mvc.comintro.ComIntroProc")
  private ComIntroProcInter comintroProc;

  
  public Re_calendarCont() {
    System.out.println("--> Re_calendarCont created.");
  }

 
  /**
   * create
   * @param session
   * @return
   */
  @RequestMapping(value = "/re_calendar/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/re_calendar/create");
    return mav; // forward
  }

  
  /**
   * create
   * @param quesVO
   * @return
   */
  @RequestMapping(value = "/re_calendar/create.do", method = RequestMethod.POST)
  public ModelAndView create(Re_calendarVO re_calendarVO) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/re_calendar/create_msg"); 

    int cnt = this.re_calendarProc.create(re_calendarVO);
    mav.addObject("cnt", cnt);

    return mav;
  }
  
  @RequestMapping(value = "/re_calendar/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/re_calendar/list");
   
    List<Re_calendarVO> list = this.re_calendarProc.list();
    mav.addObject("list", list);
    
    return mav; // forward
  }
  
  /**
   * read
   * @param calendar_no
   * @return
   */
  @RequestMapping(value = "/re_calendar/read.do", method = RequestMethod.GET)
  public ModelAndView read(int calendar_no) {
    ModelAndView mav = new ModelAndView();
    
    Re_calendarVO re_calendarVO = this.re_calendarProc.read(calendar_no);
    mav.addObject("re_calendarVO", re_calendarVO);
    
    mav.setViewName("/re_calendar/read");
    return mav;
  }
  
  @RequestMapping(value = "/re_calendar/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int calendar_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/re_calendar/read_delete");
    
    Re_calendarVO re_calendarVO = this.re_calendarProc.read(calendar_no);
    mav.addObject("re_calendarVO", re_calendarVO);

    return mav;
  }
  
  
  @RequestMapping(value = "/re_calendar/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int calendar_no) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.re_calendarProc.delete(calendar_no);
    mav.addObject("cnt", cnt);
    
    mav.setViewName("/re_calendar/delete_msg");
    
    return mav;
  }
  
  @RequestMapping(value = "/re_calendar/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int calendar_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/re_calendar/read_update");
    
    Re_calendarVO re_calendarVO = this.re_calendarProc.read_update(calendar_no);
    mav.addObject("re_calendarVO", re_calendarVO);
    
    List<Re_calendarVO> list = this.re_calendarProc.list();
    mav.addObject("list", list);
    
    return mav;
  }
  
  
  @RequestMapping(value = "/re_calendar/update.do", method = RequestMethod.POST)
  public ModelAndView update(Re_calendarVO re_calendarVO) {
    ModelAndView mav = new ModelAndView();
    

    int cnt = this.re_calendarProc.update(re_calendarVO);
    mav.addObject("cnt", cnt);

    
    mav.setViewName("/re_calendar/update_msg");
    
    return mav;
  }
  

}








