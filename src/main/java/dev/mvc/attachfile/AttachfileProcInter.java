package dev.mvc.attachfile;

import java.util.List;

public interface AttachfileProcInter {
  /**
   * 파일 등록  
   * @param attachfileVO
   * @return
   */
  public int create(AttachfileVO attachfileVO);
  
  /**
   * 전체 이미지 목록
   * @return
   */
  public List<AttachfileVO> list();
  
  /**
   * 조회
   * @param attachfileno
   * @return
   */
  public AttachfileVO read(int recruitno);
  
  /**
   * recruitno에 따른 파일 목록
   * @param recruitno
   * @return
   */
  public List<AttachfileVO> list_by_recruitno(int recruitno);
  
  /**
   * 삭제
   * @param attachfileno
   * @return
   */
  public int delete(int attachfileno);
  
  /**
   * recruitno별 카운트
   * @param recruitno
   * @return
   */
  public int count_by_recruitno(int recruitno);

  /**
   * recruitno별 삭제
   * @param recruitno
   * @return
   */
  public int delete_by_recruitno(int recruitno);

}