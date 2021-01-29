<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container' style='width: 90%; '>

<header class='header'>

    <NAV class='top_menu'>
      <div class="bottom_header">      
      <ul class="gnb">
        <li><A style='font-size: 16px;' href="${pageContext.request.contextPath}/index.jsp" >메인</A></li>
        <li><a href="#">공지사항</a>
          <ul class="depth2">
            <li><A href='${pageContext.request.contextPath}/notice/list.do' >공지사항</A></li>
            <li><A href='${pageContext.request.contextPath}/answer/list.do'>Q&A</A></li>
            <li><A href='${pageContext.request.contextPath}/survey/list.do'>설문 조사 목록</A></li>
            <li><A href='${pageContext.request.contextPath}/event/list.do'>이벤트</A></li>
          </ul>
        </li>
        
        <li><a href="#">회사</a>
          <ul class="depth2">
            <li><A href='${pageContext.request.contextPath}/comintro/list_all.do' >기업</A></li>
            <li><A href='${pageContext.request.contextPath}/jobnws/list.do' >뉴스</A></li>
            <li><A href='${pageContext.request.contextPath}/recruit/list_all.do' >채용</A></li>
          </ul>
        </li>

        <li><a href="#">구직</a>
          <ul class="depth2">
            <li><A href='${pageContext.request.contextPath}/jobsup/list.do' >구직</A></li>
            <li><A href='${pageContext.request.contextPath}/resume/list.do'>이력서</A></li>
            <li>
                <c:choose>
                  <c:when test="${sessionScope.cor_id != null}">
                    <A href='${pageContext.request.contextPath}/recruit/list_by_cateno.do' >채용</A>
                  </c:when>
                  <c:otherwise>
                    <A href='${pageContext.request.contextPath}/recruit/list_all.do' >채용</A>
                  </c:otherwise> 
                </c:choose>            
            </li>
          </ul>
        </li>

        <li><a href="#">정보공유</a>
          <ul class="depth2">
            <li><A href='${pageContext.request.contextPath}/review/list.do'>리뷰</A></li>
            <li><A href='${pageContext.request.contextPath}/pass_self/list.do'>합격 자기소개서</A></li>
          </ul>
        </li>
      </ul>
      </div>
    </NAV> 
    
    <DIV class='member_menu'>
      <c:choose>
          <c:when test="${sessionScope.gen_id == null && sessionScope.cor_id == null}">
            <A class='top_menu_link'  href='${pageContext.request.contextPath}/login/login.jsp' >Login</A><span class='top_menu_sep'>&nbsp;</span>
          </c:when>
          <c:when test="${sessionScope.gen_id != null}">
            ${sessionScope.gen_id } <A class='top_menu_link'  href='${pageContext.request.contextPath}/genmember/logout.do' >Logout</A><span class='top_menu_sep'> </span>
          </c:when>
          <c:when test="${sessionScope.cor_id != null}">
            ${sessionScope.cor_id } <A class='top_menu_link'  href='${pageContext.request.contextPath}/cormember/logout.do' >Logout</A><span class='top_menu_sep'> </span>
          </c:when>
      </c:choose>

      <A class='top_menu_link'  href='${pageContext.request.contextPath}/create/create.jsp'>회원가입</A>
    </DIV>
    
 
</header>


  
<!-- TOP HOME 닫음 -->

    <DIV class="col-md-12 cont" style='margin-top: 100px;'>
      <DIV class='content'>

    




