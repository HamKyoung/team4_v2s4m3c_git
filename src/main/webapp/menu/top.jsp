<%@ page contentType="text/html; charset=UTF-8" %>

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->

<header class='header'>
  <!-- <A href='${pageContext.request.contextPath}/index.jsp' style='margin-left: 30px; margin-top: 30px;'>로고</A>  -->
  <A class='top_menu_link' style='font-size: 10px;' href="${pageContext.request.contextPath}/index.jsp" >메인</A><span class='top_menu_sep'>&nbsp;</span>

    <NAV class='top_menu'>      
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/notice/list.do' >공지사항</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/comintro/list_all.do' >기업</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/jobnws/list.do' >뉴스</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/recruit/list_all.do' >채용</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/jobsup/list.do' >구직</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/review/list.do'>리뷰</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/resume/list_all.do'>이력서</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/pass_self/list.do'>합격 자기소개서</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link' style='font-size: 10px;' href='${pageContext.request.contextPath}/answer/list.do'>Q&A</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link'  style='font-size: 10px;' href='${pageContext.request.contextPath}/survey/list.do'>설문 조사 목록</A><span class='top_menu_sep'>&nbsp;</span>
    </NAV> 
    
    <DIV class='member_menu'>
      <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/list.do'>로그인</A><span class='top_menu_sep'>&nbsp;</span>
      <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/list.do'>회원가입</A>
    </DIV>
    
 
</header>


  
<!-- TOP HOME 닫음 -->



    <DIV class="col-sm-9 col-md-10 cont" style='margin-top: 100px;'>  <!-- 내용 출력 컬럼 -->  
      <DIV class='content' style='margin-left: 30%;'>

    




