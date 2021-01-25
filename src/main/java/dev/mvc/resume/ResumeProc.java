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
   * ���
   */
  @Override
  public int create(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.create(resumeVO);
    return cnt;
  }

  /**
   * ���
   */
  @Override
  public List<ResumeVO> list() {
    List<ResumeVO> list = this.resumeDAO.list();
    return list;
  }

  /**
   * ��ȸ
   */
  @Override
  public ResumeVO read(int res_no) {
    ResumeVO resumeVO = this.resumeDAO.read(res_no);
    
    String res_intro = resumeVO.getRes_intro();
    String res_work = resumeVO.getRes_work();
    
    res_intro = Tool.convertChar(res_intro);  // Ư�� ���� ó��
    res_work = Tool.convertChar(res_work);
    
    resumeVO.setRes_intro(res_intro);
    resumeVO.setRes_work(res_work);
    
    return resumeVO;
  }

  /**
   * ���� ��
   */
  @Override
  public ResumeVO read_update(int res_no) {
    ResumeVO resumeVO = this.resumeDAO.read(res_no);
    return resumeVO;
  }
  
  /**
   * ���� ó��
   */
  @Override
  public int update(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update(resumeVO);
    return cnt;
  }

  /**
   * ���� ó��
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
   * ���� ����
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
   
    // ���� rownum ����
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Resume.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<ResumeVO> list = this.resumeDAO.list_resno_seqno_asc(map);
    
    return list;    
  }

  /**
   * �̹��� ������Ʈ
   */
  @Override
  public int update_img(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update_img(resumeVO);
    return cnt;
  }

  /**
   * ����¡ �ڽ�
   */
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String res_work) {
    int totalPage = (int)(Math.ceil((double)search_count/Resume.RECORD_PER_PAGE)); // ��ü ������  
    
    int totalGrp = (int)(Math.ceil((double)totalPage/Resume.PAGE_PER_BLOCK));// ��ü �׷� 
    
    int nowGrp = (int)(Math.ceil((double)nowPage/Resume.PAGE_PER_BLOCK));    // ���� �׷� 
    
    int startPage = ((nowGrp - 1) * Resume.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    
    int endPage = (nowGrp * Resume.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * Resume.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+res_work+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
 
    // �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+res_work+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Resume.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+res_work+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString();    
  }


}
