package dev.mvc.re_calendar;

import java.util.HashMap;
import java.util.List;

import dev.mvc.questions.QuesVO;

public interface Re_calendarDAOInter {


  /**
   * 
   * @param re_calendarVO
   * @return
   */
  public int create(Re_calendarVO re_calendarVO);

  
  /**
   * list
   * @return
   */
  public List<Re_calendarVO> list();
  
  
  /**
   * read
   * @param calendar_no
   * @return
   */
  public Re_calendarVO read(int calendar_no);
  
  /**
   * delete
   * @param calendar_no
   * @return
   */
  public int delete(int calendar_no);
  
  
  /**
   * read_update
   * @param calendar_no
   * @return
   */
  public Re_calendarVO read_update(int calendar_no);
  
  /**
   * update
   * @param re_calendarVO
   * @return
   */
  public int update(Re_calendarVO re_calendarVO);

}





