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
<script type="text/javascript">
  $(function(){
    
  });

</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>리뷰 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
<input type='hidden' name='comno' id='comno' value='1'>
<input type='hidden' name='gen_memberno' id='gen_memberno' value='1'>
<input type='hidden' name='rev_visible' id='rev_visible' value='Y'>

  <div class="form-group">
     <label class="control-label col-md-3">회사명</label>
     <div class="col-md-9">
       <input type='text' name='com_name' value='회사명' required="required" autofocus="autofocus"
                  class="form-control" style='width: 50%;'>
     </div>
  </div>

  <div class="form-group">
     <label class="control-label col-md-3">리뷰 제목</label>
     <div class="col-md-9">
       <input type='text' name='rev_title' value='제목' required="required"
                  class="form-control" style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">평점</label>
     <div class="col-md-9">
       <input type='range' name='rev_score' id='rev_score' required="required" min="0" max="5" step="1" style='width: 30%;'>
                 <output name="rev_score" for="rev_score"></output>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">담당 직무</label>
     <div class="col-md-9">
       <input type='text' name='rev_depart' value='담당 직무' required="required" 
                  class="form-control" style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">본문</label>
     <div class="col-md-9">
       <textarea rows="5" name='rev_content' value='본문' required="required" 
                  class="form-control" style='width: 50%;'></textarea>
     </div>
  </div>
  
  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-light">목록</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

