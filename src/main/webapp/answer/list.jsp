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
 
  <DIV class='title_line'>Q&A 게시판
  <ASIDE class="aside_right">
    <A href="../questions/create.do" title="등록">질문 등록</A>
  </ASIDE>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 45%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>    
    <col style='width: 15%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">분류</TH>
    <TH class="th_bs">제목</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">작성자</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="quesVO" items="${ques_list}">
    <c:set var="ques_no" value="${quesVO.ques_no }" />

      <!-- 질문 목록 -->
      <TR>
        <TD class="td_bs">[질문]</TD>
        <TD><a href="../questions/read.do?ques_no=${ques_no}">${quesVO.ques_title}</a></TD> 
        <TD class="td_bs">${quesVO.ques_date.substring(0, 10) }</TD>
        <TD class="td_bs">${quesVO.gen_name }</TD>
        <TD class="td_bs">
          <A href="../questions/read_update.do?ques_no=${ques_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="../questions/read_delete.do?ques_no=${ques_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>      
        </TD>   
      </TR>
      
    <!-- 답변 목록 -->
     <c:forEach var="ansVO" items="${list}">
      <c:set var="ans_no" value="${ansVO.ans_no}" />
      
       <c:if test="${quesVO.ques_no == ansVO.ques_no }">
       <TR>
        <TD> </TD>
        <TD> <IMG src='./images/arrow-re.png' style='width: 15px;'><a href="./read.do?ans_no=${ans_no}">${ansVO.ans_title}</a></TD>
        <TD class="td_bs">${ansVO.ans_date.substring(0, 10) }</TD>
        <TD class="td_bs">관리자</TD>
        <TD class="td_bs">
          <A href="./read_update.do?ans_no=${ans_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?ans_no=${ans_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>      
        </TD>   
      </TR>
      </c:if>
         
      
     </c:forEach>
     
     
  </c:forEach> 
  
  
  
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 