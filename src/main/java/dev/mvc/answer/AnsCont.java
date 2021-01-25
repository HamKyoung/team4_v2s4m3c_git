package dev.mvc.answer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cormember.CormemberProc;
import dev.mvc.genmember.GenmemberProc;
import dev.mvc.notice.NoticeVO;
import dev.mvc.questions.QuesProcInter;
import dev.mvc.questions.QuesVO;

@Controller
public class AnsCont {
  @Autowired
  @Qualifier("dev.mvc.questions.QuesProc")
  private QuesProcInter quesProc;
  
  @Autowired
  @Qualifier("dev.mvc.answer.AnsProc")
  private AnsProcInter ansProc;
  
  
  @Autowired
  @Qualifier("dev.mvc.cormember.CormemberProc")
  private CormemberProc cormemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  
  public AnsCont() {
    System.out.println("--> AnsCont created.");
  }
  
  /**
   * 占쎈�э옙 占쎄�占�
   * @return
   */
  @RequestMapping(value = "/answer/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/create");
    return mav; 
  }
  
  /**
   * 占쎈�э옙 占쎄�占� 筌ｏ옙�깍옙
   * @param AnsVO
   * @return
   */
  @RequestMapping(value = "/answer/create.do", method = RequestMethod.POST)
  public ModelAndView create(AnsVO ansVO) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/create_msg");

    int cnt = this.ansProc.create(ansVO);
    mav.addObject("cnt", cnt);

    return mav;
  }
  
  /**
   * 占쎈�э옙 �귐�占썬�쏙옙占�
   * @return
   */
  @RequestMapping(value = "/answer/list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/list"); 
    
    boolean login = false;
    
    if (genmemberProc.isMember(session) || cormemberProc.isMember(session)) { // 회원 로그인 된 경우
      login = true;
    }
    mav.addObject("login", login);
    
    List<QuesVO> ques_list =this.quesProc.list_ques_no_desc();
    mav.addObject("ques_list", ques_list);
    
    List<AnsVO> list = this.ansProc.list_ans_no_asc();
    mav.addObject("list", list);
    

    return mav; // forward
  }
  
  /**
   * 占쎈�э옙 鈺곌�占쏙옙
   * @param ans_no
   * @return
   */
  @RequestMapping(value = "/answer/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ans_no) {
    ModelAndView mav = new ModelAndView();

    AnsVO ansVO = this.ansProc.read(ans_no);
    mav.addObject("ansVO", ansVO);

    mav.setViewName("/answer/read");
    return mav;
  }
  
  /**
   * 占쎈�э옙 占쏙옙占쏙옙占쏙옙 鈺곌�占쏙옙
   * @param ans_no
   * @return
   */
  @RequestMapping(value = "/answer/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int ans_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/read_update"); 

    AnsVO ansVO = this.ansProc.read_update(ans_no);
    mav.addObject("ansVO", ansVO);

    List<AnsVO> list = this.ansProc.list_ans_no_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 占쎈�э옙 占쏙옙占쏙옙占쏙옙 鈺곌�占쏙옙
   * @param ans_no
   * @return
   */
  @RequestMapping(value = "/answer/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int ans_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/read_delete"); 

    AnsVO ansVO = this.ansProc.read(ans_no);
    mav.addObject("ansVO", ansVO);

    List<AnsVO> list = this.ansProc.list_ans_no_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 占쎈�э옙 占쏙옙占쏙옙 筌ｏ옙�깍옙
   * @param ansVO
   * @return
   */
  @RequestMapping(value = "/answer/update.do", method = RequestMethod.POST)
  public ModelAndView update(AnsVO ansVO) {

    ModelAndView mav = new ModelAndView();

    int cnt = this.ansProc.update(ansVO);
    mav.addObject("cnt", cnt);

    mav.setViewName("/answer/update_msg"); 

    return mav;
  }
  
  /**
   * 占쎈�э옙 占쏙옙占쏙옙 筌ｏ옙�깍옙
   * @param ans_no
   * @return
   */
  @RequestMapping(value = "/answer/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int ans_no) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.ansProc.delete(ans_no);
    mav.addObject("cnt", cnt);
    

    mav.setViewName("/answer/delete_msg"); 

    return mav;
  }
  
  
  
  
  
  
  
  
  
  
}




