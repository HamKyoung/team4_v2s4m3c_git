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
    기업 회원 수정
  </DIV>
  
  <ASIDE class="aside_left">
  </ASIDE>
  <ASIDE class="aside_right">
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
    <input type='hidden' name='cor_memberno' id='cor_memberno' value='${corVO.cor_memberno }'>
    

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='cor_name' value=${corVO.cor_name } placeholder="이름" style='width: 15%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='cor_resident' value=${corVO.cor_resident } placeholder="생년 월일" style='width: 15%;'>
        </div>
      </div>    
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='cor_sex'  value=${corVO.cor_sex } placeholder="성별" style='width: 5%;'>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='cor_phone'  value=${corVO.cor_phone } placeholder="전화 번호" style='width: 15%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='cor_addr' value=${corVO.cor_addr } placeholder="주소" style='width: 50%;'>
        </div>
      </div> 
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='cor_mail' value=${corVO.cor_mail } placeholder="이메일 주소" style='width: 40%;'>
        </div>
      </div> 
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='cor_passwd'  placeholder="비밀 번호" style='width: 20%;'>
        </div>
      </div>
        
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./index" 
                    class="btn btn-info">취소[홈페이지]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>