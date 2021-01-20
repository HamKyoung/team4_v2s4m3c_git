<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>일반 회원 목록</DIV>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style="width: 10%;"/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">번호</TH>
      <TH class="th_bs">아이디</TH>
      <TH class="th_bs">이름</TH>
      <TH class="th_bs">가입일</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="GenmemberVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="gen_memberno" value="${GenmemberVO.gen_memberno}" />
      <TR>
        <TD class="td_bs">${gen_memberno }</TD>
        <TD class="td_bs">
        <a href="./read.do?gen_memberno=${gen_memberno }">${GenmemberVO.gen_id }</a>
        </TD>
        <TD class="td_bs">${GenmemberVO.gen_name }</TD>
        <TD class="td_bs">${GenmemberVO.gen_date.substring(0, 10) }</TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 