package dev.mvc.comcate;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.comintro.ComIntroProcInter;
import dev.mvc.comintro.ComIntroVO;

@Controller
public class ComCateCont {
  
  @Autowired
  @Qualifier("dev.mvc.comintro.ComIntroProc")
  private ComIntroProcInter comintroProc;
  
  @Autowired
  @Qualifier("dev.mvc.comcate.ComCateProc")
  private ComCateProcInter comcateProc;

  public ComCateCont() {
    System.out.println("--> ComCateCont created.");
  }
  
  /**
   * 등록폼 http://localhost:9090/team4/comcate/create.do
   * @return
   */
  @RequestMapping(value = "/comcate/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comcate/create"); // /webapp/comcate/create.jsp

    return mav; // forward
  }
  
  /**
   * 등록처리
   * @param comcateVO
   * @return
   */
  
    @RequestMapping(value = "/comcate/create.do", method = RequestMethod.POST)
    public ModelAndView create(ComCateVO comcateVO) { ModelAndView mav = new
    ModelAndView(); mav.setViewName("/comcate/create_msg");
    
    int cnt = this.comcateProc.create(comcateVO); 
    mav.addObject("cnt", cnt);
    
    return mav; }
   
  
  /**
   * Ajax 기반 등록 처리 http://localhost:9090/resort/categrp/create_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/comcate/create_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String create_ajax(ComCateVO comcateVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.comcateProc.create(comcateVO); // 등록 처리
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  
  /**
   * 목록 http://localhost:9090/team4/comcate/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/comcate/list_all.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    //List<ComCateVO> list = this.comcateProc.list_cateno_asc();
    List<ComCateVO> list = this.comcateProc.list_seqno_asc();
    mav.addObject("list", list);

  //mav.setViewName("/comcate/list_all"); // /webapp/comcate/list_all.jsp
    mav.setViewName("/comcate/list");
    
    return mav; // forward
  }

  /**
   * 목록 http://localhost:9090/resort/comcate/list.do
   * @return
   */
  @RequestMapping(value = "/comcate/list.do", method = RequestMethod.GET)
  public ModelAndView list(int comno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comcate/list_ajax"); // /webapp/comcate/list.jsp

    //ComIntro 접근
    ComIntroVO comintroVO = this.comintroProc.read(comno);
    mav.addObject("comintroVO",comintroVO);
    
   
    // List<ComCateVO> list = this.comcateProc.list_cateno_asc();
    List<ComCateVO> list = this.comcateProc.list_by_comno(comno);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 조회 + 수정폼 http://localhost:9090/resort/comcate/read_update.do
   * 
   * @return
   */
  @RequestMapping(value = "/comcate/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int cateno, int comno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comcate/read_update"); // /webapp/comcate/read_update.jsp

    ComCateVO comcateVO = this.comcateProc.read(cateno);
    mav.addObject("comcateVO", comcateVO);
    

    List<ComCateVO> list = this.comcateProc.list_by_comno(comno);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * Ajax + read http://localhost:9090/resort/comcate/read_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/comcate/read_ajax.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String read_ajax(int cateno) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    ComCateVO comcateVO = this.comcateProc.read(cateno);

    JSONObject json = new JSONObject();
    json.put("cateno", cateno);
    json.put("cate_name", comcateVO.getCate_name());
    json.put("cate_seqno", comcateVO.getCate_seqno());
    json.put("cate_visible", comcateVO.getCate_visible());

    return json.toString();
  }
  
  /**
   * 수정 처리
   * 
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/comcate/update.do", method = RequestMethod.POST)
  public ModelAndView update(ComCateVO comcateVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.comcateProc.update(comcateVO);
    mav.addObject("cnt", cnt); // request에 저장

    mav.setViewName("/comcate/update_msg"); // webapp/comcate/update_msg.jsp

    return mav;
  }
  
  /**
   * Ajax 기반 수정 처리 http://localhost:9090/resort/categrp/update_ajax.do
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/comcate/update_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String update_ajax(ComCateVO comcateVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.comcateProc.update(comcateVO); // 등록 처리
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  
  /**
   * 조회 + 삭제폼 http://localhost:9090/resort/comcate/read_delete.do
   * @return
   */
  @RequestMapping(value = "/comcate/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int cateno,int comno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/comcate/read_delete"); // /webapp/comcate/read_delete.jsp

    ComCateVO comcateVO = this.comcateProc.read(cateno);
    mav.addObject("comcateVO", comcateVO);

    List<ComCateVO> list = this.comcateProc.list_by_comno(comno);
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 삭제 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/comcate/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int cateno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.comcateProc.delete(cateno);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("/comcate/delete_msg"); // webapp/comcate/delete_msg.jsp

    return mav;
  }
  
  /**
   * 삭제 처리 + Ajax
   * @param cateno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/comcate/delete_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int cateno) {
    try {
      Thread.sleep(2000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.comcateProc.delete(cateno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param categrpno 카테고리 번호
   * @return
   */
  @RequestMapping(value="/comcate/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_up(int cateno, int comno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.comcateProc.update_seqno_up(cateno);
    //mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("redirect:/comcate/list.do?comno=" + comno); // request 객체가 전달이 안됨. 

    return mav;
  }
  
  /**
   * 우선순위 하향 up 1 ▷ 10
   * @param categrpno 카테고리 번호
   * @return
   */
  @RequestMapping(value="/comcate/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_down(int cateno, int comno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.comcateProc.update_seqno_down(cateno);
    //mav.addObject("cnt", cnt); // request에 저장
   
    mav.setViewName("redirect:/comcate/list.do?comno=" + comno); // request 객체가 전달이 안됨. 

    return mav;
  }
  
  /**
   * 출력모드 변경
   * @param comcateVO
   * @return
   */
  @RequestMapping(value = "/comcate/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(ComCateVO comcateVO) {
    ModelAndView mav = new ModelAndView();
        
    int cnt = this.comcateProc.update_visible(comcateVO);
    mav.addObject("cnt", cnt); // request에 저장

    if (cnt == 1) { 
      mav.setViewName("redirect:/comcate/list.do?comno=" + comcateVO.getComno()); // request 객체가 전달이 안됨. 
    } else {
      ComCateVO vo = this.comcateProc.read(comcateVO.getCateno());
      String name = vo.getCate_name();
      mav.addObject("name", name);
      mav.setViewName("/comcate/update_visible_msg"); // /comcate/update_visible_msg.jsp
    }
    return mav;
  }
  
  //http://localhost:9090/team4/comcate/list_join.do
 /**
  * comintro + comcate join 전체 목록
  * @return
  */
 @RequestMapping(value="/comcate/list_join.do", method=RequestMethod.GET )
 public ModelAndView list_join() {
   ModelAndView mav = new ModelAndView();
   
   List<ComIntro_ComCate_join> list = this.comcateProc.list_join();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/comcate/list_join"); // webapp/comcate/list_join.jsp
   return mav;
 }
 
}
