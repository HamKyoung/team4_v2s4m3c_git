<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>

  <jsp:include page="/menu/top.jsp" flush='false' />
    <c:set var="sur_memberno" value="${surveymemberVO.sur_memberno }"></c:set>
    <c:set var="sur_itemno" value="${surveymemberVO.sur_itemno }"></c:set>
    <c:set var="gen_memberno" value="${surveymemberVO.gen_memberno }"></c:set>
    <div class="title_line"></div>
    
    <aside class='aside_left'>설문 조사 참여 회원</aside>

    <ASIDE class="aside_right">
      <A href='./list.do'>목록</A> 
      <span class='menu_divide'> | </span> 
      <A href='./create.do?sur_itemno=${sur_itemno }&gen_memberno=${gen_memberno }'>등록</A> 
      <span class='menu_divide'> | </span> 
      <A href='./delete.do?sur_memberno=${sur_memberno }&sur_itemno=${sur_itemno }&gen_memberno=${gen_memberno }'>삭제</A>
    </ASIDE>
  
    <div class='menu_line'></div>
  
    <fieldset class="fieldset_basic">
      <ul>
        <li class="li_none">
          <c:set var="sur_memberno" value="${surveymemberVO.sur_memberno }"></c:set>
          <span>설문 참여 회원 번호: ${sur_memberno}</span><br><br> 
          <span>설문 조사 항목 번호: ${sur_itemno}</span><br><br>
          <span>회원 번호: ${gen_memberno}</span><br><br> 
          <span>설문 참여 날짜: ${surveymemberVO.rdate.substring(0,10)}</span><br><br>
        </li>
      </ul>
    </fieldset>


  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>