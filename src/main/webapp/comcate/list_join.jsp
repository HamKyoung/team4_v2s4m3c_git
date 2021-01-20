<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team4</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>
  <A href="../comintro/list_all.do">회사 목록</A> > ${comintroVO.com_name }
  </DIV>
  
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      
      <label>회사 번호</label>
      <input type='number' name='comno' value='${comintroVO.comno}' required="required" 
                min="1" max="99999" step="1" style='width: 5%;'>
        
      <label>직무</label>
      <input type='text' name='cate_name' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='cate_seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='cate_visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
   
  <TABLE class='table table-striped'>
    <colgroup>
      <col style="width: 15%;"/>
      <col style="width: 10%;"/>
      <col style='width: 25%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>       
      <col style='width: 25%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">회사 이름</TH>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">회사 직무</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="ComIntro_ComCate_join" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="comno" value="${ComIntro_ComCate_join.comno}" />
      <c:set var="comintro_name" value="${ComIntro_ComCate_join.r_com_name}" />
      <c:set var="cate_seqno" value="${ComIntro_ComCate_join.cate_seqno}" />
      <c:set var="cateno" value="${ComIntro_ComCate_join.cateno}" />
      <c:set var="cate_name" value="${ComIntro_ComCate_join.cate_name}" />
      <c:set var="cate_date" value="${ComIntro_ComCate_join.cate_date}" />
      <c:set var="cate_visible" value="${ComIntro_ComCate_join.cate_visible}" />
      <c:set var="cate_cnt" value="${ComIntro_ComCate_join.cate_cnt}" />
        <TR>
        <TD class="td_bs">${comintro_name }</TD>
        <TD class="td_bs">${cate_seqno }</TD>
        <TD class="td_bs_left"><A href="../recruit/list.do?cateno=${cateno }">${cate_name }</A></TD>
        <TD class="td_bs">${cate_date.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${cate_visible == 'Y'}">
              <A href="./update_visible.do?cateno=${cateno }&cate_visible=${cate_visible}&comno=${comno}"><IMG src="./images/open.png"></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?cateno=${cateno }&cate_visible=${cate_visible}&comno=${comno}"><IMG src="./images/close.png"></A>
            </c:otherwise>
          </c:choose>
        </TD>
        <TD class="td_bs">
          <A href="./read_update.do?cateno=${cateno}&comno=${comno}"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?cateno=${cateno}&comno=${comno}"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_seqno_up.do?cateno=${cateno}&comno=${comno}"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?cateno=${cateno}&comno=${comno}"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>             
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 