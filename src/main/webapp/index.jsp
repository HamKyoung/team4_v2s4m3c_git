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
  padding: 2px;
}
#inner-grid > div {
  <!--background: lightgreen; -->
  rules :all;
 border : solid 1px #DDDDDD;
}
  .logo{
    height:70px;
    width: auto;
  }
  .recruit_name {
    font-size : 13px;
    font-weight:bold;
    font-style: normal;
  }

</style>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class="col-md-9"> 
  <div id="inner-grid">
  
    <div>
      <div class="logo" >
        <img src="./css/images/main/kcc.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)케이씨씨
      </div>
      <div>
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4' >2021년 각 부문 수시채용</A>
      </div>
    </div>
    
    <div>
      <div class="logo" >
        <img src="./css/images/main/coupang.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        쿠팡
      </div>
      <div class="recruit_title">
       <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>2021년 상반기 직원 채용</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/gs.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)GS리테일
      </div>
      <div>
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>2021년 상반기 직원 채용</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/kgc.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        KGC인삼공사
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>한국인삼공사 각 부분별 인력모집</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/streami.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        스트리미
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>스트리미 개발/비개발직군 모집</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/thinklab.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)생각연구소
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>실력있는 광고 기획자</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/nhbank.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        NH농협은행
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>2021년 상반기 신규직원 채용</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/emart.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)이마트
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'><font size="9px"></font>이마트 경력직 채용</A>
      </div>
    </div>

    <div>
      <div id="logo" >
        <img src="./css/images/main/emart.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)이마트
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>이마트 경력직 채용</A>
      </div>
    </div>
    
    <div>
      <div id="logo" >
        <img src="./css/images/main/hyundai.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        현대씨앤알(주)
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>현대C&R 2021년 2분기 공개채용</A>
      </div>
    </div>
    
     <div>
      <div id="logo" >
        <img src="./css/images/main/ssg.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        SSG.COM
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>부문별 경력사원 대규모 공채</A>
      </div>
    </div>
    
     <div>
      <div id="logo" >
        <img src="./css/images/main/gyeryong.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        계룡건설산업(주)
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>2021년 신입/경력 수시채용</A>
      </div>
    </div> 
    
     <div>
      <div id="logo" >
        <img src="./css/images/main/hanssem.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        한샘
      </div>
      <div class="recruit_title">
       <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>키친디자이너 KD 공개채용</A>
      </div>
    </div>
    
     <div>
      <div id="logo" >
        <img src="./css/images/main/monitorapp.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)모니터랩
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>2021년 개발/마케팅 공개채용</A>
      </div>
    </div>
    
     <div>
      <div id="logo" >
        <img src="./css/images/main/gc.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        (주)GC녹십자그룹
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>부문별 수시 채용</A>
      </div>
    </div>
    
     <div>
      <div id="logo" >
        <img src="./css/images/main/naver.JPG" style="width:140px; height:70px;">
      </div>
      <div class="recruit_name">
        네이버파이낸셜(주)
      </div>
      <div class="recruit_title">
        <A style='font-size: 13px;' href='./recruit/read.do?recruitno=4'>경력 1일 이상 개발차 채용</A>
      </div>
    </div>
    
                               
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
  
         