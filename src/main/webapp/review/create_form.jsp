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
  $(function(){
    $('#btn_send').on('click', send);
  });

  function send() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    // var frm = $('#frm'); // id가 frm인 태그 검색
    //$('#frm').attr('action', './create_ajax.do');
    // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    // var params = 'contentsno=' + ${param.contentsno};
    var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    var msg = '';
    
    $.ajax({
      url: './create_ajax.do', // spring execute
      type: 'post',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        if (rdata.cnt > 0) {
          msg += "『" + $('#com_name').val() + "』 리뷰를 등록했습니다."
          msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
        } else {
          msg += "『" + $('#com_name').val() + "』 리뷰 등록에 실패했습니다."
        }
        alert(msg);
        window.close();
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
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>리뷰 등록</DIV>
 
<FORM name='frm' id='frm' method='POST' action='./create_ajax.do' class="form-horizontal">
<input type='hidden' name='comno' id='comno' value='1'>
<input type='hidden' name='gen_memberno' id='gen_memberno' value='1'>
<input type='hidden' name='rev_visible' id='rev_visible' value='Y'>

  <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto; display: none;"></DIV> 

  <div class="form-group">
     <label class="control-label col-md-3">회사명</label>
     <div class="col-md-9">
       <input type='text' name='com_name' value='회사명' required="required" autofocus="autofocus"
                  class="form-control" style='width: 50%;'>
     </div>
  </div>

  <div class="form-group">
     <label class="control-label col-md-3">리뷰 제목</label>
     <div class="col-md-9">
       <input type='text' name='rev_title' value='제목' required="required"
                  class="form-control" style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">평점</label>
     <div class="col-md-9">
       <input type='range' name='rev_score' id='rev_score' required="required" min="0" max="5" step="1" style='width: 30%;'>
                 <output name="rev_score" for="rev_score"></output>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">담당 직무</label>
     <div class="col-md-9">
       <input type='text' name='rev_depart' value='담당 직무' required="required" 
                  class="form-control" style='width: 50%;'>
     </div>
  </div>
  <div class="form-group">
     <label class="control-label col-md-3">본문</label>
     <div class="col-md-9">
       <textarea rows="5" name='rev_content' value='본문' required="required" 
                  class="form-control" style='width: 50%;'></textarea>
     </div>
  </div>
  
  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" id="btn_send" class="btn btn-primary">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-light">목록</button>
  </div>

</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

