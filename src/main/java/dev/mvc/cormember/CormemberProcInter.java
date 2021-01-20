package dev.mvc.cormember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CormemberProcInter {
  /**
   * <Xmp>
   * ��� ȸ�� ���
   * <insert id="create" parameterType="Cor_memberVO"> 
   * </Xmp>
   * @param cor_memberVO
   * @return ó���� ���ڵ� ����
   */
  public int create(CormemberVO corVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_memberno_asc" resultType="CormemberVO">
   * </xmp> 
   * @return ���ڵ� ���
   */
  public List<CormemberVO> list_memberno_asc();
  
  /**
   * ��ȸ
   * <xmp>
   *   <select id="read" resultType="CormemberVO" parameterType="int">
   * </xmp>  
   * @param cor_memberno
   * @return
   */
  public CormemberVO read(int cor_memberno);
  
  /**
   * 회원 수정
   * <xmp>
   *   <update id="update" parameterType="CormemberVO"> 
   * </xmp>
   * @param AdminVO
   * @return 
   */
  public int update(CormemberVO corVO);
  
  
  /**
   * 회원 삭제
   * @param cor_memberno
   * @return
   */
  public int delete(int cor_memberno);
  
  /**
   * id 중복 체크
   * @param cor_id
   * @return
   */
  public int id_check(String cor_id);
  
  /**
   * 패스워드 체크
   * @param hashmap
   * @return
   */
  public int passwd_check(HashMap hashmap);
  
  /**
   * 패스워드 변경
   * @param hashmap
   * @return
   */
  public int update_passwd(CormemberVO corVO);
  
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
  public CormemberVO readById(String cor_id);
  
}
