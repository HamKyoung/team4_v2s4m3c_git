<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team4</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    ${comcateVO.cate_name}
  </DIV>
  <ASIDE class="aside_left">
    <A href="../recruit/list.do">회사</A>
    <A href="../comcate/list.do?comno=${comintroVO.comno }">${comintroVO.com_name }</A>  ${comcateVO.cate_name} > 전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <c:if test="${corlogin eq true }">
      <A href="./create.do?cateno=${comcateVO.cateno }">등록</A>
      <span class='menu_divide' >│</span>
    </c:if>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='cateno' value='${comcateVO.cateno }'>
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
                     onclick="location.href='./list.do?cateno=${comcateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV> 
    
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 40%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>순서</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>회사명</th>
          <!-- <th style='text-align: center;'>회원</th> -->
          <th style='text-align: center;'>등록일</th>
          <!-- <th style='text-align: center;'>IP</th> -->
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="recruitVO" items="${list }">
          <c:set var="recruitno" value="${recruitVO.recruitno }" />
          
          <tr> 
            <td class="td_bs">${recruitVO.recruitno }</td> 
            <td>
              <a href="./read.do?recruitno=${recruitno}">${recruitVO.title}</a> 
            </td> 
            <td class="td_bs">${comintroVO.com_name }</td> 
            <td style='text-align: center;'>${recruitVO.rdate.substring(0, 10)}</td>
            

<%--             <td style='text-align: center;'>${recruitVO.memberno}</td>
            <td style='text-align: center;'>${recruitVO.ip}</td> --%>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <DIV class='bottom_menu'>${paging }</DIV>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


