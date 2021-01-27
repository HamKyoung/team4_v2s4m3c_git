<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 글 + 이미지 조회하는 경우 참고  --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge;">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>JOB</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/JavaScript">

</script>
</head>

<body>
<c:set var="eventno" value="${eventVO.eventno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    ${param.eve_title}
  </DIV>
  
  <ASIDE class="aside_left">
  </ASIDE>
  <ASIDE class="aside_right">

    <c:choose>
      <c:when test="${eventVO.eve_pic.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?eventno=${eventno }'>이미지 변경/삭제</A>     
      </c:when>
      <c:otherwise>
   
        <A href='./img_create.do?eventno=${eventno }'>이미지 등록</A>     
      </c:otherwise>
    </c:choose>    
    <span class='menu_divide' > | </span>

    <A href='./list.do'>목록</A>
    
    <span class='menu_divide' > | </span>
        <c:choose>
          <c:when test="${eventVO.eve_visible == 'Y'}">
            <A href="./update_visible.do?eventno=${eventno }&eve_visible=${eventVO.eve_visible }">비공개</A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?eventno=${eventno }&eve_visible=${eventVO.eve_visible }">공개</A>
           </c:otherwise>
         </c:choose>
        
    <span class='menu_divide' > | </span> 
    <A href='./read_update.do?eventno=${eventno }'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./read_delete.do?eventno=${eventno }'>삭제</A>
  </ASIDE>
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="eventno" value="${eventno}">
      
      <fieldset class="fieldset_basic">
        <ul>
          <li class="li_none">
            <span>${eventVO.eve_title }</span>
          </li>        
          <li class="li_none">
            <span>${eventVO.eve_date.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <c:set var="eve_pic" value="${eventVO.eve_pic }" />
            <c:if test="${eve_pic.endsWith('jpg') || eve_pic.endsWith('png') }">
              <DIV style="width: 50%;  margin-right: 10px;">
                <IMG src="./storage/main_images/${eve_pic }" style="width: 200px;">
              </DIV> 
            </c:if>
            <DIV>${eventVO.eve_content}</DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
 