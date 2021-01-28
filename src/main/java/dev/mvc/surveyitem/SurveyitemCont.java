package dev.mvc.surveyitem;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.genmember.GenmemberProc;
import dev.mvc.genmember.GenmemberVO;
import dev.mvc.survey.SurveyProc;
import dev.mvc.survey.SurveyVO;
import dev.mvc.surveymember.SurveymemberProc;
import dev.mvc.surveymember.SurveymemberVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class SurveyitemCont {
  @Autowired
  @Qualifier("dev.mvc.survey.SurveyProc")
  private SurveyProc surveyProc;
  
  @Autowired
  @Qualifier("dev.mvc.surveyitem.SurveyitemProc")
  private SurveyitemProc surveyitemProc;
  
  @Autowired
  @Qualifier("dev.mvc.surveymember.SurveymemberProc")
  private SurveymemberProc surveymemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
  public SurveyitemCont() {
    System.out.println("--> SurveyitemCont created.");
  }
  
  /**
   * 투표, JSON 출력
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/surveyitem/vote.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String vote(int sur_itemno, int surveyno, HttpSession session, SurveymemberVO surveymemberVO){
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("sur_itemno", sur_itemno);     // #{sur_itemno}
    map.put("surveyno", surveyno); // #{surveyno}

    int cnt = 0;
    int itemcnt = 0;
    boolean sw = false;
    int gen_memberno = (int) session.getAttribute("genmemberno");
    int survey_check = 0;

    if (genmemberProc.isMember(session)) {
      sw = true;
      
      if (sw = true) {
        cnt = this.surveyitemProc.update_cnt(map);
      }
      
      if (cnt == 1) {
        SurveyitemVO surveyitemVO = this.surveyitemProc.read(sur_itemno);
        itemcnt = surveyitemVO.getItemcnt();

        surveymemberVO.setGen_memberno(gen_memberno);
        surveymemberProc.create(surveymemberVO);
      }
    }
    
    JSONObject json = new JSONObject();
    json.put("itemcnt", itemcnt);
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  /**
   * 등록 폼 http://localhost:9090/team4/surveyitem/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveyitem/create"); // /webapp/survey/create.jsp

    return mav; // forward
  }
  
  /**
   * 등록 처리 http://localhost:9090/team4/surveyitem/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/create.do", method = RequestMethod.POST)
  public ModelAndView create(SurveyitemVO surveyitemVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String itemfile = "";     // main image
        
    String upDir = Tool.getRealPath(request, "/surveyitem/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
//    <input type='file' class="form-control" name='posterMF' id='posterMF' 
//               value='' placeholder="파일 선택">
    MultipartFile mf = surveyitemVO.getItemfileMF();
    long size = mf.getSize();
    
    if(size > 0) {
      itemfile = Upload.saveFileSpring(mf, upDir); 
      if(Tool.isImage(itemfile)) {
        itemfile = Tool.preview(upDir, itemfile, 200, 150);
      }
    }
    surveyitemVO.setItemfile(itemfile);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    mav.setViewName("/surveyitem/create_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveyitemProc.create(surveyitemVO);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
  /**
   * 설문 조사 목록 http://localhost:9090/team4/surveyitem/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_search(
      @RequestParam(value="surveyno", defaultValue="1") int surveyno,
      @RequestParam(value="word", defaultValue="") String word,
      HttpSession session
      ) { 
    ModelAndView mav = new ModelAndView();
    
    int gen_memberno = (int) session.getAttribute("genmemberno");
    int cnt = surveymemberProc.survey_check(gen_memberno);

    if (cnt == 1) {
      mav.setViewName("/surveyitem/already");
    } else {
      mav.setViewName("/surveyitem/list");
    }
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("surveyno", surveyno); // #{surveyno}
    map.put("word", word); // #{word}

    // 검색 목록
    List<SurveyitemVO> list = surveyitemProc.list_by_search(map);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = surveyitemProc.search_count(map);
    mav.addObject("search_count", search_count);

    SurveyVO surveyVO = surveyProc.read(surveyno);
    mav.addObject("surveyVO", surveyVO);

    return mav;
  }
  
  /**
   * 설문 조사 결과 목록 http://localhost:9090/team4/surveyitem/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/result.do", method = RequestMethod.GET)
  public ModelAndView list_by_result(
      @RequestParam(value="surveyno", defaultValue="1") int surveyno
      ) { 
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveyitem/result");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("surveyno", surveyno); // #{surveyno}
    
    // 검색 목록
    List<SurveyitemVO> list = surveyitemProc.list_by_search(map);
    mav.addObject("list", list);
    
    SurveyVO surveyVO = surveyProc.read(surveyno);
    mav.addObject("surveyVO", surveyVO);

    return mav;
  }    
  
  /**
   * 설문 조사 조회 http://localhost:9090/team4/surveyitem/read.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/read.do", method = RequestMethod.GET)
  public ModelAndView read(int sur_itemno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveyitem/read");

    SurveyitemVO surveyitemVO = this.surveyitemProc.read(sur_itemno);
    mav.addObject("surveyitemVO", surveyitemVO);

    return mav; // forward
  }
  
  
  /**
   * 수정 폼 http://localhost:9090/team4/surveyitem/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/update.do", method = RequestMethod.GET)
  public ModelAndView update(int sur_itemno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveyitem/update"); 
    
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(sur_itemno);
    mav.addObject("surveyitemVO", surveyitemVO);

    return mav;
  }
  
  /**
   * 수정 처리 http://localhost:9090/team4/surveyitem/update.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/update.do", method = RequestMethod.POST)
  public ModelAndView update(SurveyitemVO surveyitemVO) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/surveyitem/update_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveyitemProc.update(surveyitemVO);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }
  
  /**
   * 삭제 폼 http://localhost:9090/team4/surveyitem/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int sur_itemno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surveyitem/delete"); // /webapp/survey/update.jsp
    
    SurveyitemVO surveyitemVO = this.surveyitemProc.read(sur_itemno);
    mav.addObject("surveyitemVO", surveyitemVO);

    return mav; // forward
  }
  
  /**
   * 삭제 처리 http://localhost:9090/team4/surveyitem/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/surveyitem/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_msg(int sur_itemno) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/surveyitem/delete_msg"); // /webapp/survey/create.jsp
    
    int cnt = this.surveyitemProc.delete(sur_itemno);
    mav.addObject("cnt", cnt);

    return mav; // forward
  }

}
