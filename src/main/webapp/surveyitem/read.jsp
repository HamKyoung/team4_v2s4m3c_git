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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>

  <jsp:include page="/menu/top.jsp" flush='false' />
  
    <c:set var="sur_itemno" value="${surveyitemVO.sur_itemno }"></c:set>
    <c:set var="surveyno" value="${surveyitemVO.surveyno }"></c:set>
    
    <div class="title_line"></div>
    
    <aside class='aside_left'>설문 조사</aside>

    <ASIDE class="aside_right">
      <A href='./list.do'>목록</A> 
      <span class='menu_divide'> | </span> 
      <A href='./create.do?sur_itemno=${sur_itemno }&surveyno=${surveyno }'>등록</A> 
      <span class='menu_divide'> | </span> 
      <A href='./update.do?sur_itemno=${sur_itemno }&surveyno=${surveyno }'>수정</A> 
      <span class='menu_divide'> | </span> 
      <A href='./delete.do?sur_itemno=${sur_itemno }&surveyno=${surveyno }'>삭제</A>
    </ASIDE>
  
    <div class='menu_line'></div>
  
    <fieldset class="fieldset_basic">
      <ul>
        <li class="li_none">
          <c:set var="itemfile" value="${surveyitemVO.itemfile }"></c:set>
            <c:if  test="${itemfile.endsWith('jpg') || itemfile.endsWith('png') || itemfile.endsWith('gif')}">
              <div style="width: 50%; float: left; margin-right: 10px;">
              <IMG src="./storage/main_images/${itemfile }" style="width: 100%;">
              </div> 
            </c:if>
          <span>설문 조사 항목번호: ${surveyitemVO.sur_itemno}</span><br><br> 
          <span>설문 조사 번호: ${surveyno}</span><br><br>
          <span>출력 순서: ${surveyitemVO.itemseq}</span><br><br> 
          <span>항목: ${surveyitemVO.item}</span><br><br> 
          <span>항목 선택 인원: ${surveyitemVO.itemcnt}</span><br><br>
        </li>
      </ul>
    </fieldset>


  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>