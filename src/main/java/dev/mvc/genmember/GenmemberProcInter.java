package dev.mvc.genmember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface GenmemberProcInter {
  
  /**
   * <Xmp>
   * 일반 회원 등록
   * <insert id="create" parameterType="Gen_memberVO"> 
   * </Xmp>
   * @param gen_memberVO
   * @return 
   */
  public int create(GenmemberVO genVO);
  
  /**
   * <Xmp>
   * 일반 회원 목록 
   * </Xmp>
   * @return
   */
  public List<GenmemberVO> list_memberno_asc();
  
  /**
   * 조회
   * @param gen_numberno
   * @return
   */
  public GenmemberVO read(int gen_memberno);
  
  /**
   * 수정
   * @param genVO
   * @return
   */
  public int update(GenmemberVO genVO);
  
  /**
   * 회원 삭제
   * @param gen_memberno
   * @return
   */
  public int delete(int gen_memberno);
  
  /**
   * id 중복 확인
   * @param gen_id
   * @return
   */
  public int id_check(String gen_id);
  
  /**
   * 패스워드 체크
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * 패스워드 변경
   * @param hashmap
   * @return
   */
  public int update_passwd(GenmemberVO genVO);
  
  /**
   * 로그인
   * @param map
   * @return
   */
  public int login(Map<String, Object> map);
  
  /**
   * 회원 정보 조회
   * @param cor_id
   * @return
   */
  public GenmemberVO readById(String gen_id);
}
