<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team4</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    등록된 모든 글
  </DIV>
  <ASIDE class="aside_left">
    전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">회사등록</A> /
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>번호</th>
          <th style='text-align: center;'>회사이름</th>
          <th style='text-align: center;'>업종</th>
          <th style='text-align: center;'>출력</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="comintroVO" items="${list }">
          <c:set var="comno" value="${comintroVO.comno }" />
          <TR> 
            <td style='text-align: center;'>${comintroVO.comno}</td>
            <td>
              <a href="../comcate/list_ajax.do?comno=${comno}">${comintroVO.com_name}</a> 
            </td> 
            <td style='text-align: center;'>${comintroVO.com_type}</td>
            <TD class="td_bs">
        <c:choose>
          <c:when test="${comintroVO.visible == 'Y'}">
            <A href="./update_visible.do?comno=${comno }&visible=${comintroVO.visible }"><IMG src="./images/open.png" style='width: 18px;'></A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?comno=${comno }&visible=${comintroVO.visible }"><IMG src="./images/close.png" style='width: 18px;'></A>
          </c:otherwise>
        </c:choose>
      </TD>   
      <TD class="td_bs">
        <A href="./update.do?comno=${comno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./delete.do?comno=${comno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>      
      </TD>   


          </TR>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


