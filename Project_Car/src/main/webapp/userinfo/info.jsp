<%@page import="com.userinfo.db.UserDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userinfo/info.jsp</title>
</head>
<body>
<h1>나의 정보 조회</h1>

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

/* 
String user_id = session.getAttribute(user_id);
UserDTO dto = dao.getUserinfo(user_id);
*/
	%>
	
<%= user_id %>님의 개인정보를 조회하셨습니다 <br>

				<table>
					<tr>
						<th>아이디</th>
						<td><%=user_id%></td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td><%=user_pass %></td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td><%=user_name %></td>
					</tr>
					
					<tr>
						<th>휴대전화</th>
						<td><%=user_hp %></td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td><%=email %></td>
					</tr>
					
					<tr>
						<th>지역</th>
						<td><%=address%></td>
					</tr>
					
					<tr>
						<th>포인트</th>
						<td><%=user_pt%></td>
					</tr>
					
					<tr>
						<th>면허증 번호</th>
						<td><%=license_num %></td>
					</tr>
					
					<tr>
						<th>면허증 종류</th>
						<td><%=license_type%></td>
					</tr>
				</table>
<a href="./UserInfoMypage.me">마이페이지로 이동</a>
</body>
</html>
