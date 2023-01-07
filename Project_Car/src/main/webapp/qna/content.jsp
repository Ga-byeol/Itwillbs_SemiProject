<%@page import="com.itwillbs.qna.db.QnaDTO"%>
<%@page import="com.itwillbs.qna_comm.db.QnaCommDTO"%>
<%@page import="com.itwillbs.qna_comm.db.QnaCommDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content.jsp</title>
<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">
 	$(document).ready(function() {
		$('.deleteQna').submit(function(){
			if(!confirm ("삭제하시겠습니까?")){
				return false;
			}
		});
		
		$('.deleteComm').submit(function(){
			if(!confirm ("삭제하시겠습니까?")){
				return false;
			}
		});
 	});
 	 
</script>
</head>
<body>
<%
QnaDTO dto=(QnaDTO)request.getAttribute("dto");
int qna_num=dto.getQna_num();
String filepath = request.getSession().getServletContext().getRealPath("qna_images");
%>
<table border="1">
	<tr>
		<td align ="center" width="80">글번호</td>
		<td width="500"><%=dto.getQna_index() %></td>
	</tr>
	<tr>
		<td align ="center">작성자</td>
		<td><%=dto.getUser_id() %></td>
	</tr>
	<tr>
		<td align ="center">등록일</td>
		<td><%=dto.getQna_date() %></td>
	</tr>
	<tr>
		<td align ="center">조회수</td>
		<td><%=dto.getQna_readcount() %></td>
	</tr>
	<tr>
		<td align ="center">제목</td>
		<td><%=dto.getQna_sub() %></td>
	</tr>
	<tr>
		<td colspan="2">
		<div height="500px">
			<% 
			if(dto.getQna_image() != null){
			%>
			<img src="./qna_images/<%=dto.getQna_image() %>" width=350px height=190px style="margin: 0px; margin-right: 40px;"><br>
			<% 
			}
			%>
			<%=dto.getQna_content() %>
		</div>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 글쓴이와 로그인(세션값) 일치하면 => 글수정, 글삭제 버튼 보이기
		if(id!=null){
			if(dto.getUser_id().equals(id) || id.equals("admin")){
%>
				<div>
					<form action="./QnaDelete.qn" method="get" class="deleteQna" align ="right" align="bottom">
						<input type="button" value="글수정" class="update"
						onclick="location.href='QnaUpdateForm.qn?qna_num=<%=dto.getQna_num()%>&qna_index=<%=dto.getQna_index()%>'">
						<input type="hidden" name="qna_num" value="<%=dto.getQna_num()%>">
						<input type="submit" value="글삭제">
					</form>
				</div>
		</td>
				<%
			}
		}
		%>

	<tr>
		<td colspan="2">
			<h3>답글</h3>
			<%
			
			QnaCommDAO dao2 = new QnaCommDAO();
			int pageSize=10;
			System.out.println("pageSize="+pageSize);
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			System.out.println("pageNum="+pageNum);
			int currentPage=Integer.parseInt(pageNum);
			int startRow=(currentPage-1)*pageSize+1;
			System.out.println("startRow="+startRow);
			int endRow=startRow+pageSize-1;
			System.out.println("endRow="+endRow);
			List<QnaCommDTO> commList = dao2.getCommList(startRow,pageSize,qna_num);
			int count=dao2.getQnaCommCount(qna_num);
			System.out.println("count="+count);
			%>
	<table>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>등록일</th>
		</tr>
		<%
		for(int i = 0; i<commList.size(); i++){
			int commindex=1;
			QnaCommDTO dto2 = commList.get(i);
		%> 
			<tr>
				<td><%=dto2.getComm_index() %></td>
				<td><%=dto2.getUser_id() %></td>
				<td><%=dto2.getComm_content() %></td> 
				<td><%=dto2.getComm_date() %></td>
			<%
			if(id!=null){
				if(id.equals("admin") || dto2.getUser_id().equals(id)) {
			%>
				<td><input type="button" value="수정" 
					onclick="location.href='./QnaCommUpdateForm.co?qna_num=<%=dto.getQna_num() %>&comm_num=<%=dto2.getComm_num()%>&qna_index=<%=dto.getQna_index()%>'"></td>
				<td>
					<form action="./QnaCommDelete.co" method="get" class="deleteComm">
						<input type="hidden" name="qna_num" value="<%=dto.getQna_num()%>">
						<input type="hidden" name="comm_num" value="<%=dto2.getComm_num()%>">
						<input type="hidden" name="qna_index" value="<%=dto.getQna_index() %>">
						<input type="submit" value="삭제">
					</form>
				</td>
			</tr>
			<%
				}
			}
		}
		%>
		
	</table>

<%
int pageBlock=10;
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
System.out.println("startPage="+startPage);
int endPage=startPage+pageBlock-1;
int pageCount = count/pageSize+(count%pageSize==0? 0 : 1);
System.out.println("pageCount="+pageCount);
if(endPage > pageCount) {
	endPage=pageCount;
}
System.out.println("endPage="+endPage);
// 10페이지 이전
if(startPage>pageBlock) {
	%>
	<a href="QnaContent.qn?qna_num=<%=qna_num %>&pageNum=<%=startPage-pageBlock %>">[10이전]</a>
	<%
}

%>
<div align="center">
<%
	// 1페이지 이전
	if(currentPage != 1) {
		%>
		<a href="QnaContent.qn?qna_num=<%=qna_num %>&pageNum=<%=currentPage-1 %>">[이전]</a>
		<%
	}
	for(int i=startPage; i<=endPage; i++){
		%>
		<a href="QnaContent.qn?qna_num=<%=qna_num %>&pageNum=<%=i%>"><%=i%></a>
		<%
	}
	
	// 1페이지 다음
	if(currentPage < pageCount) {
		%>
		<a href="QnaContent.qn?qna_num=<%=qna_num %>&pageNum=<%=currentPage+1 %>">[다음]</a>
		<%
	}
%>
</div>
<br>
<%
if(id!=null) {
	if(id.equals("admin") || dto.getUser_id().equals(id)) {
%>
		<form action="./QnaCommWritePro.co" method="post" >
		<input type="hidden" name="qna_num" value="<%=qna_num %>">
		<input type="hidden" name="user_id" value="<%=id %>">
		<input type="hidden" name="qna_index" value="<%=dto.getQna_index() %>">
		<%
		if(id.equals("admin")) { 
		%>
		<textarea name="comm_content" rows="5" cols="50" maxlength="1500"><%=dto.getUser_id() %>님 문의 감사합니다. </textarea>
			<%
			}else {
			%>
		<textarea name="comm_content" rows="5" cols="50" maxlength="1500"></textarea>
			<%
			} 
			%>
		<input type="submit" value="전송" >
		</form>
		</td>
	</tr>
<%
	}
}
%>
</table>
<br>
<input type="button" value="QnA목록" onclick="location.href='./QnaList.qn'">
</body>
</html>