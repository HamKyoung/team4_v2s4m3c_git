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
<script type="text/javascript">
  // 첨부 이미지 출력, dir: ../attachfile/storage/, ./storage/main_images/
  function panel_img(dir, file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">"; // 이미지 감추기
    tag += "  <IMG src='" + dir + file + "' style='width: 100%;'>";
    tag += "</A>";

    $('#attachfile_panel').html(tag);  // 문자열을 태그로 적용
    $('#attachfile_panel').show();      // 패널 출력
  }
</script> 


</head>

<body>
<c:set var="pass_self_no" value="${pass_selfVO.pass_self_no}" />

<jsp:include page="/menu/top.jsp" flush='false' />


  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="pass_self_no" id="pass_self_no" value="${pass_self_no}">
      <fieldset>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
               <ASIDE class="aside_right">
                <A href="javascript:location.reload();">새로고침</A>
                <span class='menu_divide' > | </span>
                <A href='../ps_attachfile/create.do?pass_self_no=${pass_self_no }'>첨부 파일 등록</A>
                <span class='menu_divide' > | </span>
                <A href='../ps_attachfile/list_by_pass_self_no.do?pass_self_no=${pass_self_no }'>첨부 파일 삭제</A>
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
          
          <%-- ********** 첨부 파일 이미지 목록 출력 시작 ********** --%>
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 70%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;' >
            
            <c:forEach var="ps_attachfileVO" items="${attachfile_list }">
              <c:set var="ps_thumb" value="${ps_attachfileVO.ps_thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${ps_thumb.endsWith('jpg') || ps_thumb.endsWith('png') || ps_thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('../ps_attachfile/storage/', '${ps_attachfileVO.ps_fname }')"><IMG src='../ps_attachfile/storage/${ps_attachfileVO.ps_thumb }' style='margin-top: 2px; width: 120px; height: 80px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          <%-- ********** 첨부 파일 이미지 목록 출력 종료 ********** --%>
          
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