<%@page import="java.io.File"%>
<%@page import="com.notice.db.NoticeDTO"%>
<%@page import="com.notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice/updateForm.jsp</title>

<script type="text/javascript">
function deleteCheck() {
	if(!confirm("수정한글이 사라질수도 있습니다")){
		alert("O");	
		return false;
	}else{
		alert("X");			
	}
</script>


<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.Dconfirm').click(function(){
			if(!confirm("삭제 하시겠습니까?")) {
				return false;
			}
		});
	});
</script>




<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.change').click(function(){
			if(!confirm("정말로 수정 하시겠습니까?")) {
				return false;
			}
		});
	});
</script>

<%
NoticeDTO dto = (NoticeDTO) request.getAttribute("dto");
String sessionId=(String)session.getAttribute("sessionId");


if(sessionId==null){
	response.sendRedirect("./NoticeList.no");
}
%>


</head>
<body>
	<%
	// String id=(String)session.getAttribute("id");
	

	String filepath = request.getSession().getServletContext().getRealPath("notice_images");
	String real = filepath;
	File viewFile = new File(real + "\\" + dto.getNotice_image());
	%>
	<h1>글수정</h1>
	<form action="./NoticeUpdatePro.no" method="post"
		encType="multipart/form-data" id="join">
		<input type="hidden" name="num" value="<%=dto.getNotice_num()%>">
		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name"
					value="<%=dto.getUser_id()%>" readonly></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject"
					value="<%=dto.getNotice_sub()%>" class="subject" maxlength="50"></td>
			</tr>

			<tr>
				<td>이미지</td>
				<td colspan="1" style="text-align: center;">
					<%
					if (viewFile.exists()) {
					%> <img alt="img" src="notice_images/<%=dto.getNotice_image()%>" width="300">
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="10" cols="20"
						maxlength="1500"><%=dto.getNotice_content()%></textarea></td>
			</tr>

			<tr>
				<td colspan="2"><input type="file" name="fileName"></td>
			<tr>
				<td>기존 이미지</td>

				<%
				if (!viewFile.exists()) {
				%>
				<td colspan="2"><input type="text" class="form-control"
					placeholder="기존 이미지가 없습니다." name="searchText" maxlength="100">
					<input type="hidden" name="eimg" value="<%=dto.getNotice_image()%>"
					readonly></td>
				<%
				} else {
				%>
				<td colspan="2"><input name="eimg"
					value="<%=dto.getNotice_image()%>"></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="3"><input type="submit" value="글수정" class="change"></td>
			</tr>

		</table>
	</form>
</body>
</html>


