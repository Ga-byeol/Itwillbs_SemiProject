<%@page import="com.user.db.UserDTO"%>
<%@page import="com.user.db.UserDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_list.jsp</title>
</head>
<body>
<h1>회원목록</h1>
<%
//여기는 admin만 볼 수 있음.
String id = (String)session.getAttribute("id");

UserDAO dao = new UserDAO();
List<UserDTO> userList = dao.getUserList();
%>
<table border="1">
<tr><td>회원번호</td><td>회원아이디</td>
    <td>비밀번호</td><td>이름</td>
    <td>생년월일</td><td>핸드폰번호</td>
    <td>보유포인트</td><td>주소</td>
    <td>이메일</td><td>면허번호</td><td>면허종류</td></tr>
    <%
    for(int i = 0; i < userList.size(); i++){
    	UserDTO dto = userList.get(i);
    	%>
<tr><td><%=dto.getUser_num() %></td>
	<td><%=dto.getUser_id() %></td>
    <td><%=dto.getUser_pass() %></td>
    <td><%=dto.getUser_name() %></td>
    <td><%=dto.getUser_birth() %></td>
    <td><%=dto.getUser_hp() %>
    <td><%=dto.getUser_pt() %></td>
    <td><%=dto.getAddress() %></td>
    <td><%=dto.getEmail() %></td>
    <td><%=dto.getLicense_num() %></td>
    <td><%=dto.getLicense_type() %></td>
    </tr>    	
    	<%
    }
    %>
</table>
</body>
</html>