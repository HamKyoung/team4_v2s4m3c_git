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
<c:set var="comno" value="${comintroVO.comno}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${comintro.com_name }
  </DIV>
  
  <ASIDE class="aside_left">
  </ASIDE>
  <ASIDE class="aside_right">
  <c:if test="${corlogin eq true }">
    <A href="./create.do">글 등록</A>
    <span class='menu_divide' > | </span>
    <A href='./update.do?comno=${comno }'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?comno=${comno }'>삭제</A>
    <span class='menu_divide' > | </span>
  </c:if>
    
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list_all.do?comno=${comno }'>목록</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <!-- FK memberno 지정 -->
      <input type='hidden' name='cor_memberno' id='cor_memberno' value='1'>
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>회사이름 : ${comintroVO.com_name}</span>
          </li>

          <li class="li_none">
            <DIV>기업형태 : ${comintroVO.com_form}</DIV><BR>
            <DIV>업종 : ${comintroVO.com_type}</DIV><BR>
            <DIV>매출액 : ${comintroVO.sales }</DIV><BR>
            <DIV>홈페이지 : ${comintroVO.homepage }</DIV><BR>
            <DIV>주소 : ${comintroVO.address }</DIV><BR>
            <DIV>사원수 : ${comintroVO.num_people }</DIV><BR>
            <DIV>대표자명 : ${comintroVO.ceo_name}</DIV><BR>
            <DIV>설립일 : ${comintroVO.edate }</DIV><BR>
          </li>
  
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

