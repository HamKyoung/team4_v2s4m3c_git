<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge;">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<meta name="keywords" content="기업 뉴스, 채용공고, 회사 리뷰, 대기업 채용, 중견기업 채용, 중소기업 채용, 취업사이트, 상반기채용, 하반기채용, 합격자소서, 면접예상질문, 취업준비생, 공채, 구인구직사이트" />
<title>JOB</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    등록된 모든 이력서
  </DIV>
  <ASIDE class="aside_left">
    전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>    
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>

      <thead>
        <tr>
          <th style='text-align: center;'>등록번호</th>
          <th style='text-align: center;'>사진(나중엔 지울것)</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>메일</th>
          <th style='text-align: center;'>공개여부<th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="resumeVO" items="${list }">
          <c:set var="res_no" value="${resumeVO.res_no }" />
          <c:set var="res_thumb" value="${resumeVO.res_thumb }" />
          
          <tr> 
          <td style='text-align: center; vertical-align: middle;'>${res_no}</td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${res_thumb.endsWith('jpg') || res_thumb.endsWith('png') || res_thumb.endsWith('gif')}">
                  <IMG src="./storage/main_images/${res_thumb }" style="width:80px; height:120px;">
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${resumeVO.res_pic}
                </c:otherwise>
              </c:choose>
            </td>
            <td style='vertical-align: middle;'>
              <a href="./read.do?res_no=${res_no}">${resumeVO.res_title}</a> 
            </td> 
            <td style='text-align: center; vertical-align: middle;'>${resumeVO.res_mail1}@${resumeVO.res_mail2}</td>
            
            <TD class="td_bs">
              <c:choose>
                <c:when test="${resumeVO.res_visible == 'Y'}">
                  <A href="./update_visible.do?res_no=${res_no }&res_visible=${resumeVO.res_visible }"><IMG src="./images/open.png" style='width: 18px;'></A>
                </c:when>
                <c:otherwise>
                  <A href="./update_visible.do?res_no=${res_no }&res_visible=${resumeVO.res_visible }"><IMG src="./images/close.png" style='width: 18px;'></A>
                </c:otherwise>
              </c:choose>
            </TD>   
            
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


