<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      </DIV> <!-- container END -->

    </DIV><!-- <DIV class="second"> 종료 -->
  </DIV> <!-- <DIV class="third"> 종료 -->

  
  <!-- 화면 하단 메뉴 --> 
  <DIV class='fourth' style='text-align: center;'>
    <HR>
    ⓒ Copyright Team4 All rights reserved.
  </DIV>
  <DIV style='text-align: right;'>
        <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A style='font-size: 10px; font-weight: lighter;' href='${pageContext.request.contextPath}/admin/login.do' >Ad.Login</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A style='font-size: 10px; font-weight: lighter;' href='${pageContext.request.contextPath}/admin/logout.do' >Ad.Logout</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>
  </DIV>


