package dev.mvc.ps_attachfile;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.attachfile.AttachfileVO;
import dev.mvc.pass_self.Pass_selfProcInter;
import dev.mvc.recruit.RecruitVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Ps_attachfileCont {
  @Autowired
  @Qualifier("dev.mvc.ps_attachfile.Ps_attachfileProc")
  private Ps_attachfileProcInter ps_attachfileProc;

  public Ps_attachfileCont(){
    System.out.println("--> Ps_attachfileCont created.");
  }
  
  /**
    * 등록 폼
    * @return
    */
  @RequestMapping(value="/ps_attachfile/create.do", method=RequestMethod.GET )
  public ModelAndView create(int pass_self_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ps_attachfile/create");
     
    return mav;
  }
  
  /**
   * 등록 처리
   * @return
   */
  @RequestMapping(value = "/ps_attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, 
                                           Ps_attachfileVO ps_attachfileVO) {
    
    ModelAndView mav = new ModelAndView();
    // ---------------------------------------------------------------
    // 파일 전송 코드 시작
    // ---------------------------------------------------------------
    int pass_self_no = ps_attachfileVO.getPass_self_no();
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/ps_attachfile/storage");
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = ps_attachfileVO.getFnamesMF();
    
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
        Ps_attachfileVO vo = new Ps_attachfileVO();
        vo.setPass_self_no(pass_self_no);
        vo.setPs_fname(fname);
        vo.setPs_upname(fupname);
        vo.setPs_thumb(thumb);
        vo.setPs_fsize(fsize);
        
        // 파일 1건 등록 정보 dbms 저장, 파일이 20개이면 20개의 record insert.
        upload_count = upload_count + ps_attachfileProc.create(vo); 
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    mav.addObject("pass_self_no", pass_self_no); // redirect parameter 적용
    mav.addObject("upload_count", upload_count); // redirect parameter 적용
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/ps_attachfile/msg.do"); // 새로고침 방지
    
    return mav;
  }
  
  /**
   * 새로고침을 방지하는 메시지 출력
   * @param memberno
   * @return
   */
  @RequestMapping(value="/ps_attachfile/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    

    mav.setViewName("/ps_attachfile/" + url); // forward
    
    return mav; // forward
  }
  
  /**
   * 목록
   * @return
   */
  @RequestMapping(value="/ps_attachfile/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<Ps_attachfileVO> list = ps_attachfileProc.list();
    System.out.println(list);
    mav.addObject("list", list);
    
    mav.setViewName("/ps_attachfile/list");
    
    return mav;
  }
  
  /**
   * pass_self_no별 목록
   * @return
   */
  @RequestMapping(value = "/ps_attachfile/list_by_pass_self_no.do", method = RequestMethod.GET)
  public ModelAndView list_by_recruitno(int pass_self_no) {
    ModelAndView mav = new ModelAndView();

    List<Ps_attachfileVO> list = ps_attachfileProc.list_by_pass_self_no(pass_self_no);
    mav.addObject("list", list);

    Ps_attachfileVO ps_attachfileVO = this.ps_attachfileProc.read(pass_self_no);

    mav.addObject("ps_attachfileVO", ps_attachfileVO);

    mav.setViewName("/ps_attachfile/list_by_pass_self_no"); 

    return mav;
  }

  
  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/ps_attachfile/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int ps_attachfileno,
      @RequestParam(value = "pass_self_no", defaultValue = "0") int pass_self_no, String rurl) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    Ps_attachfileVO ps_attachfileVO = ps_attachfileProc.read(ps_attachfileno);

    String upDir = Tool.getRealPath(request, "/ps_attachfile/storage"); // 절대 경로
    Tool.deleteFile(upDir, ps_attachfileVO.getPs_upname()); // Folder에서 1건의 파일 삭제
    Tool.deleteFile(upDir, ps_attachfileVO.getPs_thumb()); // 1건의 Thumb 파일 삭제

    // DBMS에서 1건의 파일 삭제
    ps_attachfileProc.delete(ps_attachfileno);

    List<Ps_attachfileVO> list = ps_attachfileProc.list();
    mav.addObject("list", list);

    mav.addObject("pass_self_no", pass_self_no);

    mav.setViewName("redirect:/ps_attachfile/" + rurl);

    return mav;
  }
  
  
  
  
}
  





