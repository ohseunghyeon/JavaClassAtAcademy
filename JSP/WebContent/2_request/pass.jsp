<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int age;
%>
<%
	String str = request.getParameter("age");
	age = Integer.parseInt(str);
%>
<%if (age < 150) {%>
당신은 <font color="red"> <%=age %></font>세이므로 성인입니다.<br/>
주류 구매가 가능합니다.<br/>
<%} else { %>
잘못 입력하셨습니다.<br/>
<%} %>
<a href="request_4.jsp">처음으로 이동</a>
</body>
</html>