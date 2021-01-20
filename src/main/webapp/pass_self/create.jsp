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
 
<DIV class='title_line'>합격 자소서 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input type='text' class="form-control" name='pass_self_title' value='삼성그룹 합격 자기소개서' placeholder="제목" required="required" style='width: 80%;'>
        </li>
        
        <li class="li_none">
          <label>회사번호</label>
          <input type='text' class="form-control" name='comno' value='1' placeholder="제목" required="required" style='width: 10%;'>
        </li>
        <li class="li_none">
          <label>작성자(기업회원) 번호</label>
          <input type='text' class="form-control" name='cor_memberno' value='1' placeholder="제목" required="required" style='width: 10%;'>
        </li>
        
        <li class="li_none">
          <label>항목1: </label>
          <textarea class="form-control" name='pass_self_item1' id='pass_self_item1' rows='2' placeholder="합격자소서 항목1">1. 성장과정 (최소 100자, 최대 500자 입력가능)</textarea>
        </li>
        <li class="li_none">
          <label>답변1: </label>
          <textarea class="form-control" name='pass_self_ans1' id='pass_self_ans1' rows='10' placeholder="첫번째 답변">경청과 소통의 중요성
대학교 입학 후 경청을 통한 소통능력을 기르면서 저는 한 단계 더 성장하였습니다. 첫 학기에 각종 팀 과제를 경험한 후 공동의 목표를 달성하기 위해서는 협력이 중요하다는 것을 깨닫게 되었고 저는 협력을 위해 경청하고 소통하는 법을 배우려 노력하였습니다. </textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목2: </label>
          <textarea class="form-control" name='pass_self_item2' id='pass_self_item2' rows='2' placeholder="합격자소서 항목2">2. 도전을 통한 성취/실패 경험 (최소 100자, 최대 500자 입력가능)</textarea>
        </li>
        <li class="li_none">
          <label>답변2: </label>
          <textarea class="form-control" name='pass_self_ans2' id='pass_self_ans2' rows='10' placeholder="두번째 답변">객관화를 통한 성취
저는 대학교에 입학 후 축구부에 가입하였습니다. 축구부는 대한축구협회에 등록되어 대학축구리그에 참가하고 있었고 저는 엘리트 선수들과 어깨를 나란히 하는 주전선수가 되는 것을 목표로 설정하여 훈련에 임하였습니다. 하지만 중, 고교시절 선수 경험이 없던 제가 주전선수가 되는 것은 큰 도전이었습니다. </textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목3: </label>
          <textarea class="form-control" name='pass_self_item3' id='pass_self_item3' rows='2' placeholder="합격자소서 항목3">3. 창의적으로 문제를 해결한 경험 (최소 100자, 최대 500자 입력가능)</textarea>
        </li>
        <li class="li_none">
          <label>답변3: </label>
          <textarea class="form-control" name='pass_self_ans3' id='pass_self_ans3' rows='10' placeholder="세번째 답변">접근방식의 변화
대학시절 저는 학생들이 여러 종목에서 경쟁하는 스포츠 페스티벌의 운영진으로 참여했습니다. </textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목4: </label>
          <textarea class="form-control" name='pass_self_item4' id='pass_self_item4' rows='2' placeholder="합격자소서 항목4">4. 해당직무의 지원동기 (최소 100자, 최대 500자 입력가능)</textarea>
        </li>
        <li class="li_none">
          <label>답변4: </label>
          <textarea class="form-control" name='pass_self_ans4' id='pass_self_ans4' rows='10' placeholder="네번째 답변">두발로 뛰어다닌 영업인
저는 2017년에 과외를 구하는 과정에서 제 자신을 영업하는 경험을 하였습니다. 처음에는 저희 아파트에 전단지를 붙여놓고 연락을 기다렸습니다.</textarea>
        </li><br>
        
        <li class="li_none">
          <label>항목5: </label>
          <textarea class="form-control" name='pass_self_item5' id='pass_self_item5' rows='2' placeholder="합격자소서 항목5">5. 입사후 포부: 광동제약을 통해 실현하고 싶은 가치 (최소 100자, 최대 500자 입력가능)</textarea>
        </li>
        <li class="li_none">
          <label>답변5: </label>
          <textarea class="form-control" name='pass_self_ans5' id='pass_self_ans5' rows='10' placeholder="다섯번째 답변">체덕지 가치의 실현
여러 교육기관에서는 학생의 지덕체(智德體)를 고르게 성장시키는 것을 목표로 하여 교육을 하고 있습니다. 지덕체란 지식을 쌓고 도덕성을 함양하고 건강한 체력을 기르도록 교육하자는 것을 의미합니다. </textarea>
        </li>
      </ul>   
      
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

