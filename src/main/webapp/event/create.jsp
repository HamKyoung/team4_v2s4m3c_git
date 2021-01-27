<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<script type="text/javascript">
  $(function(){
 
  });
</script>

</head> 

<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">이벤트 작성</DIV>

  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='eve_visible' id='eve_visible' value='Y'> <!-- 기업회원에게 공개여부 결정 -->
            
      <div class="form-group">
        <label class="control-label col-md-3">제목</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='eve_title' required="required" style='width: 50%;'>
        </div>
      </div>   

      <div class="form-group">   
        <label class="control-label col-md-3">내용</label>
        <div class="col-md-9">
          <textarea class="form-control" name='eve_content' id='eve_content' rows='5' style='width: 50%;'></textarea>
        </div>
      </div>
      
      <div class="form-group">   
      <label class="control-label col-md-3">사진</label>
        <div class="col-md-9">
          <input type='file' class="form-control" name='eve_picMF' id='eve_picMF' 
                    value='' placeholder="이미지 선택(필수)" multiple="multiple" style='width: 50%;'>
        </div>
      </div>

           
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-success">등록</button>
        <button type="button" 
                    onclick="location.href='../index.jsp'" 
                    class="btn btn-secondary">취소[홈으로]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
  