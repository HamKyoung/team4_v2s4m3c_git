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

<script type="text/javascript">
 
  
</script>

</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">전체 이벤트</DIV>
  
  <ASIDE class="aside_right">
    <c:if test="${sessionScope.id != null }">
      <A href="./create.do">등록</A>
    </c:if>
  </ASIDE> 
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <br>
      <c:choose>
        <c:when test="${param.eve_content != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='eve_content' id='eve_content' value='${param.eve_content }' 
                     style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='eve_content' id='eve_content' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.eve_content.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?&eve_content='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  
  
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 40%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
      </colgroup>

      <thead>
        <tr>
          <th style='text-align: center;'>번호</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>사진</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>수정<th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="eventVO" items="${list }">
          <c:set var="eventno" value="${eventVO.eventno }" />
          <c:set var="eve_thumb" value="${eventVO.eve_thumb }" />
          
          <tr> 
          <td style='text-align: center; vertical-align: middle;'>${eventno}</td>
          <td style='text-align: center; vertical-align: middle;'><a href="./read.do?eventno=${eventno}">${eventVO.eve_title}</a></td>
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${eve_thumb.endsWith('jpg') || eve_thumb.endsWith('png') || eve_thumb.endsWith('gif')}">
                  <a href="./read.do?eventno=${eventno}"><IMG src="./storage/main_images/${eve_thumb }" style="width:80px; height:120px;"></a>
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${eventVO.eve_pic}
                </c:otherwise>
              </c:choose>
            </td>
            <td style='text-align: center; vertical-align: middle;'>${eventVO.eve_date.substring(0,10) }</td>
            <TD class="td_bs">
              <A href="./read_update.do?eventno=${eventno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
              <A href="./read_delete.do?eventno=${eventno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>

              <c:choose>
                <c:when test="${eventVO.eve_visible == 'Y'}">
                  <A href="./update_visible.do?eventno=${eventno }&eve_visible=${eventVO.eve_visible }">${eventVO.eve_visible }</A>
                </c:when>
                <c:otherwise>
                  <A href="./update_visible.do?eventno=${eventno }&eve_visible=${eventVO.eve_visible }">${eventVO.eve_visible }</A>
                </c:otherwise>
              </c:choose>
            </TD>   
            
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <DIV class='bottom_menu'>${paging }</DIV>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


