package dev.mvc.questions;

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
import dev.mvc.cormember.CormemberProc;
import dev.mvc.genmember.GenmemberProc;
import dev.mvc.genmember.GenmemberVO;

@Controller
public class QuesCont {
  @Autowired
  @Qualifier("dev.mvc.questions.QuesProc")
  private QuesProcInter quesProc;
  
  
  @Autowired
  @Qualifier("dev.mvc.answer.AnsProc")
  private AnsProcInter ansProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProc adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.cormember.CormemberProc")
  private CormemberProc cormemberProc;  
  
  public QuesCont() {
    System.out.println("--> QuesCont created.");
  }

  /**
   * 吏�臾� �깅�
   * @return
   */
  @RequestMapping(value = "/questions/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/questions/create");
    return mav; // forward
  }

  /**
   * 吏�臾� �깅� 泥�由�
   * @param quesVO
   * @return
   */
  @RequestMapping(value = "/questions/create.do", method = RequestMethod.POST)
  public ModelAndView create(QuesVO quesVO) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/questions/create_msg"); 

    int cnt = this.quesProc.create(quesVO);
    mav.addObject("cnt", cnt);

    return mav;
  }
  
  /**
   * 吏�臾� 紐⑸�
   * @return
   */
  @RequestMapping(value = "/questions/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/questions/list");
    
    List<QuesVO> list = this.quesProc.list_ques_no_desc();
    mav.addObject("list", list);
    
    return mav; // forward
  }
  
  /**
   * 吏�臾� 議고��
   * @param ques_no
   * @return
   */
  @RequestMapping(value = "/questions/read.do", method = RequestMethod.GET)
  public ModelAndView read(int ques_no, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    QuesVO quesVO = this.quesProc.read(ques_no);
    mav.addObject("quesVO", quesVO);

    boolean adlogin = false;
    
    if (adminProc.isAdmin(session)) {  // 관리자 로그인
      adlogin = true;
    }
    
    mav.addObject("adlogin", adlogin);
    
    mav.setViewName("/questions/read");
    return mav;
  }
  
  /**
   * 吏�臾� ������ 議고��
   * @param ques_no
   * @return
   */
  @RequestMapping(value = "/questions/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int ques_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/questions/read_update"); 

    QuesVO quesVO = this.quesProc.read_update(ques_no);
    mav.addObject("quesVO", quesVO);
    
    List<QuesVO> list = this.quesProc.list_ques_no_desc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 吏�臾� ������ 議고��
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/questions/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int ques_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/questions/read_delete"); 

    QuesVO quesVO = this.quesProc.read(ques_no);
    mav.addObject("quesVO", quesVO);

    List<QuesVO> list = this.quesProc.list_ques_no_desc();
    mav.addObject("list", list);

    return mav; // forward
  }
   
  /**
   * 吏�臾� ���� 泥�由�
   * @param quesVO
   * @return
   */
  @RequestMapping(value = "/questions/update.do", method = RequestMethod.POST)
  public ModelAndView update(QuesVO quesVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("ques_no", quesVO.getQues_no());
    hashMap.put("ques_passwd", quesVO.getQues_passwd());
    
    int passwd_cnt = 0; 
    int cnt = 0;             
    
    passwd_cnt = this.quesProc.passwd_check(hashMap); // �⑥�ㅼ���� 泥댄��

    if (passwd_cnt == 1) { 
      cnt = this.quesProc.update(quesVO); // ���� 泥�由�
    }

    mav.addObject("cnt", cnt);
    mav.addObject("passwd_cnt", passwd_cnt); 
    
    mav.setViewName("/questions/update_msg");
    return mav;
  }

  /**
   * 吏�臾� ���� 泥�由�
   * @param ques_no
   * @return
   */
  @RequestMapping(value = "/questions/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int ques_no, String ques_passwd) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("ques_no", ques_no);
    hashMap.put("ques_passwd", ques_passwd);
    
    String ques_title = this.quesProc.read(ques_no).getQues_title();
    int passwd_cnt = 0; 
    int cnt = 0;             
    
    passwd_cnt = this.quesProc.passwd_check(hashMap); // �⑥�ㅼ���� 泥댄��
    
    int ans_cnt = 0;
    
    ans_cnt = this.ansProc.ans_cnt(ques_no);

    if (passwd_cnt == 1 && ans_cnt == 0) { 
      cnt =this.quesProc.delete(ques_no); // ���� 泥�由�
    }

    mav.addObject("cnt", cnt);
    mav.addObject("ques_title", ques_title);
    mav.addObject("passwd_cnt", passwd_cnt); 
    mav.addObject("ans_cnt", ans_cnt);

    mav.setViewName("/questions/delete_msg"); // /webapp/notice/delete_msg.jsp

    return mav;
  }
  

}








