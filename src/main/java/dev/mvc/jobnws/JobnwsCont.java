package dev.mvc.jobnws;

import java.util.HashMap;
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
public class JobnwsCont {
  @Autowired
  @Qualifier("dev.mvc.jobnws.JobnwsProc")
  private JobnwsProcInter jobnwsProc;
  
  public JobnwsCont() {
    System.out.println("-> JobnwsCont Created");
  }
  
  /**
   * 등록폼 http://localhost:9090/team4/jobnws/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/create"); // /jobnws/create.jsp

    return mav;
  }
  
  /**
   * 등록처리
   * http://localhost:9090/team4/jobnws/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String news_file1 = "";     // main image
    String news_thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택" multiple="multiple">
    MultipartFile mf = jobnwsVO.getNews_file1MF();
    System.out.println(mf);
    long news_size1 = mf.getSize();  // 파일 크기
    if (news_size1 > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
     news_file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(news_file1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        news_thumb1 = Tool.preview(upDir, news_file1, 200, 150); 
      }   
    }    
    
    jobnwsVO.setNews_file1(news_file1);
    jobnwsVO.setNews_thumb1(news_thumb1);
    jobnwsVO.setNews_size1(news_size1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    mav.setViewName("/jobnws/create_msg");

    int cnt = this.jobnwsProc.create(jobnwsVO);
    mav.addObject("cnt", cnt);

    return mav;
  }  
  
  /**
   * 목록 http://localhost:9090/team4/jobnws/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/list"); // /webapp/jobnws/list.jsp
    
    List<JobnwsVO> list = this.jobnwsProc.list_newsno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 조회
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/read.do", method = RequestMethod.GET)
  public ModelAndView read_update(int newsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/read"); // /webapp/jobnws/read.jsp

    JobnwsVO jobnwsVO = this.jobnwsProc.read(newsno);
    mav.addObject("jobnwsVO", jobnwsVO);
        
    mav.setViewName("/jobnws/read"); // /webapp/contents/read.jsp 
    return mav; // forward
  }
  
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/jobnws/update.do", method=RequestMethod.GET )
  public ModelAndView update(int newsno) {
    ModelAndView mav = new ModelAndView();
    
    JobnwsVO jobnwsVO = this.jobnwsProc.read_update(newsno); // 수정용 읽기
    mav.addObject("jobnwsVO", jobnwsVO); // request.setAttribute("jobnwsVO", jobnwsVO);
    
    mav.setViewName("/jobnws/update"); // webapp/jobnws/update.jsp
    
    return mav;
  }

  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/jobnws/update.do", method=RequestMethod.POST )
  public ModelAndView update(JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("newsno", jobnwsVO.getNewsno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("newsno", jobnwsVO.getNewsno());
    hashMap.put("news_passwd", jobnwsVO.getNews_passwd());
    
    int news_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    news_passwd_cnt = this.jobnwsProc.news_passwd_check(hashMap);
    
    if (news_passwd_cnt == 1) { // 패스워드가 일치할 경우 글 수정
      cnt = this.jobnwsProc.update(jobnwsVO);
    }
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("news_passwd_cnt", news_passwd_cnt); // request에 저장
        
    mav.setViewName("/jobnws/update_msg"); // webapp/jobnws/update_msg.jsp
    
    return mav;
  }
  
  /**
   * 삭제 폼
   * @return
   */
  @RequestMapping(value="/jobnws/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int newsno) {
    ModelAndView mav = new ModelAndView();
    
    JobnwsVO jobnwsVO = this.jobnwsProc.read(newsno); // 삭제용 읽기
    mav.addObject("jobnwsVO", jobnwsVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/jobnws/delete"); // webapp/contents/delete.jsp
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param jobnwsVO
   * @return
   */
  @RequestMapping(value="/jobnws/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    int newsno = jobnwsVO.getNewsno();
    
    String title = this.jobnwsProc.read(newsno).getNews_title();
    mav.addObject("title", title);
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("newsno", newsno);
    hashMap.put("news_passwd", jobnwsVO.getNews_passwd());
    
    int news_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    news_passwd_cnt = this.jobnwsProc.news_passwd_check(hashMap);
    
    if (news_passwd_cnt == 1) { // 패스워드가 일치할 경우 글 삭제
      cnt = this.jobnwsProc.delete(jobnwsVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("news_passwd_cnt", news_passwd_cnt); // request에 저장
        
    mav.setViewName("/jobnws/delete_msg"); // webapp/jobnws/delete_msg.jsp
    
    return mav;
  }
  
  /**
   * 메인 이미지 등록 폼 http://localhost:9090/resort/jobnws/img_create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_create.do", method = RequestMethod.GET)
  public ModelAndView img_create(int newsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/img_create"); // /webapp/jobnws/img_create.jsp

    JobnwsVO jobnwsVO = this.jobnwsProc.read(newsno);
    mav.addObject("jobnwsVO", jobnwsVO);
    
    return mav; // forward
  }

  /**
   * 메인 이미지 등록 처리 http://localhost:9090/resort/jobnws/img_create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_create.do", method = RequestMethod.POST)
  public ModelAndView img_create(HttpServletRequest request, JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("newsno", jobnwsVO.getNewsno());
    hashMap.put("news_passwd", jobnwsVO.getNews_passwd());
    
    int news_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    news_passwd_cnt = this.jobnwsProc.news_passwd_check(hashMap);
    
    if (news_passwd_cnt == 1) { // 패스워드가 일치할 경우 파일 업로드
      // -------------------------------------------------------------------
      // 파일 전송 코드 시작
      // -------------------------------------------------------------------
      String news_file1 = "";     // main image
      String news_thumb1 = ""; // preview image
          
      String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // 절대 경로
      // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택" multiple="multiple">
      MultipartFile mf = jobnwsVO.getNews_file1MF();
      long news_size1 = mf.getSize();  // 파일 크기
      if (news_size1 > 0) { // 파일 크기 체크
        // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        news_file1 = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(news_file1)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          news_thumb1 = Tool.preview(upDir, news_file1, 200, 150); 
        }
      }    
      
      jobnwsVO.setNews_file1(news_file1);
      jobnwsVO.setNews_thumb1(news_thumb1);
      jobnwsVO.setNews_size1(news_size1);
      // -------------------------------------------------------------------
      // 파일 전송 코드 종료
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/jobnws/read.do?newsno=" + jobnwsVO.getNewsno());
      
      cnt = this.jobnwsProc.img_create(jobnwsVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/jobnws/update_msg"); // webapp/contents/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("news_passwd_cnt", news_passwd_cnt); // request에 저장
            
    return mav;    
  }
  
  /**
   * 메인 이미지 삭제/수정 폼 http://localhost:9090/resort/jobnws/img_update.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_update.do", method = RequestMethod.GET)
  public ModelAndView img_update(int newsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/img_update"); // /webapp/jobnws/img_update.jsp

    JobnwsVO jobnwsVO = this.jobnwsProc.read(newsno);
    mav.addObject("jobnwsVO", jobnwsVO);
    
    
    return mav; // forward
  }
  
  /**
   * 메인 이미지 삭제 처리 http://localhost:9090/resort/contents/img_delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_delete.do", method = RequestMethod.POST)
  public ModelAndView img_delete(HttpServletRequest request,
                                                 int newsno, String news_passwd) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("newsno", newsno);
    hashMap.put("news_passwd", news_passwd);
    
    int news_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    news_passwd_cnt = this.jobnwsProc.news_passwd_check(hashMap);
    
    if (news_passwd_cnt == 1) { // 패스워드가 일치할 경우 파일 업로드
      // -------------------------------------------------------------------
      // 파일 삭제 코드 시작
      // -------------------------------------------------------------------
      // 삭제할 파일 정보를 읽어옴.
      JobnwsVO jobnwsVO = jobnwsProc.read(newsno);
      // System.out.println("news_file1: " + jobnwsVO.getNews_file1());
      
      String news_file1 = jobnwsVO.getNews_file1().trim();
      String news_thumb1 = jobnwsVO.getNews_thumb1().trim();
      long news_size1 = jobnwsVO.getNews_size1();
      boolean sw = false;
      
      String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // 절대 경로
      sw = Tool.deleteFile(upDir, jobnwsVO.getNews_file1());  // Folder에서 1건의 파일 삭제
      sw = Tool.deleteFile(upDir, jobnwsVO.getNews_thumb1());  // Folder에서 1건의 파일 삭제
      // System.out.println("sw: " + sw);
      
      news_file1 = "";
      news_thumb1 = "";
      news_size1 = 0;
      
      jobnwsVO.setNews_file1(news_file1);
      jobnwsVO.setNews_thumb1(news_thumb1);
      jobnwsVO.setNews_size1(news_size1);
      // -------------------------------------------------------------------
      // 파일 삭제 종료 시작
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/jobnws/read.do?newsno=" + newsno);
      
      cnt = this.jobnwsProc.img_delete(jobnwsVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/jobnws/update_msg"); // webapp/jobnws/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("news_passwd_cnt", news_passwd_cnt); // request에 저장
            
    return mav;    
  }
  
  /**
   * 메인 이미지 수정 처리 http://localhost:9090/resort/jobnws/img_update.do
   * 기존 이미지 삭제후 새로운 이미지 등록(수정 처리)
   * @return
   */
  @RequestMapping(value = "/jobnws/img_update.do", method = RequestMethod.POST)
  public ModelAndView img_update(HttpServletRequest request, JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("newsno", jobnwsVO.getNewsno());
    hashMap.put("news_passwd", jobnwsVO.getNews_passwd());
    
    int news_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    news_passwd_cnt = this.jobnwsProc.news_passwd_check(hashMap);
    
    if (news_passwd_cnt == 1) { // 패스워드가 일치할 경우 파일 업로드
      // -------------------------------------------------------------------
      // 파일 삭제 코드 시작
      // -------------------------------------------------------------------
      // 삭제할 파일 정보를 읽어옴.
      JobnwsVO vo = jobnwsProc.read(jobnwsVO.getNewsno());
      // System.out.println("file1: " + jobnwsVO.getNews_file1());
      
      String news_file1 = vo.getNews_file1().trim();
      String news_thumb1 = vo.getNews_thumb1().trim();
      long news_size1 = 0;
      boolean sw = false;
      
      String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // 절대 경로
      sw = Tool.deleteFile(upDir, jobnwsVO.getNews_file1());  // Folder에서 1건의 파일 삭제
      sw = Tool.deleteFile(upDir, jobnwsVO.getNews_thumb1());  // Folder에서 1건의 파일 삭제
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
      MultipartFile mf = jobnwsVO.getNews_file1MF();
      news_size1 = mf.getSize();  // 파일 크기
      if (news_size1 > 0) { // 파일 크기 체크
        // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        news_file1 = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(news_file1)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          news_thumb1 = Tool.preview(upDir, news_file1, 200, 150); 
        }
      }    
      
      jobnwsVO.setNews_file1(news_file1);
      jobnwsVO.setNews_thumb1(news_thumb1);
      jobnwsVO.setNews_size1(news_size1);
      // -------------------------------------------------------------------
      // 파일 전송 코드 종료
      // -------------------------------------------------------------------

      mav.setViewName("redirect:/jobnws/read.do?newsno=" + jobnwsVO.getNewsno());
      
      cnt = this.jobnwsProc.img_create(jobnwsVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/jobnws/update_msg"); // webapp/contents/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("news_passwd_cnt", news_passwd_cnt); // request에 저장
            
    return mav;    
  }
  
}
 