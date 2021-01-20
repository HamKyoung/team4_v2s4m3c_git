<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
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
    비밀 번호 변경
  </DIV>
  
  <ASIDE class="aside_left">
  </ASIDE>
  <ASIDE class="aside_right">
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update_passwd.do' class="form-horizontal">
    <input type='hidden' name='gen_memberno' id='gen_memberno' value='${genVO.gen_memberno }'>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='gen_passwd'  placeholder="현재 비밀 번호" style='width: 20%;'>
        </div>
      </div>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='update_passwd'  placeholder="변경할 비밀 번호" style='width: 20%;'>
        </div>
      </div>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='update_passwd_check'  placeholder="변경할 비밀 번호 확인" style='width: 20%;'>
        </div>
      </div>
        
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">변경</button>
        <button type="button" 
                    onclick="location.href='./index" 
                    class="btn btn-info">취소[홈페이지]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>