package dev.mvc.recruit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.recruit.RecruitProc")
public class RecruitProc implements RecruitProcInter{
  @Autowired
  private RecruitDAOInter recruitDAO;

  public RecruitProc() {
    System.out.println("--> RecruitProc created.");
  }

  @Override
  public int create(RecruitVO recruitVO) {
    int cnt = this.recruitDAO.create(recruitVO);
    return cnt;
  }

  @Override
  public List<RecruitVO> list_all() {
    List<RecruitVO> list = this.recruitDAO.list_all();
    return list;
  }

  @Override
  public List<RecruitVO> list_by_cateno(int cateno) {
    List<RecruitVO> list = this.recruitDAO.list_by_cateno(cateno);
    return list;
  }

  @Override
  public RecruitVO read(int recruitno) {
    RecruitVO recruitVO = this.recruitDAO.read(recruitno);
    
    String title = recruitVO.getTitle();
    String content = recruitVO.getContent();
    
    title = Tool.convertChar(title);  // Ư�� ���� ó��
    // content = Tool.convertChar(content); // Ckeditor ���� ������� �� ��.
    
    recruitVO.setTitle(title);
    // contentsVO.setContent(content);  // Ckeditor ���� ������� �� ��.
    
    
    return recruitVO;
  }

  @Override
  public RecruitVO read_update(int recruitno) {
    RecruitVO recruitVO = this.recruitDAO.read(recruitno);
    return recruitVO;
  }

  @Override
  public int update(RecruitVO recruitVO) {
    int cnt = this.recruitDAO.update(recruitVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap<String, Object> hashMap) {
    int passwd_cnt = this.recruitDAO.passwd_check(hashMap);
    return passwd_cnt;
  }
  
  @Override
  public int delete(int recruitno) {
    int cnt = this.recruitDAO.delete(recruitno);
    return cnt;
  }

  @Override
  public int img_create(RecruitVO recruitVO) {
    int cnt = this.recruitDAO.update_img(recruitVO);
    return cnt;
  }

  @Override
  public int img_update(RecruitVO recruitVO) {
    int cnt = this.recruitDAO.update_img(recruitVO);
    return cnt;
  }

  @Override
  public int img_delete(RecruitVO recruitVO) {
    int cnt = this.recruitDAO.update_img(recruitVO);
    return cnt;
  }
  
  @Override
  public List<RecruitVO> list_by_cateno_search(HashMap<String, Object> hashMap) {
    List<RecruitVO> list = recruitDAO.list_by_cateno_search(hashMap);
    return list;
  }  
  
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = recruitDAO.search_count(hashMap);
    return count;
  }
  

  @Override
  public List<RecruitVO> list_by_cateno_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������ ���� rownum: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������ ���� rownum: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������ ���� rownum: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Recruit.RECORD_PER_PAGE;
   
    // ���� rownum ����
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Recruit.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<RecruitVO> list = this.recruitDAO.list_by_cateno_search_paging(map);
    
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
  public String pagingBox(String listFile, int cateno, int search_count, int nowPage, String word) {
    int totalPage = (int)(Math.ceil((double)search_count/Recruit.RECORD_PER_PAGE)); // ��ü ������  
    
    int totalGrp = (int)(Math.ceil((double)totalPage/Recruit.PAGE_PER_BLOCK));// ��ü �׷� 
    
    int nowGrp = (int)(Math.ceil((double)nowPage/Recruit.PAGE_PER_BLOCK));    // ���� �׷� 
    
    int startPage = ((nowGrp - 1) * Recruit.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    
    int endPage = (nowGrp * Recruit.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    int _nowPage = (nowGrp-1) * Recruit.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&cateno="+cateno+"'>����</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"&cateno="+cateno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Recruit.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&cateno="+cateno+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

}
