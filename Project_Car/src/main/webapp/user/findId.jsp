<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
//유효성체크 - null값 못오게함.

function findValid() {
	
	var FV1 = document.FindID; 
	if(FV1.user_name.value == "" || FV1.user_email.value == "" ) {
		alert("정보를 정확하게 입력해주세요.");
		return false;
	}

}
</script>
<body>
<h1>아이디찾기</h1>
<form action="./findIdResult.us" name="FindID" onSubmit="return findValid()">
<input type="text" name='user_name' placeholder="이름을 입력하세요."> <br>
<input type='email' name='user_email' placeholder="이메일을 입력하세요."><br><br>
<input type="submit" name="findbtn" value="아이디찾기">
</form>
</body>
</html>