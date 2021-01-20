package dev.mvc.notice;

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
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")

  private NoticeProcInter noticeProc;

  public NoticeCont() {
    System.out.println("--> NoticeCont created.");
  }

  /**
   * 공지사항 등록
   * @return
   */
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/create"); // /webapp/notice/create.jsp
    return mav; // forward
  }

  /**
   * 공지사항 등록 처리
   * @param noticeVO
   * @return
   */
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, NoticeVO noticeVO) {

    ModelAndView mav = new ModelAndView();
    
    String notice_file1 = "";
    String notice_thumb1 = "";
    
    String upDir = Tool.getRealPath(request, "/notice/storage/main_images");
    
    MultipartFile mf = noticeVO.getNotice_file1MF();
    long size1 = mf.getSize();
    if (size1 > 0) {
      notice_file1 = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(notice_file1)) {
        notice_thumb1 = Tool.preview(upDir, notice_file1, 200, 150);
      }
    }
    
    noticeVO.setNotice_file1(notice_file1);
    noticeVO.setNotice_thumb1(notice_thumb1);
    noticeVO.setNotice_size1(size1);
    
    mav.setViewName("/notice/create_msg"); // /webapp/notice/create_msg.jsp

    int cnt = this.noticeProc.create(noticeVO);
    mav.addObject("cnt", cnt);

    return mav;
  }

  /**
   * 공지사항 리스트
   * @return
   */
//  @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    mav.setViewName("/notice/list"); // /webapp/notice/list.jsp
//
//    List<NoticeVO> list = this.noticeProc.list_notice_seqno_asc();
//    // List<NoticeVO> list = this.noticeProc.list_seqno_asc();
//    mav.addObject("list", list);
//
//    return mav; // forward
//  }

  /**
   * 목록 + 검색 + 페이징 지원
   * @param noticeno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
  public ModelAndView list_notice_seqno_asc(
      @RequestParam(value="notice_word", defaultValue="") String notice_word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("notice_word", notice_word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     

    // 검색 목록
    List<NoticeVO> list = noticeProc.list_notice_seqno_asc(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = noticeProc.search_count(map);
    mav.addObject("search_count", search_count);

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
    String paging = noticeProc.pagingBox("list.do", search_count, nowPage, notice_word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_table_img1_search_paging.jsp
    mav.setViewName("/notice/list");   
    
    return mav;
  }    
  
  /**
   * 공지사항 조회
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
  public ModelAndView read(int notice_no) {
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = this.noticeProc.read(notice_no);
    mav.addObject("noticeVO", noticeVO);

    mav.setViewName("/notice/read");
    return mav;
  }
  
  /**
   * 공지사항 수정용 조회
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int notice_no,
    @RequestParam(value="word", defaultValue="") String word,
    @RequestParam(value="nowPage", defaultValue="1") int nowPage
    ) { 
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/read_update"); // /webapp/notice/read_update.jsp

    NoticeVO noticeVO = this.noticeProc.read_update(notice_no);
    mav.addObject("noticeVO", noticeVO);

    // List<NoticeVO> list = this.noticeProc.list_notice_no_asc(); // PK 기준
    List<NoticeVO> list = this.noticeProc.list_notice_seqno_asc(map); // seqno 기준
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 공지사항 삭제용 조회
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int notice_no,
    @RequestParam(value="word", defaultValue="") String word,
    @RequestParam(value="nowPage", defaultValue="1") int nowPage
    ) { 
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용    
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/read_delete"); // /webapp/notice/read_delete.jsp

    NoticeVO noticeVO = this.noticeProc.read(notice_no);
    mav.addObject("noticeVO", noticeVO);

    List<NoticeVO> list = this.noticeProc.list_notice_seqno_asc(map);
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * 공지사항 수정 + 새로운 이미지 등록 처리
   * @param noticeVO
   * @return
   */
  @RequestMapping(value = "/notice/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, NoticeVO noticeVO) {

    ModelAndView mav = new ModelAndView();
    
    String notice_file1 = "";
    String notice_thumb1 = "";
    
    String upDir = Tool.getRealPath(request, "/notice/storage/main_images");
    
    MultipartFile mf = noticeVO.getNotice_file1MF();
    long size1 = mf.getSize();
    if (size1 > 0) {
      notice_file1 = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(notice_file1)) {
        notice_thumb1 = Tool.preview(upDir, notice_file1, 200, 150);
      }
    }
    
    noticeVO.setNotice_file1(notice_file1);
    noticeVO.setNotice_thumb1(notice_thumb1);
    noticeVO.setNotice_size1(size1);

    int cnt = this.noticeProc.update(noticeVO);
    mav.addObject("cnt", cnt);

    mav.setViewName("/notice/update_msg"); // webapp/notice/update_msg.jsp

    return mav;
  }
  
  /**
   * 공지사항 이미지 수정
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/update_img.do", method = RequestMethod.GET)
  public ModelAndView update_img(int notice_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice/update_img");

    NoticeVO noticeVO = this.noticeProc.read(notice_no);
    mav.addObject("noticeVO", noticeVO);

    return mav; // forward
  }

  /**
   * 공지사항 삭제 처리
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int notice_no) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.noticeProc.delete(notice_no);
    mav.addObject("cnt", cnt);

    mav.setViewName("/notice/delete_msg"); 

    return mav;
  }
  
  /**
   * 공지사항 이미지 수정 처리
   * @param request
   * @param noticeVO
   * @return
   */
  @RequestMapping(value = "/notice/update_img.do", method = RequestMethod.POST)
  public ModelAndView img_update(HttpServletRequest request, NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("notice_no", noticeVO.getNotice_no());

    int cnt = 0; 
    
    NoticeVO vo = noticeProc.read(noticeVO.getNotice_no());
    String notice_file1 = vo.getNotice_file1();
    String notice_thumb1 = vo.getNotice_thumb1().trim();
    long size1 = 0;
    boolean sw = false;
    
    String upDir = Tool.getRealPath(request, "/notice/storage/main_images");
    sw = Tool.deleteFile(upDir, noticeVO.getNotice_file1());
    sw = Tool.deleteFile(upDir, noticeVO.getNotice_thumb1());
    
    MultipartFile mf = noticeVO.getNotice_file1MF();
    size1 = mf.getSize();
    if (size1 > 0 ) {
      notice_file1 = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(notice_file1)) {
        notice_thumb1 = Tool.preview(upDir, notice_file1, 200, 150);
      }
    }
    
    noticeVO.setNotice_file1(notice_file1);
    noticeVO.setNotice_thumb1(notice_thumb1);
    noticeVO.setNotice_size1(size1);
    
    mav.setViewName("redirect:/notice/read.do?notice_no=" + noticeVO.getNotice_no());
    
    cnt = this.noticeProc.update_img(noticeVO);
    
    mav.addObject("cnt", cnt);
            
    return mav;    
  }
  
  /**
   * 공지사항 이미지 삭제 처리
   * @param request
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/img_delete.do", method = RequestMethod.POST)
  public ModelAndView img_delete(HttpServletRequest request, int notice_no) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("notice_no", notice_no);
    
    int cnt = 0;

    NoticeVO noticeVO = noticeProc.read(notice_no);
      
    String notice_file1 = noticeVO.getNotice_file1().trim();
    String notice_thumb1 = noticeVO.getNotice_thumb1().trim();
    
    long size1 = noticeVO.getNotice_size1();
    boolean sw = false;
      
    String upDir = Tool.getRealPath(request, "/notice/storage/main_images");
    sw = Tool.deleteFile(upDir, noticeVO.getNotice_file1());
    sw = Tool.deleteFile(upDir, noticeVO.getNotice_thumb1()); 
     
    notice_file1 = "";
    notice_thumb1 = "";
    size1 = 0;
    
    noticeVO.setNotice_file1(notice_file1);
    noticeVO.setNotice_thumb1(notice_thumb1);
    noticeVO.setNotice_size1(size1);

    mav.setViewName("redirect:/notice/read.do?notice_no=" + notice_no);
    cnt = this.noticeProc.delete_img(noticeVO);

    mav.addObject("cnt", cnt); 

    return mav;    
  }
  
  

  /**
   * 공지사항 출력순서 상향
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/update_seqno_up.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_up(int notice_no) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.noticeProc.update_seqno_up(notice_no);
    mav.addObject("cnt", cnt);

    NoticeVO noticeVO =this.noticeProc.read(notice_no); 
    mav.addObject("noticeVO", noticeVO);

    mav.setViewName("redirect:/notice/list.do");

    return mav;
  }

  /**
   * 공지사항 출력순서 하향
   * @param notice_no
   * @return
   */
  @RequestMapping(value = "/notice/update_seqno_down.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_down(int notice_no) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.noticeProc.update_seqno_down(notice_no);
    mav.addObject("cnt", cnt);

    NoticeVO noticeVO =this.noticeProc.read(notice_no); 
    mav.addObject("noticeVO", noticeVO);

    mav.setViewName("redirect:/notice/list.do");

    return mav;
  }
  
  /**
   * 공지사항 출력형식 변환
   * @param noticeVO
   * @return
   */
  @RequestMapping(value = "/notice/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
        
    int cnt = this.noticeProc.update_visible(noticeVO);
    mav.addObject("cnt", cnt); 
    
    if (cnt == 1) {
      mav.setViewName("redirect:/notice/list.do");
    } else {
      NoticeVO vo = this.noticeProc.read(noticeVO.getNotice_no());
      String name = vo.getNotice_name();
      mav.addObject("name", name);
      mav.setViewName("/notice/update_visible_msg"); 
    }
    return mav;
  }
  

}




