package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.event.EventProc")
public class EventProc implements EventProcInter{
  @Autowired
  private EventDAOInter eventDAO;

  @Override
  public int create(EventVO eventVO) {
    int cnt = this.eventDAO.create(eventVO);
    return cnt;
  }

  @Override
  public List<EventVO> list() {
    List<EventVO> list = this.eventDAO.list();
    return list;
  }

  @Override
  public EventVO read(int eventno) {
    EventVO eventVO = this.eventDAO.read(eventno);
    
    String eve_title = eventVO.getEve_title();
    String eve_content = eventVO.getEve_content();
    
    eve_title = Tool.convertChar(eve_title);  // Ư�� ���� ó��
    eve_content = Tool.convertChar(eve_content);
    
    eventVO.setEve_title(eve_title);
    eventVO.setEve_content(eve_content);
    
    return eventVO;
  }

  @Override
  public EventVO read_update(int eventno) {
    EventVO eventVO = this.eventDAO.read(eventno);
    return eventVO;
  }

  @Override
  public int update(EventVO eventVO) {
    int cnt = this.eventDAO.update(eventVO);
    return cnt;
  }

  @Override
  public int delete(int eventno) {
    int cnt = this.eventDAO.delete(eventno);
    return cnt;
  }

  @Override
  public int delete_img(EventVO eventVO) {
    int cnt = this.eventDAO.update_img(eventVO);
    return cnt;
  }

  @Override
  public int update_visible(EventVO eventVO) {
    if (eventVO.getEve_visible().equalsIgnoreCase("Y")) {
      eventVO.setEve_visible("N");
    } else {
      eventVO.setEve_visible("Y");
    }
    int cnt = this.eventDAO.update_visible(eventVO);
    return cnt;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int cnt = this.eventDAO.search_count(hashMap);
    return cnt;
  }

  @Override
  public List<EventVO> list_eventno_seqno_asc(HashMap<String, Object> map) {
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Event.RECORD_PER_PAGE;
    
    // ���� rownum ����
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1;
    
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Event.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<EventVO> list = this.eventDAO.list_eventno_seqno_asc(map);
    
    return list;    
  }

  @Override
  public int update_img(EventVO eventVO) {
    int cnt = this.eventDAO.update_img(eventVO);
    return cnt;
  }

  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String eve_content) {
    int totalPage = (int)(Math.ceil((double)search_count/Event.RECORD_PER_PAGE)); // ��ü ������  
    
    int totalGrp = (int)(Math.ceil((double)totalPage/Event.PAGE_PER_BLOCK));// ��ü �׷� 
    
    int nowGrp = (int)(Math.ceil((double)nowPage/Event.PAGE_PER_BLOCK));    // ���� �׷� 
    
    int startPage = ((nowGrp - 1) * Event.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    
    int endPage = (nowGrp * Event.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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

    int _nowPage = (nowGrp-1) * Event.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+eve_content+"&nowPage="+_nowPage+"'>����</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+eve_content+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Event.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+eve_content+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString();      }

}














