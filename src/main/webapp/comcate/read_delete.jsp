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
  <DIV class='title_line'><A href="../comintro/list_all.do">회사 직무별 목록</A>> ${comcateVO.cate_name} > 삭제</DIV>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">회사 직무를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='comno' id='comno' value="${param.comno}">
      <input type='hidden' name='cateno' id='cateno' value="${comcateVO.cateno}">
      
      <label>회사 번호</label>: ${comcateVO.comno} &nbsp;
      <label>직무 이름</label>: ${comcateVO.cate_name} &nbsp;
      <label>순서</label>: ${comcateVO.cate_seqno} &nbsp;
      <label>형식</label>: ${comcateVO.cate_visible} &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do?comno=${param.comno}'">취소</button>
    </FORM>
  </DIV>
  
  <TABLE class='table table-striped'>
    <colgroup>
      <col style="width: 10%;"/>
      <col style='width: 35%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>       
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">회사 직무</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">출력</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="comcateVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="cateno" value="${comcateVO.cateno}" />
      <TR>
        <TD class="td_bs">${comcateVO.cate_seqno }</TD>
        <TD class="td_bs_left"><A href="../contents/list.do?cateno=${cateno }">${comcateVO.cate_name }</A></TD>
        <TD class="td_bs">${comcateVO.cate_date.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${comcateVO.cate_visible == 'Y'}">
              <A href="./update_visible.do?cateno=${cateno }&visible=${comcateVO.cate_visible}&comno=${param.comno}"><IMG src="./images/open.png"></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?cateno=${cateno }&visible=${comcateVO.cate_visible}&comno=${param.comno}"><IMG src="./images/close.png"></A>
            </c:otherwise>
          </c:choose>
        </TD>
        <TD class="td_bs">
          <A href="./read_update.do?cateno=${cateno}&comno=${param.comno}"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?cateno=${cateno}&comno=${param.comno}"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_seqno_up.do?cateno=${cateno}&comno=${param.comno}"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?cateno=${cateno}&comno=${param.comno}"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>             
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 