<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>공지사항 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input type='text' class="form-control" name='notice_name' value='공지사항' placeholder="제목" required="required" style='width: 80%;'>
        </li>
        <li class="li_none">
          <label>내용: </label>
          <textarea class="form-control" name='notice_con' id='notice_con' rows='10' placeholder="내용">공지사항 내용</textarea>
        </li>
      </ul> 
      
      <div class="form-group">   
        <div class="col-md-12">
          <%-- 실제 컬럼명: file1, Spring File 객체 대응: file1MF --%>
          <input type='file' class="form-control" name='notice_file1MF' id='notice_file1MF' 
                    value='' placeholder="파일 선택">
         </div>
       </div>
        <li class="li_none">
          <input type='text' class="form-control" name='notice_word' value='공지, 공지사항, ' placeholder="제목" required="required"'>
        </li>
      
      
  <div class="form-group">
     <label class="control-label col-md-3">출력 형식</label>
     <div class="col-md-9">
        <select name='visible' class="form-control" style='width: 20%;'>
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
     </div>
  </div>   

  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

