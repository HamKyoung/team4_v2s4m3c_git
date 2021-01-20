package dev.mvc.pass_self;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.questions.QuesVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class Pass_selfCont {
  
  
  @Autowired
  @Qualifier("dev.mvc.pass_self.Pass_selfProc")
  private Pass_selfProcInter pass_selfProc;
  
  public Pass_selfCont() {
    System.out.println("--> Pass_selfCont created.");
  }
  
  /**
   * 합격 자소서 등록
   * @return
   */
  @RequestMapping(value = "/pass_self/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/pass_self/create");
    return mav; // forward
  }
  
  /**
   * 합격 자소서 등록 처리
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
   * 합격 자소서 목록
   * @return
   */
  @RequestMapping(value = "/pass_self/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/pass_self/list");

    List<Pass_selfVO> list = this.pass_selfProc.list();
    
    mav.addObject("list", list);
    
    return mav; // forward
  }
  
  /**
   * 합격자소서 조회
   * @param 
   * @return
   */
  @RequestMapping(value = "/pass_self/read.do", method = RequestMethod.GET)
  public ModelAndView read(int pass_self_no) {
    ModelAndView mav = new ModelAndView();
    
    Pass_selfVO pass_selfVO = this.pass_selfProc.read(pass_self_no);
    mav.addObject("pass_selfVO", pass_selfVO);

    mav.setViewName("/pass_self/read");
    return mav;
  }
  
  
  /**
   * 합격자소서 수정용 조회
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
   * 합격자소서 삭제용 조회
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
   * 합격자소서 수정 처리
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
   * 합격자소서 삭제 처리
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
