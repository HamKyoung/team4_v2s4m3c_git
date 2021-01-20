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

</head>

<body> 
<c:set var="comno" value="${reviewVO.comno}" />
<c:set var="rev_no" value="${reviewVO.rev_no }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    ${reviewVO.com_name }
  </DIV>
  
  <ASIDE class="aside_left">
    ${reviewVO.rev_title } - ${reviewVO.rev_score} 점
  </ASIDE>
  <ASIDE class="aside_right">
    <A href='./list.do?comno=${comno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?comno=${comno }&rev_no=${rev_no}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?comno=${comno }&rev_no=${rev_no}'>삭제</A>    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
    <input type='hidden' name='comno' id='comno' value='1'>
    <input type='hidden' name='gen_memberno' id='gen_memberno' value='1'>
    <input type='hidden' name='rev_visible' id='rev_visible' value='Y'>
      <fieldset class="fieldset_basic">
        <ul>
          <li class="li_none">
            <DIV>${reviewVO.rev_content }</DIV>
          </li>
          <li class="li_none">
            ${reviewVO.rev_date.substring(5,10) }
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html> 
  
 