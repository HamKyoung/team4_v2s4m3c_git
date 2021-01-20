package dev.mvc.jobsup;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.jobnws.JobnwsVO;

@Controller
public class JobsupCont {
  @Autowired
  @Qualifier("dev.mvc.jobsup.JobsupProc")
  private JobsupProcInter jobsupProc;

  public JobsupCont() {
    System.out.println("--> JobsupCont created.");
  }

  /**
   * 등록폼 http://localhost:9090/resort/categrp/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobsup/create"); // /webapp/jobsup/create.jsp

    return mav; // forward
  }

  /**
   * 등록 처리 http://localhost:9090/team4/categrp/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/create.do", method = RequestMethod.POST)
  public ModelAndView create(JobsupVO jobsupVO) {
    // request.setAttribute("jobsupVO", jobsupVO) 자동 실행

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobsup/create_msg"); // /webapp/categrp/create_msg.jsp

    int cnt = this.jobsupProc.create(jobsupVO); // 등록 처리
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }

  /**
   * 목록 http://localhost:9090/team4/jobsup/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/list.do", method = RequestMethod.GET)
  public ModelAndView list_jobsupno_asc() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/jobsup/list"); // /webapp/jobsup/create.jsp

    List<JobsupVO> list = this.jobsupProc.list_jobsupno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 조회
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/read.do", method = RequestMethod.GET)
  public ModelAndView read_update(int jobsupno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobsup/read"); // /webapp/jobsup/read.jsp

    JobsupVO jobsupVO = this.jobsupProc.read(jobsupno);
    mav.addObject("jobsupVO", jobsupVO);

    mav.setViewName("/jobsup/read"); // /webapp/jobsup/read.jsp
    return mav; // forward
  }

  /**
   * 수정 폼
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/update.do", method = RequestMethod.GET)
  public ModelAndView update(int jobsupno) {
    ModelAndView mav = new ModelAndView();

    JobsupVO jobsupVO = this.jobsupProc.read_update(jobsupno); // 수정용 읽기
    mav.addObject("jobsupVO", jobsupVO); // request.setAttribute("jobsupVO", jobsupVO);

    mav.setViewName("/jobsup/update"); // webapp/jobsup/update.jsp

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/jobsup/update.do", method = RequestMethod.POST)
  public ModelAndView update(JobsupVO jobsupVO) {
    ModelAndView mav = new ModelAndView();

    mav.addObject("jobsupno", jobsupVO.getJobsupno());

    mav.setViewName("/jobsup/update_msg"); // webapp/jobsup/update_msg.jsp

    return mav;

  }
}
