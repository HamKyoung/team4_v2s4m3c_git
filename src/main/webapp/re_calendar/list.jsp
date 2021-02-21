<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.*"%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
  
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
  <%!
  ArrayList<Integer> rdate_y = new ArrayList<Integer>();
  ArrayList<Integer> rdate_m = new ArrayList<Integer>();
  ArrayList<Integer> rdate_d = new ArrayList<Integer>();
  ArrayList<Integer> edate_y = new ArrayList<Integer>();
  ArrayList<Integer> edate_m = new ArrayList<Integer>();
  ArrayList<Integer> edate_d = new ArrayList<Integer>();
  ArrayList<String> com_name = new ArrayList<String>();
  ArrayList<Integer> recruitno = new ArrayList<Integer>();

  %>
  
  <%
  this.rdate_y.clear();
  this.rdate_m.clear();
  this.rdate_d.clear();
  this.edate_y.clear();
  this.edate_m.clear();
  this.edate_d.clear();
  this.com_name.clear();
  this.recruitno.clear();

  %>
  
  <c:forEach var="re_calendarVO"  items="${list}">
    <c:set var="RECRUITNO" value="${re_calendarVO.RECRUITNO }" />
    <c:set var="c_rdate" value="${re_calendarVO.c_rdate }" />
    <c:set var="c_edate" value="${re_calendarVO.c_edate }" />
    <c:set var="c_title" value="${re_calendarVO.c_title }" />
    <c:set var="com_name" value="${re_calendarVO.com_name }" />
    <%
    
    String rdate = (String)pageContext.getAttribute("c_rdate");
    String edate = (String)pageContext.getAttribute("c_edate");
    String title = (String)pageContext.getAttribute("c_title");
    
    String name = (String)pageContext.getAttribute("com_name");
    int no = (int)pageContext.getAttribute("RECRUITNO");

    this.com_name.add(name);
    this.recruitno.add(no);
    
    this.rdate_y.add(Integer.parseInt(rdate.substring(0, 4)));
    this.rdate_m.add(Integer.parseInt(rdate.substring(5, 7)));
    this.rdate_d.add(Integer.parseInt(rdate.substring(8, 10)));
    
    this.edate_y.add(Integer.parseInt(edate.substring(0, 4)));
    this.edate_m.add(Integer.parseInt(edate.substring(5, 7)));
    this.edate_d.add(Integer.parseInt(edate.substring(8, 10)));
    %>
 </c:forEach> 
 
  <%
  
    Calendar cal = Calendar.getInstance();
    int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
    int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);

    // 시작요일 확인
    // - Calendar MONTH는 0-11까지임
    cal.set(year, month, 1);
    int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

    // 다음/이전월 계산
    // - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
    int prevYear = year;
    int prevMonth = (month + 1) - 1;
    int nextYear = year;
    int nextMonth = (month  + 1) + 1;

    // 1월인 경우 이전년 12월로 지정
    if (prevMonth < 1) {
        prevYear--;
        prevMonth = 12;
    }

    // 12월인 경우 다음년 1월로 지정
    if (nextMonth > 12) {
        nextYear++;
        nextMonth = 1;
    }
%>

  <table border="0" cellpadding="0" cellspacing="0" width="80%" align='center'>
    <tr>
      <td align="center">
        <!--  이전 년월 -->
        <a href="./list.do?y=<%=prevYear%>&m=<%=prevMonth%>">◁</a>
        <%=year%>년  <%=month+1%>월
        <!--  다음 년월 --> 
        <a href="./list.do?y=<%=nextYear%>&m=<%=nextMonth%>">▷</a>
      </td>
    </tr>
    <tr>
      <td>

        <table border="1" cellpadding="0" cellspacing="0" width='100%' height='250px' align='center'>
          <tr>
            <td width='14%' align='center'>일</td>
            <td width='14%' align='center'>월</td>
            <td width='14%' align='center'>화</td>
            <td width='14%' align='center'>수</td>
            <td width='14%' align='center'>목</td>
            <td width='14%' align='center'>금</td>
            <td width='16%' align='center'>토</td>
          </tr>
          <tr height='14%'>
            <% 
    // 시작요일까지 이동
    for (int k=1; k<bgnWeek; k++){
      out.println("<td>&nbsp;</td>");
    }
            
    // 첫날~마지막날까지 처리
    // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
    while (cal.get(Calendar.MONTH) == month) {
      if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){ // 토요일인 경우
        out.println("<td height='130px' valign='top'><span style='color:blue;'>" + cal.get(Calendar.DATE));
        for(int in = 0; in < this.rdate_y.size(); in++) {
          if(cal.get(Calendar.YEAR) == this.rdate_y.get(in) && cal.get(Calendar.MONTH) == this.rdate_m.get(in) - 1) {   // 연도, 월이 구직시작과 같은 경우
            if(cal.get(Calendar.DATE) == this.rdate_d.get(in) ) {  // 시작일인 경우
              if(cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인경우
                out.println("<br><A href='../recruit/read.do?recruitno=" + this.recruitno.get(in) + "'>" + "<span style= 'font-size:13px; color: blue;'> 시작 </span> <span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span> </A>" + "<br>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");
              } else {
                out.println("<br><A href='../recruit/read.do?recruitno=" + this.recruitno.get(in) + "'>" + "<span style= 'font-size:13px; color: blue;'> 시작 </span> <span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span> </A>" );
                }
            } else { // 시작일이 아닌 경우
              if (cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인경우
                out.println("<br><span style= 'font-size:13px; color: red;'>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");
              }
            }
          } else {   // 연도, 월이 구직시작과 같지 않은 경우
            if (cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인 경우
              out.println("<br><span style= 'font-size:13px; color: red;'>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");
            }
          }
          }
        out.println("</span></td>");
        out.println("</tr><tr>");
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1); // 날짜 증가시키기
        } else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) { // 일요일인 경우
          out.println("<td height='130px' valign='top'><span style='color:red;'>" + cal.get(Calendar.DATE));
        for(int in = 0; in < this.rdate_y.size(); in++) {
          if(cal.get(Calendar.YEAR) == this.rdate_y.get(in) && cal.get(Calendar.MONTH) == this.rdate_m.get(in) - 1) {   // 연도, 월이 구직시작과 같은 경우
            if(cal.get(Calendar.DATE) == rdate_d.get(in) ){  // 시작일인 경우
              if(cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인경우
                out.println("<br><A href='../recruit/read.do?recruitno=" + this.recruitno.get(in) + "'>" + "<span style= 'font-size:13px; color: blue;'> 시작 </span> <span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span> </A>" + "<br>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");
              } else {
                out.println("<br><A href='../recruit/read.do?recruitno=" + this.recruitno.get(in) + "'>" + "<span style= 'font-size:13px; color: blue;'> 시작 </span> <span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span> </A>" );
                }
            } else { // 시작일이 아닌 경우
              if (cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인경우
                out.println("<br><span style= 'font-size:13px; color: red;'>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");
              }
            }
          } else {   // 연도, 월이 구직시작과 같지 않은 경우
            if(cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인 경우
              out.println("<br><span style= 'font-size:13px; color: red;'>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");
            }
          }
          }
        out.println("</span></td>");
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1); // 날짜 증가시키기
        } else { // 평일인 경우
          out.println("<td height='130px' valign='top'>" + cal.get(Calendar.DATE));
        for(int in = 0; in < this.rdate_y.size(); in++) {
          if(cal.get(Calendar.YEAR) == this.rdate_y.get(in) && cal.get(Calendar.MONTH) == this.rdate_m.get(in) - 1) {   // 연도, 월이 구직시작과 같은 경우
            if(cal.get(Calendar.DATE) == this.rdate_d.get(in) ) {  // 시작일인 경우
              if(cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인경우
                out.println("<br><A href='../recruit/read.do?recruitno=" + this.recruitno.get(in) + "'>" + "<span style= 'font-size:13px; color: blue;'> 시작 </span> <span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span> </A>" + "<br>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>"); // 시작일과 마감일이 동시에 존재
                } else {
                  out.println("<br><A href='../recruit/read.do?recruitno=" + this.recruitno.get(in) + "'>" + "<span style= 'font-size:13px; color: blue;'> 시작 </span> <span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span> </A>" ); // 시작일만 존재
                  }
            } else { // 시작일이 아닌 경우
              if (cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인경우
                out.println("<br><span style= 'font-size:13px; color: red;'>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>");  // 마감일만 존재
                }
            }
          } else {   // 연도, 월이 구직시작과 같지 않은 경우
            if(cal.get(Calendar.YEAR) == this.edate_y.get(in) && cal.get(Calendar.MONTH) == this.edate_m.get(in) - 1 && cal.get(Calendar.DATE) == this.edate_d.get(in)) { // 마감일인 경우
              out.println("<br><span style= 'font-size:13px; color: red;'>" + "마감 </span>" + "<span style= 'font-size:13px;'>" + this.com_name.get(in) + "</span>"); // 마감일만 존재
              }
          }
          }
        out.println("</span></td>");
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);        // 날짜 증가시키기
        }
      }
    // 끝날부터 토요일까지 빈칸으로 처리
    for (int j=cal.get(Calendar.DAY_OF_WEEK); j<=7; j++) out.println("<td>&nbsp;</td>");
%>
          </tr>
        </table>

      </td>
    </tr>
  </table>
    
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>





