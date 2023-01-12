<%@page import="com.userinfo.db.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first/mypage.jsp</title>
<link href="./css/mypage.css" rel="stylesheet">
<link href="./css/header.css" rel="stylesheet">
<link href="./css/footer.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div id="wrapper">
		<div class="myPage_menu">
			<div>
				<button onclick="#">예약하기</button><br>
				<button onclick="#">나의 후기</button><br>
				<button onclick="#">1:1 문의</button><br>
				<button onclick="location.href='./UserInfoDeleteForm.me'">회원탈퇴</button>
			</div>
		</div>
		<div class="myPage_cont">
			<form action="./UserInfoUpdatePro.me" method="get">
			<%
				String user_id = (String) session.getAttribute("sessionId");
				String user_pass = (String) session.getAttribute("user_pass");
				String user_name = (String) session.getAttribute("user_name");
				String user_hp = (String) session.getAttribute("user_hp");
				String email = (String) session.getAttribute("email");
				String address = (String) session.getAttribute("address");
				int user_pt = (Integer) session.getAttribute("user_pt");
				String license_num = (String) session.getAttribute("license_num");
				String license_type = (String) session.getAttribute("license_type");
				
				
				System.out.println(session.getAttribute("user_name"));
				
				
				if (user_id == null ) {
					response.sendRedirect("./UserLoginForm.me");
					return;
				}
			%>
<!-- 			<div class="my_welcome"> -->
<!-- 				<h1>마이페이지</h1> -->
<%-- 				<%=id%>님 로그인 하셨습니다<br> --%>
<!-- 			</div> -->
			<div class="my_page">
				<h1>나의 정보 수정</h1>
				<h1>마이페이지</h1>
				<%=user_id%>님 로그인 하셨습니다<br>
				<table>
					<tr>
						<th>아이디</th>
						<td>
						<input type="text" name="user_id" value="<%=user_id%>" readonly="readonly">
						</td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="user_pass" placeholder="변경할 비밀번호를 입력하세요."></td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td><input type="text" name="user_name" value="<%=user_name%>"></td>
					</tr>
					
					<tr>
						<th>휴대전화</th>
						<td><input type="text" name="user_hp" value="<%=user_hp%>"></td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" value="<%=email %>"></td>
					</tr>
					
					<tr>
						<th>지역</th>
						<td><input type="text" name="address" value="<%=address%>"></td>
					</tr>
					
					<tr>
						<th>포인트</th>
						<td><input type="text" name="user_pt" value="<%=user_pt %>"readonly="readonly"></td>
					</tr>
					
					<tr>
						<th>면허증 번호</th>
						<td><input type="text" name="license_num" value="<%=license_num %>"></td>
					</tr>
					
					<tr>
						<th>면허증 종류</th>
						<td><input type="text" name="license_type" value="<%=license_type %>"></td>
					</tr>
					<tr>
						<td><input type="submit" value="회원정보수정"></td>
					</tr>
				</table>
				</div>
					
				</form>
<!-- 				<a href="./UserInfoMypage.me">HOME</a> -->
			</div>
		</div>
	<!--  admin 사용자만 보이게  -->
	<%
	if (user_id != null) {
		if (user_id.equals("admin")) {
	%>
	<a href="./MemberList.me">회원목록</a>
	<br>
	<%
		}
	}
	%>
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>