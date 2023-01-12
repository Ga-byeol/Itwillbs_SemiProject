<%@page import="com.notice.db.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice/writeForm.jsp</title>


<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 $('#join').submit(function(){
		 if($('.subject').val()=="" ){
				alert("제목을 입력하세요");
				$('.subject').focus();
				return false;
			}
			 
	 });
 });

 
 
 </script>

</head>
<body>
	<%
//세션값 가져오기
NoticeDTO dto = (NoticeDTO) request.getAttribute("dto");
	String sessionId=(String)session.getAttribute("sessionId");


	if(sessionId==null){
		response.sendRedirect("./NoticeList.no");
	}
	%>

	<!--  enctype="multipart/form-data" -->
	<h1>글쓰기</h1>
	<form action="./NoticeWritePro.no" method="post"
		encType="multipart/form-data" id="join">
		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="<%=sessionId %>"
					readonly></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" class="subject"
					maxlength="50"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="10" cols="20"
						class="content" maxlength="1500"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="fileName">
			<tr>
				<td colspan="2"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>


