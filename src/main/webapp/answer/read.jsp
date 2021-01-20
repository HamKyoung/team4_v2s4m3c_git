<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
<c:set var="ans_no" value="${ansVO.ans_no}" />

<jsp:include page="/menu/top.jsp" flush='false' />


  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="ans_no" value="${ans_no}">
      <fieldset>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
               <ASIDE class="aside_right">
                <span class='menu_divide' >|</span>
                <A href="javascript:location.reload();">새로고침</A>
                <span class='menu_divide' >|</span>
                <A href='./list.do?ans_no=${ans_no }'>목록</A>
                <span class='menu_divide' >|</span>
                <A href='./read_update.do?ans_no=${ans_no }'>수정</A>
                <span class='menu_divide' >|</span>
                <A href='./read_delete.do?ans_no=${ans_no }'>삭제</A>
              </ASIDE> 
            </li>
        <ul>
        <br>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span style='font-size: 25px'>${ansVO.ans_title}</span><br>
            <span class='aside_right'>${ansVO.ans_date.substring(0, 16)} ${ansVO.ans_views} </span>

          </li>
          
          <li class="li_none">
            <DIV>${ansVO.ans_con }</DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>