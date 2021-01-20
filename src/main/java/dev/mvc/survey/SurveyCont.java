package dev.mvc.survey;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class SurveyCont {
  @Autowired
  @Qualifier("dev.mvc.survey.SurveyProc")
  private SurveyProc surveyProc;
  
  public SurveyCont() {
    System.out.println("--> SurveyCont created.");
  }
  
  /**
   * 등록 폼 http://localhost:9090/team4/survey/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/survey/create"); // /webapp/survey/create.jsp

    return mav; // forward
  }
  
  /**
   * 등록 처리 http://localhost:9090/team4/survey/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/create.do", method = RequestMethod.POST)
  public ModelAndView create(SurveyVO surveyVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String poster = "";     // main image
        
    String upDir = Tool.getRealPath(request, "/survey/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
//    <input type='file' class="form-control" name='posterMF' id='posterMF' 
//               value='' placeholder="파일 선택">
    MultipartFile mf = surveyVO.getPosterMF();
    long size = mf.getSize();
    
    if(size > 0) {
      poster = Upload.saveFileSpring(mf, upDir); 
      if(Tool.isImage(poster)) {
        poster = Tool.preview(upDir, poster, 200, 150);
      }
    }
    surveyVO.setPoster(poster);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    mav.setViewName("/survey/create_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveyProc.create(surveyVO);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
  /**
   * 설문 조사 목록 http://localhost:9090/team4/survey/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_search(
      @RequestParam(value="surveyno", defaultValue="1") int surveyno,
      @RequestParam(value="word", defaultValue="") String word
      ) { 
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/survey/list");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("surveyno", surveyno); // 
    map.put("word", word);     // #{word}
    
    // 검색 목록
    List<SurveyVO> list = surveyProc.list_by_search(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = surveyProc.search_count(map);
    mav.addObject("search_count", search_count);

    SurveyVO surveyVO = surveyProc.read(surveyno);
    mav.addObject("surveyVO", surveyVO);

    return mav;
  }    
  
  /**
   * 설문 조사 조회 http://localhost:9090/team4/survey/read.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/read.do", method = RequestMethod.GET)
  public ModelAndView read(int surveyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/survey/read"); // /webapp/genmember/read.jsp

    SurveyVO surveyVO = this.surveyProc.read(surveyno);
    mav.addObject("surveyVO", surveyVO);

    return mav; // forward
  }
  
  /**
   * 수정 폼 http://localhost:9090/team4/survey/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/update.do", method = RequestMethod.GET)
  public ModelAndView update(int surveyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/survey/update"); // /webapp/survey/update.jsp
    
    SurveyVO surveyVO = this.surveyProc.read(surveyno);
    mav.addObject("surveyVO", surveyVO);

    return mav; // forward
  }
  
  /**
   * 수정 처리 http://localhost:9090/team4/survey/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/update.do", method = RequestMethod.POST)
  public ModelAndView update(SurveyVO surveyVO) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/survey/update_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveyProc.update(surveyVO);
    System.out.println(cnt);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
  /**
   * 삭제 폼 http://localhost:9090/team4/survey/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int surveyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/survey/delete"); // /webapp/survey/update.jsp
    
    SurveyVO surveyVO = this.surveyProc.read(surveyno);
    mav.addObject("surveyVO", surveyVO);

    return mav; // forward
  }
  
  /**
   * 삭제 처리 http://localhost:9090/team4/survey/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/survey/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_msg(int surveyno) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/survey/delete_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveyProc.delete(surveyno);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }

}
