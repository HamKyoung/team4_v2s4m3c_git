<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
    
    <c:choose>
      <c:when test="${sw == false }">
        <LI class='li_none'>
            <span class='span_success'>비밀번호가 서로 일치하지 않습니다.</span>
        </LI>
      </c:when>
     </c:choose>
     
      <c:choose>
        <c:when test="${cnt == 1 }">
          <LI class='li_none'>
            <span class='span_success'>회원 가입을 완료 했습니다.</span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_fail'>회원가입에 실패했습니다.</span>
          </LI>
          <button type='button' 
            onclick="history.back();"
            class="btn btn-info">다시 시도</button>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <button type='button' 
                    onclick="location.href='../index.do'"
                    class="btn btn-info">홈페이지</button>
      </LI>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>