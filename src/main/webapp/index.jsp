<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>TEAM 4</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<style>
#inner-grid{
  display: grid;
  grid-template-rows: 130px 130px 130px 130px;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-gap: 5px;
  padding: 8px;
  border: 1px solid black;
  border-

}
#inner-grid > div {
  <!--background: lightgreen; -->
  padding: 8px;
  rules :all;
}
.logo{
  height:70px;
  width: auto;

}
#recruit_title{
  height:40px;
  width: auto;
}
</style>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class="col-md-9"> 
  <div id="inner-grid">
    <div>
      <div class="logo" >
        <img src="./css/images/soldeskLogo.jpeg" style="width:140px; height:70px;">
      </div>
      <div>
      솔데스크
      </div>
      <div id="recruit_title">
      2021년 상반기 직원 채용
      </div>
    </div>
    
    <div>
      <div class="logo" >
        <img src="./css/images/coupang.png" style="width:140px; height:70px;">
      </div>
      <div style="background-color:pink;">
      회사이름
      </div>
      <div id="recruit_title">
      제목
      </div>
    </div>
    
    <div>
      <div id="logo" >
      로고2
      </div>
      <div style="background-color:pink;">
      회사이름
      </div>
      <div id="recruit_title">
      제목
      </div>
    </div>
    
    <div>
      <div id="logo" >
      로고
      </div>
      <div style="background-color:pink;">
      회사이름
      </div>
      
      <div id="recruit_title">
      제목
      </div>
    </div>
        <div>
      <div id="logo" >
      로고
      </div>
      <div style="background-color:pink;">
      회사이름
      </div>
      
      <div id="recruit_title">
      제목
      </div>
    </div>
    <div>6</div>
    <div>7</div>
    <div>8</div>
    <div>6</div>
    <div>7</div>
    <div>8</div>
    <div>5</div>
    <div>6</div>
    <div>7</div>
    <div>6</div>
    <div>7</div>
  </div>
</DIV>

<DIV class="col-md-3">
  <div class="inner-grid">
    <div>공지배너</div>
    <div>인기뉴스1</div>
    <div>인기뉴스2</div>
   
  </div>    
    
</DIV>

 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
  
         