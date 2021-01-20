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
 
  <DIV class='title_line'>설문 조사 목록
  </DIV>
  <div class="aside_right"></div>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">설문 참여 회원 번호</TH>
      <TH class="th_bs">설문 조사 항목 번호</TH>
      <TH class="th_bs">참여 회원</TH>
      <TH class="th_bs">설문 참여 날짜</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="Survey_genVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="sur_memberno" value="${Survey_genVO.sur_memberno}" />
      <c:set var="gid" value="${Survey_genVO.gid}" />
      <c:set var="sur_itemno" value="${Survey_genVO.sur_itemno}" />
      <TR>
        <TD class="td_bs">
          <a href="./read.do?sur_memberno=${sur_memberno }">${sur_memberno }</a>
        </TD>
        <TD class="td_left">${sur_itemno }</TD>
        <TD class="td_bs">${gid }</TD>
        <TD class="td_bs">${Survey_genVO.rdate.substring(0,10) }</TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 