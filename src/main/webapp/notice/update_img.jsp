<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    『${noticeVO.notice_name}』 이미지 변경 및 삭제
  </DIV>

  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <H4>이미지 삭제</H4>

    <c:set var="notice_file1" value="${noticeVO.notice_file1 }" />
    <c:if test="${notice_file1.endsWith('jpg') || notice_file1.endsWith('png') || notice_file1.endsWith('gif')}">
      <FORM name='frm' method='POST' action='./img_delete.do' class="form-horizontal">

        <input type='hidden' name='notice_no' id='notice_no' value="${param.notice_no }">

        <IMG src="./storage/main_images/${notice_file1 }" style="width: 50%; margin-bottom: 10px;">
        
        <button type="submit" class="btn btn-info">이미지 삭제</button>
        <button type="button" 
                    onclick="location.href='./read.do?notice_no=${param.notice_no}'" 
                    class="btn btn-info">취소[조회]</button>
      </FORM> 
    </c:if> 
    
    <HR>
    <H4>이미지 변경</H4>
    <%-- 이미지가 존재하는 경우 새로운 이미지 등록 폼 출력 --%>
    <FORM name='frm' method='POST' action='./update_img.do' class="form-horizontal"
                enctype="multipart/form-data">

      <input type='hidden' name='notice_no' id='notice_no' value="${param.notice_no }">
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control" name='notice_file1MF' id='notice_file1MF' 
                    value='' placeholder="파일 선택">
        </div>
      </div>
      <br>
      <button type="submit" class="btn btn-info">이미지 변경</button>
      <button type="button" 
                  onclick="location.href='./read.do?notice_no=${param.notice_no}'" 
                  class="btn btn-info">취소[조회]</button>
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
  