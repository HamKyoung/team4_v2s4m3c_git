<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team4</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  $(function() {
    $('#btn_send').on('click', send);
  }); 

  function send() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    // var frm = $('#frm'); // id가 frm인 태그 검색
    // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    // var params = 'contentsno=' + ${param.contentsno};
    var params = $('#frm_create').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // alert('params: ' + params);
    // return;

    var msg = '';
    $.ajax({
      url: './create_ajax.do', // spring execute
      type: 'post',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        if (rdata.cnt > 0) {
          msg = $('#name').val() + " 카테고리 그룹을 등록했습니다."
          msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
        } else {
          msg = $('#name').val() + " 카테고리 그룹 등록에 실패했습니다."
        }
        $('#panel1').html(msg); // 메시지 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR\n';
        msg += 'request.status: '+request.status + '\n';
        msg += 'message: '+error;
        console.log(msg);
      }
    });
      
    // 처리중 출력
    var gif = '';
    gif +="<div style='margin: 0px auto; text-align: center;'>";
    gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
    gif +="</div>";
      
    $('#panel1').html(gif);
    $('#panel1').show(); // 출력 */    
  }
</script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    등록된 모든 글
  </DIV>
  <ASIDE class="aside_left">
    전체 보기 
  </ASIDE>
  <ASIDE class="aside_right">
    <c:if test="${corlogin eq true }">
      <A href="./create.do">회사등록</A> /
      <A href="javascript:location.reload();">새로고침</A>
      <!--  <span class='menu_divide' >│</span> -->
    </c:if>
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
  <c:choose>
  <c:when test="${corlogin eq false}">
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 60%;"></col>
        <col style="width: 20%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>번호</th>
          <th style='text-align: center;'>회사이름</th>
          <th style='text-align: center;'>업종</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="comintroVO" items="${list }">
          <c:set var="comno" value="${comintroVO.comno }" />
          <TR> 
            <td style='text-align: center;'>${comintroVO.comno}</td>
            <td>
              <a href="../comcate/list.do?comno=${comno}">${comintroVO.com_name}</a> 
            </td> 
            <td style='text-align: center;'>${comintroVO.com_type}</td> 
           </TR>
        </c:forEach>
 
      </tbody>
    </table>
    <br><br>
  </div>
  </c:when>
  </c:choose>


  <c:choose>
  <c:when test="${corlogin eq true}">
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>

      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>번호</th>
          <th style='text-align: center;'>회사이름</th>
          <th style='text-align: center;'>업종</th>
          <th style='text-align: center;'>출력</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="comintroVO" items="${list }">
          <c:set var="comno" value="${comintroVO.comno }" />
          <TR> 
            <td style='text-align: center;'>${comintroVO.comno}</td>
            <td>
              <a href="../comcate/list.do?comno=${comno}">${comintroVO.com_name}</a> 
            </td> 
            <td style='text-align: center;'>${comintroVO.com_type}</td>
            <TD class="td_bs">
        <c:choose>
          <c:when test="${comintroVO.visible == 'Y'}">
            <A href="./update_visible.do?comno=${comno }&visible=${comintroVO.visible }"><IMG src="./images/open.png" style='width: 18px;'></A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?comno=${comno }&visible=${comintroVO.visible }"><IMG src="./images/close.png" style='width: 18px;'></A>
          </c:otherwise>
        </c:choose>
      </TD>   
      <TD class="td_bs">
        <A href="./update.do?comno=${comno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./delete.do?comno=${comno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>      
      </TD>      


          </TR>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
</c:when>
</c:choose> 


 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


