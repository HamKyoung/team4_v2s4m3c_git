<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=Edge;">
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
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='title_line'>리뷰 수정</DIV>
  <ASIDE class="aside_left">
    <A href=''>${reviewVO.com_name }</A> > 
    <A href=''>리뷰</A> > 수정
  </ASIDE>
  <ASIDE class="aside_right">
    <A href='./list.do?comno=${reviewVO.comno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='comno' id='comno' value="${reviewVO.comno}">
      <input type='hidden' name='gen_memberno' id='gen_memberno' value="${reviewVO.gen_memberno}">
      <input type='hidden' name='rev_visible' id='rev_visible' value="${reviewVO.rev_visible}">
      <input type='hidden' name='rev_no' id='rev_no' value="${reviewVO.rev_no}">
      
      <div class="form-group">
         <label class="control-label col-md-3">회사명</label>
         <div class="col-md-9">
           <input type='text' name='com_name' readonly="${reviewVO.com_name}"
                      class="form-control" style='width: 50%;'>
         </div>
      </div>
    
      <div class="form-group">
         <label class="control-label col-md-3">리뷰 제목</label>
         <div class="col-md-9">
           <input type='text' minlength= "5" name='rev_title' value="${reviewVO.rev_title}" required="required" autofocus="autofocus"
                      class="form-control" style='width: 50%;'>
         </div>
      </div>
      <div class="form-group">
         <label class="control-label col-md-3">평점</label>
         <div class="col-md-9">
           <input type='range' name='rev_score' id="${reviewVO.rev_score}" required="required" 
                     min="1" max="5" step="1" style='width: 30%;'>
                     <output name="x" for="rev_score"></output>
         </div>
      </div>
      <div class="form-group">
         <label class="control-label col-md-3">담당 직무</label>
         <div class="col-md-9">
           <input type='text' name='rev_depart' value="${reviewVO.rev_depart}" required="required" 
                      class="form-control" style='width: 50%;'>
         </div>
      </div>
      <div class="form-group">
         <label class="control-label col-md-3">본문</label>
         <div class="col-md-9">
           <input type='text' name='rev_content' value="${reviewVO.rev_content}" required="required" 
                      class="form-control" style='width: 50%;'>
         </div>
      </div>   

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?comno=${reviewVO.comno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

