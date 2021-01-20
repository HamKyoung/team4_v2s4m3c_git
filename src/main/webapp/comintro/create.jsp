<%@ page contentType="text/html; charset=UTF-8" %>
 
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
    회사등록
  </DIV>
  
  <!--  <ASIDE class="aside_left">
    <A href=''>회사</A> > 
    신규 등록
  </ASIDE>-->
  <ASIDE class="aside_right">
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='cor_memberno' id='cor_memberno' value='1'>
      
      <div class="form-group">   
        <div class="col-md-12">
          회사이름 : <input type='text' class="form-control" name='com_name' value='쿠팡' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          기업형태:<input type='text' class="form-control" name='com_form' value='중견기업' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
          업종:<input type='text' class="form-control" name='com_type' value='전자상거래 소매업' placeholder="업종" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          매출액:<input type='text' class="form-control" name='sales'  value='7조 1,407억원' placeholder="매출액" style='width: 90%;'>
        </div>
      </div>
      
        <div class="form-group">   
        <div class="col-md-12">
          홈페이지:<input type='text' class="form-control" name='homepage'  value='naver.com' placeholder="홈페이지" style='width: 90%;'>
        </div>
      </div>
      
        <div class="form-group">   
        <div class="col-md-12">
          회원주소:<input type='text' class="form-control" name='address'  value='서울특별시' placeholder="회사주소" style='width: 90%;'>
        </div>
      </div>
      
        <div class="form-group">   
        <div class="col-md-12">
          사원수:<input type='text' class="form-control" name='num_people'  value='50명' placeholder="사원수" style='width: 90%;'>
        </div>
      </div>
      
        <div class="form-group">   
        <div class="col-md-12">
          설립일:<input type='text' class="form-control" name='edate'  value='2020-01-01' placeholder="설립일" style='width: 90%;'>
        </div>
      </div>
      
        <div class="form-group">   
        <div class="col-md-12">
          대표자명:<input type='text' class="form-control" name='ceo_name'  value='홍길동' placeholder="대표자명" style='width: 90%;'>
        </div>
      </div>
      

<!--  
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='passwd'  value='1234' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>
      -->
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list_all.do?categrpno=${param.categrpno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
  