<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/header.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
		<header class="nav-menu">
			<div>
				<a href="./UserHome.us" class="logo"><img src="./car_images/카차차갈색.png" width="80"></a>
				<nav>
					<div>
						<p>
							<a href="./CarListPro.ci">차량예약</a>
						</p>
					</div>
					<div>
						<a href="./information.ma">이용안내</a>
					</div>
					<div>
						<p>회사소개</p>
						<p>
							<a href="./mainHome/guide.ma">회사소개</a>
							<a href="./map/map.ma">찾아오시는 길</a>
						</p>
					</div>
					<div>
						<p>고객지원</p>
						<p>
							<a href="./NoticeList.no">공지사항</a>
							<a href="./QnaList.qn">문의사항</a>
						</p>
					</div>
				</nav>
			</div>
		</header>
		<div class="log-bar"></div>
		<%
			String sessionId = (String)session.getAttribute("sessionId");
			System.out.println(sessionId);
			if(sessionId == null){
				%>
				<div class="log_btn">
				<button Onclick="location.href='./UserLoginForm.us'">Login</button>
				<button Onclick="location.href='./UserInsertForm.us'">Sign up</button>
				</div>
				<%
			} %>
			
			<%
			if(sessionId != null) {
				%> 
					<button Onclick="location.href='./UserLogout.us'">로그아웃</button>
					<button Onclick="location.href='./UserInfoMypage.me'">마이페이지</button>
				<%
			}
			%>
</body>
</html>