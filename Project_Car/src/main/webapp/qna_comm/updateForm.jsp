<%@page import="com.qna_comm.db.QnaCommDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/header.css"/>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<%
QnaCommDTO dto=(QnaCommDTO)request.getAttribute("dto");
String sessionId=(String)session.getAttribute("sessionId");
int qna_index=Integer.parseInt(request.getParameter("qna_index"));

if(sessionId==null || !sessionId.equals(dto.getUser_id())){
	response.sendRedirect("./QnaList.qn");
}
%>
<h1>글수정</h1>
<form action="QnaCommUpdatePro.co" method="post">
	<input type="hidden" name="qna_num" value="<%=dto.getQna_num()%>">
	<input type="hidden" name="comm_num" value="<%=dto.getComm_num()%>">
	<input type="hidden" name="qna_index" value="<%=qna_index %>">
	<table border="1">
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="user_id" value="<%=dto.getUser_id() %>" readonly></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea name="comm_content" rows="10" cols="20" maxlength="1500"><%=dto.getComm_content()%></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="글쓰기"></td>
		</tr>
	</table>
</form>
</body>
</html>