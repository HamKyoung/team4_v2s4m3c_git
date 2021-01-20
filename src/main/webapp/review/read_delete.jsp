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
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'><a href="./review/list.do"> 리뷰 목록></a>
     > ${reviewVO.rev_title } 삭제
  </DIV>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">리뷰를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
    <input type='hidden' name='rev_no' id='rev_no' value="${reviewVO.rev_no }">
    <input type='hidden' name='comno' id='comno' value="${reviewVO.comno }">
    <input type='hidden' name='gen_memberno' id='gen_memberno' value="${reviewVO.gen_memberno }">
    <input type='hidden' name='rev_visible' id='rev_visible' value="${reviewVO.rev_visible }">
      
      <label>회사명</label>: ${reviewVO.com_name } &nbsp;
      <label>리뷰 제목</label>: ${reviewVO.rev_title} &nbsp;
      <label>평점</label>: ${reviewVO.rev_score} &nbsp;
      <label>담당 직무</label>: ${reviewVO.rev_depart} &nbsp;
      <label>본문</label>: ${reviewVO.rev_content} &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./read.do?rev_no=${param.rev_no}'">취소</button>
    </FORM>
  </DIV>
  

 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 