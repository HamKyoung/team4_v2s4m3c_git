<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

$(function(){
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  
  function drawChart() {
    var vis_data = "";
    var params = "surveyno="+${param.surveyno};

    $.ajax({
      url: 'vote_result.do', // spring execute
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success : function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        var chart_data = new Array();
        for (var i=0; i< rdata.length; i++) {
          chart_data.push([rdata[i][0], rdata[i][1]]);
        }    
 /* 
          for (var i=0; i< chart_data.length; i++) {  // 0 ~ 2
            var row = chart_data[i]; // 배열에서 하나의 객체 추출
            alert('키: ' + row[0] + ' 값: ' + row[1]);
        } 
 */ 
        var data = google.visualization.arrayToDataTable(chart_data);

        var options = {
          title : '설문조사 결과'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error : function(request, status, error) { // callback 함수
          var msg = 'ERROR\n';
          msg += 'request.status: ' + request.status + '\n';
          msg += 'error: ' + error;
          console.log(msg);
        }
      });
    }
  });
</script>
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

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
              결과: ${SurveyitemVO.item } > ${SurveyitemVO.itemcnt }(명)
          </label>
        </TD>
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
  <div id="piechart" style="width: 900px; height: 500px;"></div>
  

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>