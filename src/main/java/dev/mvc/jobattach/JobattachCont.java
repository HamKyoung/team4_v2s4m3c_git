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
   * ��� �� http://localhost:9090/team4/jobattach/create.do X
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
   * ��� ó��
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
    // ���� ���� �ڵ� ����
    // ---------------------------------------------------------------
    int jobnwsno = jobattachVO.getJobnwsno(); // �θ�� ��ȣ
    String jobattach_fname = ""; // ���� ���ϸ�
    String jobattach_fupname = ""; // ���ε�� ���ϸ�
    long jobattach_fsize = 0;  // ���� ������
    String jobattach_thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/jobattach/storage");
    
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> jobattach_fnamesMF = jobattachVO.getJobattach_fnamesMF();
    
    int count = jobattach_fnamesMF.size(); // ���� ���� ����
    if (count > 0) {
      for (MultipartFile multipartFile:jobattach_fnamesMF) { // ���� ����, 1���̻� ���� ó��
        jobattach_fsize = multipartFile.getSize();  // ���� ũ��
        if (jobattach_fsize > 0) { // ���� ũ�� üũ
          jobattach_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          jobattach_fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����, ���ε�� ���ϸ�
          
          if (Tool.isImage(jobattach_fname)) { // �̹������� �˻�
            jobattach_thumb = Tool.preview(upDir, jobattach_fupname, 200, 150); // thumb �̹��� ����
          }
        }
        JobattachVO vo = new JobattachVO();
        vo.setJobnwsno(jobnwsno);
        vo.setJobattach_fname(jobattach_fname);
        vo.setJobattach_fupname(jobattach_fupname);
        vo.setJobattach_thumb(jobattach_thumb);
        vo.setJobattach_fsize(jobattach_fsize);
        
        // ���� 1�� ��� ���� dbms ����, ������ 20���̸� 20���� record insert.
        upload_count = upload_count + jobattachProc.create(vo); 
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    mav.addObject("jobnwsno", jobnwsno); // redirect parameter ����
    mav.addObject("upload_count", upload_count); // redirect parameter ����
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter ����
    
    mav.setViewName("redirect:/jobattach/msg.do"); // ���ΰ�ħ ����
    
    return mav;
  }

  /**
   * ���ΰ�ħ�� �����ϴ� �޽��� ���
   * 
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/jobattach/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    // ��� ó�� �޽���: create_msg --> /jobattach/create_msg.jsp
    // ���� ó�� �޽���: update_msg --> /jobattach/update_msg.jsp
    // ���� ó�� �޽���: delete_msg --> /jobattach/delete_msg.jsp
    mav.setViewName("/jobattach/" + url); // forward

    return mav; // forward
  }

  /**
   * ��� http://localhost:9090/team4/jobattach/list.do
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
   * �ϳ��� jobnwsno�� ��� http://localhost:9090/team4/jobattach/list_by_jobnwsno.do
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
   * ÷�� ���� 1�� ���� ó��
   * 
   * @return
   */
  @RequestMapping(value = "/jobattach/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int jobattachno,
      @RequestParam(value = "jobnwsno", defaultValue = "0") int jobnwsno, String rurl) {
    ModelAndView mav = new ModelAndView();

    // ������ ���� ������ �о��.
    JobattachVO jobattachVO = jobattachProc.read(jobattachno);

    String upDir = Tool.getRealPath(request, "/jobattach/storage"); // ���� ���
    Tool.deleteFile(upDir, jobattachVO.getJobattach_fupname()); // Folder���� 1���� ���� ����
    Tool.deleteFile(upDir, jobattachVO.getJobattach_thumb()); // 1���� Thumb ���� ����

    // DBMS���� 1���� ���� ����
    jobattachProc.delete(jobattachno);

    List<JobattachVO> list = jobattachProc.list(); // ��� ���� ��ħ
    mav.addObject("list", list);

    mav.addObject("jobnwsno", jobnwsno);

    mav.setViewName("redirect:/jobattach/" + rurl);

    return mav;
  }

  // http://localhost:9090/team4/jobattach/count_by_jobnwsno.do?jobnwsno=14
  /**
   * �θ�Ű�� ���� ����
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
   * FK�� ����� ���ڵ� ����
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
    int cnt = 0; // ������ ���ڵ� ����

    String upDir = Tool.getRealPath(request, "/jobattach/storage"); // ���� ���
    
    for (JobattachVO jobattachVO: list) { // ���� ������ŭ ��ȯ
      Tool.deleteFile(upDir, jobattachVO.getJobattach_fupname()); // Folder���� 1���� ���� ����
      Tool.deleteFile(upDir, jobattachVO.getJobattach_thumb()); // 1���� Thumb ���� ����
    
      jobattachProc.delete(jobattachVO.getJobattachno());  // DBMS���� 1���� ���� ����
      cnt = cnt + 1;

    }
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * ZIP ���� �� ���� �ٿ�ε�
   * @param request
   * @param jobnwsno ���� ����� �����ö� ����� �۹�ȣ
   * @return
   */
  @RequestMapping(value = "/jobattach/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    
    // �۹�ȣ�� �ش��ϴ� ���� ��� ����
    List<JobattachVO> jobattach_list = jobattachProc.list_by_jobnwsno(jobnwsno);
    
    // ���� ����� ���ϸ� ����
    ArrayList<String> files_array = new ArrayList<String>();
    for(JobattachVO jobattachVO:jobattach_list) {
      files_array.add(jobattachVO.getJobattach_fupname());
    }
    
    String dir = "/jobattach/storage";
    String upDir = Tool.getRealPath(request, dir); // ���� ���
    
    // ����� ���ϸ�, ���� ������ �ٿ�ε��� �浹 ó��
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // ���� ������ŭ �迭 ����
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // ���� ��� ����      
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
        // 4 KB�� �о buffer �迭�� ������ ���� ����Ʈ���� length�� ����
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // ����� ����, ���뿡���� ���� ��ġ, ����� ����
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " ���� �Ϸ�");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " ������ �����߽��ϴ�.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download ���� ����
    mav.setViewName("redirect:/download2?dir=" + dir + "&filename=" + zip + "&downname=" + zip);    
    
    return mav;
  }
  
  
  
}








