<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>JOB</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
<c:set var="res_no" value="${resumeVO.res_no}" />
<c:set var="gen_memberno" value="${resumeVO.gen_memberno}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
   『${res_no}』  수정
  </DIV>
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal" enctype="multipart/form-data">               
            <input type="hidden" name="res_visible" value="${resumeVO.res_visible }">
            <input type="hidden" name="gen_memberno" value="${gen_memberno }">
            <input type="hidden" name="res_no" value="${res_no }">
            
      <div class="form-group">
        <label class="control-label col-md-3">이름</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='gen_name' value='${resumeVO.gen_name }' placeholder="이름" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <label class="control-label col-md-3">연락처</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_phone' value="${resumeVO.res_phone }" placeholder="'-' 제외하고 입력" required="required" style='width: 50%;'>  예) 01012345678
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-md-3">메일</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_mail' value="${resumeVO.res_mail }"  required="required" style='width: 50%;'>
        </div>
      </div>

      <div class="form-group">   
      <label class="control-label col-md-3">사진</label>
        <div class="col-md-9">
          <%-- 실제 컬럼명: res_pic, Spring File 객체 대응: fiel1MF --%>
          <input type='file' class="form-control" name='res_picMF' id='res_picMF' 
                    value='${resumeVO.res_picMF }' placeholder="이미지 선택(선택사항)" multiple="multiple" style='width: 50%;'>
        </div>
      </div>

      <div class="form-group">   
        <label class="control-label col-md-3">자기소개</label>
        <div class="col-md-9">
          <textarea class="form-control" name='res_intro' id='res_intro' rows='5' placeholder="자기소개" maxlength="150" style='width: 50%;'>${resumeVO.res_intro }</textarea>
        </div>
      </div>
      
      <div class="form-group">
        <label class="control-label col-md-3">최종학력 학교명</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_school' value='${resumeVO.res_school }'  placeholder="최종학력" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <label class="control-label col-md-3">전공</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_major' value='${resumeVO.res_major }'  placeholder="전공" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <label class="control-label col-md-3">경력기술서</label>
        <div class="col-md-9">
          <textarea rows="10" class="form-control" name='res_work' required="required" style='width: 50%;'>${resumeVO.res_work }</textarea>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-md-3">자격증</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_lice' value='${resumeVO.res_lice }' placeholder="자격증 명칭" style='width: 50%;'>
        </div>
      </div>   

      <div class="form-group">
        <label class="control-label col-md-3">급수</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_lice_lev' value='${resumeVO.res_lice_lev }'  placeholder="자격증 급수 예시) TOEIC의 경우, 점수 입력" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
      <label class="control-label col-md-3">링크</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_web' value='${resumeVO.res_web }' placeholder="인터넷 주소" style='width: 50%;'>
        </div>
      </div>   

      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?res_no=${param.res_no}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
      
  </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>