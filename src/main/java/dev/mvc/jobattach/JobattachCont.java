package dev.mvc.jobattach;

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


import dev.mvc.jobnws.JobnwsProcInter;
import dev.mvc.jobnws.JobnwsVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class JobattachCont {
  @Autowired
  @Qualifier("dev.mvc.jobnws.JobnwsProc")
  private JobnwsProcInter jobnwsProc;

  @Autowired
  @Qualifier("dev.mvc.jobattach.JobattachProc")
  private JobattachProcInter jobattachProc;

  public JobattachCont() {
    System.out.println("--> JobattachCont created.");
  }

  // http://localhost:9090/team4/jobattach/create.do
  /**
   * 등록 폼 http://localhost:9090/team4/jobattach/create.do X
   * http://localhost:9090/team4/jobattach/create.do?jobnwsno=1 O
   * 
   * @return
   */
  @RequestMapping(value = "/jobattach/create.do", method = RequestMethod.GET)
  public ModelAndView create(int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobattach/create"); // webapp/jobattach/create.jsp

    return mav;
  }

  /**
   * 등록 처리
   * 
   * @param ra
   * @param request
   * @param jobattachVO
   * @return
   */
  @RequestMapping(value = "/jobattach/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, 
                                           JobattachVO jobattachVO) {
    // System.out.println("--> categrpno: " + categrpno);
    
    ModelAndView mav = new ModelAndView();
    // ---------------------------------------------------------------
    // 파일 전송 코드 시작
    // ---------------------------------------------------------------
    int jobnwsno = jobattachVO.getJobnwsno(); // 부모글 번호
    String jobattach_fname = ""; // 원본 파일명
    String jobattach_fupname = ""; // 업로드된 파일명
    long jobattach_fsize = 0;  // 파일 사이즈
    String jobattach_thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/jobattach/storage");
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> jobattach_fnamesMF = jobattachVO.getJobattach_fnamesMF();
    
    int count = jobattach_fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile:jobattach_fnamesMF) { // 파일 추출, 1개이상 파일 처리
        jobattach_fsize = multipartFile.getSize();  // 파일 크기
        if (jobattach_fsize > 0) { // 파일 크기 체크
          jobattach_fname = multipartFile.getOriginalFilename(); // 원본 파일명
          jobattach_fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장, 업로드된 파일명
          
          if (Tool.isImage(jobattach_fname)) { // 이미지인지 검사
            jobattach_thumb = Tool.preview(upDir, jobattach_fupname, 200, 150); // thumb 이미지 생성
          }
        }
        JobattachVO vo = new JobattachVO();
        vo.setJobnwsno(jobnwsno);
        vo.setJobattach_fname(jobattach_fname);
        vo.setJobattach_fupname(jobattach_fupname);
        vo.setJobattach_thumb(jobattach_thumb);
        vo.setJobattach_fsize(jobattach_fsize);
        
        // 파일 1건 등록 정보 dbms 저장, 파일이 20개이면 20개의 record insert.
        upload_count = upload_count + jobattachProc.create(vo); 
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    mav.addObject("jobnwsno", jobnwsno); // redirect parameter 적용
    mav.addObject("upload_count", upload_count); // redirect parameter 적용
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/jobattach/msg.do"); // 새로고침 방지
    
    return mav;
  }

  /**
   * 새로고침을 방지하는 메시지 출력
   * 
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/jobattach/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    // 등록 처리 메시지: create_msg --> /jobattach/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /jobattach/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /jobattach/delete_msg.jsp
    mav.setViewName("/jobattach/" + url); // forward

    return mav; // forward
  }

  /**
   * 목록 http://localhost:9090/team4/jobattach/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobattach/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<JobattachVO> list = jobattachProc.list();
    mav.addObject("list", list);

    mav.setViewName("/jobattach/list");

    return mav;
  }

  /**
   * 하나의 jobnwsno별 목록 http://localhost:9090/team4/jobattach/list_by_jobnwsno.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobattach/list_by_jobnwsno.do", method = RequestMethod.GET)
  public ModelAndView list_by_jobnwsno(int jobnwsno) {
    ModelAndView mav = new ModelAndView();

    List<JobattachVO> list = jobattachProc.list_by_jobnwsno(jobnwsno);
    mav.addObject("list", list);

    JobnwsVO jobnwsVO = this.jobnwsProc.read(jobnwsno);

    mav.addObject("jobnwsVO", jobnwsVO);

    mav.setViewName("/jobattach/list_by_jobnwsno"); // list_by_jobnwsno.jsp

    return mav;
  }

  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/jobattach/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int jobattachno,
      @RequestParam(value = "jobnwsno", defaultValue = "0") int jobnwsno, String rurl) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    JobattachVO jobattachVO = jobattachProc.read(jobattachno);

    String upDir = Tool.getRealPath(request, "/jobattach/storage"); // 절대 경로
    Tool.deleteFile(upDir, jobattachVO.getJobattach_fupname()); // Folder에서 1건의 파일 삭제
    Tool.deleteFile(upDir, jobattachVO.getJobattach_thumb()); // 1건의 Thumb 파일 삭제

    // DBMS에서 1건의 파일 삭제
    jobattachProc.delete(jobattachno);

    List<JobattachVO> list = jobattachProc.list(); // 목록 새로 고침
    mav.addObject("list", list);

    mav.addObject("jobnwsno", jobnwsno);

    mav.setViewName("redirect:/jobattach/" + rurl);

    return mav;
  }

  // http://localhost:9090/team4/jobattach/count_by_jobnwsno.do?jobnwsno=14
  /**
   * 부모키별 갯수 산출
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/jobattach/count_by_jobnwsno.do", method = RequestMethod.GET, 
                          produces = "text/plain;charset=UTF-8")
  public String count_by_jobnwsno(int jobnwsno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.jobattachProc.count_by_jobnwsno(jobnwsno);
 
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  // http://localhost:9090/team4/jobattach/delete_by_jobnwsno.do?jobnwsno=13
  /**
   * FK를 사용한 레코드 삭제
   * @param request
   * @param jobnwsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/jobattach/delete_by_jobnwsno.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_by_jobnwsno(HttpServletRequest request,
                                              @RequestParam(value = "jobnwsno", defaultValue = "0") int jobnwsno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    List<JobattachVO> list = this.jobattachProc.list_by_jobnwsno(jobnwsno);
    int cnt = 0; // 삭제된 레코드 갯수

    String upDir = Tool.getRealPath(request, "/jobattach/storage"); // 절대 경로
    
    for (JobattachVO jobattachVO: list) { // 파일 갯수만큼 순환
      Tool.deleteFile(upDir, jobattachVO.getJobattach_fupname()); // Folder에서 1건의 파일 삭제
      Tool.deleteFile(upDir, jobattachVO.getJobattach_thumb()); // 1건의 Thumb 파일 삭제
    
      jobattachProc.delete(jobattachVO.getJobattachno());  // DBMS에서 1건의 파일 삭제
      cnt = cnt + 1;

    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * ZIP 압축 후 파일 다운로드
   * @param request
   * @param jobnwsno 파일 목록을 가져올때 사용할 글번호
   * @return
   */
  @RequestMapping(value = "/jobattach/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    
    // 글번호에 해당하는 파일 목록 산출
    List<JobattachVO> jobattach_list = jobattachProc.list_by_jobnwsno(jobnwsno);
    
    // 실제 저장된 파일명만 추출
    ArrayList<String> files_array = new ArrayList<String>();
    for(JobattachVO jobattachVO:jobattach_list) {
      files_array.add(jobattachVO.getJobattach_fupname());
    }
    
    String dir = "/jobattach/storage";
    String upDir = Tool.getRealPath(request, dir); // 절대 경로
    
    // 압축될 파일명, 동시 접속자 다운로드의 충돌 처리
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // 파일 갯수만큼 배열 선언
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // 절대 경로 조합      
    }
 
    byte[] buffer = new byte[4096]; // 4 KB
    
    try {
      ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zip_filename));
      
      for(int index=0; index < zip_src.length; index++) {
        FileInputStream in = new FileInputStream(zip_src[index]);
        
        Path path = Paths.get(zip_src[index]);
        String zip_src_file = path.getFileName().toString();
        // System.out.println("zip_src_file: " + zip_src_file);
        
        ZipEntry zipEntry = new ZipEntry(zip_src_file);
        zipOutputStream.putNextEntry(zipEntry);
        
        int length = 0;
        // 4 KB씩 읽어서 buffer 배열에 저장후 읽은 바이트수를 length에 저장
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // 기록할 내용, 내용에서의 시작 위치, 기록할 길이
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " 압축 완료");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " 파일을 삭제했습니다.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download 서블릿 연결
    mav.setViewName("redirect:/download2?dir=" + dir + "&filename=" + zip + "&downname=" + zip);    
    
    return mav;
  }
  
  
  
}








