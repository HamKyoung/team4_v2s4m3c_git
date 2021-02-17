package dev.mvc.re_calendar;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.questions.QuesVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.re_calendar.Re_calendarProc")
public class Re_calendarProc implements Re_calendarProcInter{
  @Autowired
  private Re_calendarDAOInter re_calendarDAO;
  
  public Re_calendarProc() {
    System.out.println("--> Re_calendarProc created.");
  }

  @Override
  public int create(Re_calendarVO re_calendarVO) {
    int cnt = this.re_calendarDAO.create(re_calendarVO);
    return cnt;
  }

  @Override
  public List<Re_calendarVO> list() {
    List<Re_calendarVO> list = this.re_calendarDAO.list();
    return list;
  }

  @Override
  public Re_calendarVO read(int calendar_no) {
    Re_calendarVO re_calendarVO = this.re_calendarDAO.read(calendar_no);
    return re_calendarVO;
  }

  @Override
  public int delete(int calendar_no) {
    int cnt = this.re_calendarDAO.delete(calendar_no);
    return cnt;
  }

  @Override
  public int update(Re_calendarVO re_calendarVO) {
    int cnt = this.re_calendarDAO.update(re_calendarVO);
    return cnt;
  }

  @Override
  public Re_calendarVO read_update(int calendar_no) {
    Re_calendarVO re_calendarVO = this.re_calendarDAO.read(calendar_no);
    return re_calendarVO;
  }

 

}







