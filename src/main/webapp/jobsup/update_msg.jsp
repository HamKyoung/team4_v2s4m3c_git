<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>채용뉴스</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
     ${jobsupVO.jobsup_title }
  </DIV>

  <ASIDE class="aside_left">
<A href=''>구직신청</A> > 수정
  </ASIDE>
  <ASIDE class="aside_right">
    <A href=''>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
              <LI class='li_none'>
                <span class='span_success'>구직신청을 수정했습니다.</span>
              </LI>
            
              <LI class='li_none'>
                <span class='span_fail'>구직신청 수정에 실패했습니다.</span>
              </LI>
              <LI class='li_none'>
                <span class='span_fail'>다시 시도해주세요.</span>
              </LI> 
          <LI class='li_none'>
            <button type='button' 
                        onclick="location.href='./read.do?jobsupno=${param.jobsupno}&jobsupno=${param.jobsupno}'"
                        class="btn btn-info">변경 확인</button>
            <button type='button' 
                        onclick="location.href='./list.do?jobsupno=${param.jobsupno}'"
                        class="btn btn-info">목록</button>                        
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-info">재시도</button>
            <button type='button' 
                        onclick="location.href='./list.do?jobsupno=${param.jobsupno}'"
                        class="btn btn-info">목록</button>                        
          </LI>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>