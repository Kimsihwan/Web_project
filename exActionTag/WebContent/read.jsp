<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "exActionTag.studentVO" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<jsp:useBean id="item" scope="page" class="exActionTag.studentVO"/>
<jsp:useBean id="dao" scope="page" class="exActionTag.studentDAO"/>

<%

 request.setCharacterEncoding("UTF-8");

 Vector<studentVO> items = new Vector<studentVO>();

 items = dao.selectStudent();

%>

<body>

<%

 for(int i=0;i<items.size();i++) {

  item = items.get(i);

%>

  <%=item.getNo()%>

  <%=item.getName()%><BR>

 <%}%>

</body>

</html>