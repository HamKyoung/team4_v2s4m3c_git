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

<div class="aside_right"></div>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 70%;'/>
      <col style='width: 30%;'/>

    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">주제: ${surveyVO.topic } </TH>
      <TH class="th_bs">항목 파일</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="SurveyitemVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="sur_itemno" value="${SurveyitemVO.sur_itemno}" />
      <c:set var="surveyno" value="${SurveyitemVO.surveyno}" />
      <c:set var="itemfile" value="${SurveyitemVO.itemfile}" />
      <TR>
        <TD class="td_bs" style="text-align: left;">
          <label>
              결과: ${SurveyitemVO.item } > ${SurveyitemVO.itemcnt }(명)
          </label>
        </TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>