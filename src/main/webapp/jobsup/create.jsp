<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>구직 신청</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
 
<body>  
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    구직 신청
  </DIV>
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
               enctype="multipart/form-data">
      
            <input type='hidden' name='recruitno' id='recruitno' value="${recruitno}">
            <input type='hidden' name='comno' id='comno' value="${comno }">
            <input type='hidden' name='gen_memberno' id='gen_memberno' value="${sessionScope.genmemberno }">
            
            
            
       회사명: ${comname}<br><br>
  
        
       채용 공고명: ${title}<br><br>
        
      
       회원 이름: ${sessionScope.gen_name }<br><br>
       
    
     
             
       이력서 제목:     <!-- FK res_no 지정 -->
      <select class="form-control" id="res_no" name="res_no" onchange="">
          <c:forEach var="ResumeVO" items="${list }">
          <c:set var="res_no" value="${ResumeVO.res_no}" />
          <c:set var="res_intro" value="${ResumeVO.res_intro}" />
          <option  value="${ResumeVO.res_no}">${res_intro}</option>
          </c:forEach>  
      </select>
        
        
       <br><br>       
      <div class="form-group">   
        <div class="col-md-12">
        지원 제목
          <input type='text' class="form-control" name='jobsup_title' value='믿음직하고 꼼꼼한사람입니다' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
        지원 메세지
          <textarea class="form-control" name='jobsup_msg' id='jobsup_msg' rows='10' placeholder="내용">저는 이 회사에 지원하고 싶은 이유는 뭣보다 돈이필요해서 입니다.</textarea>
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>