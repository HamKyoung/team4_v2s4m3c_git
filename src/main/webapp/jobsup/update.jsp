<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>구직신청</title>
 
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
      구직신청
  </DIV>

  <ASIDE class="aside_left">
    <A href=''>구직신청</A> > 수정
  </ASIDE>
  
    <ASIDE class="aside_right">
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
        
       <input type='hidden' name='jobsupno' id='jobsupno' value="${param.jobsupno }">
        
       채용번호:       
      <!-- FK recruitno 지정 -->
      <input type="text" name='recruitno' id='recruitno' value='1'><br><br>
      
       회원번호:
      <!-- FK gen_memberno 지정 -->
      <%-- <input type='hidden' name='gen_memberno' id='gen_memberno' value="${sessionScope.gen_memberno}"> --%>
       <input type='text' name='gen_memberno' id='gen_memberno' value="1"><br><br>
       
       이력서번호:
      <!-- FK res_no 지정 -->
      <input type="text" name='res_no' id='res_no' value='1'><br><br>
               
      
      
      <div class="form-group">   
        <div class="col-md-12">
        지원 제목:
          <input type='text' class="form-control" name='jobsup_title' value="${jobsupVO.jobsup_title }" 
                    placeholder="지원 제목" required="required" style='width: 80%;' autofocus="autofocus">
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
        지원 메세지:
          <textarea class="form-control" name='jobsup_msg' id='jobsup_msg' rows='10' placeholder="지원 메세지">${jobsupVO.jobsup_msg }</textarea>
        </div>
      </div>

      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?jobsupno=${param.jobsupno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>