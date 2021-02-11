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

    <ASIDE class="aside_right">
    <A href="./list.do" class="btn btn-light"> 리뷰 전체 보기</A>
          <c:choose>
              <c:when test="${sessionScope.gen_id == null && sessionScope.cor_id == null}">
                <A href='${pageContext.request.contextPath}/login/login_need.jsp' class="btn btn-light">등록</A>
              </c:when>                          
              <c:when test="${sessionScope.cor_id != null}">
                <A href='${pageContext.request.contextPath}/login/gen_only.jsp' class="btn btn-light">등록</A>
              </c:when>
              <c:when test="${sessionScope.gen_id != null}">
                <button type="button" id="create_form" class="btn btn-light">등록</button>
              </c:when>            
          </c:choose>          
    </ASIDE>
  
    <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto; display: none;"></DIV> 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 25%;'/>
    <col style='width: 25%;'/>
    <col style='width: 25%;'/>
    <col style='width: 25%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">회사명</TH>
    <TH class="th_bs">기업형태</TH>
    <TH class="th_bs">업종</TH>
    <TH class="th_bs">홈페이지</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="Review_comintroVO" items="${list }">
      <tr>
        <td>${Review_comintroVO.com_name }</td>
        <td>${Review_comintroVO.com_form }</td>
        <td>${Review_comintroVO.com_type }</td>
        <td class="td_bs">${Review_comintroVO.homepage }</td>
             
      </tr>
  </c:forEach>
 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
  