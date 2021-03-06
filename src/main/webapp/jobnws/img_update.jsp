<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>채용뉴스</title>
 
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
    『${jobnwsVO.jobnws_title}』 메인 이미지 변경 및 삭제
  </DIV>
  
  <ASIDE class="aside_left">
    채용뉴스 > 이미지 변경 및 삭제
  </ASIDE>
  <ASIDE class="aside_right">
    <A href='./list.do'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <H4>메인 이미지 삭제</H4>

    <%-- 이미지가 존재하는 경우 이미지를 출력하고 삭제 버튼 표시 --%>
    <c:set var="jobnws_file1" value="${jobnwsVO.jobnws_file1 }" />
    <c:if test="${jobnws_file1.endsWith('jpg') || jobnws_file1.endsWith('png') || jobnws_file1.endsWith('gif')}">
      <FORM name='frm' method='POST' action='./img_delete.do' class="form-horizontal">
      
        <input type='hidden' name='jobnwsno' id='jobnwsno' value="${param.jobnwsno }">

        <IMG src="./storage/main_images/${jobnws_file1 }" style="width: 50%; margin-bottom: 10px;">
        
        <div class="form-group">   
          <div class="col-md-12">
            <input type='password' class="form-control" name='jobnws_passwd'  value='1234' placeholder="패스워드" style='width: 20%;'>
          </div>
        </div>
        
        <button type="submit" class="btn btn-info">메인 이미지 삭제</button>
        <button type="button" 
                    onclick="location.href='./read.do?jobnwsno=${param.jobnwsno}'" 
                    class="btn btn-info">취소[조회]</button>
      </FORM> 
    </c:if> 
    
    <HR>
    <H4>새로운 메인 이미지 등록</H4>
    <%-- 이미지가 존재하는 경우 새로운 이미지 등록 폼 출력 --%>
    <FORM name='frm' method='POST' action='./img_update.do' class="form-horizontal"
                enctype="multipart/form-data">
               
      
      <input type='hidden' name='jobnwsno' id='jobnwsno' value="${param.jobnwsno }">
      
      <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF --%>
          <input type='file' class="form-control" name='jobnws_file1MF' id='jobnws_file1MF' 
                    value='' placeholder="파일 선택">
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='jobnws_passwd'  value='1234' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>
      
      <button type="submit" class="btn btn-info">새로운 메인 이미지 등록</button>
      <button type="button" 
                  onclick="location.href='./read.do?jobnwsno=${param.jobnwsno}'" 
                  class="btn btn-info">취소[조회]</button>
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>