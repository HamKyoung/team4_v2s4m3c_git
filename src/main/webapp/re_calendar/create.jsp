<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team4</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  // window.onload=function(){
  //  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  // };

  $(function() {
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  });
 
</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='title_line'>회사 구인 등록</DIV>
  
  <ASIDE class="aside_left">
    <A href=''>회사</A> > 
    <A href=''>직무별</A> >
    구인 등록
  </ASIDE>
  <ASIDE class="aside_right"> 
    <A href='./list_all.do'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
                enctype="multipart/form-data">

      <!-- FK 지정 -->
      <input type='hidden' name='RECRUITNO' id='RECRUITNO' value="${param.recruitno }">
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='c_title' value='a' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='c_rdate' id='c_rdate' rows='1' placeholder="시작일">${c_rdate }</textarea>
          <textarea class="form-control" name='c_edate' id='c_edate' rows='1' placeholder="마감일">${c_edate }</textarea>
        </div>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?cateno=${param.cateno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
  