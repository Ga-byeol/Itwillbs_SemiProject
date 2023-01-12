<%@page import="com.qna.db.QnaDTO"%>
<%@page import="com.qna.db.QnaDTO"%>
<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<<<<<<< HEAD
<link rel="stylesheet" href="./css/header.css"/>
<link rel="stylesheet" href="./css/list.css"/>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<%
String sessionId=(String)session.getAttribute("sessionId");
=======
<link rel="stylesheet" href="./header/basic.css"/>
</head>
<body>
<jsp:include page="../css/header.jsp"></jsp:include>
<%
String id=(String)session.getAttribute("id");
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
List<QnaDTO> qnaList=(List<QnaDTO>)request.getAttribute("qnaList");
int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int currentPage=(Integer)request.getAttribute("currentPage");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");
QnaDTO dto = new QnaDTO();

<<<<<<< HEAD
if(sessionId==null){
	sessionId="null";
=======
if(id==null){
	id="null";
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
}

%>
<h1>문의</h1>
<<<<<<< HEAD
<table border="1" id="qna">
	<tr align ="center">
		<th>번호</th>
		<th width="100">글쓴이</th>
		<th width="500">제목</th>
		<th>등록일</th>
		<th>조회</th>
	</tr>
=======
<table border="1">
<tr align ="center">
	<th>번호</th>
	<th width="100">글쓴이</th>
	<th width="500">제목</th>
	<th>등록일</th>
	<th>조회</th>
</tr>
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
<%
	for(int i = 0; i<qnaList.size(); i++){
		dto = qnaList.get(i);
		%>
		<tr align ="center">
			<td><%=dto.getQna_index() %></td> 
			<td><%=dto.getUser_id() %></td> 
		<%
<<<<<<< HEAD
		if(dto.getQna_secret().equals("N") || sessionId.equals(dto.getUser_id()) || sessionId.equals("admin")){ %>
			<td align ="left" class="listSub"><a href="QnaContent.qn?qna_num=<%=dto.getQna_num()%>&qna_index=<%=dto.getQna_index() %>"><%=dto.getQna_sub() %></a></td> 
			<%
			} else {
			%>
				<td align ="left"> 비밀글입니다</td>
		<%
		}
		%>
				<td><%=dto.getQna_date() %></td>
				<td><%=dto.getQna_readcount() %></td></tr>
=======
		if(dto.getQna_secret().equals("N") || id.equals(dto.getUser_id()) || id.equals("admin")){ %>
			<td align ="left"><a href="QnaContent.qn?qna_num=<%=dto.getQna_num()%>&qna_index=<%=dto.getQna_index() %>"><%=dto.getQna_sub() %></a></td> 
			<%
			} else {
				%><td align ="left"> 비밀글입니다</td><%  
			}
			%>
			<td><%=dto.getQna_date() %></td>
			<td><%=dto.getQna_readcount() %></td></tr>
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
	<%
	}
	%>
</table>
<br>

<%
<<<<<<< HEAD
// 10페이지 이전
if(startPage>pageBlock) {
%>
	<a href="QnaList.qn?pageNum=<%=startPage-pageBlock %>">[10이전]</a>
<%
}else {
	%>
	<a href="QnaList.qn?pageNum=<%=startPage %>">[10이전]</a>
<%
}
// 1페이지 이전
if(currentPage != 1) {
%>
	<a href="QnaList.qn?pageNum=<%=currentPage-1 %>">[이전]</a>
<%
} else {
	%>
	<a href="QnaList.qn?pageNum=<%=startPage %>">[이전]</a>
<%
}
for(int i=startPage; i<=endPage; i++){
%>
	<a href="QnaList.qn?pageNum=<%=i%>"><%=i%></a>
<%
} 
=======
// System.out.println("endPage="+endPage);
// 10페이지 이전
if(startPage>pageBlock) {
	%>
	<a href="QnaList.qn?pageNum=<%=startPage-pageBlock %>">[10이전]</a>
	<%
}

// 1페이지 이전
if(currentPage != 1) {
	%>
<%-- 	<a href="list.jsp?pageNum=<%=currentPage-1 %>">[이전]</a> --%>
	<%
}
for(int i=startPage; i<=endPage; i++){
	%>
	<a href="QnaList.qn?pageNum=<%=i%>"><%=i%></a>
	<%
}
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f

// 1페이지 다음
if(currentPage < pageCount) {
	%>
<<<<<<< HEAD
	<a href="QnaList.qn?pageNum=<%=currentPage+1 %>">[다음]</a>
	<%
} else {
	%>
	<a href="#">[다음]</a>
<%
}
%>
<%
=======
<%-- 	<a href="list.jsp?pageNum=<%=currentPage+1 %>">[다음]</a> --%>
	<%
}

>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
//10페이지 다음
if(endPage < pageCount) {
	%>
	<a href="QnaList.qn?pageNum=<%=startPage+pageBlock %>">[10다음]</a>
	<%
<<<<<<< HEAD
} else {
	%>
	<a href="QnaList.qn?pageNum=<%=endPage %>">[10다음]</a>
<%
=======
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
}
%>
<br>
<input type="button" value="글쓰기" onclick="location.href='./QnaWriteForm.qn'"><br>
<<<<<<< HEAD
<a href="./UserHome.us">메인으로 이동</a><br>
<!-- <a href="QnaWriteForm.qn">글쓰기</a><br> -->
=======
<a href="./MemberMain.me">메인으로 이동</a><br>
<!-- <a href="QnaWriteForm.qn">글쓰기</a><br> -->

>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
</body>
</html>