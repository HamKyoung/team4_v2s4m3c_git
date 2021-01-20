<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
 
  <DIV class='title_line'>질문 게시판
  <ASIDE class="aside_right">
    <A href="./create.do" title="등록">등록</A>
  </ASIDE>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 55%;'/>
    <col style='width: 15%;'/>
    <col style='width: 5%;'/>    
    <col style='width: 15%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">NO</TH>
    <TH class="th_bs">제목</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">작성자</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="quesVO" items="${list}">
    <c:set var="ques_no" value="${quesVO.ques_no }" />
    <TR>
      <TD class="td_bs">${ques_no }</TD>
      <TD><a href="./read.do?ques_no=${ques_no}">${quesVO.ques_title}</a></TD> 

      <TD class="td_bs">${quesVO.ques_date.substring(0, 10) }</TD>
      <TD class="td_bs">${quesVO.gen_memberno }</TD>
      <TD class="td_bs">
        <A href="./read_update.do?ques_no=${ques_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?ques_no=${ques_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>      
      </TD>   
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 