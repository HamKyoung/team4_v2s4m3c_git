package dev.mvc.event;

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

import dev.mvc.resume.ResumeVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class EventCont {
  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;
  
  /**
   * 등록폼
   * @return
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/create");
    return mav;
  }

  /**
   * 등록 처리
   * @param request
   * @param eventVO
   * @return
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String eve_pic = "";     // main image
    String eve_thumb = ""; // preview image
    String upDir = Tool.getRealPath(request, "/event/storage/main_images"); // 절대 경로

    MultipartFile mf = eventVO.getEve_picMF();
    long eve_size = mf.getSize();  // 파일 크기
    if (eve_size > 0) { // 파일 크기 체크
      eve_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(eve_pic)) { // 이미지인지 검사
        eve_thumb = Tool.preview(upDir, eve_pic, 120, 80); 
      }      
    }    
    
    eventVO.setEve_pic(eve_pic);
    eventVO.setEve_thumb(eve_thumb);
    eventVO.setEve_size(eve_size);
    
    mav.setViewName("/event/create_msg"); 
    
    int cnt = this.eventProc.create(eventVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  /**
   * 검색 목록
   * @param res_work
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/event/list.do", method = RequestMethod.GET)
  public ModelAndView list_eventno_seqno_asc(
      @RequestParam(value="eve_content", defaultValue="") String eve_content,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("eve_content", eve_content);
    map.put("nowPage", nowPage);

    List<EventVO> list = eventProc.list_eventno_seqno_asc(map);
    mav.addObject("list", list);
    
    int search_count = eventProc.search_count(map);
    mav.addObject("search_count", search_count);

    String paging = eventProc.pagingBox("list.do", search_count, nowPage, eve_content);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/event/list");   
    
    return mav;
  }    

  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/event/read.do", method=RequestMethod.GET )
  public ModelAndView read(int eventno) {
    ModelAndView mav = new ModelAndView();

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);
    
    mav.setViewName("/event/read");
    return mav;
  }

  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/event/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int eventno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("word", word);
      map.put("nowPage", nowPage);
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/event/read_update");

      EventVO eventVO = this.eventProc.read_update(eventno);
      mav.addObject("eventVO", eventVO);

      List<EventVO> list = this.eventProc.list_eventno_seqno_asc(map);
      mav.addObject("list", list);

      return mav; // forward
    } 
  
  /**
   * 삭제
   * @param res_no
   * @return
   */
  @RequestMapping(value = "/event/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int eventno,
    @RequestParam(value="word", defaultValue="") String word,
    @RequestParam(value="nowPage", defaultValue="1") int nowPage
    ) { 
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);
    map.put("nowPage", nowPage);
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/read_delete");

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);

    List<EventVO> list = this.eventProc.list_eventno_seqno_asc(map);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * @param ResumeVO
   * @return
   */
  @RequestMapping(value="/event/update.do", method=RequestMethod.POST )
  public ModelAndView update(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    
    String eve_pic = "";     // main image
    String eve_thumb = ""; // preview image
    String upDir = Tool.getRealPath(request, "/event/storage/main_images"); // 절대 경로

    MultipartFile mf = eventVO.getEve_picMF();
    long eve_size = mf.getSize();  // 파일 크기
    if (eve_size > 0) { // 파일 크기 체크
      eve_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(eve_pic)) { // 이미지인지 검사
        eve_thumb = Tool.preview(upDir, eve_pic, 120, 80); 
      }      
    }    
    
    eventVO.setEve_pic(eve_pic);
    eventVO.setEve_thumb(eve_thumb);
    eventVO.setEve_size(eve_size);
    
    int cnt = this.eventProc.update(eventVO);    
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/event/update_msg"); // webapp/contents/update_msg.jsp
    
    return mav;
  }
  
  /**
   * 이미지 업데이트 폼
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/event/update_img.do", method = RequestMethod.GET)
  public ModelAndView update_img(int eventno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/event/update_img");

    EventVO eventVO = this.eventProc.read(eventno);
    mav.addObject("eventVO", eventVO);

    return mav; // forward
  }

  /**
   * 이미지 업데이트 처리
   * @param request
   * @param resumeVO
   * @return
   */
  @RequestMapping(value = "/event/update_img.do", method = RequestMethod.POST)
  public ModelAndView img_update(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("eventno", eventVO.getEventno());

    int cnt = 0; 
    
    EventVO vo = eventProc.read(eventVO.getEventno());
    String eve_pic = vo.getEve_pic();
    String eve_thumb = vo.getEve_thumb().trim();
    long eve_size = 0;
    boolean sw = false;
    
    String upDir = Tool.getRealPath(request, "/event/storage/main_images");
    sw = Tool.deleteFile(upDir, eventVO.getEve_pic());
    sw = Tool.deleteFile(upDir, eventVO.getEve_thumb());
    
    MultipartFile mf = eventVO.getEve_picMF();
    eve_size = mf.getSize();
    if (eve_size > 0 ) {
      eve_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(eve_pic)) {
        eve_thumb = Tool.preview(upDir, eve_pic, 200, 150);
      }
    }
    
    eventVO.setEve_pic(eve_pic);
    eventVO.setEve_thumb(eve_thumb);
    eventVO.setEve_size(eve_size);
    
    mav.setViewName("redirect:/event/read.do?eventno=" + eventVO.getEventno());
    
    cnt = this.eventProc.update_img(eventVO);
    
    mav.addObject("cnt", cnt);
            
    return mav;    
  }
  
  /**
   * 삭제
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int eventno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.eventProc.delete(eventno);
    mav.addObject("cnt", cnt);

    mav.setViewName("/event/delete_msg"); 

    return mav;
  }

  /**
   * 이미지 삭제
   * @param request
   * @param res_no
   * @return
   */
  @RequestMapping(value = "/event/img_delete.do", method = RequestMethod.POST)
  public ModelAndView img_delete(HttpServletRequest request, int eventno) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("eventno", eventno);
    
    int cnt = 0;

    EventVO eventVO = eventProc.read(eventno);
      
    String eve_pic = eventVO.getEve_pic().trim();
    String eve_thumb = eventVO.getEve_thumb().trim();
    
    long eve_size = eventVO.getEve_size();
    boolean sw = false;
      
    String upDir = Tool.getRealPath(request, "/event/storage/main_images");
    sw = Tool.deleteFile(upDir, eventVO.getEve_pic());
    sw = Tool.deleteFile(upDir, eventVO.getEve_thumb()); 
     
    eve_pic = "";
    eve_thumb = "";
    eve_size = 0;
    
    eventVO.setEve_pic(eve_pic);
    eventVO.setEve_thumb(eve_thumb);
    eventVO.setEve_size(eve_size);

    mav.setViewName("redirect:/event/read.do?eventno=" + eventno);
    cnt = this.eventProc.delete_img(eventVO);

    mav.addObject("cnt", cnt); 

    return mav;    
  }
  
  /**
   * 공개여부 수정
   * @param resumeVO
   * @return
   */
  @RequestMapping(value = "/event/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
        
    int cnt = this.eventProc.update_visible(eventVO);
    mav.addObject("cnt", cnt); 
    
    if (cnt == 1) {
      mav.setViewName("redirect:/event/list.do");
    } else {
      EventVO vo = this.eventProc.read(eventVO.getEventno());

      mav.setViewName("/event/update_visible_msg"); 
    }
    return mav;
  }

  
  
  
  
  
}
