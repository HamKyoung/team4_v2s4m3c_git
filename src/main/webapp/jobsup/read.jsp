<%@ page contentType="text/html; charset=UTF-8"%>
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

</head>

<body>
<c:set var="comno" value="${jobsupVO.comno}" />
<c:set var="gen_memberno" value="${jobsupVO.gen_memberno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${jobsupVO.jobsup_title }
  </DIV>
  
  <ASIDE class="aside_right">
    <A href="create.do">구직 신청</A>
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?jobsupno=${jobsupno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?comno=${param.comno}&gen_memberno=${param.gen_memberno }&jobsupno=${param.jobsupno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?comno=${param.comno}&gen_memberno=${param.gen_memberno }&jobsupno=${jobsupno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="jobsupno" value="${jobsupno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${jobsupVO.comno}</span>
            <span>${jobsupVO.gen_memberno}</span>
            <span>${jobsupVO.jobsup_title}</span>
            <span>${jobsupVO.jobsup_date.substring(0, 16)}</span>
          </li>
           <li class="li_none">
             <DIV>${jobsupVO.jobsup_msg }</DIV>
          </li>         
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>