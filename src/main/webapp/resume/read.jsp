<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 글 + 이미지 조회하는 경우 참고  --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge;">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>JOB</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
<c:set var="res_no" value="${resumeVO.res_no}" />
<c:set var="gen_memberno" value="${resumeVO.gen_memberno}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    ${param.res_no}
  </DIV>
  <ASIDE class="aside_left">
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">글 등록</A>
    <c:choose>
      <c:when test="${resumeVO.res_pic.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?res_no=${res_no }'>이미지 변경/삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./img_create.do?res_no=${res_no }'>이미지 등록</A>     
      </c:otherwise>
    </c:choose>    
    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list_all.do'>목록</A>
    
    <span class='menu_divide' > | </span> 
    <A href='./update_visible.do?res_no=${res_no }&gen_memberno=${gen_memberno}&res_visible=${res_visible}'>수정</A>
    
    <span class='menu_divide' > | </span> 
    <A href='./update.do?res_no=${res_no }&gen_memberno=${gen_memberno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?res_no=${res_no }&gen_memberno=${gen_memberno}'>삭제</A>
  </ASIDE>
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="res_no" value="${res_no}">
      
      <fieldset class="fieldset_basic">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${resumeVO.res_title }</span>
            <span>${resumeVO.res_date.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <c:set var="res_pic" value="${resumeVO.res_pic }" />
            <c:if test="${res_pic.endsWith('jpg') || res_pic.endsWith('png') }">
              <DIV style="width: 50%;  margin-right: 10px;">
                <IMG src="./storage/main_images/${res_pic }" style="width: 200px;">
              </DIV> 
            </c:if>
            <DIV> 이름 ${resumeVO.gen_name}</DIV>
          </li>
          <li class="li_none"> 연락처
            ${resumeVO.res_phone }
          </li>
          <li class="li_none"> 메일
            ${resumeVO.res_mail1 }@${resumeVO.res_mail2} 
          </li>
          <li class="li_none"> 자기소개
            ${resumeVO.res_intro }
          </li>
          <li class="li_none"> 경력기술서
            ${resumeVO.res_work }
          </li>
          <li class="li_none"> 최종학력
            ${resumeVO.res_scname }
          </li>
          <li class="li_none"> 전공
            ${resumeVO.res_major1 }
          </li>
          <li class="li_none"> 부/복수 전공
            ${resumeVO.res_major2 }
          </li>
          <li class="li_none"> 입학일자
            ${resumeVO.res_gotin }
          </li>
          <li class="li_none"> 졸업일자
            ${resumeVO.res_grad }
          </li>
          <li class="li_none"> 자격증
            ${resumeVO.res_lice1 }
          </li>
          <li class="li_none"> 자격증 상세
            ${resumeVO.res_lice1_lev }
          </li>
          <li class="li_none"> 자격증2
            ${resumeVO.res_lice2 }
          </li>
          <li class="li_none"> 자격증2 상세
            ${resumeVO.res_lice2_lev }
          </li>
          <li class="li_none">링크
            ${resumeVO.res_web }
          </li>
          
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
 