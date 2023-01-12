<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first/deleteForm.jsp</title>
</head>
<body>
<script type="text/javascript">
function deletes() {
	if(!confirm("모든 파일이 삭제되도 괜찮나요")){
		alert("취소(아니요)를 누르셨습니다");
		return false;
	}else {
		alert("확인(예)를 누르셨습니다");
	}	
}
</script>
<%
String user_id = (String) session.getAttribute("sessionId");
%>
<h1>회원탈퇴</h1>
<form action="./UserInfoDeletePro.me" method="get" onsubmit="return deletes()">
아이디 : <input type="text" name="user_id" value="<%=user_id %>"><br>
비밀번호 : <input type="password" name="user_pass"><br>
<input type="submit" value="회원정보삭제">
</form>
</body>
</html>