package dev.mvc.attachfile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.recruit.RecruitProcInter;
import dev.mvc.recruit.RecruitVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class AttachfileCont {
  @Autowired
  @Qualifier("dev.mvc.recruit.RecruitProc")
  private RecruitProcInter recruitProc;
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc")
  private AttachfileProcInter attachfileProc;
  
  public AttachfileCont(){
    System.out.println("--> AttachfileCont created.");
  }
  
  //http://localhost:9090/resort/attachfile/create.do
  /**
    * 등록 폼
    * http://localhost:9090/resort/attachfile/create.do  X
    * http://localhost:9090/resort/attachfile/create.do?cateno=2&contentsno=1  O
    * @return
    */
  @RequestMapping(value="/attachfile/create.do", method=RequestMethod.GET )
  public ModelAndView create(int recruitno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/attachfile/create"); // webapp/attachfile/create.jsp
     
    return mav;
  }
  
  /**
   * 등록 처리
   * @param ra
   * @param request
   * @param attachfileVO
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, 
                                           AttachfileVO attachfileVO, int cateno) {
    // System.out.println("--> categrpno: " + categrpno);
    
    ModelAndView mav = new ModelAndView();
    // ---------------------------------------------------------------
    // 파일 전송 코드 시작
    // ---------------------------------------------------------------
    int recruitno = attachfileVO.getRecruitno(); // 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/attachfile/storage");
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = attachfileVO.getFnamesMF();
    
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출, 1개이상 파일 처리
        fsize = multipartFile.getSize();  // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명
          fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장, 업로드된 파일명
          
          if (Tool.isImage(fname)) { // 이미지인지 검사
            thumb = Tool.preview(upDir, fupname, 200, 150); // thumb 이미지 생성
          }
        }
        AttachfileVO vo = new AttachfileVO();
        vo.setRecruitno(recruitno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        // 파일 1건 등록 정보 dbms 저장, 파일이 20개이면 20개의 record insert.
        upload_count = upload_count + attachfileProc.create(vo); 
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    mav.addObject("recruitno", recruitno); // redirect parameter 적용
    mav.addObject("cateno", cateno); // redirect parameter 적용
    mav.addObject("upload_count", upload_count); // redirect parameter 적용
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/attachfile/msg.do"); // 새로고침 방지
    
    return mav;
  }
  
  /**
   * 새로고침을 방지하는 메시지 출력
   * @param memberno
   * @return
   */
  @RequestMapping(value="/attachfile/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // 등록 처리 메시지: create_msg --> /attachfile/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /attachfile/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /attachfile/delete_msg.jsp
    mav.setViewName("/attachfile/" + url); // forward
    
    return mav; // forward
  }
  
  /**
   * 목록 http://localhost:9090/ojt/attachfile/list.do
   * @return
   */
  @RequestMapping(value = "/attachfile/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<AttachfileVO> list = attachfileProc.list();
    mav.addObject("list", list);

    mav.setViewName("/attachfile/list");

    return mav;
  }
  
  /**
   * 하나의 recruitno별 목록 http://localhost:9090/ojt/attachfile/list_by_recruitno.do 
   * @return
   */
  @RequestMapping(value = "/attachfile/list_by_recruitno.do", method = RequestMethod.GET)
  public ModelAndView list_by_recruitno(int recruitno) {
    ModelAndView mav = new ModelAndView();

    List<AttachfileVO> list = attachfileProc.list_by_recruitno(recruitno);
    mav.addObject("list", list);

    RecruitVO recruitVO = this.recruitProc.read(recruitno);
    // System.out.println("--> title: " + contentsVO.getTitle());

    // mav.addObject("title", contentsVO.getTitle());
    mav.addObject("recruitVO", recruitVO);

    mav.setViewName("/attachfile/list_by_recruitno"); // list_by_recruitno.jsp

    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 처리
   * @return
   */
  @RequestMapping(value = "/attachfile/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int attachfileno,
      @RequestParam(value = "recruitno", defaultValue = "0") int recruitno, String rurl) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    AttachfileVO attachfileVO = attachfileProc.read(attachfileno);

    String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로
    Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder에서 1건의 파일 삭제
    Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1건의 Thumb 파일 삭제

    // DBMS에서 1건의 파일 삭제
    attachfileProc.delete(attachfileno);

    List<AttachfileVO> list = attachfileProc.list(); // 목록 새로 고침
    mav.addObject("list", list);

    mav.addObject("recruitno", recruitno);

    mav.setViewName("redirect:/attachfile/" + rurl);

    return mav;
  }
  
  //http://localhost:9090/resort/attachfile/count_by_recruitno.do?recruitno=14
   /**
    * 부모키별 갯수 산출
    * @return
    */
   @ResponseBody
   @RequestMapping(value = "/attachfile/count_by_recruitno.do", method = RequestMethod.GET, 
                           produces = "text/plain;charset=UTF-8")
   public String count_by_recruitno(int recruitno) {
     try {
       Thread.sleep(3000);
     } catch (InterruptedException e) {
       e.printStackTrace();
     }
     
     int cnt = this.attachfileProc.count_by_recruitno(recruitno);
  
     JSONObject json = new JSONObject();
     json.put("cnt", cnt);
  
     return json.toString();
   }
   
  //http://localhost:9090/resort/attachfile/delete_by_recruitno.do?recruitno=13
  /**
   * FK를 사용한 레코드 삭제
   * @param request
   * @param recruitno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/attachfile/delete_by_recruitno.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_by_recruitno(HttpServletRequest request,
                                              @RequestParam(value = "recruitno", defaultValue = "0") int recruitno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    List<AttachfileVO> list = this.attachfileProc.list_by_recruitno(recruitno);
    int cnt = 0; // 삭제된 레코드 갯수
  
    String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로
    
    for (AttachfileVO attachfileVO: list) { // 파일 갯수만큼 순환
      Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder에서 1건의 파일 삭제
      Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1건의 Thumb 파일 삭제
    
      attachfileProc.delete(attachfileVO.getAttachfileno());  // DBMS에서 1건의 파일 삭제
      cnt = cnt + 1;
  
    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
  
    return json.toString();
  }

  
}