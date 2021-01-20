<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
 
<DIV class='title_line'>답변 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">

      <input type='hidden' name='ques_no' id='ques_no' value="${param.ques_no }">
      
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input type='text' class="form-control" name='ans_title' value='답변 제목' placeholder="제목" required="required" style='width: 90%;'>
        </li>
        <li class="li_none">
          <label>내용: </label>
          <textarea class="form-control" name='ans_con' id='ans_con' rows='10' placeholder="내용" style='width: 90%;'>오늘은 월요일 입니다.</textarea>
        </li>
        <li class="li_none">
          <label>질문테이블 PK</label>
          <input type='text' class="form-control" name='ques_no' value='${param.ques_no }' required="required" style='width: 10%;'>
        </li>

      </ul> 
  <div class="form-group">
  </div>   

  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" onclick="location.href='../answer/list.do?ques_no'" class="btn btn-primary">취소</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

