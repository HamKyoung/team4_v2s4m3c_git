<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
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
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>『${resumeVO.res_no}』 삭제</DIV>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">삭제한 이력서는 복구 할 수 없습니다.</div>
      <FORM name='frm' method="get" action='./update.do'>
          <input type="hidden" name="res_no" id="res_no" value="${resumeVO.res_no}">
    
          <button type="submit" id='submit'>삭제</button>
          <button type="button" onclick="location.href='./list.do'">취소</button>
    
          <fieldset class="fieldset_basic">
            <ul>
              <li class="li_none">
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
                ${resumeVO.res_mail}
              </li>
              <li class="li_none"> 자기소개
                ${resumeVO.res_intro }
              </li>
              <li class="li_none"> 경력기술서
                ${resumeVO.res_work }
              </li>
              <li class="li_none"> 최종학력
                ${resumeVO.res_school }
              </li>
              <li class="li_none"> 전공
                ${resumeVO.res_major }
              </li>
              <li class="li_none"> 자격증
                ${resumeVO.res_lice }
              </li>
              <li class="li_none"> 자격증 급수
                ${resumeVO.res_lice_lev }
              </li>
              <li class="li_none">포트폴리오
                ${resumeVO.res_web }
              </li>          
            </ul>
          </fieldset>
      </FORM>
  </DIV>
   

 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 