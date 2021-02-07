package dev.mvc.ps_attachfile;

import java.util.List;


public interface Ps_attachfileProcInter {

  /**
   * 
   * @param ps_attachfileVO
   * @return
   */
  public int create(Ps_attachfileVO ps_attachfileVO);
  
  
  /**
   * 조회
   * @param ps_attachfileno
   * @return
   */
  public Ps_attachfileVO read(int ps_attachfileno);
  
  /**
   * 전체 첨부파일 목록
   * @return
   */
  public List<Ps_attachfileVO> list();
  
  
  /**
   * 글 별 첨부파일 목록
   * @return
   */
  public List<Ps_attachfileVO> list_by_pass_self_no(int pass_self_no);
  
  /**
   * 부모 테이블 별 삭제
   * @param ps_attachfileno
   * @return
   */
  public int delete(int ps_attachfileno);
  
  
  
}












