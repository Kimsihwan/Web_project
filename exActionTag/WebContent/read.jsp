<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "exActionTag.studentVO" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<jsp:useBean id="item" scope="page" class="exActionTag.studentVO"/> <!-- 액션태그에서 스코프는 페이지로 sudentVO를 불러옴 아이디는 item -->
<jsp:useBean id="dao" scope="page" class="exActionTag.studentDAO"/> <!-- 액션태그에서 스코프는 페이지로 sudentVO를 불러옴 아이디는 item -->

<%

 request.setCharacterEncoding("UTF-8"); 

 Vector<studentVO> items = new Vector<studentVO>(); // Vector를 이용하여 배열에 저장

 items = dao.selectStudent();  // studentDAO에있는 selectStudent 를 이용하여 items에 저장

%>

<body>

<%

 for(int i=0;i<items.size();i++) {  //for 반복문을 이용하여 들고온 데이터를 저장

  item = items.get(i);

%>

  <%=item.getNo()%>

  <%=item.getName()%><BR>

 <%}%>

</body>

</html>