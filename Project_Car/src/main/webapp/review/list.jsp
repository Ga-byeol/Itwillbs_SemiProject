<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.review.db.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/list.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./review/basic.css"/>
  <script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  // id="join"
		$('.review_delete').submit(function(){
			if(!confirm("삭제하시겠습니까")){
				return false;
			}
		});
});
				</script>
  
  
  
  
</head>
<body>
<%
List<ReviewDTO> reviewList=(List<ReviewDTO>)request.getAttribute("reviewList");

int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int currentPage=(Integer)request.getAttribute("currentPage");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");
										 
%>
<jsp:include page="../review/basic.jsp"></jsp:include>

<form action="./ReviewWritePro.re" method="post">  
<div class="container">
  <h2>review</h2>

  <table class="table table-striped">
    <thead>
      <tr>
      	<th>번호<th>
<!--         <th align=center>상품</th> -->
        <th>별점</th>
        <th width=500>내용</th>
        <th>등록일</th>
<!--         <th>조회수</th> -->
      </tr>
    </thead>
    <tbody>
    
	<% 
// 	ReviewDTO dto = new ReviewDTO();
	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
	
	for(int i=0; i<reviewList.size(); i++) {
		ReviewDTO dto = reviewList.get(i);
					
		%>
		<tr> 
			<td><%=dto.getReview_num() %></td>
			<td><%=dto.getCar_num() %></td>
			<td>
			<%
			if(dto.getReview_star().equals("1")){
				%>
				
				<img src="./review/img/star1.png" width="20" height="20 ">
				<%
			}else if(dto.getReview_star().equals("2")){
				%>
				<img src="./review/img/star2.png" width="20" height="20 ">
				<%
			}else if(dto.getReview_star().equals("3")){
				%>
				<img src="./review/img/star3.png" width="20" height="20 ">
				<%
			}else if(dto.getReview_star().equals("4")){
				%>
				<img src="./review/img/star4.png" width="20" height="20 ">
				<%	
			}else if(dto.getReview_star().equals("5")){
				%>
				<img src="./review/img/star5.png" width="20" height="20 ">
				<%	
			}else {
				dto.getReview_star();
			}
			%>
			
			</td>
			<td height="100"><%=dto.getReview_cont() %></td>
		    <td><%=dateFormat.format(dto.getReview_date()) %></td>
			<td>
			<input type="button" value="수정" onclick="location.href='./ReviewUpdateForm.re?review_num=<%=dto.getReview_num() %>'">
			<input type="button" value="삭제" onclick="location.href='./ReviewDelete.re?review_num=<%=dto.getReview_num() %>'">
			
			
<!-- 			  <form action="./ReviewDelete.re" class="review_delete" method="get"> -->
<%-- 		    	<input type="button" value="수정" onclick="location.href='./ReviewUpdateForm.re?review_num=<%=dto.getReview_num() %>'"> --%>
<%-- 				<input type="hidden" name="review_num" value="<%=dto.getReview_num() %>"> --%>
<!-- 				<input type="submit" value="삭제" > -->
<!-- 			  </form> -->
			</td>
		    <td><input type="hidden" name="user_id" value="<%=dto.getUser_id() %>" readonly></td>
		    </tr>


		   
		   
		   
		<%
	}
	%>
		
    </tbody>
  </table>
  

<%
//10페이지 이전
if(startPage > pageBlock){
	%>
	<a href="./ReviewList.re?pageNum=<%=startPage-pageBlock %>">[10페이지 이전]</a>
	<%
}

//이전페이지 currentPage-1
if(currentPage > 1){
	%>
<%-- 	<a href="list.jsp?pageNum=<%=currentPage-1 %>">[1페이지 이전]</a> --%>
	<%
}

for(int i=startPage; i<=endPage; i++){
	%>
	<a href="./ReviewList.re?pageNum=<%=i %>"><%=i %></a>
	<%
}

// 다음페이지 currentPage+1
if(currentPage < pageCount){
	%>
<%-- 	<a href="list.jsp?pageNum=<%=currentPage+1 %>">[1페이지 다음]</a> --%>
	<%
}

//10페이지 다음
if(endPage < pageCount) {
	%>
	<a href="./ReviewList.re?pageNum=<%=startPage+pageBlock %>">[10페이지 다음]</a>
	<%
}
%>

</div>

</form>
</body>
</html>