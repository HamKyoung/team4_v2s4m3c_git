<%@ page contentType="text/html; charset=UTF-8" %>
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
<jsp:include page="/menu/top.jsp" />

 <ASIDE class="aside_right">
    <c:if test="${adlogin eq true }">
    <A href="create.do">글 등록</A>
    </c:if>

  
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 15%;'/>
      <col style='width: 5%;'/>
      <col style="width: 25%;"/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">뉴스번호</TH>
      <TH class="th_bs">파일</TH>
      <TH class="th_bs">뉴스제목</TH>
      <TH class="th_bs">조회수</TH>
      <TH class="th_bs">관리자</TH>
      <TH class="th_bs">등록일</TH>
      
    </TR>
    </thead>
    
   
    
    </ASIDE>

    <tbody>
    <c:forEach var="jobnws_AdminVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="jobnwsno" value="${jobnws_AdminVO.jobnwsno}" />
      <c:set var="jobnws_file1" value="${jobnws_AdminVO.jobnws_file1 }" />
      <c:set var="jobnws_title" value="${jobnws_AdminVO.jobnws_title}" />
      <c:set var="jobnws_thumb1" value="${jobnws_AdminVO.jobnws_thumb1 }" />
      <c:set var="aid" value="${jobnws_AdminVO.aid }" />
      
      <TR>
        <TD class="td_bs">${jobnwsno }</TD>
        <TD>
               <c:choose>
                <c:when test="${jobnws_thumb1.endsWith('jpg') || jobnws_thumb1.endsWith('png') || jobnws_thumb1.endsWith('gif')}">
                  <IMG src="./storage/main_images/${jobnws_thumb1 }" style="width: 120px; height: 80px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${jobnws_AdminVO.jobnws_file1}
                </c:otherwise>
              </c:choose>
              </TD>
             <TD class="td_bs_left"><A href="./read.do?jobnwsno=${jobnwsno}&jobnws_title=${param.jobnws_title }&nowPage=${nowPage}">${jobnws_AdminVO.jobnws_title }</A></TD>   
          <TD class="td_bs">${jobnws_AdminVO.jobnws_cnt }</TD>
          <TD class="td_bs">${aid}</TD>
        <TD class="td_bs">${jobnws_AdminVO.jobnws_date.substring(0, 10) }</TD>     
      </TR> 
    </c:forEach>
    
    <DIV style="text-align: right;">
    <form name='frm' id='frm' method='get' action='./list.do'>
      <br>
      <c:choose>
        <c:when test="${param.jobnws_title != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='jobnws_title' id='jobnws_title' value='${param.jobnws_title }' 
                     style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='jobnws_title' id='jobnws_title' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.jobnws_title.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?&jobnws_title='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
    
      </tbody>
    </TABLE>
    <DIV class='bottom_menu'>${paging }</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

 
 
 
 
 