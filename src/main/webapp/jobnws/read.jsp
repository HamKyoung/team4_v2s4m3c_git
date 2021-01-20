<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>채용뉴스</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>

</head>

<body>
<c:set var="newsno" value="${jobnwsVO.newsno}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${jobnwsVO.news_title }
  </DIV>
  
  <ASIDE class="aside_right">
    <A href="create.do">뉴스 등록</A>
        <c:choose>
      <c:when test="${jobnwsVO.news_file1.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?newsno=${newsno }'>메인 이미지 변경/삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./img_create.do?newsno=${newsno }'>메인 이미지 등록</A>     
      </c:otherwise>
    </c:choose>  
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?newsno=${newsno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?newsno=${newsno }&newsno=${newsno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?newsno=${newsno }&newsno=${newsno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="newsno" value="${newsno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${jobnwsVO.news_title}</span>
            <span>${jobnwsVO.news_date.substring(0, 16)}</span>
          </li>
           <li class="li_none">
            <c:set var="news_file1" value="${jobnwsVO.news_file1 }" />
            <c:if test="${news_file1.endsWith('jpg') || news_file1.endsWith('png') || news_file1.endsWith('gif')}">
              <DIV style="width: 50%; float: left; margin-right: 10px;">
                <IMG src="./storage/main_images/${news_file1 }" style="width: 100%;">
              </DIV> 
            </c:if> 
             <DIV>${jobnwsVO.news_content }</DIV>
          </li>
          
          <li class="li_none">
           
          </li>
           <li class="li_none">
            ${jobnwsVO.news_url }
          </li>
          <li class="li_none">
           조회수: ${jobnwsVO.news_cnt }  추천수: <img src='./images/good01.png' 
               style='width: 50px; margin-left: 20px;' title="추천">${jobnwsVO.news_good }
           
          </li>

        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>