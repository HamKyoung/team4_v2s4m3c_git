package dev.mvc.jobsup;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.genmember.GenmemberProc;
import dev.mvc.genmember.GenmemberVO;
import dev.mvc.recruit.RecruitVO;
import dev.mvc.comcate.ComCateProc;
import dev.mvc.comcate.ComCateVO;
import dev.mvc.comintro.ComIntroProcInter;
import dev.mvc.comintro.ComIntroVO;
import dev.mvc.recruit.RecruitProc;
import dev.mvc.resume.ResumeProc;
import dev.mvc.resume.ResumeVO;



@Controller
public class JobsupCont {
  @Autowired
  @Qualifier("dev.mvc.jobsup.JobsupProc")
  private JobsupProcInter jobsupProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
  private RecruitProc recruitProc;

  @Autowired
  @Qualifier("dev.mvc.comcate.ComCateProc")
  private ComCateProc comcateProc;
  
  @Autowired
  @Qualifier("dev.mvc.comintro.ComIntroProc")
  private ComIntroProcInter comintroProc;

  @Autowired
  @Qualifier("dev.mvc.resume.ResumeProc")
  private ResumeProc resumeProc;
  
  
  public JobsupCont() {
    System.out.println("--> JobsupCont created.");
  }
  


  /**
   * 등록폼 http://localhost:9090/resort/categrp/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session, String comname, String title, int comno, int recruitno) {
    ModelAndView mav = new ModelAndView();
  
    List<ResumeVO> list = this.resumeProc.list();
    String id=(String)session.getAttribute("gen_id");
    
    
    mav.addObject("list" ,list);  
    mav.addObject("comname",comname);
    mav.addObject("title",title);
    mav.addObject("comno", comno);
    mav.addObject("recruitno", recruitno);
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
//    System.out.println("testessettesesttes"+jobsupVO.getRes_no());
    // request.setAttribute("jobsupVO", jobsupVO) 자동 실행
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobsup/create_msg"); // /webapp/categrp/create_msg.jsp
//    System.out.println("testessettesesttes"+jobsupVO.getRes_no());
//    System.out.println("testessettesesttes"+jobsupVO.getComno());
//    System.out.println("testessettesesttes"+jobsupVO.getGen_memberno());
//    System.out.println("testessettesesttes"+jobsupVO.getRecruitno());
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
  public ModelAndView list_jobsupno_asc(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    boolean genmem = false;
    
    if (genmemberProc.isMember(session)) {  // 회원 로그인
      genmem = true;
    }
    
    mav.addObject("genmem", genmem);

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
  public ModelAndView read_update(HttpSession session, int jobsupno, int recruitno, int comno, int res_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobsup/read"); // /webapp/jobsup/read.jsp
    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    JobsupVO jobsupVO = this.jobsupProc.read(jobsupno);
    ResumeVO resumeVO = this.resumeProc.read(res_no);
    ComIntroVO comIntroVO = this.comintroProc.read(comno);
    
    String title = recruitVO.getTitle();
    String res_intro = resumeVO.getRes_intro();
    String comname = comIntroVO.getCom_name();
    String id=(String)session.getAttribute("gen_id");
    
    
    mav.addObject("jobsupVO", jobsupVO);
    mav.addObject("recruitno" , recruitno); 
    mav.addObject("title", title);
    mav.addObject("res_intro", res_intro);
    mav.addObject("comno", comno);
    mav.addObject("comname" , comname);
    
    mav.setViewName("/jobsup/read"); // /webapp/jobsup/read.jsp
    return mav; // forward
  }

  /**
   * 수정 폼
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/update.do", method = RequestMethod.GET)
  public ModelAndView update(HttpSession session, int jobsupno, int recruitno, int comno, int res_no) {
    ModelAndView mav = new ModelAndView();

    List<ResumeVO> list = this.resumeProc.list();
    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    JobsupVO jobsupVO = this.jobsupProc.read(jobsupno);
    ResumeVO resumeVO = this.resumeProc.read(res_no);
    ComIntroVO comIntroVO = this.comintroProc.read(comno);
      
    String title = recruitVO.getTitle();
    String res_intro = resumeVO.getRes_intro();
    String comname = comIntroVO.getCom_name();
    String id=(String)session.getAttribute("gen_id");
  
    mav.addObject("jobsupno", jobsupno);
    mav.addObject("jobsupVO", jobsupVO);
    mav.addObject("recruitno" , recruitno); 
    mav.addObject("title", title);
    mav.addObject("list" ,list);
    mav.addObject("res_intro", res_intro);
    mav.addObject("comno", comno);
    mav.addObject("comname" , comname);
 

    mav.setViewName("/jobsup/update"); // webapp/jobsup/update.jsp

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param jobsupVO
   * @return
   */
  @RequestMapping(value = "/jobsup/update.do", method = RequestMethod.POST)
  public ModelAndView update(JobsupVO jobsupVO) {
    ModelAndView mav = new ModelAndView();
    //System.out.println("test");
    mav.addObject("jobsupno", jobsupVO.getJobsupno());
    int cnt = this.jobsupProc.update(jobsupVO);  
 
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/jobsup/update_msg"); // webapp/jobsup/update_msg.jsp

    return mav;
  }
  
  /**
   * 삭제 폼
   * 
   * @return
   */
  @RequestMapping(value = "/jobsup/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int jobsupno, int recruitno, int comno, int res_no) {
    ModelAndView mav = new ModelAndView();

    List<ResumeVO> list = this.resumeProc.list();
    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    JobsupVO jobsupVO = this.jobsupProc.read(jobsupno);
    ResumeVO resumeVO = this.resumeProc.read(res_no);
    ComIntroVO comIntroVO = this.comintroProc.read(comno);
      
    String title = recruitVO.getTitle();
    String res_intro = resumeVO.getRes_intro();
    String comname = comIntroVO.getCom_name();
    String id=(String)session.getAttribute("gen_id");
  
    mav.addObject("jobsupno", jobsupno);
    mav.addObject("jobsupVO", jobsupVO);
    mav.addObject("recruitno" , recruitno); 
    mav.addObject("title", title);
    mav.addObject("list" ,list);
    mav.addObject("res_intro", res_intro);
    mav.addObject("comno", comno);
    mav.addObject("comname" , comname);
 

    mav.setViewName("/jobsup/delete"); // webapp/jobsup/delete.jsp

    return mav;
  }

/**
 * 삭제 처리
 * 
 * @param jobsupno
 * @return
 */
@RequestMapping(value = "/jobsup/delete.do", method = RequestMethod.POST)
public ModelAndView delete(JobsupVO jobsupVO) {
  ModelAndView mav = new ModelAndView();
  //System.out.println("test");
  int jobsupno = jobsupVO.getJobsupno();
  mav.addObject("jobsupno", jobsupno);
  
  String title = this.jobsupProc.read(jobsupno).getJobsup_title();
  mav.addObject("title", title);
  
  int cnt = this.jobsupProc.delete(jobsupVO);
  mav.addObject("cnt", cnt); // request에 저장
  
  mav.setViewName("/jobsup/delete_msg"); // webapp/jobsup/update_msg.jsp

  return mav;
  }

}
