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
  <c:set var="cor_memberno" value="${corVO.cor_memberno}" />

  <jsp:include page="/menu/top.jsp" flush='false' />
    <div class="title_line"></div>
    
  <aside class='aside_left'>회원 정보</aside>

  <ASIDE class="aside_right">
    <A href='./list.do'>목록</A> 
    <span class='menu_divide'> | </span>
    <A href='./update_passwd.do?cor_memberno=${cor_memberno }'>비밀 번호 변경</A> 
    <span class='menu_divide'> | </span>
    <A href='./update.do?cor_memberno=${cor_memberno }'>개인 정보 수정</A> 
    <span class='menu_divide'> | </span> 
    <A href='./delete.do?cor_memberno=${cor_memberno }'>삭제</A>
  </ASIDE>
  
  <div class='menu_line'></div>
  
  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none"><span>ID: ${corVO.cor_id}</span><br><br> 
        <span>이름: ${corVO.cor_name}</span><br><br>
        <span>성별: ${corVO.cor_sex}</span><br><br> 
        <span>생년월일: ${corVO.cor_resident}</span><br><br> 
        <span>전화 번호: ${corVO.cor_phone}</span><br><br> 
        <span>우편 번호: ${corVO.cor_zipcode}</span><br><br>
        <span>주소: ${corVO.cor_addr}</span><br><br>
        <span>상세 주소: ${corVO.cor_addr1}</span><br><br>
        <span>이메일: ${corVO.cor_mail}</span><br><br>
        <span>가입일: ${corVO.cor_date.substring(0, 16)}</span>
      </li>
    </ul>
  </fieldset>


  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>