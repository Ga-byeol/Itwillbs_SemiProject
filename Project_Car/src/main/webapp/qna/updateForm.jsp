<%@page import="com.itwillbs.qna.db.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
</head>
<body>
<%
QnaDTO dto=(QnaDTO)request.getAttribute("dto");
String id=(String)session.getAttribute("id");
	if(id==null || !id.equals(dto.getUser_id())){
		response.sendRedirect("./BoardList.qn");
	}
%>
<h1>글수정</h1>
<form action="./QnaUpdatePro.qn" method="post" enctype="multipart/form-data">
<input type="hidden" name="qna_num" value="<%=dto.getQna_num()%>">
<input type="hidden" name="qna_index" value="<%=dto.getQna_index() %>">
<table border="1">
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="user_id" value="<%=dto.getUser_id() %>" readonly></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="qna_sub" value="<%=dto.getQna_sub() %>" maxlength="50"></td>
	</tr>
	<tr>
		<th>글내용</th>
		<td><textarea name="qna_content" rows="10" cols="20" maxlength="1500"><%=dto.getQna_content()%></textarea></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="file" name="qna_image" id="qna_image"><br> 
		기존 이미지 : <%=dto.getQna_image() %><td>
	</tr>
	<tr>
		<td colspan="2"><input type="checkbox" name="qna_secret" value="Y" 
		<%=dto.getQna_secret().equals("Y") ? "checked='checked'" : "" %>>비밀글</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="글쓰기"></td>
	</tr>
</table>
</form>
</body>
</html>