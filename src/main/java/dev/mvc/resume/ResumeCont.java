package dev.mvc.resume;

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
public class ResumeCont {
  @Autowired
  @Qualifier("dev.mvc.resume.ResumeProc")
  private ResumeProcInter resumeProc;
  
  /**
   * 등록폼
   * @return
   */
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/create");
    return mav;
  }
  
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String res_pic = "";     // main image
    String res_thumb = ""; // preview image
    String upDir = Tool.getRealPath(request, "/resume/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = resumeVO.getRes_picMF();
    long res_size = mf.getSize();  // 파일 크기
    if (res_size > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      res_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(res_pic)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        res_thumb = Tool.preview(upDir, res_pic, 120, 80); 
      }      
    }    
    
//    String res_mail2 = "";
//    res_mail2 = "@" + res_mail2;
    
    resumeVO.setRes_pic(res_pic);
    resumeVO.setRes_thumb(res_thumb);
    resumeVO.setRes_size(res_size);
    //resumeVO.setRes_mail2(res_mail2);
    
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    mav.setViewName("/resume/create_msg"); 
    
    int cnt = this.resumeProc.create(resumeVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  /**
   * 회원 전체 이력서 목록
   * @return
   */
  @RequestMapping(value = "/resume/list_all.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/list_all"); // /webapp/contents/list_all.jsp

    List<ResumeVO> list = this.resumeProc.list_all();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/resume/read.do", method=RequestMethod.GET )
  public ModelAndView read(int res_no) {
    ModelAndView mav = new ModelAndView();

    ResumeVO resumeVO = this.resumeProc.read(res_no);
    mav.addObject("resumeVO", resumeVO);
    
    mav.setViewName("/resume/read");
    return mav;
  }

  



}
