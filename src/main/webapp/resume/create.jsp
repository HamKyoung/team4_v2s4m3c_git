<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=Edge;">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>JOB</title>

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
    이력서 작성
  </DIV>

  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
                enctype="multipart/form-data">               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='gen_memberno' id='gen_memberno' value='1'> <!-- 회원 고유번호로 바꿔야함 -->
      <input type='hidden' name='res_visible' id='res_visible' value='Y'> <!-- 회원이 기업회원에게 공개여부 결정 -->
      
      <!-- null값으로 처리할 컬럼들 //  나중엔 지워야함 -->
      <input type='hidden' name='res_lice2' id='res_lice2' value='자격증추가'>
      <input type='hidden' name='res_lice2_lev' id='res_lice2_lev' value='자격증추가레벨'>
      
      <div class="form-group">
        <label class="control-label col-md-3">이름</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='gen_name' value='이름' placeholder="이름" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <label class="control-label col-md-3">연락처</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_phone' placeholder="'-' 제외하고 입력" required="required" style='width: 50%;'>  예) 01012345678
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-md-3">메일</label>
        <div class="col-md-9">
          <input type="text" name="res_mail1" required="required" style="width: 50%;"
            class="form-control">
        </div>
        <label class="control-label col-md-3">@</label>
        <div class="col-md-9">
          <select name="res_mail2" class="form-control" required="required" style='width: 50%;'>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
          </select>
        </div>
      </div>

      <div class="form-group">   
      <label class="control-label col-md-3">사진</label>
        <div class="col-md-9">
          <%-- 실제 컬럼명: res_pic, Spring File 객체 대응: fiel1MF --%>
          <input type='file' class="form-control" name='res_picMF' id='res_picMF' 
                    value='' placeholder="이미지 선택(선택사항)" multiple="multiple" style='width: 50%;'>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-md-3">제목</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_title' placeholder="제목" required="required" style='width: 50%;'>
        </div>
      </div>   
            
      <div class="form-group">   
        <label class="control-label col-md-3">자기소개</label>
        <div class="col-md-9">
          <textarea class="form-control" name='res_intro' id='res_intro' rows='5' placeholder="자기소개" maxlength="150" style='width: 50%;'>자기소개(150자 제한)</textarea>
        </div>
      </div>
      
      <div class="form-group">
        <label class="control-label col-md-3">최종학력 학교명</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_scname' placeholder="최종학력" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <label class="control-label col-md-3">전공</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_major1' placeholder="전공" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <label class="control-label col-md-3">부/복수 전공</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_major2' placeholder="부/복수 전공" style='width: 50%;'>
        </div>
      </div>   

      <div class="form-group">
        <label class="control-label col-md-3">입학 일자</label>
        <div class="col-md-9">
          <input type='date' name='res_gotin' class="form-control" placeholder="입학 일자" required="required" min='1980-01-01'  max='2020-12-31' value="2020-01-01" style='width: 50%;'>
        </div>
      </div>   

      <div class="form-group">
        <label class="control-label col-md-3">졸업 일자</label>
        <div class="col-md-9">
          <input type='date' name='res_grad' class="form-control" placeholder="졸업 일자" required="required" min='1980-01-01'  max='2020-12-31' value="2020-01-01" style='width: 50%;'>
        </div>
      </div>   

      <div class="form-group">
        <label class="control-label col-md-3">경력기술서</label>
        <div class="col-md-9">
          <textarea rows="10" class="form-control" name='res_work' placeholder="경력기술서 예시) ~~~~" required="required" style='width: 50%;'></textarea>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-md-3">자격증</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_lice1' placeholder="자격증 명칭" style='width: 50%;'>
        </div>
      </div>   

      <div class="form-group">
        <label class="control-label col-md-3">급수</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_lice1_lev' placeholder="자격증 급수 예시) TOEIC의 경우, 점수 입력" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">
      <label class="control-label col-md-3">링크</label>
        <div class="col-md-9">
          <input type='text' class="form-control" name='res_web' placeholder="인터넷 주소" style='width: 50%;'>
        </div>
      </div>   
           
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-success">등록</button>
        <button type="button" 
                    onclick="location.href='../index.jsp'" 
                    class="btn btn-secondary">취소[홈으로]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
  