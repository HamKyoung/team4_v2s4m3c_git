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
   * ����� http://localhost:9090/team4/recruit/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/recruit/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recruit/create"); // /webapp/categrp/create.jsp
    // String content = "���:\n�ο�:\n�غ�:\n���:\n��Ÿ:\n";
    // mav.addObject("content", content);

    
    return mav; // forward
  }
  
  //http://localhost:9090/resort/contents/create.do
   /**
    * ��� ó��
    * @param cateVO
    * @return
    */
   @RequestMapping(value="/recruit/create.do", 
                               method=RequestMethod.POST )
   public ModelAndView create(HttpServletRequest request, RecruitVO recruitVO) {
     
     ModelAndView mav = new ModelAndView();
     // -------------------------------------------------------------------
     // ���� ���� �ڵ� ����
     // -------------------------------------------------------------------
     String file1 = "";     // main image
     String thumb1 = ""; // preview image
         
     String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // ���� ���
     // ���� ������ ����� fnamesMF ��ü�� ������.
     MultipartFile mf = recruitVO.getFile1MF();
     long size1 = mf.getSize();  // ���� ũ��
     if (size1 > 0) { // ���� ũ�� üũ
       // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
       // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
       file1 = Upload.saveFileSpring(mf, upDir); 
       
       if (Tool.isImage(file1)) { // �̹������� �˻�
           // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 200, height: 150
           thumb1 = Tool.preview(upDir, file1, 200, 150); 
       }
       
     }    
     // -------------------------------------------------------------------
     // ���� ���� �ڵ� ����
     // -------------------------------------------------------------------
     
     //recruitVO.setIp(request.getRemoteAddr()); // ������ IP
     recruitVO.setFile1(file1);
     recruitVO.setThumb1(thumb1);
     recruitVO.setSize1(size1);
  
     int cnt = this.recruitProc.create(recruitVO); // Call By Reference�� ����
  
     mav.addObject("cnt", cnt);
     mav.addObject("cateno", recruitVO.getCateno());
     mav.addObject("url", "create_msg"); // // webapp/contents/create_msg.jsp
    
     mav.setViewName("/recruit/create_msg"); // /webapp/contents/create_msg.jsp
     
     return mav;
   }

  /**
   * ��� http://localhost:9090/team4/recruit/list_all.do
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
   * ī�װ��� ��� http://localhost:9090/team4/recruit/list.do
   * 
   * @return
   */
    @RequestMapping(value = "/recruit/list.do", method = RequestMethod.GET)
    public ModelAndView list_by_cateno(int cateno) { ModelAndView mav = new
    ModelAndView(); // /webapp/contents/list_by_cateno.jsp //
    mav.setViewName("/recruit/list_by_cateno");
    
    // ���̺� �̹��� ���, /webapp/contents/list_by_cateno.jsp
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
     * ��ü ���
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
      
      // ÷�� ���� ��� 
      List<AttachfileVO> attachfile_list =this.attachfileProc.list_by_recruitno(recruitno);
      mav.addObject("attachfile_list", attachfile_list);
//      System.out.println("--> ÷�� ���� ����: " + attachfile_list.size());
       
      
      //mav.setViewName("/recruit/read"); // /webapp/contents/read.jsp
      // mav.setViewName("/recruit/read_img"); // /webapp/contents/read_img.jsp
      mav.setViewName("/recruit/read_img_attachfile"); // /webapp/contents/read_img_attachfile.jsp    
      return mav;
    }

  // http://localhost:9090/resort/recruit/update.do
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/recruit/update.do", method=RequestMethod.GET )
  public ModelAndView update(int recruitno) {
    ModelAndView mav = new ModelAndView();
    
    RecruitVO recruitVO = this.recruitProc.read_update(recruitno); // ������ �б�
    mav.addObject("recruitVO", recruitVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/recruit/update"); // webapp/recruit/update.jsp
    
    return mav;
  }
 // http://localhost:9090/resort/contents/update.do
  /**
   * ���� ó��
   * @param recruitVO
   * @return
   */
  @RequestMapping(value="/recruit/update.do", method=RequestMethod.POST )
  public ModelAndView update(RecruitVO recruitVO) {
    ModelAndView mav = new ModelAndView();
    
    ComCateVO comcateVO = this.comcateProc.read(recruitVO.getCateno());
    // mav.addObject("cateVO", cateVO); // ���޾ȵ�.
    mav.addObject("cate_name", comcateVO.getCate_name());
    mav.addObject("cateno", comcateVO.getCateno());

    ComIntroVO comIntroVO = this.comintroProc.read(comcateVO.getComno());
    // mav.addObject("categrpVO", categrpVO); // ���޾ȵ�.
    mav.addObject("com_name", comIntroVO.getCom_name());
    
    mav.addObject("recruitno", recruitVO.getRecruitno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("recruitno", recruitVO.getRecruitno());
    hashMap.put("passwd", recruitVO.getPasswd());
    
    int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
      cnt = this.recruitProc.update(recruitVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
        
    mav.setViewName("/recruit/update_msg"); // webapp/recruit/update_msg.jsp
    
    return mav;
  }
    
  /**
   * ������
   * @param recruitno
   * @return
   */
    @RequestMapping(value="/recruit/delete.do", method=RequestMethod.GET )
    public ModelAndView delete(int recruitno) { 
      ModelAndView mav = new  ModelAndView();
    
    RecruitVO recruitVO = this.recruitProc.read_update(recruitno); // ������ �б�
    mav.addObject("recruitVO", recruitVO); //
    //request.setAttribute("recruitVO", recruitVO);
    
    mav.setViewName("/recruit/delete"); // webapp/contents/delete.jsp
    
    return mav;
  }
      
  // http://localhost:9090/resort/recruit/delete.do
  /**
   * ���� ó�� +  ���� ����
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
    
    int passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    passwd_cnt = this.recruitProc.passwd_check(hashMap);
    boolean sw = false;
    
/*    if (passwd_cnt == 1) { // �н����尡 ��ġ�� ��� �� ����
      cnt = this.recruitProc.delete(recruitno);
      if (cnt == 1) {
        comcateProc.decreaseCnt(cateno);
        
        // -------------------------------------------------------------------------------------
        // ������ �������� ���ڵ� �������� ������ ��ȣ -1 ó��
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("cateno", cateno);
        map.put("word", word);
        // �ϳ��� �������� 3���� ���ڵ�� �����Ǵ� ��� ���� 9���� ���ڵ尡 ���� ������
        if (recruitProc.search_count(map) % Contents.RECORD_PER_PAGE == 0) {
          nowPage = nowPage - 1;
          if (nowPage < 1) {
            nowPage = 1; // ���� ������
          }
        }
        // -------------------------------------------------------------------------------------
      }
      
      String upDir = Tool.getRealPath(request, "/recruit/storage/main_images"); // ���� ���
      sw = Tool.deleteFile(upDir, recruitVO.getFile1());  // Folder���� 1���� ���� ����
      sw = Tool.deleteFile(upDir, recruitVO.getThumb1());  // Folder���� 1���� ���� ����

    }
*/
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt); // request�� ����
    //mav.addObject("nowPage", nowPage); // request�� ����
    // System.out.println("--> ContentsCont.java nowPage: " + nowPage);
    
    mav.addObject("cateno", recruitVO.getCateno()); // redirect parameter ����
   // mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
    
    mav.setViewName("/recruit/delete_msg"); // webapp/contents/delete_msg.jsp
    //mav.setViewName("redirect:/recruit/msg.do"); 
    
    return mav;
  }
     

}
