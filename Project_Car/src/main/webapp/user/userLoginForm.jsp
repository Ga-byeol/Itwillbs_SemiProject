<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_login_form.jsp</title>
    <link rel="stylesheet" href="./css/userLoginForm.css"/>
</head>
<script type="text/javascript">
function id_search() {
	url="./findId.us";
	open(url, "confirm" , "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}

function pass_search() {
	url="./findPass.us";
	open(url, "confirm" , "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}
</script>

<!-- 카카오 자바스크립트 코드 86ad72e4cc590fb5133c38f3d4058f6e"> -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('86ad72e4cc590fb5133c38f3d4058f6e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

</script>

<body>
<form action="./UserLoginPro.us" name="userLogin" method="post"> 

<input class="input" type="text" name="user_id" placeholder="userID"> <br>

<input class="input" type="password" name="user_pass" placeholder="password"> <br>

<input type="submit" value="로그인">
<input type="button" value="회원가입" id="sign" OnClick="location.href ='./UserInsertForm.us'">


<input type="button" id="idpass" value="아이디찾기" onclick="id_search()">
<input type="button" id="idpass" value="비밀번호찾기" onclick="pass_search()">

</form>
</body>
</html>