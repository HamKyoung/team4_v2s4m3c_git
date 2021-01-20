<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
   『${pass_selfVO.pass_self_title}』  수정
  </DIV>
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal" enctype="multipart/form-data">
      <input type='hidden' name='pass_self_no' id='pass_self_no' value='${pass_selfVO.pass_self_no }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='pass_self_title' value="${pass_selfVO.pass_self_title }"
                    placeholder="제목" required="required" style='width: 80%;' autofocus="autofocus">
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
        <li class="li_none">
          <label>항목1: </label>
          <textarea class="form-control" name='pass_self_item1' id='pass_self_item1' rows='2' placeholder="합격자소서 항목1">${pass_selfVO.pass_self_item1 }</textarea>
        </li>
        <li class="li_none">
          <label>답변1: </label>
          <textarea class="form-control" name='pass_self_ans1' id='pass_self_ans1' rows='10' placeholder="첫번째 답변">${pass_selfVO.pass_self_ans1 }</textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목2: </label>
          <textarea class="form-control" name='pass_self_item2' id='pass_self_item2' rows='2' placeholder="합격자소서 항목2">${pass_selfVO.pass_self_item2 }</textarea>
        </li>
        <li class="li_none">
          <label>답변2: </label>
          <textarea class="form-control" name='pass_self_ans2' id='pass_self_ans2' rows='10' placeholder="두번째 답변">${pass_selfVO.pass_self_ans2 }</textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목3: </label>
          <textarea class="form-control" name='pass_self_item3' id='pass_self_item3' rows='2' placeholder="합격자소서 항목3">${pass_selfVO.pass_self_item3 }</textarea>
        </li>
        <li class="li_none">
          <label>답변3: </label>
          <textarea class="form-control" name='pass_self_ans3' id='pass_self_ans3' rows='10' placeholder="세번째 답변">${pass_selfVO.pass_self_ans3 } </textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목4: </label>
          <textarea class="form-control" name='pass_self_item4' id='pass_self_item4' rows='2' placeholder="합격자소서 항목4">${pass_selfVO.pass_self_item4 }</textarea>
        </li>
        <li class="li_none">
          <label>답변4: </label>
          <textarea class="form-control" name='pass_self_ans4' id='pass_self_ans4' rows='10' placeholder="네번째 답변">${pass_selfVO.pass_self_ans4 }</textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목5: </label>
          <textarea class="form-control" name='pass_self_item5' id='pass_self_item5' rows='2' placeholder="합격자소서 항목5">${pass_selfVO.pass_self_item5 }</textarea>
        </li>
        <li class="li_none">
          <label>답변5: </label>
          <textarea class="form-control" name='pass_self_ans5' id='pass_self_ans5' rows='10' placeholder="다섯번째 답변">${pass_selfVO.pass_self_ans5 }</textarea>
        </li>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?pass_self_no=${param.pass_self_no}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>