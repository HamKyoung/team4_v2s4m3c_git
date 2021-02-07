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
    * ��� ��
    * @return
    */
  @RequestMapping(value="/ps_attachfile/create.do", method=RequestMethod.GET )
  public ModelAndView create(int pass_self_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/ps_attachfile/create");
     
    return mav;
  }
  
  /**
   * ��� ó��
   * @return
   */
  @RequestMapping(value = "/ps_attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, 
                                           Ps_attachfileVO ps_attachfileVO) {
    
    ModelAndView mav = new ModelAndView();
    // ---------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // ---------------------------------------------------------------
    int pass_self_no = ps_attachfileVO.getPass_self_no();
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/ps_attachfile/storage");
    
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = ps_attachfileVO.getFnamesMF();
    
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����, 1���̻� ���� ó��
        fsize = multipartFile.getSize();  // ���� ũ��
        if (fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����, ���ε�� ���ϸ�
          
          if (Tool.isImage(fname)) { // �̹������� �˻�
            thumb = Tool.preview(upDir, fupname, 200, 150); // thumb �̹��� ����
          }
        }
        Ps_attachfileVO vo = new Ps_attachfileVO();
        vo.setPass_self_no(pass_self_no);
        vo.setPs_fname(fname);
        vo.setPs_upname(fupname);
        vo.setPs_thumb(thumb);
        vo.setPs_fsize(fsize);
        
        // ���� 1�� ��� ���� dbms ����, ������ 20���̸� 20���� record insert.
        upload_count = upload_count + ps_attachfileProc.create(vo); 
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    mav.addObject("pass_self_no", pass_self_no); // redirect parameter ����
    mav.addObject("upload_count", upload_count); // redirect parameter ����
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter ����
    
    mav.setViewName("redirect:/ps_attachfile/msg.do"); // ���ΰ�ħ ����
    
    return mav;
  }
  
  /**
   * ���ΰ�ħ�� �����ϴ� �޽��� ���
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
   * ���
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
   * pass_self_no�� ���
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
   * ÷�� ���� 1�� ���� ó��
   * 
   * @return
   */
  @RequestMapping(value = "/ps_attachfile/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int ps_attachfileno,
      @RequestParam(value = "pass_self_no", defaultValue = "0") int pass_self_no, String rurl) {
    ModelAndView mav = new ModelAndView();

    // ������ ���� ������ �о��.
    Ps_attachfileVO ps_attachfileVO = ps_attachfileProc.read(ps_attachfileno);

    String upDir = Tool.getRealPath(request, "/ps_attachfile/storage"); // ���� ���
    Tool.deleteFile(upDir, ps_attachfileVO.getPs_upname()); // Folder���� 1���� ���� ����
    Tool.deleteFile(upDir, ps_attachfileVO.getPs_thumb()); // 1���� Thumb ���� ����

    // DBMS���� 1���� ���� ����
    ps_attachfileProc.delete(ps_attachfileno);

    List<Ps_attachfileVO> list = ps_attachfileProc.list();
    mav.addObject("list", list);

    mav.addObject("pass_self_no", pass_self_no);

    mav.setViewName("redirect:/ps_attachfile/" + rurl);

    return mav;
  }
  
  
  
  
}
  





