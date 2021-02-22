<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function(){
  $('#btn_send').click(function () {
    var sur_itemno = $('input[name="item"]:checked').val();
    var surveyno = ${param.surveyno}

    var msg ="surveyno=" + surveyno;
    msg += "&sur_itemno=" + sur_itemno;
    var params = msg;
    
    $.ajax({
      url: './vote.do', // spring execute
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        if(rdata.cnt == 1){
          alert("완료되었습니다.");
          location.href = './result.do?surveyno='+${param.surveyno};
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR\n';
        msg += 'request.status: '+request.status + '\n';
        msg += 'error: '+error;
        console.log(msg);
      }
    });
  }); 
});
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />

  <DIV class='title_line'>설문 조사 항목 목록
    <aside class="aside_right">
      <c:if test="${sessionScope.id != null}">
        <A href='./create.do?surveyno=${param.surveyno }'>등록</A> 
      </c:if>
    </aside>
  </DIV>
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='surveyno' value='${surveyitemVO.surveyno }'>
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
                     onclick="location.href='./list.do?surveyitemno=${surveyitemVO.surveyno }&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  
  <div class="aside_right"></div>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 70%;'/>
      <col style='width: 30%;'/>

    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">주제: ${surveyVO.topic } </TH>
      <TH class="th_bs">항목 파일</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="SurveyitemVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="sur_itemno" value="${SurveyitemVO.sur_itemno}" />
      <c:set var="surveyno" value="${SurveyitemVO.surveyno}" />
      <c:set var="itemfile" value="${SurveyitemVO.itemfile}" />
      <TR>
        <TD class="td_bs" style="text-align: left;">
          <label>
            <input type="radio" name="item" id="item" value="${sur_itemno }"> ${SurveyitemVO.item }
          </label>
        </TD>
        <TD style='vertical-align: middle; text-align: center;'>
         <c:choose>
                <c:when test="${itemfile.endsWith('jpg') || itemfile.endsWith('png') || itemfile.endsWith('gif')}">
                  <IMG src="./storage/main_images/${itemfile }" style='width: 120px; height: 80px;'> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${SurveyitemVO.itemfile}
                </c:otherwise>
              </c:choose>
            </TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
  
  <div style="text-align: center;">
    <button type="button" id="btn_send">확인</button>
  </div>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 