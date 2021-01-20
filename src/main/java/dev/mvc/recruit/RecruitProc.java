package dev.mvc.recruit;

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
    
    title = Tool.convertChar(title);  // 특수 문자 처리
    // content = Tool.convertChar(content); // Ckeditor 사용시 사용하지 말 것.
    
    recruitVO.setTitle(title);
    // contentsVO.setContent(content);  // Ckeditor 사용시 사용하지 말 것.
    
    
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

}
