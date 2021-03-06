<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regBean" class="mvc.member.dao.LogonDBBean" />
<script src="script.js"></script>
<link type="text/css" rel="stylesheet" href="style.css">

	<h2>중복확인 페이지</h2>
<%!
	String id;
	int result;
%>
<%
	String id = request.getParameter("id");
	int result = regBean.check(id);
	
	//request.setAttribute("key값", value나 변수);
	request.setAttribute("id", id);
	request.setAttribute("result", result);
	
	// id 중복
	if (result == 1) {
%>
	<body onload="confirmFocus()">
		<form action="confirmId.jsp" method="post" name="confirmForm" onsubmit="return confirmCheck()">
			<table>
				<tr>
					<th colspan="2">
						<span><%=id%></span>는 사용할 수 없습니다.
					</th>
				</tr>
				<tr>
					<th>아이디 : </th>
					<td>
						<input type="text" class="input" name="id" maxlength="12">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" class="inputbutton" value="확인">
						<input type="reset" class="inputbutton" value="취소" onclick="self.close()">
					</th>
				</tr>
			</table>
		</form>
	</body>
<%	
	// id 중복이 아닌 경우
	} else {
%>
	<table>
		<tr>
			<td align="center">
				<span><%=id%></span>는 사용할 수 있습니다.
			</td>
		</tr>
		<tr>
			<th>
				<input type="button" class="inputbutton" value="확인" onclick="setId('<%=id%>')">
			</th>
		</tr>
	</table>
<%	
	}
%>
	
</body>
</html>