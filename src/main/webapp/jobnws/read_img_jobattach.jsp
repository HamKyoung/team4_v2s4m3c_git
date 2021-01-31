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

// 첨부 이미지 출력, dir: ../attachfile/storage/, ./storage/main_images/
function panel_img(dir, file) {
  var tag = "";
  tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">"; // 이미지 감추기
  tag += "  <IMG src='" + dir + file + "' style='width: 100%;'>";
  tag += "</A>";

  $('#jobattach_panel').html(tag);  // 문자열을 태그로 적용
  $('#jobattach_panel').show();      // 패널 출력
}

</script>

</head>

<body>
<c:set var="jobnwsno" value="${jobnwsVO.jobnwsno}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${jobnwsVO.jobnws_title }
  </DIV>
  
  <ASIDE class="aside_right">
  <c:if test="${adlogin eq true }">
    <A href="create.do">뉴스 등록</A>
        <c:choose>
      <c:when test="${jobnwsVO.jobnws_file1.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?jobnwsno=${jobnwsno }'>메인 이미지 변경/삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./img_create.do?jobnwsno=${jobnwsno }'>메인 이미지 등록</A>     
      </c:otherwise>
    </c:choose>
    <span class='menu_divide' > | </span>
    <A href='../jobattach/create.do?jobnwsno=${jobnwsno }'>첨부 파일 등록</A>
    <span class='menu_divide' > | </span>
    <A href='../jobattach/list_by_jobnwsno.do?jobnwsno=${jobnwsno }'>첨부 파일 삭제</A>
        
    <span class='menu_divide' > | </span> 
    <A href='./update.do?jobnwsno=${jobnwsno }&jobnwsno=${jobnwsno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?jobnwsno=${jobnwsno }&jobnwsno=${jobnwsno}'>삭제</A>
    </c:if>
    
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?jobnwsno=${jobnwsno }'>목록</A>

  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="jobnwsno" value="${jobnwsno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${jobnwsVO.jobnws_title}</span>
            <span>${jobnwsVO.jobnws_date.substring(0, 16)}</span>
          </li>
          
          <%-- ********** 첨부 파일 이미지 목록 출력 시작 ********** --%>
          <li class="li_none">
            <DIV id='jobattach_panel' style="width: 70%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          
           <li class="li_none" style='text-align: center;' >
            <c:set var="jobnws_file1" value="${jobnwsVO.jobnws_file1.toLowerCase() }" />
            <c:if test="${jobnws_file1.endsWith('jpg') || jobnws_file1.endsWith('png') || jobnws_file1.endsWith('gif')}">
              <A href="javascript:panel_img('./storage/main_images/', '${jobnwsVO.jobnws_file1 }')">
              <IMG src='./storage/main_images/${jobnwsVO.jobnws_thumb1 }' style='margin-top: 2px; width: 120px; height: 80px;'></A>
            </c:if>

            <c:forEach var="jobattachVO" items="${jobattach_list }">
               <c:set var="jobattach_thumb" value="${jobattachVO.jobattach_thumb.toLowerCase() }" />  
              <c:choose>
                <c:when test="${jobattach_thumb.endsWith('jpg') || jobattach_thumb.endsWith('png') || jobattach_thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('../jobattach/storage/', '${jobattachVO.jobattach_fname }')"><IMG src='../jobattach/storage/${jobattachVO.jobattach_thumb }' style='margin-top: 2px; width: 120px; height: 80px;'></A>
                </c:when>
              </c:choose>            
            </c:forEach>
          </li>
              <%-- ********** 첨부 파일 이미지 목록 출력 종료 ********** --%>          
             
          <li class="li_none">
             <DIV>${jobnwsVO.jobnws_content }</DIV>
          </li>
          
           <li class="li_none">
            ${jobnwsVO.jobnws_url }
          </li>
          <li class="li_none">
           조회수: ${jobnwsVO.jobnws_cnt }  추천수: <img src='./images/good01.png' 
               style='width: 50px; margin-left: 20px;' title="추천">${jobnwsVO.jobnws_good }
           
          </li>

        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>