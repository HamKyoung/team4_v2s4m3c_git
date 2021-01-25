package dev.mvc.resume;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;


@Component("dev.mvc.resume.ResumeProc")
public class ResumeProc implements ResumeProcInter{
  @Autowired
  private ResumeDAOInter resumeDAO;

  /**
   * 등록
   */
  @Override
  public int create(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.create(resumeVO);
    return cnt;
  }

  /**
   * 목록
   */
  @Override
  public List<ResumeVO> list() {
    List<ResumeVO> list = this.resumeDAO.list();
    return list;
  }

  /**
   * 조회
   */
  @Override
  public ResumeVO read(int res_no) {
    ResumeVO resumeVO = this.resumeDAO.read(res_no);
    
    String res_intro = resumeVO.getRes_intro();
    String res_work = resumeVO.getRes_work();
    
    res_intro = Tool.convertChar(res_intro);  // 특수 문자 처리
    res_work = Tool.convertChar(res_work);
    
    resumeVO.setRes_intro(res_intro);
    resumeVO.setRes_work(res_work);
    
    return resumeVO;
  }

  /**
   * 수정 폼
   */
  @Override
  public ResumeVO read_update(int res_no) {
    ResumeVO resumeVO = this.resumeDAO.read(res_no);
    return resumeVO;
  }
  
  /**
   * 수정 처리
   */
  @Override
  public int update(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update(resumeVO);
    return cnt;
  }

  /**
   * 삭제 처리
   */
  @Override
  public int delete(int res_no) {
    int cnt = this.resumeDAO.delete(res_no);    
    return cnt;
  }

  @Override
  public int delete_img(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update_img(resumeVO);
    return cnt;
  }

  /**
   * 공개 여부
   */
  @Override
  public int update_visible(ResumeVO resumeVO) {
    if (resumeVO.getRes_visible().equalsIgnoreCase("Y")) {
      resumeVO.setRes_visible("N");
    } else {
      resumeVO.setRes_visible("Y");
    }
    int cnt = this.resumeDAO.update_visible(resumeVO);
    return cnt;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int cnt = resumeDAO.search_count(hashMap);
    return cnt;
  }

  @Override
  public List<ResumeVO> list_resno_seqno_asc(HashMap<String, Object> map) {
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Resume.RECORD_PER_PAGE;
   
    // 시작 rownum 결정
    // 1 페이지 = 0 + 1, 2 페이지 = 10 + 1, 3 페이지 = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  종료 rownum
    // 1 페이지 = 0 + 10, 2 페이지 = 0 + 20, 3 페이지 = 0 + 30
    int endNum = beginOfPage + Resume.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<ResumeVO> list = this.resumeDAO.list_resno_seqno_asc(map);
    
    return list;    
  }

  /**
   * 이미지 업데이트
   */
  @Override
  public int update_img(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update_img(resumeVO);
    return cnt;
  }

  /**
   * 페이징 박스
   */
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String res_work) {
    int totalPage = (int)(Math.ceil((double)search_count/Resume.RECORD_PER_PAGE)); // 전체 페이지  
    
    int totalGrp = (int)(Math.ceil((double)totalPage/Resume.PAGE_PER_BLOCK));// 전체 그룹 
    
    int nowGrp = (int)(Math.ceil((double)nowPage/Resume.PAGE_PER_BLOCK));    // 현재 그룹 
    
    int startPage = ((nowGrp - 1) * Resume.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    
    int endPage = (nowGrp * Resume.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _nowPage = (nowGrp-1) * Resume.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+res_work+"&nowPage="+_nowPage+"'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+res_work+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _nowPage = (nowGrp * Resume.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+res_work+"&nowPage="+_nowPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString();    
  }


}
