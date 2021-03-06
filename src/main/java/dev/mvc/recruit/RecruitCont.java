package dev.mvc.recruit;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import dev.mvc.cormember.CormemberProc;
import dev.mvc.genmember.GenmemberProc;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class RecruitCont {
  
  @Autowired
  @Qualifier("dev.mvc.cormember.CormemberProc")
  private CormemberProc cormemberProc;
  
  @Autowired
  @Qualifier("dev.mvc.genmember.GenmemberProc")
  private GenmemberProc genmemberProc;
  
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
    String content = "장소: \n+인원:\n준비물:\n비용:\n기타:\n";
    //String content = "장소:\n";
    mav.addObject("content", content);

    
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
     //System.out.println("--> cateno : " + recruitVO.getCateno());
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
  /*
  @RequestMapping(value = "/recruit/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno(int cateno,HttpSession session) {
    ModelAndView mav = new ModelAndView(); // /webapp/contents/list_by_cateno.jsp //
    mav.setViewName("/recruit/list_by_cateno");
  
    // 테이블 이미지 기반, /webapp/contents/list_by_cateno.jsp
    //mav.setViewName("/recruit/list_by_cateno_table_img1");
    
    boolean genlogin = false;
    boolean corlogin = false;
    
    if (genmemberProc.isMember(session)) { 
      genlogin = true;
    }
    
    if (cormemberProc.isMember(session)) {
      corlogin = true;
    }
    
    mav.addObject("genlogin", genlogin);
    mav.addObject("corlogin", corlogin);
    
    ComCateVO comcateVO = this.comcateProc.read(cateno);
    mav.addObject("comcateVO", comcateVO);
    
    ComIntroVO comintroVO = this.comintroProc.read(comcateVO.getComno());
    mav.addObject("comintroVO", comintroVO);
    
    List<RecruitVO> list = this.recruitProc.list_by_cateno(cateno);
    mav.addObject("list", list);
    
    return mav; // forward }
 
  }
  */
  
  /**
   * 목록 + 검색 지원
   * http://localhost:9090/team4/recruit/list.do
   * http://localhost:9090/team4/recruit/list.do?cateno=1&word=스위스
   * @param cateno
   * @param word
   * @return
   */
  /*
  @RequestMapping(value = "/recruit/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search(
      @RequestParam(value="cateno", defaultValue="1") int cateno,
      @RequestParam(value="word", defaultValue="") String word,
      HttpSession session
      ) { 
    
    ModelAndView mav = new ModelAndView();
    // /contents/list_by_cateno_table_img1_search.jsp
    mav.setViewName("/recruit/list_by_cateno_table_img1_search");   
    
    boolean genlogin = false;
    boolean corlogin = false;
    
    if (genmemberProc.isMember(session)) { 
      genlogin = true;
    }
    
    if (cormemberProc.isMember(session)) {
      corlogin = true;
    }
    
    mav.addObject("genlogin", genlogin);
    mav.addObject("corlogin", corlogin);
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cateno", cateno); // #{cateno}
    map.put("word", word);     // #{word}
    
    // 검색 목록
    List<RecruitVO> list = recruitProc.list_by_cateno_search(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = recruitProc.search_count(map);
    mav.addObject("search_count", search_count);

    ComCateVO comcateVO = comcateProc.read(cateno);
    mav.addObject("comcateVO", comcateVO);
    
    ComIntroVO comIntroVO = this.comintroProc.read(comcateVO.getComno());
    mav.addObject("comIntroVO", comIntroVO); 
    
    return mav;
  } 
  */
  
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/team4/recruit/list.do
   * http://localhost:9090/team4/recruit/list.do?cateno=1&title=채용&nowPage=1
   * @param cateno
   * @param title
   * @param nowPage
   * @return
   */  
  @RequestMapping(value = "/recruit/list.do", method = RequestMethod.GET)
    public ModelAndView list_by_cateno_search_paging(
        @RequestParam(value="cateno", defaultValue="1") int cateno,
        @RequestParam(value="word", defaultValue="") String word,
        @RequestParam(value="nowPage", defaultValue="1") int nowPage,
        HttpSession session
        ) { 
      System.out.println("--> nowPage: " + nowPage);
      
      ModelAndView mav = new ModelAndView();
           
      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cateno", cateno); // #{cateno}
      map.put("word", word);     // #{word}
      map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
      
      // 검색 목록
      List<RecruitVO> list = recruitProc.list_by_cateno_search_paging(map);
      mav.addObject("list", list);

      // 검색된 레코드 갯수
      int search_count = recruitProc.search_count(map);
      mav.addObject("search_count", search_count);
    
      ComCateVO  comcateVO  = comcateProc.read(cateno);
      mav.addObject("comcateVO ", comcateVO);
      
      ComIntroVO  comIntroVO = comintroProc.read(comcateVO.getComno());
      mav.addObject("comIntroVO", comIntroVO);

      /*
       * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
       * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
       * 
       * @param listFile 목록 파일명 
       * @param cateno 카테고리번호 
       * @param search_count 검색(전체) 레코드수 
       * @param nowPage     현재 페이지
       * @param word 검색어
       * @return 페이징 생성 문자열
       */ 
      String paging = recruitProc.pagingBox("list.do", cateno, search_count, nowPage, word);
      mav.addObject("paging", paging);
    
      mav.addObject("nowPage", nowPage);

      // /contents/list_by_cateno_table_img1_search_paging.jsp
      mav.setViewName("/recruit/list_by_cateno_table_img1_search_paging");   
      
      return mav;
    }     
    
    // http://localhost:9090/team4/recruit/read.do
    /**
     * 전체 목록
     * @return
     */
    @RequestMapping(value="/recruit/read.do", method=RequestMethod.GET )
    public ModelAndView read(int recruitno,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      
      boolean genlogin = false;
      boolean corlogin = false;
      
      if (genmemberProc.isMember(session)) { 
        genlogin = true;
      }
      
      if (cormemberProc.isMember(session)) {
        corlogin = true;
      }
      
      mav.addObject("genlogin", genlogin);
      mav.addObject("corlogin", corlogin);

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
    
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 글 수정
      cnt = this.recruitProc.delete(recruitno);
      if (cnt == 1) {
        comcateProc.decreaseCnt(cateno);
        /*
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
         */
      }
      
      String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // 절대 경로
      sw = Tool.deleteFile(upDir, recruitVO.getFile1());  // Folder에서 1건의 파일 삭제
      sw = Tool.deleteFile(upDir, recruitVO.getThumb1());  // Folder에서 1건의 파일 삭제

    }

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
  
  /**
   * 메인 이미지 등록 폼 http://localhost:9090/resort/recruit/img_create.do
   * @return
   */
  @RequestMapping(value = "/recruit/img_create.do", method = RequestMethod.GET)
  public ModelAndView img_create(int recruitno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/img_create"); // /webapp/contents/img_create.jsp

    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    mav.addObject("recruitVO", recruitVO);
    
    ComCateVO comcateVO = this.comcateProc.read(recruitVO.getCateno());
    mav.addObject("comcateVO", comcateVO); 

    ComIntroVO comIntroVO = this.comintroProc.read(comcateVO.getComno());
    mav.addObject("comIntroVO", comIntroVO); 
    
    return mav; // forward
  }
  
  /**
   * 메인 이미지 등록 처리 http://localhost:9090/resort/recruit/img_create.do
   * 
   * @return
   */
  @RequestMapping(value = "/recruit/img_create.do", method = RequestMethod.POST)
  public ModelAndView img_create(HttpServletRequest request, RecruitVO recruitVO,
                                    @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("recruitno", recruitVO.getRecruitno());
    hashMap.put("passwd", recruitVO.getPasswd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 파일 업로드
      // -------------------------------------------------------------------
      // 파일 전송 코드 시작
      // -------------------------------------------------------------------
      String file1 = "";     // main image
      String thumb1 = ""; // preview image
          
      String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // 절대 경로
      // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택" multiple="multiple">
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
      
      recruitVO.setFile1(file1);
      recruitVO.setThumb1(thumb1);
      recruitVO.setSize1(size1);
      // -------------------------------------------------------------------
      // 파일 전송 코드 종료
      // -------------------------------------------------------------------
      
      //mav.addObject("nowPage", nowPage);
      mav.addObject("recruitno", recruitVO.getRecruitno());
      
      mav.setViewName("redirect:/recruit/read.do");
      
      cnt = this.recruitProc.img_create(recruitVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/recruit/update_msg"); // webapp/contents/update_msg.jsp
    }
    
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
            
    return mav;    
  }
  
  /**
   * 메인 이미지 삭제/수정 폼 http://localhost:9090/resort/recruit/img_update.do
   * @return
   */
  @RequestMapping(value = "/recruit/img_update.do", method = RequestMethod.GET)
  public ModelAndView img_update(int recruitno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/img_update"); // /webapp/recruit/img_update.jsp

    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    mav.addObject("recruitVO", recruitVO);
    
    ComCateVO comcateVO = this.comcateProc.read(recruitVO.getCateno());
    mav.addObject("comcateVO", comcateVO); 

    ComIntroVO comIntroVO = this.comintroProc.read(comcateVO.getComno());
    mav.addObject("comIntroVO", comIntroVO); 
    
    return mav; // forward
  }
  
  /**
   * 메인 이미지 삭제 처리 http://localhost:9090/resort/recruit/img_delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/recruit/img_delete.do", method = RequestMethod.POST)
  public ModelAndView img_delete(HttpServletRequest request,
                                       int recruitno, 
                                       int cateno, 
                                       String passwd,
                                       @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("recruitno", recruitno);
    hashMap.put("passwd", passwd);
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 파일 업로드
      // -------------------------------------------------------------------
      // 파일 삭제 코드 시작
      // -------------------------------------------------------------------
      // 삭제할 파일 정보를 읽어옴.
      RecruitVO recruitVO = recruitProc.read(recruitno);
      // System.out.println("file1: " + contentsVO.getFile1());
      
      String file1 = recruitVO.getFile1().trim();
      String thumb1 = recruitVO.getThumb1().trim();
      long size1 = recruitVO.getSize1();
      boolean sw = false;
      
      String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // 절대 경로
      sw = Tool.deleteFile(upDir, recruitVO.getFile1());  // Folder에서 1건의 파일 삭제
      sw = Tool.deleteFile(upDir, recruitVO.getThumb1());  // Folder에서 1건의 파일 삭제
      // System.out.println("sw: " + sw);
      
      file1 = "";
      thumb1 = "";
      size1 = 0;
      
      recruitVO.setFile1(file1);
      recruitVO.setThumb1(thumb1);
      recruitVO.setSize1(size1);
      // -------------------------------------------------------------------
      // 파일 삭제 종료 시작
      // -------------------------------------------------------------------
      
      //mav.addObject("nowPage", nowPage);  // redirect시에 get parameter로 전송됨
      mav.addObject("recruitno", recruitno);
      mav.setViewName("redirect:/recruit/read.do");
      
      cnt = this.recruitProc.img_delete(recruitVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/recruit/update_msg"); // webapp/recruit/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
            
    return mav;    
  }
  
  /**
   * 메인 이미지 수정 처리 http://localhost:9090/resort/recruit/img_update.do
   * 기존 이미지 삭제후 새로운 이미지 등록(수정 처리)
   * @return
   */
  @RequestMapping(value = "/recruit/img_update.do", method = RequestMethod.POST)
  public ModelAndView img_update(HttpServletRequest request, RecruitVO recruitVO,
                                     @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("recruitno", recruitVO.getRecruitno());
    hashMap.put("passwd", recruitVO.getPasswd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우 파일 업로드
      // -------------------------------------------------------------------
      // 파일 삭제 코드 시작
      // -------------------------------------------------------------------
      // 삭제할 파일 정보를 읽어옴.
      RecruitVO vo = recruitProc.read(recruitVO.getRecruitno());
      // System.out.println("file1: " + contentsVO.getFile1());
      
      String file1 = vo.getFile1().trim();
      String thumb1 = vo.getThumb1().trim();
      long size1 = 0;
      boolean sw = false;
      
      String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // 절대 경로
      sw = Tool.deleteFile(upDir, recruitVO.getFile1());  // Folder에서 1건의 파일 삭제
      sw = Tool.deleteFile(upDir, recruitVO.getThumb1());  // Folder에서 1건의 파일 삭제
      // System.out.println("sw: " + sw);
      // -------------------------------------------------------------------
      // 파일 삭제 종료 시작
      // -------------------------------------------------------------------
      
      // -------------------------------------------------------------------
      // 파일 전송 코드 시작
      // -------------------------------------------------------------------
      // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택" multiple="multiple">
      MultipartFile mf = recruitVO.getFile1MF();
      size1 = mf.getSize();  // 파일 크기
      if (size1 > 0) { // 파일 크기 체크
        // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        file1 = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(file1)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          thumb1 = Tool.preview(upDir, file1, 200, 150); 
        }
      }    
      
      recruitVO.setFile1(file1);
      recruitVO.setThumb1(thumb1);
      recruitVO.setSize1(size1);
      // -------------------------------------------------------------------
      // 파일 전송 코드 종료
      // -------------------------------------------------------------------

      //mav.addObject("nowPage", nowPage);
      mav.addObject("recruitno", recruitVO.getRecruitno());
      mav.setViewName("redirect:/recruit/read.do");
      
      
      cnt = this.recruitProc.img_create(recruitVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/recruit/update_msg"); // webapp/recruit/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
            
    return mav;    
  }
    
     

}
