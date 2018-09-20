<!DOCTYPE html>
<%@page import="exBean.studentVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="exBean.ConnBean" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>출력</h2>
<table width=300 border=1>
<tr align=center bgcolor="cyan">
<td>학번</td><td>이름</td>
</tr>
<jsp:useBean id="sk" class="exBean.ConnBean" scope="page"/>
<%
Vector vlist = sk.getData();
for(int i = 0; i < vlist.size(); i++){
studentVO rbean = (studentVO) vlist.elementAt(i);
 %>
 <tr align="center">
 <td><%=rbean.getNo() %></td>
 <td><%=rbean.getName() %></td>
 </tr>
 <%
 }
  %>
</table>

</body>
</html>