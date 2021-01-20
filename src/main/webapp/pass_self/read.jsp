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
<c:set var="pass_self_no" value="${pass_selfVO.pass_self_no}" />

<jsp:include page="/menu/top.jsp" flush='false' />


  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="pass_self_no" value="${pass_self_no}">
      <fieldset>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
               <ASIDE class="aside_right">
                <A href="javascript:location.reload();">새로고침</A>
                <span class='menu_divide' >|</span>
                <A href='./list.do?pass_self_no=${pass_self_no }'>목록</A>
                <span class='menu_divide' >|</span>
                <A href='./read_update.do?pass_self_no=${pass_self_no }'>수정</A>
                <span class='menu_divide' >|</span>
                <A href='./read_delete.do?pass_self_no=${pass_self_no }'>삭제</A>
              </ASIDE> 
            </li>
        <ul>
        <br>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span style='font-size: 25px'>${pass_selfVO.pass_self_title}</span><br>
            <span class='aside_right'>${pass_selfVO.pass_self_date.substring(0, 16)} ${pass_selfVO.pass_self_views} </span>

          </li>
          
          <li class="li_none">
            <span style='font-size: 20px'>${pass_selfVO.pass_self_item1 }</span>
            <DIV>${pass_selfVO.pass_self_ans1 }</DIV><br><br>
            <span style='font-size: 20px'>${pass_selfVO.pass_self_item2 }</span>
            <DIV>${pass_selfVO.pass_self_ans2 }</DIV><br><br>
            <span style='font-size: 20px'>${pass_selfVO.pass_self_item3 }</span>
            <DIV>${pass_selfVO.pass_self_ans3 }</DIV><br><br>
            <span style='font-size: 20px'>${pass_selfVO.pass_self_item4 }</span>
            <DIV>${pass_selfVO.pass_self_ans4 }</DIV><br><br>
            <span style='font-size: 20px'>${pass_selfVO.pass_self_item5 }</span>
            <DIV>${pass_selfVO.pass_self_ans5 }</DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>