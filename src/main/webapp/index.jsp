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
#outer-grid {
  display: grid;
  grid-template-rows: 100px 1fr;
  grid-template-columns: 1fr 200px;
  grid-gap: 8px;
}
#outer-grid > div {
  background-color: limegreen;
  color: white;
  font-size: 4vw;
  padding: 8px;
}
#inner-grid{
  display: grid;
  grid-template-rows: 130px 130px 130px 130px;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-gap: 5px;
  padding: 8px;
}
#inner-grid > div {
  <!--background: lightgreen; -->
  padding: 8px;
}
#logo{
  height:70px;
  width: auto;
  background-color:yellow;
}
#recruit_title{
  height:40px;
  width: auto;
  background-color:lightgreen;
}
</style>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class="col-md-9"> 
  <div id="inner-grid">
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
  
         