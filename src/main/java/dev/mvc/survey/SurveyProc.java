package dev.mvc.survey;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.survey.SurveyProc")
public class SurveyProc implements SurveyProcInter {
  @Autowired
  private SurveyDAOInter surveyDAO;
  
  public SurveyProc() {
    System.out.println("--> SurveyProc created.");
  }
  @Override
  public int create(SurveyVO surveyVO) {
    int cnt = this.surveyDAO.create(surveyVO);
    return cnt;
  }
  @Override
  public List<SurveyVO> list() {
    List<SurveyVO> list = this.surveyDAO.list();
    return list;
  }
  @Override
  public SurveyVO read(int surveyno) {
    SurveyVO surveyVO = this.surveyDAO.read(surveyno);
    return surveyVO;
  }
  @Override
  public int update(SurveyVO surveyVO) {
    int cnt = this.surveyDAO.update(surveyVO);
    return cnt;
  }
  @Override
  public int delete(int surveyno) {
    int cnt = this.surveyDAO.delete(surveyno);
    return cnt;
  }
  @Override
  public List<SurveyVO> list_by_search(HashMap<String, Object> hashMap) {
    List<SurveyVO> list_by_search = this.surveyDAO.list_by_search(hashMap);
    return list_by_search;
  }
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int cnt = this.surveyDAO.search_count(hashMap);
    return cnt;
  }
}
