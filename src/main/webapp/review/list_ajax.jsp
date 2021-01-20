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
  $(function() {   
    $('#create_form').on('click', cform);
    //$('#read').on('click', rform);
  }); 

  function cform() {  // 성공
    $.ajax({
      url: './create_form.do', // spring execute
      type: 'get',  // post
      cache: false,
      async: true,
      dataType: 'html',
      data: null,
      success: function(rdata) {
          window.open("./create_form.do"); // 나중엔 팝업창으로 바꾸기
      }      
    });
  }

  function rform(rev_no) {
    var params = 'rev_no=' + rev_no;

    var msg = '';
    $.ajax({
      url: './read_ajax.do', // spring execute
      type: 'get',  // post, get
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        window.open("./read_ajax.do"); // 나중엔 팝업창으로 바꾸기
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR\n';
        msg += 'request.status: '+request.status + '\n';
        msg += 'message: '+error;
        console.log(msg);
      }
    });
  }
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>회사 리뷰</DIV>
  
    <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='cateno' value='${cateVO.cateno }'>
      <br>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' 
                     style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; width: 100%; text-align: right;'>
      <button type="button" id="create_form" class="btn btn-light">등록</button>
  </DIV>
    <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto; display: none;"></DIV> 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">순서</TH>
    <TH class="th_bs">회사명</TH>
    <TH class="th_bs">제목</TH>
    <TH class="th_bs">평점</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">출력</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="reviewVO" items="${list }">
    <c:set var="comno" value="${reviewVO.comno }" />
    <c:set var="rev_no" value="${reviewVO.rev_no }" />
      <tr>
        <td class="td_bs">${rev_no }</td>
        <td><a href="./read.do?rev_no=${rev_no}"> ${reviewVO.com_name }</a></td>        
        <td><a href="./read.do?rev_no=${rev_no}"> ${reviewVO.rev_title }</a></td>
        <td class="td_bs">${reviewVO.rev_score }</td>
        <td class="td_bs">${reviewVO.rev_date.substring(5,10) }</td>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${reviewVO.rev_visible == 'Y'}">
              <A href="./update_visible.do?rev_no=${rev_no }&rev_visible=${reviewVO.rev_visible }"><IMG src="./images/open.png" style='width:15px;'></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?rev_no=${rev_no }&rev_visible=${reviewVO.rev_visible }"><IMG src="./images/close.png" style='width:15px;'></A>
            </c:otherwise>
          </c:choose>
        </TD>
        <TD class="td_bs">
          <A href="./update.do?rev_no=${reviewVO.rev_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?rev_no=${reviewVO.rev_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_rev_no_up.do?rev_no=${reviewVO.rev_no }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_rev_no_down.do?rev_no=${reviewVO.rev_no }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>        
         </TD>             
      </tr>
  </c:forEach>
 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
  