package dev.mvc.resume;

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

import dev.mvc.genmember.GenmemberProcInter;
import dev.mvc.genmember.GenmemberVO;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ResumeCont {
  @Autowired
  @Qualifier("dev.mvc.resume.ResumeProc")
  private ResumeProcInter resumeProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProcInter genmemberProc= null;
  
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
  
  /**
   * 등록 처리
   * @param request
   * @param resumeVO
   * @return
   */
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String res_pic = "";     // main image
    String res_thumb = ""; // preview image
    String upDir = Tool.getRealPath(request, "/resume/storage/main_images"); // 절대 경로

    MultipartFile mf = resumeVO.getRes_picMF();
    long res_size = mf.getSize();  // 파일 크기
    if (res_size > 0) { // 파일 크기 체크
      res_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(res_pic)) { // 이미지인지 검사
        res_thumb = Tool.preview(upDir, res_pic, 120, 80); 
      }      
    }    
    
    resumeVO.setRes_pic(res_pic);
    resumeVO.setRes_thumb(res_thumb);
    resumeVO.setRes_size(res_size);    
    
    mav.setViewName("/resume/create_msg"); 
    
    int cnt = this.resumeProc.create(resumeVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  /**
   * 회원 전체 이력서 목록
   * @return
   */
  /*
   * @RequestMapping(value = "/resume/list.do", method = RequestMethod.GET) public
   * ModelAndView list() { ModelAndView mav = new ModelAndView();
   * mav.setViewName("/resume/list_all"); // /webapp/contents/list_all.jsp
   * 
   * List<ResumeVO> list = this.resumeProc.list(); mav.addObject("list", list);
   * 
   * return mav; }
   */
  
  /**
   * 검색 목록
   * @param res_work
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/resume/list.do", method = RequestMethod.GET)
  public ModelAndView list_resno_seqno_asc(
      @RequestParam(value="res_work", defaultValue="") String res_work,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("res_work", res_work);
    map.put("nowPage", nowPage);

    List<ResumeVO> list = resumeProc.list_resno_seqno_asc(map);
    mav.addObject("list", list);
    
    int search_count = resumeProc.search_count(map);
    mav.addObject("search_count", search_count);

    String paging = resumeProc.pagingBox("list.do", search_count, nowPage, res_work);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_table_img1_search_paging.jsp
    mav.setViewName("/resume/list");   
    
    return mav;
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

  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/resume/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int res_no,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("word", word);
      map.put("nowPage", nowPage);
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/resume/read_update");

      ResumeVO resumeVO = this.resumeProc.read_update(res_no);
      mav.addObject("resumeVO", resumeVO);

      List<ResumeVO> list = this.resumeProc.list_resno_seqno_asc(map);
      mav.addObject("list", list);

      return mav; // forward
    }  

  /**
   * 삭제
   * @param res_no
   * @return
   */
  @RequestMapping(value = "/resume/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int res_no,
    @RequestParam(value="word", defaultValue="") String word,
    @RequestParam(value="nowPage", defaultValue="1") int nowPage
    ) { 
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);
    map.put("nowPage", nowPage);
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/read_delete");

    ResumeVO resumeVO = this.resumeProc.read(res_no);
    mav.addObject("resumeVO", resumeVO);

    List<ResumeVO> list = this.resumeProc.list_resno_seqno_asc(map);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  
  /**
   * 수정 처리
   * @param ResumeVO
   * @return
   */
  @RequestMapping(value="/resume/update.do", method=RequestMethod.POST )
  public ModelAndView update(HttpServletRequest request, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    String res_pic = "";
    String res_thumb = "";
    
    String upDir = Tool.getRealPath(request, "/resume/storage/main_images");
    
    MultipartFile mf = resumeVO.getRes_picMF();
    long res_size = mf.getSize();
    if (res_size > 0) {
      res_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(res_pic)) {
        res_thumb = Tool.preview(upDir, res_pic, 200, 150);
      }
    }
    
    resumeVO.setRes_pic(res_pic);
    resumeVO.setRes_thumb(res_thumb);
    resumeVO.setRes_size(res_size);

    int cnt = this.resumeProc.update(resumeVO);    
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/resume/update_msg"); // webapp/contents/update_msg.jsp
    
    return mav;
  }

  /**
   * 이미지 업데이트 폼
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/resume/update_img.do", method = RequestMethod.GET)
  public ModelAndView update_img(int res_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/update_img");

    ResumeVO resumeVO = this.resumeProc.read(res_no);
    mav.addObject("resumeVO", resumeVO);

    return mav; // forward
  }

  /**
   * 이미지 업데이트 처리
   * @param request
   * @param resumeVO
   * @return
   */
  @RequestMapping(value = "/resume/update_img.do", method = RequestMethod.POST)
  public ModelAndView img_update(HttpServletRequest request, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("res_no", resumeVO.getRes_no());

    int cnt = 0; 
    
    ResumeVO vo = resumeProc.read(resumeVO.getRes_no());
    String res_pic = vo.getRes_pic();
    String res_thumb = vo.getRes_thumb().trim();
    long res_size = 0;
    boolean sw = false;
    
    String upDir = Tool.getRealPath(request, "/resume/storage/main_images");
    sw = Tool.deleteFile(upDir, resumeVO.getRes_pic());
    sw = Tool.deleteFile(upDir, resumeVO.getRes_thumb());
    
    MultipartFile mf = resumeVO.getRes_picMF();
    res_size = mf.getSize();
    if (res_size > 0 ) {
      res_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(res_pic)) {
        res_thumb = Tool.preview(upDir, res_pic, 200, 150);
      }
    }
    
    resumeVO.setRes_pic(res_pic);
    resumeVO.setRes_thumb(res_thumb);
    resumeVO.setRes_size(res_size);
    
    mav.setViewName("redirect:/resume/read.do?res_no=" + resumeVO.getRes_no());
    
    cnt = this.resumeProc.update_img(resumeVO);
    
    mav.addObject("cnt", cnt);
            
    return mav;    
  }

  /**
   * 삭제
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/resume/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int res_no) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.resumeProc.delete(res_no);
    mav.addObject("cnt", cnt);

    mav.setViewName("/resume/delete_msg"); 

    return mav;
  }

  /**
   * 이미지 삭제
   * @param request
   * @param res_no
   * @return
   */
  @RequestMapping(value = "/resume/img_delete.do", method = RequestMethod.POST)
  public ModelAndView img_delete(HttpServletRequest request, int res_no) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("res_no", res_no);
    
    int cnt = 0;

    ResumeVO resumeVO = resumeProc.read(res_no);
      
    String res_pic = resumeVO.getRes_pic().trim();
    String res_thumb = resumeVO.getRes_thumb().trim();
    
    long res_size = resumeVO.getRes_size();
    boolean sw = false;
      
    String upDir = Tool.getRealPath(request, "/resume/storage/main_images");
    sw = Tool.deleteFile(upDir, resumeVO.getRes_pic());
    sw = Tool.deleteFile(upDir, resumeVO.getRes_thumb()); 
     
    res_pic = "";
    res_thumb = "";
    res_size = 0;
    
    resumeVO.setRes_pic(res_pic);
    resumeVO.setRes_thumb(res_thumb);
    resumeVO.setRes_size(res_size);

    mav.setViewName("redirect:/resume/read.do?res_no=" + res_no);
    cnt = this.resumeProc.delete_img(resumeVO);

    mav.addObject("cnt", cnt); 

    return mav;    
  }
  
  /**
   * 공개여부 수정
   * @param resumeVO
   * @return
   */
  @RequestMapping(value = "/resume/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
        
    int cnt = this.resumeProc.update_visible(resumeVO);
    mav.addObject("cnt", cnt); 
    
    if (cnt == 1) {
      mav.setViewName("redirect:/resume/list.do");
    } else {
      ResumeVO vo = this.resumeProc.read(resumeVO.getRes_no());
      //String name = vo.getNotice_name();
      //mav.addObject("name", name);
      mav.setViewName("/resume/update_visible_msg"); 
    }
    return mav;
  }


}
