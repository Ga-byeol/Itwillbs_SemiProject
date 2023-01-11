<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/writeForm</title>
<script type="text/javascript">

function check() {
	if (document.getElementById("qna_sub").value=="") {
		alert("제목을 입력하시오")
		document.getElementById("qna_sub").focus();
		return false;
	}
}
</script>
<link rel="stylesheet" href="./header/basic.css"/>
</head>
<body>
<jsp:include page="../css/header.jsp"></jsp:include>
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("./QnaList.qn");
}

%>

<h1>글쓰기</h1>
<form action="QnaWritePro.qn" method="post" name="fo" enctype="multipart/form-data" onsubmit="return check()">
	<table border="1">
		<tr>
			<th>글쓴이</th>
			<td><input type="text" name="user_id" value="<%=id %>" readonly></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td><input type="text" name="qna_sub" id="qna_sub" maxlength="50"></td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><textarea name="qna_content" rows="10" cols="20" maxlength="1500"></textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="qna_image" id="qna_image"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="checkbox" name="qna_secret" value="Y">비밀글</td>
		</tr>
		<tr align="right">
			<td colspan="2"><input type="submit" value="글쓰기"></td>
		</tr>
	</table>
</form>

</body>
</html>