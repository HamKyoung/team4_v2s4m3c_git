<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
 
  <DIV class='title_line'>공지사항
  <ASIDE class="aside_right">
    <A href="./create.do" title="등록">등록</A>
  </ASIDE>
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <br>
      <c:choose>
        <c:when test="${param.notice_word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='notice_word' id='notice_word' value='${param.notice_word }' 
                     style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='notice_word' id='notice_word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.notice_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?&notice_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 55%;'/>
    <col style='width: 13%;'/>
    <col style='width: 7%;'/>    
    <col style='width: 15%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs"></TH>
    <TH class="th_bs">제목</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">출력</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="noticeVO" items="${list}">
    <c:set var="notice_seqno" value="${noticeVO.notice_seqno }" />
    <TR>
      <TD class="td_bs">[공지]</TD>
      <TD><a href="./read.do?notice_no=${noticeVO.notice_no}">${noticeVO.notice_name}</a></TD> 

      <TD class="td_bs">${noticeVO.notice_date.substring(0, 10) }</TD>
      <TD class="td_bs">
        <c:choose>
          <c:when test="${noticeVO.notice_visible == 'Y'}">
            <A href="./update_visible.do?notice_no=${noticeVO.notice_no }&notice_visible=${noticeVO.notice_visible }"><IMG src="./images/open.png"></A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?notice_no=${noticeVO.notice_no }&notice_visible=${noticeVO.notice_visible }"><IMG src="./images/close.png"></A>
           </c:otherwise>
         </c:choose>
        </TD>
      <TD class="td_bs">
        <A href="./read_update.do?notice_no=${noticeVO.notice_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?notice_no=${noticeVO.notice_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./update_seqno_up.do?notice_no=${noticeVO.notice_no }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./update_seqno_down.do?notice_no=${noticeVO.notice_no }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>       
      </TD>   
    </TR>   
  </c:forEach> 
  </tbody>
</TABLE>
<DIV class='bottom_menu'>${paging }</DIV>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 