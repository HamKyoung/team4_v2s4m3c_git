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
<c:set var="recruitno" value="${jobsupVO.recruitno}" />
<c:set var="res_no" value="${jobsupVO.res_no}" />
<c:set var="gen_memberno" value="${jobsupVO.gen_memberno }" />
<c:set var="comno" value="${jobsupVO.comno }" />



<jsp:include page="/menu/top.jsp" flush='false' /><br>
  
  <DIV class="title_line">
    구직 신청 > 조회
  </DIV>
  
  <ASIDE class="aside_right">
  <c:if test="${sessionScope.gen_id != null  or sessionScope.id != null }">
    <A href="create.do">구직 신청</A>
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?jobsupno=${jobsupno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?comno=${comintroVO.comno }&comname=${comintroVO.com_name }&cateno=${recruitVO.cateno }&recruitno=${recruitVO.recruitno}&title=${recruitVO.title}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?jobsupno=${jobsupno }&jobsupno=${jobsupno}'>삭제</A>
    </c:if>
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="jobsupno" value="${jobsupno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            회사명: 
            <span>${comname}</span><br><br>
            채용 공고명:
            <span> ${title}</span><br><br>
            회원 이름: 
            <span>${sessionScope.gen_name }</span><br><br>
            이력서 제목: 
            <span>${res_intro}</span><br><br>
            지원제목:
            <span>${jobsupVO.jobsup_title}</span><br><br>
            지원메시지:
            <span>${jobsupVO.jobsup_msg }</span><br><br>
          </li>
           <li class="li_none">
             <DIV>${jobsupVO.jobsup_date.substring(0, 16)}</DIV>
          </li>         
        </ul>
      </fieldset>
  </FORM>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>