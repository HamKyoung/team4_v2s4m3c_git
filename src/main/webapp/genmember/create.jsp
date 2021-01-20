<%@ page contentType="text/html; charset=UTF-8" %>
 
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
<script type="text/javascript">
$(function(){
  $("#alert-success").hide(); 
  $("#alert-danger").hide();
  $('#btn_checkID').on('click', checkID);  
  $('#btn_DaumPostcode').on('click', DaumPostcode);
  $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동

  function checkID() {
    var frm = $('#frm');
    var gen_id = $('#gen_id', frm).val();
    var params = '';
    var msg = '';

    if ($.trim(gen_id).length == 0) { // id를 입력받지 않은 경우
      msg = 'ID를 입력하세요.<br>ID 입력은 필수 입니다.<br>ID는 3자이상 권장합니다.';
      
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('ID 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
      return false;
    } else {  // when ID is entered
      params = 'gen_id=' + gen_id;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);

      $.ajax({
        url: './checkID.do', // spring execute
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          // alert(rdata);
          var msg = "";
          
          if (rdata.cnt > 0) {
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = "이미 사용중인 ID 입니다.";
            $('#btn_close').attr('data-focus', "gen_id");
          } else {
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 ID 입니다.";
            $('#btn_close').attr('data-focus', "gen_passwd");
            
            // $.cookie('checkId', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('ID 중복 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR\n';
          msg += 'request.status: '+request.status + '\n';
          msg += 'error: '+error;
          console.log(msg);
        }
      });
      
      // 처리중 출력
  /*     var gif = '';
      gif +="<div style='margin: 0px auto; text-align: center;'>";
      gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
      gif +="</div>";
      
      $('#panel2').html(gif);
      $('#panel2').show(); // 출력 */
    }
  }

  function setFocus() { // focus이동
    var tag =$('#btn_close').attr('data-focus'); // 포커스를 적용할 태그 id 가져오기
    $('#' + tag).focus(); // 포커스지정
  }
  
  $('#gen_passwd_check').keyup(function(){
      if($('#gen_passwd').val() != $('#gen_passwd_check').val()){
         $("#alert-success").hide(); 
         $("#alert-danger").show(); 
      } else {
         $("#alert-success").show(); 
         $("#alert-danger").hide(); 
      }
  });
});
 </script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<!-- Modal 알림창 시작 -->
  <div id="modal_panel" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_close" class="btn btn-default" data-focus='' data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <DIV class="title_line">
    일반 회원 가입
  </DIV>
  
  <ASIDE class="aside_left">
        *: 필수 입력  
  </ASIDE>
  <ASIDE class="aside_right">
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  
  <DIV style='width: 100%;'>
    <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">

      <div class="form-group">
        <label for="id" class="col-md-2 control-label" style='font-size: 0.9em;'>아이디*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='gen_id' id='gen_id' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <button type='button' id="btn_checkID" class="btn btn-info btn-md">중복확인</button>
          <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
        </div>
      </div>   
      
    <div class="form-group">
      <label for="passwd" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드*</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" id='gen_passwd' name='gen_passwd'  value='' placeholder="비밀 번호" required="required" style='width: 20%;'>
      </div>
    </div> 
     
    <div class="form-group">
      <label for="passwd2" class="col-md-2 control-label" style='font-size: 0.9em;'>패스워드 확인*</label>    
      <div class="col-md-10">
          <input type='password' class="form-control" id='gen_passwd_check' name='gen_passwd_check'  value='' placeholder="비밀 번호 확인" required="required" style='width: 30%;'>
          <div class="alert-success" id="alert-success" style="width: 30%;">비밀번호가 일치합니다.</div> 
          <div class="alert-danger" id="alert-danger" style="width: 30%;">비밀번호가 일치하지 않습니다.</div>
      </div>
    </div>   

    <div class="form-group">
      <label for="mname" class="col-md-2 control-label" style='font-size: 0.9em;'>성명*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_name' id='gen_name' 
                   value='' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   
      
    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>생년월일*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_resident' id='gen_resident' 
                   value='' required="required" style='width: 30%;' placeholder="생년월일"> 예) 990101
      </div>
    </div>   
      
    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>성별*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_sex' id='gen_sex' 
                   value='' required="required" style='width: 10%;' placeholder="성별">
      </div>
    </div>   

    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_phone' id='gen_phone' 
                   value='' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
      </div>
    </div>   
      
    <div class="form-group">
      <label for="zipcode" class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_zipcode' id='gen_zipcode' 
                   value='' style='width: 30%;' placeholder="우편번호">
        <input type="button" id="btn_DaumPostcode" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  

    <div class="form-group">
      <label for="address1" class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_addr' id='gen_addr' 
                   value='' style='width: 80%;' placeholder="주소">
      </div>
    </div>   

    <div class="form-group">
      <label for="address2" class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_addr1' id='gen_addr1' 
                   value='' style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   

    <div class="form-group">
      <div class="col-md-12">

<!-- ---------- DAUM 우편번호 API 시작 ---------- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#gen_zipcode').val(data.zonecode); //5자리 새우편번호 사용 ★
                $('#gen_addr').val(fullAddr); //주소 ★

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#gen_add1').focus(); // ★
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ---------- DAUM 우편번호 API 종료 ---------- -->

      </div>
    </div>
      
    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일*</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='gen_mail' id='gen_mail' 
                   value='' required="required" style='width: 30%;' placeholder="이메일">
      </div>
    </div>   
        
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">가입</button>
        <button type="button" 
                    onclick="location.href='./index" 
                    class="btn btn-info">취소[홈페이지]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>