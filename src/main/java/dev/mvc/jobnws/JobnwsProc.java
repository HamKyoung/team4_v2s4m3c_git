package dev.mvc.jobnws;
 
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import dev.mvc.tool.Tool;

 
@Component("dev.mvc.jobnws.JobnwsProc")
public class JobnwsProc implements JobnwsProcInter {
  
 @Autowired
 private JobnwsDAOInter jobnwsDAO;
  
  public JobnwsProc() {
    System.out.println("--> JobnwsProc created");
  }

  @Override
  public int create(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.create(jobnwsVO);
    return cnt;
  }
  
  @Override
  public List<JobnwsVO> list_jobnwsno_asc() {
    List<JobnwsVO> list = this.jobnwsDAO.list_jobnwsno_asc();
    return list;
  }
  
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = jobnwsDAO.search_count(hashMap);
    return count;
  }
  
  @Override
  public List<JobnwsVO> list_by_jobnwsno_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������ ���� rownum: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������ ���� rownum: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������ ���� rownum: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Jobnws.RECORD_PER_PAGE;
   
    // ���� rownum ����
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Jobnws.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<JobnwsVO> list = this.jobnwsDAO.list_by_jobnwsno_search_paging(map);
    
    return list;
  }
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String jobnws_title){ 
    int totalPage = (int)(Math.ceil((double)search_count/Jobnws.RECORD_PER_PAGE)); // ��ü ������  
    
    int totalGrp = (int)(Math.ceil((double)totalPage/Jobnws.PAGE_PER_BLOCK));// ��ü �׷� 
    
    int nowGrp = (int)(Math.ceil((double)nowPage/Jobnws.PAGE_PER_BLOCK));    // ���� �׷� 
    
    int startPage = ((nowGrp - 1) * Jobnws.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    
    int endPage = (nowGrp * Jobnws.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    int _nowPage = (nowGrp-1) * Jobnws.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&jobnws_title="+jobnws_title+"&nowPage="+_nowPage+"'>����</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?jobnws_title="+jobnws_title+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Jobnws.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&jobnws_title="+jobnws_title+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  
  @Override
  public List<Jobnws_AdminVO> list_by_jobnwsno_search_paging_join(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������ ���� rownum: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������ ���� rownum: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������ ���� rownum: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Jobnws.RECORD_PER_PAGE;
   
    // ���� rownum ����
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Jobnws.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<Jobnws_AdminVO> list = this.jobnwsDAO.list_by_jobnwsno_search_paging_join(map);
    
    return list;
  }
  

  @Override
  public JobnwsVO read(int jobnwsno) {
   JobnwsVO jobnwsVO = this.jobnwsDAO.read(jobnwsno);
   
   String jobnws_title = jobnwsVO.getJobnws_title();
   String jobnws_content = jobnwsVO.getJobnws_content();
   
   jobnws_title = Tool.convertChar(jobnws_title);  // Ư�� ���� ó��
   jobnws_content = Tool.convertChar(jobnws_content);
   
   jobnwsVO.setJobnws_title(jobnws_title);
   jobnwsVO.setJobnws_content(jobnws_content);
   
    return jobnwsVO;
  }

  @Override
  public int update(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update(jobnwsVO);
    return cnt;
  }

  @Override
  public JobnwsVO read_update(int jobnwsno) {
    JobnwsVO jobnwsVO = this.jobnwsDAO.read(jobnwsno);
    return jobnwsVO;
  }




  @Override
  public int delete(int jobnwsno) {
    int cnt = this.jobnwsDAO.delete(jobnwsno);
    return cnt;
  }

  @Override
  public int delete(JobnwsVO jobnwsVO) {
  int cnt = this.jobnwsDAO.delete(jobnwsVO);
    return cnt;
  }

  @Override
  public int jobnws_passwd_check(HashMap hashMap) {
    int jobnws_passwd_cnt = this.jobnwsDAO.jobnws_passwd_check(hashMap);
    return jobnws_passwd_cnt;
  }




  @Override
  public int update_img(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update_img(jobnwsVO);
    return cnt;
  }

  @Override
  public int img_create(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update_img(jobnwsVO);
    return cnt;
  }
  
  @Override
  public int img_delete(JobnwsVO jobnwsVO) {
    int cnt = this.jobnwsDAO.update_img(jobnwsVO);
    return cnt;
  }

  @Override
  public int increaseCnt(int jobnwsno) {
    int cnt = this.jobnwsDAO.increaseCnt(jobnwsno);
    return cnt;
  }

}