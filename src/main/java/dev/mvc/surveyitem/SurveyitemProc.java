package dev.mvc.surveyitem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.surveyitem.SurveyitemProc")
public class SurveyitemProc implements SurveyitemProcInter {
  @Autowired
  private SurveyitemDAOInter surveyitemDAO;
  
  public SurveyitemProc() {
    System.out.println("--> SurveyitemProc created.");
  }

  @Override
  public int create(SurveyitemVO surveyitemVO) {
    int cnt = this.surveyitemDAO.create(surveyitemVO);
    return cnt;
  }

  @Override
  public List<SurveyitemVO> list() {
    List<SurveyitemVO> list = this.surveyitemDAO.list();
    return list;
  }

  @Override
  public SurveyitemVO read(int sur_itemno) {
    SurveyitemVO surveyitemVO = this.surveyitemDAO.read(sur_itemno);
    return surveyitemVO;
  }

  @Override
  public int update(SurveyitemVO surveyitemVO) {
    int cnt = this.surveyitemDAO.update(surveyitemVO);
    return cnt;
  }

  @Override
  public int delete(int sur_itemno) {
    int cnt = this.surveyitemDAO.delete(sur_itemno);
    return cnt;
  }

  @Override
  public List<SurveyitemVO> list_by_search(HashMap<String, Object> hashMap) {
    List<SurveyitemVO> list_by_search = this.surveyitemDAO.list_by_search(hashMap);
    return list_by_search;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int cnt = this.surveyitemDAO.search_count(hashMap);
    return cnt;
  }

  @Override
  public int update_cnt(Map map){
    int cnt = this.surveyitemDAO.update_cnt(map);
    return cnt;
  }

  @Override
  public int count_by_surveyno(int surveyno) {
    int cnt = this.surveyitemDAO.count_by_surveyno(surveyno);
    return cnt;
  }

  @Override
  public int delete_by_surveyno(int surveyno) {
    int cnt = this.surveyitemDAO.delete_by_surveyno(surveyno);
    return cnt;
  }

  @Override
  public List<SurveyitemVO> list_by_surveyno(int surveyno) {
    List<SurveyitemVO> list_by_surveyno = this.surveyitemDAO.list_by_surveyno(surveyno);
    return list_by_surveyno;
  }
  
}
