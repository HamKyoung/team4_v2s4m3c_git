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
   * ����� http://localhost:9090/team4/jobnws/create.do
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
   * ���ó��
   * http://localhost:9090/team4/jobnws/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String jobnws_file1 = "";     // main image
    String jobnws_thumb1 = ""; // preview image
        
    String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="���� ����" multiple="multiple">
    MultipartFile mf = jobnwsVO.getJobnws_file1MF();
    System.out.println(mf);
    long jobnws_size1 = mf.getSize();  // ���� ũ��
    if (jobnws_size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      jobnws_file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(jobnws_file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
        jobnws_thumb1 = Tool.preview(upDir, jobnws_file1, 200, 150); 
      }   
    }    
    
    jobnwsVO.setJobnws_file1(jobnws_file1);
    jobnwsVO.setJobnws_thumb1(jobnws_thumb1);
    jobnwsVO.setJobnws_size1(jobnws_size1);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    mav.setViewName("/jobnws/create_msg");

    int cnt = this.jobnwsProc.create(jobnwsVO);
    mav.addObject("cnt", cnt);

    return mav;
  }  
  
  /**
   * ��� http://localhost:9090/team4/jobnws/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/list"); // /webapp/jobnws/list.jsp
    
    List<JobnwsVO> list = this.jobnwsProc.list_jobnwsno_asc();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * ��ȸ
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/read.do", method = RequestMethod.GET)
  public ModelAndView read_update(int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/read"); // /webapp/jobnws/read.jsp

    JobnwsVO jobnwsVO = this.jobnwsProc.read(jobnwsno);
    mav.addObject("jobnwsVO", jobnwsVO);
        
    mav.setViewName("/jobnws/read"); // /webapp/contents/read.jsp 
    return mav; // forward
  }
  
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/jobnws/update.do", method=RequestMethod.GET )
  public ModelAndView update(int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    
    JobnwsVO jobnwsVO = this.jobnwsProc.read_update(jobnwsno); // ������ �б�
    mav.addObject("jobnwsVO", jobnwsVO); // request.setAttribute("jobnwsVO", jobnwsVO);
    
    mav.setViewName("/jobnws/update"); // webapp/jobnws/update.jsp
    
    return mav;
  }

  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/jobnws/update.do", method=RequestMethod.POST )
  public ModelAndView update(JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("jobnwsno", jobnwsVO.getJobnwsno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("jobnwsno", jobnwsVO.getJobnwsno());
    hashMap.put("jobnws_passwd", jobnwsVO.getJobnws_passwd());
    
    int jobnws_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    jobnws_passwd_cnt = this.jobnwsProc.jobnws_passwd_check(hashMap);
    
    if (jobnws_passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
      cnt = this.jobnwsProc.update(jobnwsVO);
    }
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("jobnws_passwd_cnt", jobnws_passwd_cnt); // request�� ����
        
    mav.setViewName("/jobnws/update_msg"); // webapp/jobnws/update_msg.jsp
    
    return mav;
  }
  
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/jobnws/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    
    JobnwsVO jobnwsVO = this.jobnwsProc.read(jobnwsno); // ������ �б�
    mav.addObject("jobnwsVO", jobnwsVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/jobnws/delete"); // webapp/contents/delete.jsp
    
    return mav;
  }
  
  /**
   * ���� ó��
   * @param jobnwsVO
   * @return
   */
  @RequestMapping(value="/jobnws/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    int jobnwsno = jobnwsVO.getJobnwsno();
    
    String title = this.jobnwsProc.read(jobnwsno).getJobnws_title();
    mav.addObject("title", title);
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("jobnwsno", jobnwsno);
    hashMap.put("jobnws_passwd", jobnwsVO.getJobnws_passwd());
    
    int jobnws_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    jobnws_passwd_cnt = this.jobnwsProc.jobnws_passwd_check(hashMap);
    
    if (jobnws_passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
      cnt = this.jobnwsProc.delete(jobnwsVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("jobnws_passwd_cnt", jobnws_passwd_cnt); // request�� ����
        
    mav.setViewName("/jobnws/delete_msg"); // webapp/jobnws/delete_msg.jsp
    
    return mav;
  }
  
  /**
   * ���� �̹��� ��� �� http://localhost:9090/resort/jobnws/img_create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_create.do", method = RequestMethod.GET)
  public ModelAndView img_create(int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/img_create"); // /webapp/jobnws/img_create.jsp

    JobnwsVO jobnwsVO = this.jobnwsProc.read(jobnwsno);
    mav.addObject("jobnwsVO", jobnwsVO);
    
    return mav; // forward
  }

  /**
   * ���� �̹��� ��� ó�� http://localhost:9090/resort/jobnws/img_create.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_create.do", method = RequestMethod.POST)
  public ModelAndView img_create(HttpServletRequest request, JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("jobnwsno", jobnwsVO.getJobnwsno());
    hashMap.put("jobnws_passwd", jobnwsVO.getJobnws_passwd());
    
    int jobnws_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    jobnws_passwd_cnt = this.jobnwsProc.jobnws_passwd_check(hashMap);
    
    if (jobnws_passwd_cnt == 1) { // �н����尡 ��ġ�� ��� ���� ���ε�
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      String jobnws_file1 = "";     // main image
      String jobnws_thumb1 = ""; // preview image
          
      String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // ���� ���
      // ���� ������ ����� fnamesMF ��ü�� ������.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="���� ����" multiple="multiple">
      MultipartFile mf = jobnwsVO.getJobnws_file1MF();
      long jobnws_size1 = mf.getSize();  // ���� ũ��
      if (jobnws_size1 > 0) { // ���� ũ�� üũ
        // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
        // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
        jobnws_file1 = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(jobnws_file1)) { // �̹������� �˻�
          // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
          jobnws_thumb1 = Tool.preview(upDir, jobnws_file1, 200, 150); 
        }
      }    
      
      jobnwsVO.setJobnws_file1(jobnws_file1);
      jobnwsVO.setJobnws_thumb1(jobnws_thumb1);
      jobnwsVO.setJobnws_size1(jobnws_size1);
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/jobnws/read.do?jobnwsno=" + jobnwsVO.getJobnwsno());
      
      cnt = this.jobnwsProc.img_create(jobnwsVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/jobnws/update_msg"); // webapp/contents/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("jobnws_passwd_cnt", jobnws_passwd_cnt); // request�� ����
            
    return mav;    
  }
  
  /**
   * ���� �̹��� ����/���� �� http://localhost:9090/resort/jobnws/img_update.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_update.do", method = RequestMethod.GET)
  public ModelAndView img_update(int jobnwsno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobnws/img_update"); // /webapp/jobnws/img_update.jsp

    JobnwsVO jobnwsVO = this.jobnwsProc.read(jobnwsno);
    mav.addObject("jobnwsVO", jobnwsVO);
    
    
    return mav; // forward
  }
  
  /**
   * ���� �̹��� ���� ó�� http://localhost:9090/resort/contents/img_delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/jobnws/img_delete.do", method = RequestMethod.POST)
  public ModelAndView img_delete(HttpServletRequest request,
                                                 int jobnwsno, String jobnws_passwd) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("jobnwsno", jobnwsno);
    hashMap.put("jobnws_passwd", jobnws_passwd);
    
    int jobnws_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    jobnws_passwd_cnt = this.jobnwsProc.jobnws_passwd_check(hashMap);
    
    if (jobnws_passwd_cnt == 1) { // �н����尡 ��ġ�� ��� ���� ���ε�
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      // ������ ���� ������ �о��.
      JobnwsVO jobnwsVO = jobnwsProc.read(jobnwsno);
      // System.out.println("jobnws_file1: " + jobnwsVO.getJobnws_file1());
      
      String jobnws_file1 = jobnwsVO.getJobnws_file1().trim();
      String jobnws_thumb1 = jobnwsVO.getJobnws_thumb1().trim();
      long jobnws_size1 = jobnwsVO.getJobnws_size1();
      boolean sw = false;
      
      String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // ���� ���
      sw = Tool.deleteFile(upDir, jobnwsVO.getJobnws_file1());  // Folder���� 1���� ���� ����
      sw = Tool.deleteFile(upDir, jobnwsVO.getJobnws_thumb1());  // Folder���� 1���� ���� ����
      // System.out.println("sw: " + sw);
      
      jobnws_file1 = "";
      jobnws_thumb1 = "";
      jobnws_size1 = 0;
      
      jobnwsVO.setJobnws_file1(jobnws_file1);
      jobnwsVO.setJobnws_thumb1(jobnws_thumb1);
      jobnwsVO.setJobnws_size1(jobnws_size1);
      // -------------------------------------------------------------------
      // ���� ���� ���� ����
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/jobnws/read.do?jobnwsno=" + jobnwsno);
      
      cnt = this.jobnwsProc.img_delete(jobnwsVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/jobnws/update_msg"); // webapp/jobnws/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("jobnws_passwd_cnt", jobnws_passwd_cnt); // request�� ����
            
    return mav;    
  }
  
  /**
   * ���� �̹��� ���� ó�� http://localhost:9090/resort/jobnws/img_update.do
   * ���� �̹��� ������ ���ο� �̹��� ���(���� ó��)
   * @return
   */
  @RequestMapping(value = "/jobnws/img_update.do", method = RequestMethod.POST)
  public ModelAndView img_update(HttpServletRequest request, JobnwsVO jobnwsVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("jobnwsno", jobnwsVO.getJobnwsno());
    hashMap.put("jobnws_passwd", jobnwsVO.getJobnws_passwd());
    
    int jobnws_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    jobnws_passwd_cnt = this.jobnwsProc.jobnws_passwd_check(hashMap);
    
    if (jobnws_passwd_cnt == 1) { // �н����尡 ��ġ�� ��� ���� ���ε�
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      // ������ ���� ������ �о��.
      JobnwsVO vo = jobnwsProc.read(jobnwsVO.getJobnwsno());
      // System.out.println("file1: " + jobnwsVO.getJobnws_file1());
      
      String jobnws_file1 = vo.getJobnws_file1().trim();
      String jobnws_thumb1 = vo.getJobnws_thumb1().trim();
      long jobnws_size1 = 0;
      boolean sw = false;
      
      String upDir = Tool.getRealPath(request, "/jobnws/storage/main_images"); // ���� ���
      sw = Tool.deleteFile(upDir, jobnwsVO.getJobnws_file1());  // Folder���� 1���� ���� ����
      sw = Tool.deleteFile(upDir, jobnwsVO.getJobnws_thumb1());  // Folder���� 1���� ���� ����
      // System.out.println("sw: " + sw);
      // -------------------------------------------------------------------
      // ���� ���� ���� ����
      // -------------------------------------------------------------------
      
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      // ���� ������ ����� fnamesMF ��ü�� ������.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="���� ����" multiple="multiple">
      MultipartFile mf = jobnwsVO.getJobnws_file1MF();
      jobnws_size1 = mf.getSize();  // ���� ũ��
      if (jobnws_size1 > 0) { // ���� ũ�� üũ
        // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
        // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
        jobnws_file1 = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(jobnws_file1)) { // �̹������� �˻�
          // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
          jobnws_thumb1 = Tool.preview(upDir, jobnws_file1, 200, 150); 
        }
      }    
      
      jobnwsVO.setJobnws_file1(jobnws_file1);
      jobnwsVO.setJobnws_thumb1(jobnws_thumb1);
      jobnwsVO.setJobnws_size1(jobnws_size1);
      // -------------------------------------------------------------------
      // ���� ���� �ڵ� ����
      // -------------------------------------------------------------------

      mav.setViewName("redirect:/jobnws/read.do?jobnwsno=" + jobnwsVO.getJobnwsno());
      
      cnt = this.jobnwsProc.img_create(jobnwsVO);
      // mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.setViewName("/jobnws/update_msg"); // webapp/contents/update_msg.jsp
      
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("jobnws_passwd_cnt", jobnws_passwd_cnt); // request�� ����
            
    return mav;    
  }
  
}
 