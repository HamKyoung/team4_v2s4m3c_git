<%@ page contentType="text/plain; charset=UTF-8" %> 
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>

<%
Thread.sleep(5000); 
%>

<%
JSONObject json = new JSONObject();  // 부모 객체
json.put("qna", "<a href=\"../answer/list.do\"><IMG src=\"./images/qna.png\" style=\"width: 100%;\"></a>");

out.println(json.toString());
%>







