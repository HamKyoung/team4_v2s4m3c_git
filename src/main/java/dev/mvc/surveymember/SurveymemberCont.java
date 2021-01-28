package dev.mvc.surveymember;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class SurveymemberCont {
  @Autowired
  @Qualifier("dev.mvc.surveymember.SurveymemberProc")
  private SurveymemberProc surveymemberProc;
  
  public SurveymemberCont() {
    System.out.println("--> SurveymemberCont created.");
  }
  
  /**
   * 등록 폼 http://localhost:9090/team4/surveymember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveymember/create"); // /webapp/surveymember/create.jsp

    return mav; // forward
  }
  
  /**
   * 등록 처리 http://localhost:9090/team4/surveymember/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/create.do", method = RequestMethod.POST)
  public ModelAndView create(SurveymemberVO surveymemberVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    

    mav.setViewName("/surveymember/create_msg"); // /webapp/surveymember/create.jsp
    
    int cnt = this.surveymemberProc.create(surveymemberVO);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
  /**
   * 설문 조사 목록 http://localhost:9090/team4/surveymember/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveymember/list"); // /webapp/surveymember/list.jsp

    List<Survey_genVO> list = this.surveymemberProc.list();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 설문 조사 조회 http://localhost:9090/team4/surveymember/read.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/read.do", method = RequestMethod.GET)
  public ModelAndView read(int sur_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveymember/read");

    SurveymemberVO surveymemberVO = this.surveymemberProc.read(sur_memberno);
    mav.addObject("surveymemberVO", surveymemberVO);

    return mav; // forward
  }
  
  /**
   * 수정 폼 http://localhost:9090/team4/surveymember/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/update.do", method = RequestMethod.GET)
  public ModelAndView update(int sur_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveymember/update"); 
    
    SurveymemberVO surveymemberVO = this.surveymemberProc.read(sur_memberno);
    mav.addObject("surveymemberVO", surveymemberVO);

    return mav;
  }
  
  /**
   * 수정 처리 http://localhost:9090/team4/surveymember/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/update.do", method = RequestMethod.POST)
  public ModelAndView update(SurveymemberVO surveymemberVO) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/surveymember/update_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveymemberProc.update(surveymemberVO);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
  /**
   * 삭제 폼 http://localhost:9090/team4/surveyitem/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int sur_memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveymember/delete"); // /webapp/survey/update.jsp
    
    SurveymemberVO surveymemberVO = this.surveymemberProc.read(sur_memberno);
    mav.addObject("surveymemberVO", surveymemberVO);

    return mav; // forward
  }
  
  /**
   * 삭제 처리 http://localhost:9090/team4/surveymember/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveymember/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_msg(int sur_memberno) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/surveymember/delete_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveymemberProc.delete(sur_memberno);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
}
