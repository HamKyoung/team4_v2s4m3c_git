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

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="./css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
  $(function() { 
    send();
  });

  // jQuery ajax 요청
  function send() {
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // alert('params: ' + params);
    // return;
    $.ajax({
      url: './noticeajax.jsp',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        
        var str = '';
        str += rdata.qna;  

        var str2 = '';
        str2 += rdata.qna2;
        
        $('#panel').css('text-align', 'left');
        $('#panel').html(str);  // 보통 DIV, SPAN등에 출력, input 태그는 $('#rname').val(rdata);
        //$('#panel').html(str2);  // 보통 DIV, SPAN등에 출력, input 태그는 $('#rname').val(rdata);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    $('#panel').css('text-align', 'center');
    $('#panel').html("궁금한것이 있으신가요?");
    $('#panel').show(); // 숨겨진 태그의 출력
  }
  
  // jQuery ajax 요청

  
</script>

</head>

<body>
<c:set var="notice_no" value="${noticeVO.notice_no}" />

<jsp:include page="/menu/top.jsp" flush='false' />


  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="notice_no" value="${notice_no}">
      <fieldset>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
               <ASIDE class="aside_right">
                <c:choose>
                  <c:when test="${noticeVO.notice_file1.trim().length() > 0 }">
                    <A href='./update_img.do?notice_no=${notice_no }'>이미지 변경/삭제</A>     
                  </c:when>
                </c:choose>    
                <span class='menu_divide' >|</span>
                <A href="javascript:location.reload();">새로고침</A>
                <span class='menu_divide' >|</span>
                <A href='./list.do?notice_no=${notice_no }'>목록</A>
                <span class='menu_divide' >|</span>
                <A href='./read_update.do?notice_no=${notice_no }'>수정</A>
                <span class='menu_divide' >|</span>
                <A href='./read_delete.do?notice_no=${notice_no }'>삭제</A>
              </ASIDE> 
            </li>
        <ul>
        <br>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span style='font-size: 25px'>${noticeVO.notice_name}</span><br>
            <span class='aside_right'>${noticeVO.notice_date.substring(0, 16)} ${noticeVO.notice_views} </span>

          </li>
          
          <li class="li_none">
          <c:set var="notice_file1" value="${noticeVO.notice_file1 }" />
          <c:if test="${notice_file1.endsWith('jpg') || notice_file1.endsWith('png') || notice_file1.endsWith('gif')}">
          <DIV style="width: 60%; float: center; margin-left : 150px;">
          <IMG src="./storage/main_images/${notice_file1 }" style="width: 100%;">
          </DIV>
          </c:if>
            <DIV>${noticeVO.notice_con }</DIV>
            <br>
            <DIV id='panel' style='margin: 10px auto; padding: 10px; border: solid 1px #00AA00; width: 50%;'>
            </DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>