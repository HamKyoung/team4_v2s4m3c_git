package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.review.ReviewVO;

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;

  public ReviewCont() {
    System.out.println("--> ReviewCont created.");
  }

  /**
   * 등록폼 http://localhost:9090/team4/review/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/review/create_form.do", method = RequestMethod.GET)
  public ModelAndView create_form() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/create_form");
    return mav;
  }

  /*  *//**
         * 등록처리 http://localhost:9090/team4/review/create.do
         * 
         * @return
         *//*
            * @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
            * public ModelAndView create(ReviewVO reviewVO) { ModelAndView mav = new
            * ModelAndView(); mav.setViewName("/review/create_msg");
            * 
            * int rev_cnt = this.reviewProc.create(reviewVO); mav.addObject("rev_cnt",
            * rev_cnt);
            * 
            * return mav; }
            */

  /**
   * Ajax 기반 등록 처리 http://localhost:9090/resort/categrp/create_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/create_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create_ajax(ReviewVO reviewVO) {
    int cnt = this.reviewProc.create(reviewVO);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * 목록 (리뷰등록순)
   * 
   * @return
   */
  @RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ReviewVO> list = this.reviewProc.list_rev_no();
    mav.addObject("list", list);

    mav.setViewName("/review/list_ajax");
    return mav;
  }

  /**
   * 목록 (최종목표:특정 회사만 나오게)
   * 
   * @return
   */
  @RequestMapping(value = "/review/list_final.do", method = RequestMethod.GET)
  public ModelAndView list_final(@RequestParam(value = "rev_no", defaultValue = "1") int rev_no,
      @RequestParam(value = "com_name", defaultValue = "") String com_name,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("rev_no", rev_no); // #{cateno}
    map.put("com_name", com_name); // #{word}
    map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    // 검색 목록
    List<ReviewVO> list = reviewProc.list_comno(map);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = reviewProc.search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * 
     * @param listFile 목록 파일명
     * 
     * @param cateno 카테고리번호
     * 
     * @param search_count 검색(전체) 레코드수
     * 
     * @param nowPage 현재 페이지
     * 
     * @param word 검색어
     * 
     * @return 페이징 생성 문자열
     */
    String paging = reviewProc.pagingBox("list.do", rev_no, search_count, nowPage, com_name);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    mav.setViewName("/review/list.do");

    return mav;
  }

  /**
   * 조회
   * 
   * @return
   */
   @RequestMapping(value = "/review/read.do", method = RequestMethod.GET) 
   public ModelAndView read(int rev_no) {
     ModelAndView mav = new ModelAndView();
   
     ReviewVO reviewVO = this.reviewProc.read(rev_no); mav.addObject("reviewVO",
     reviewVO);
  
     mav.setViewName("/review/read");
   
     return mav; 
   }

   /*
       * Ajax read
       * 
       * @return
       */
  /*
   * @ResponseBody
   * 
   * @RequestMapping(value = "/review/read_ajax.do", method = RequestMethod.GET,
   * produces = "text/plain;charset=UTF-8") public String read_ajax(int rev_no) {
   * ReviewVO reviewVO = this.reviewProc.read(rev_no);
   * 
   * JSONObject json = new JSONObject(); json.put("rev_no", rev_no);
   * json.put("com_name", reviewVO.getCom_name()); json.put("rev_title",
   * reviewVO.getRev_title()); json.put("rev_score", reviewVO.getRev_score());
   * json.put("rev_depart", reviewVO.getRev_depart()); json.put("rev_content",
   * reviewVO.getRev_content()); json.put("rev_visible",
   * reviewVO.getRev_visible()); json.put("comno", reviewVO.getComno());
   * 
   * return json.toString(); }
   */
   
   
  /**
   * 수정 폼
   * 
   * @return
   */
  @RequestMapping(value = "/review/update.do", method = RequestMethod.GET)
  public ModelAndView update(int rev_no) {
    ModelAndView mav = new ModelAndView();

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO); // request.setAttribute("contentsVO", contentsVO);

    mav.setViewName("/review/update"); // webapp/contents/update.jsp

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
  public ModelAndView update(ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();

    int rev_cnt = this.reviewProc.update(reviewVO);
    mav.addObject("rev_cnt", rev_cnt); // request에 저장

    mav.setViewName("/review/update_msg");

    return mav;
  }

  /**
   * Ajax 기반 수정 처리
   */
  @ResponseBody
  @RequestMapping(value = "/review/update_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String update_ajax(ReviewVO reviewVO) {
    int cnt = this.reviewProc.update(reviewVO); // 등록 처리

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * 조회 + 삭제폼 http://localhost:9090/resort/cate/read_delete.do
   * 
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/review/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int rev_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/read_delete");

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO);

    return mav; // forward
  }

  /**
   * 삭제 폼, attachfile Ajax 기반 삭제 지원
   * 
   * @return
   */
  @RequestMapping(value = "/review/delete_form.do", method = RequestMethod.GET)
  public ModelAndView delete_form(int rev_no) {
    ModelAndView mav = new ModelAndView();

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO); // request.setAttribute("contentsVO", contentsVO);

    mav.setViewName("/review/delete"); // webapp/contents/delete.jsp

    return mav;
  }

  /**
   * 삭제 처리
   * 
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/review/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int rev_no) {
    ModelAndView mav = new ModelAndView();

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO);

    int rev_cnt = this.reviewProc.delete(rev_no);
    mav.addObject("rev_cnt", rev_cnt); // request에 저장

    mav.setViewName("/review/delete_msg"); // webapp/cate/delete_msg.jsp

    return mav;
  }

  /**
   * Ajax 삭제 처리
   * 
   * @param categrpno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/delete_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int rev_no) {
    int cnt = this.reviewProc.delete(rev_no);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * 새로고침을 방지하는 메시지 출력
   * 
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/review/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    // 등록 처리 메시지: create_msg --> /review/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /review/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /review/delete_msg.jsp
    mav.setViewName("/review/" + url); // forward

    return mav; // forward
  }

}
