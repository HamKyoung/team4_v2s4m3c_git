package dev.mvc.recruit;

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

import dev.mvc.attachfile.AttachfileProcInter;
import dev.mvc.attachfile.AttachfileVO;
import dev.mvc.comcate.ComCateProcInter;
import dev.mvc.comcate.ComCateVO;
import dev.mvc.comintro.ComIntroProcInter;
import dev.mvc.comintro.ComIntroVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class RecruitCont {
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc")
  private AttachfileProcInter attachfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.comintro.ComIntroProc")
  private ComIntroProcInter comintroProc;

  @Autowired
  @Qualifier("dev.mvc.comcate.ComCateProc")
  private ComCateProcInter comcateProc;

  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
  private RecruitProcInter recruitProc;

  public RecruitCont() {
    System.out.println("--> RecruitCont created.");
  }

  /**
   * 등록폼 http://localhost:9090/team4/recruit/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/recruit/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/create"); // /webapp/categrp/create.jsp
    // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
    // mav.addObject("content", content);

    
    return mav; // forward
  }
  
  //http://localhost:9090/resort/contents/create.do
   /**
    * 등록 처리
    * @param cateVO
    * @return
    */
   @RequestMapping(value="/recruit/create.do", 
                               method=RequestMethod.POST )
   public ModelAndView create(HttpServletRequest request, RecruitVO recruitVO) {
     
     ModelAndView mav = new ModelAndView();
     // -------------------------------------------------------------------
     // 파일 전송 코드 시작
     // -------------------------------------------------------------------
     String file1 = "";     // main image
     String thumb1 = ""; // preview image
         
     String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // 절대 경로
     // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
     MultipartFile mf = recruitVO.getFile1MF();
     long size1 = mf.getSize();  // 파일 크기
     if (size1 > 0) { // 파일 크기 체크
       // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
       // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
       file1 = Upload.saveFileSpring(mf, upDir); 
       
       if (Tool.isImage(file1)) { // 이미지인지 검사
           // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
           thumb1 = Tool.preview(upDir, file1, 200, 150); 
       }
       
     }    
     // -------------------------------------------------------------------
     // 파일 전송 코드 종료
     // -------------------------------------------------------------------
     
     //recruitVO.setIp(request.getRemoteAddr()); // 접속자 IP
     recruitVO.setFile1(file1);
     recruitVO.setThumb1(thumb1);
     recruitVO.setSize1(size1);
  
     int cnt = this.recruitProc.create(recruitVO); // Call By Reference로 전송
  
     mav.addObject("cnt", cnt);
     mav.addObject("cateno", recruitVO.getCateno());
     mav.addObject("url", "create_msg"); // // webapp/contents/create_msg.jsp
    
     mav.setViewName("/recruit/create_msg"); // /webapp/contents/create_msg.jsp
     
     return mav;
   }

  /**
   * 목록 http://localhost:9090/team4/recruit/list_all.do
   * 
   * @return
   */
  @RequestMapping(value = "/recruit/list_all.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/list_all"); // /webapp/recruit/list_all.jsp

    //ComCateVO comcateVO = this.comcateProc.read();
    //mav.addObject("comcateVO", comcateVO);

    //ComIntroVO comintroVO = this.comintroProc.read(comcateVO.getComno());
    //mav.addObject("comintroVO", comintroVO);

    List<RecruitVO> list = this.recruitProc.list_all();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 카테고리별 목록 http://localhost:9090/team4/recruit/list.do
   * 
   * @return
   */
    @RequestMapping(value = "/recruit/list.do", method = RequestMethod.GET)
    public ModelAndView list_by_cateno(int cateno) { ModelAndView mav = new
    ModelAndView(); // /webapp/contents/list_by_cateno.jsp //
    mav.setViewName("/recruit/list_by_cateno");
    
    // 테이블 이미지 기반, /webapp/contents/list_by_cateno.jsp
    //mav.setViewName("/recruit/list_by_cateno_table_img1");
    
    ComCateVO comcateVO = this.comcateProc.read(cateno);
    mav.addObject("comcateVO", comcateVO);
    
    ComIntroVO comintroVO = this.comintroProc.read(comcateVO.getComno());
    mav.addObject("comintroVO", comintroVO);
    
    List<RecruitVO> list = this.recruitProc.list_by_cateno(cateno);
    mav.addObject("list", list);
    
    return mav; // forward }
   
    }
    
    // http://localhost:9090/team4/recruit/read.do
    /**
     * 전체 목록
     * @return
     */
    @RequestMapping(value="/recruit/read.do", method=RequestMethod.GET )
    public ModelAndView read(int recruitno) {
      ModelAndView mav = new ModelAndView();

      RecruitVO recruitVO = this.recruitProc.read(recruitno);
      mav.addObject("recruitVO", recruitVO); // request.setAttribute("contentsVO", contentsVO);
      
      ComCateVO comcateVO = this.comcateProc.read(recruitVO.getCateno());
      mav.addObject("comcateVO", comcateVO);
      
      ComIntroVO comintroVO = this.comintroProc.read(comcateVO.getComno());
      mav.addObject("comintroVO", comintroVO);
      
      // 첨부 파일 목록 
      List<AttachfileVO> attachfile_list =this.attachfileProc.list_by_recruitno(recruitno);
      mav.addObject("attachfile_list", attachfile_list);
//      System.out.println("--> 첨부 파일 갯수: " + attachfile_list.size());
       
      
      //mav.setViewName("/recruit/read"); // /webapp/contents/read.jsp
      // mav.setViewName("/recruit/read_img"); // /webapp/contents/read_img.jsp
      mav.setViewName("/recruit/read_img_attachfile"); // /webapp/contents/read_img_attachfile.jsp    
      return mav;
    }

  // http://localhost:9090/resort/recruit/update.do
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/recruit/update.do", method=RequestMethod.GET )
  public ModelAndView update(int recruitno) {
    ModelAndView mav = new ModelAndView();
    
    RecruitVO recruitVO = this.recruitProc.read_update(recruitno); // 수정용 읽기
    mav.addObject("recruitVO", recruitVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/recruit/update"); // webapp/recruit/update.jsp
    
    return mav;
  }
 // http://localhost:9090/resort/contents/update.do
  /**
   * 수정 처리
   * @param recruitVO
   * @return
   */
  @RequestMapping(value="/recruit/update.do", method=RequestMethod.POST )
  public ModelAndView update(RecruitVO recruitVO) {
    ModelAndView mav = new ModelAndView();
    
    ComCateVO comcateVO = this.comcateProc.read(recruitVO.getCateno());
    // mav.addObject("cateVO", cateVO); // 전달안됨.
    mav.addObject("cate_name", comcateVO.getCate_name());
    mav.addObject("cateno", comcateVO.getCateno());

    ComIntroVO comIntroVO = this.comintroProc.read(comcateVO.getComno());
    // mav.addObject("categrpVO", categrpVO); // 전달안됨.
    mav.addObject("com_name", comIntroVO.getCom_name());
    
    mav.addObject("recruitno", recruitVO.getRecruitno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("recruitno", recruitVO.getRecruitno());
    hashMap.put("passwd", recruitVO.getPasswd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 글 수정
      cnt = this.recruitProc.update(recruitVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
        
    mav.setViewName("/recruit/update_msg"); // webapp/recruit/update_msg.jsp
    
    return mav;
  }
    
  /**
   * 삭제폼
   * @param recruitno
   * @return
   */
    @RequestMapping(value="/recruit/delete.do", method=RequestMethod.GET )
    public ModelAndView delete(int recruitno) { 
      ModelAndView mav = new  ModelAndView();
    
    RecruitVO recruitVO = this.recruitProc.read_update(recruitno); // 수정용 읽기
    mav.addObject("recruitVO", recruitVO); //
    //request.setAttribute("recruitVO", recruitVO);
    
    mav.setViewName("/recruit/delete"); // webapp/contents/delete.jsp
    
    return mav;
  }
      
  // http://localhost:9090/resort/recruit/delete.do
  /**
   * 삭제 처리 +  파일 삭제
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/recruit/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(HttpServletRequest request,
                                           int cateno, 
                                           int recruitno, 
                                           String passwd,
                                           @RequestParam(value="word", defaultValue="") String word,
                                           @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
   
    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    String title = recruitVO.getTitle();
    mav.addObject("title", title);
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("recruitno", recruitno);
    hashMap.put("passwd", passwd);
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    boolean sw = false;
    
/*    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 글 수정
      cnt = this.recruitProc.delete(recruitno);
      if (cnt == 1) {
        comcateProc.decreaseCnt(cateno);
        
        // -------------------------------------------------------------------------------------
        // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("cateno", cateno);
        map.put("word", word);
        // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
        if (recruitProc.search_count(map) % Contents.RECORD_PER_PAGE == 0) {
          nowPage = nowPage - 1;
          if (nowPage < 1) {
            nowPage = 1; // 시작 페이지
          }
        }
        // -------------------------------------------------------------------------------------
      }
      
      String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // 절대 경로
      sw = Tool.deleteFile(upDir, recruitVO.getFile1());  // Folder에서 1건의 파일 삭제
      sw = Tool.deleteFile(upDir, recruitVO.getThumb1());  // Folder에서 1건의 파일 삭제

    }
*/
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
    //mav.addObject("nowPage", nowPage); // request에 저장
    // System.out.println("--> ContentsCont.java nowPage: " + nowPage);
    
    mav.addObject("cateno", recruitVO.getCateno()); // redirect parameter 적용
   // mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
    
    mav.setViewName("/recruit/delete_msg"); // webapp/contents/delete_msg.jsp
    //mav.setViewName("redirect:/recruit/msg.do"); 
    
    return mav;
  }
     

}
