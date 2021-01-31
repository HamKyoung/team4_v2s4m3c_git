<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>구직 신청</title>
 
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

  
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 8%;'/>
      <col style='width: 8%;'/>
      <col style="width: 7%;"/>
      <col style='width: 17%;'/>
      <col style='width: 30%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">구직 신청 번호</TH>
      <TH class="th_bs">채용 번호</TH>
      <TH class="th_bs">회원 번호</TH>
      <TH class="th_bs">이력서 번호</TH>
      <TH class="th_bs">지원 제목</TH>
      <TH class="th_bs">지원 메세지</TH>
      <TH class="th_bs">지원일</TH>
    </TR>
    </thead>
    
    <ASIDE class="aside_left">
    <c:if test="${sessionScope.gen_id != null  or sessionScope.id != null}">
    <A href="create.do">구직 신청</A>
    </c:if>
    </ASIDE>
     <tbody>
        <c:forEach var="JobsupVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="jobsupno" value="${JobsupVO.jobsupno}" />
       <%-- 글을 등록한 회원만 메뉴 출력 --%>
     <c:if test="${sessionScope.gen_id != null  or sessionScope.id != null }">
      <TR>
        <TD class="td_bs">${jobsupno }</TD>
        <TD class="td_bs">${JobsupVO.recruitno }</TD>
        <TD class="td_bs">${JobsupVO.gen_memberno }</TD>
        <TD class="td_bs">${JobsupVO.res_no }</TD>     
        <TD class="td_bs_left"><A href="./read.do?jobsupno=${jobsupno }">${JobsupVO.jobsup_title }</A></TD>
        <TD class="td_bs">${JobsupVO.jobsup_msg}</TD>
        <TD class="td_bs">${JobsupVO.jobsup_date.substring(0, 10) }</TD>     
      </TR> 
      </c:if>
    </c:forEach>
   </tbody>
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 