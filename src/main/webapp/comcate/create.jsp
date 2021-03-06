<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team4</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
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
 
<DIV class='title_line'>회사 직무 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
  <input type="hidden" name="comno" value="1">
  
    <div class="form-group">
     <label class="control-label col-md-3">회사 번호</label>
     <div class="col-md-9">
       <input type='text' name='comno' value='' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  
  <div class="form-group">
     <label class="control-label col-md-3">직무 이름</label>
     <div class="col-md-9">
       <input type='text' name='cate_name' value='${comintroVO.comno}' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">출력 순서</label>
     <div class="col-md-9">
       <input type='number' name='cate_seqno' value='1' required="required" 
                 placeholder="" min="1" max="1000" step="1" 
                 style='width: 30%;' class="form-control" >
     </div>
  </div>  
  <div class="form-group">
     <label class="control-label col-md-3">출력 형식</label>
     <div class="col-md-9">
        <select name='cate_visible' class="form-control" style='width: 20%;'>
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
     </div>
  </div>   

  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

