<%@ page contentType="text/html; charset=UTF-8" %>
 
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
  <DIV class='title_line'>
      ${jobnwsVO.jobnws_title }
  </DIV>

  <ASIDE class="aside_left">
    <A href=''>채용뉴스</A> > 수정
  </ASIDE>
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      
      <input type='hidden' name='jobnwsno' id='jobnwsno' value='${jobnwsVO.jobnwsno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='jobnws_title' value="${jobnwsVO.jobnws_title }" 
                    placeholder="뉴스 제목" required="required" style='width: 80%;' autofocus="autofocus">
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='jobnws_content' id='jobnws_content' rows='10' placeholder="뉴스 내용">${jobnwsVO.jobnws_content }</textarea>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
        뉴스 출처
          <input type='text' class="form-control" name='jobnws_url' value='http://www.kma.go.kr' placeholder="인터넷 주소" style='width: 80%;'>
        </div>
      </div>
      
        <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='jobnws_passwd'  value='1234' placeholder="비밀번호" style='width: 20%;'>
        </div>
        </div>         
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?jobnwsno=${param.jobnwsno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>