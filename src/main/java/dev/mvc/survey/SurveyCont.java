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

import dev.mvc.surveyitem.SurveyitemProc;
import dev.mvc.surveyitem.SurveyitemVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class SurveyCont {
  @Autowired
  @Qualifier("dev.mvc.survey.SurveyProc")
  private SurveyProc surveyProc;
  
  @Autowired
  @Qualifier("dev.mvc.surveyitem.SurveyitemProc")
  private SurveyitemProc surveyitemProc;
  
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
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/survey/list.do
   * http://localhost:9090/resort/survey/list.do?word=스위스&nowPage=1
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/survey/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_surveyno_search_paging(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<SurveyVO> list = surveyProc.list_by_search_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = surveyProc.search_count(map);
    mav.addObject("search_count", search_count);
  

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = surveyProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/survey/list");   
    
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
