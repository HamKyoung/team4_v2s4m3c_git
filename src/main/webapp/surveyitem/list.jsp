<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>설문 조사 목록</DIV>
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='cateno' value='${surveyitemVO.surveyno }'>
      <br>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' 
                     style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?surveyitemno=${surveyitemVO.surveyno }&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <div class="aside_right"></div>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 15%;'/>
      <col style="width: 15%;"/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">설문조사항목번호</TH>
      <TH class="th_bs">설문조사 번호</TH>
      <TH class="th_bs">출력순서</TH>
      <TH class="th_bs">항목</TH>
      <TH class="th_bs">항목 파일</TH>
      <TH class="th_bs">항목 선택 인원</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="SurveyitemVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="sur_itemno" value="${SurveyitemVO.sur_itemno}" />
      <c:set var="surveyno" value="${SurveyitemVO.surveyno}" />
      <c:set var="itemfile" value="${SurveyitemVO.itemfile}" />
      <TR>
        <TD class="td_bs">${sur_itemno }</TD>
        <TD class="td_left">${surveyno }</TD>
        <TD class="td_bs">${SurveyitemVO.itemseq }</TD>
        <TD class="td_bs">
          <a href="./read.do?sur_itemno=${sur_itemno }">${SurveyitemVO.item }</a>
        </TD>
        <TD style='vertical-align: middle; text-align: center;'>
         <c:choose>
                <c:when test="${itemfile.endsWith('jpg') || itemfile.endsWith('png') || itemfile.endsWith('gif')}">
                  <IMG src="./storage/main_images/${itemfile }" style='width: 120px; height: 80px;'> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${SurveyitemVO.itemfile}
                </c:otherwise>
              </c:choose>
            </TD>
        <TD class="td_bs">${SurveyitemVO.itemcnt }</TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 