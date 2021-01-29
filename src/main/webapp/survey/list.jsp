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
 
  <DIV class='title_line'>설문 조사 목록
    <aside class="aside_right">
      <c:if test="${sessionScope.id != null}">
        <A href='./create.do?surveyno=${param.surveyno }'>등록</A> 
      </c:if>
    </aside>
  </DIV>
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='surveyno' value='${surveyVO.surveyno }'>
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
                     onclick="location.href='./list.do?surveyno=${surveyVO.surveyno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <div class="aside_right"></div>
  
  <c:choose>
    <c:when test="${sessionScope.id != null}">
      <TABLE class='table table-striped'>
        <colgroup>
          <col style='width: 10%;'/>
          <col style="width: 40%;"/>
          <col style='width: 15%;'/>
          <col style='width: 15%;'/>
          <col style='width: 20%;'/>
        </colgroup>
       
        <thead>  
        <TR>
          <TH class="th_bs">번호</TH>
          <TH class="th_bs">주제</TH>
          <TH class="th_bs">시작 날짜</TH>
          <TH class="th_bs">종료 날짜</TH>
          <TH class="th_bs">기타</TH>
        </TR>
        </thead>
        
        <tbody>
        <c:forEach var="SurveyVO" items="${list }">  <!-- request 객체에 접근 -->
          <c:set var="surveyno" value="${SurveyVO.surveyno}" />
          <TR>
            <TD class="td_bs">${surveyno }</TD>
            <TD class="td_left">
              <a href="../surveyitem/list.do?surveyno=${surveyno }">${SurveyVO.topic }</a>
            </TD>
            <TD class="td_bs">${SurveyVO.startdate }</TD>
            <TD class="td_bs">${SurveyVO.enddate }</TD>
            <TD class="td_bs"><a href="./delete.do?surveyno=${surveyno }">삭제</a>
              <a href="./update.do?surveyno=${surveyno }">수정</a>
            </TD>
          </TR>
        </c:forEach>
        </tbody>
      </TABLE>
    </c:when>
    
    <c:otherwise>
      <TABLE class='table table-striped'>
        <colgroup>
          <col style='width: 10%;'/>
          <col style="width: 50%;"/>
          <col style='width: 20%;'/>
          <col style='width: 20%;'/>
        </colgroup>
       
        <thead>  
        <TR>
          <TH class="th_bs">번호</TH>
          <TH class="th_bs">주제</TH>
          <TH class="th_bs">시작 날짜</TH>
          <TH class="th_bs">종료 날짜</TH>
        </TR>
        </thead>
        
        <tbody>
        <c:forEach var="SurveyVO" items="${list }">  <!-- request 객체에 접근 -->
          <c:set var="surveyno" value="${SurveyVO.surveyno}" />
          <TR>
            <TD class="td_bs">${surveyno }</TD>
            <TD class="td_left">
              <c:choose>
                <c:when test="${sessionScope.gen_id != null || sessionScope.cor_id != null}">
                  <a href="../surveyitem/list.do?surveyno=${surveyno }">${SurveyVO.topic }</a> 
                </c:when>
                <c:otherwise>
                  <a href="../login/login_need.jsp">${SurveyVO.topic }</a>
                </c:otherwise>
              </c:choose>
            </TD>
            <TD class="td_bs">${SurveyVO.startdate }</TD>
            <TD class="td_bs">${SurveyVO.enddate }</TD>
          </TR>
        </c:forEach>
        </tbody>
      </TABLE>
    </c:otherwise>
  </c:choose>
  
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 