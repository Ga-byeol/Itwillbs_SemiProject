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
<!-- 				<input type="search" id="searchBar" class="gnb_serch_box" placeholder="원하는 차종, 대여 날짜를 입력하세요."> -->
				<nav>
					<div>
						<p>
							<a href="./CarListPro.ci">차량예약</a>
						</p>
					</div>
<!-- 					<div> -->
<!-- 						<p> -->
<!-- 							<a href="#">차량소개</a> -->
<!-- 						</p> -->
<!-- 					</div> -->
					<div>
						<p>
							<a href="./information.ma">이용안내</a>
						</p>
					</div>
					<div>
						<p>회사소개</p>
						<p>
							<a href="./guide.ma">회사소개</a>
							<a href="./map.ma">찾아오시는 길</a>
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
<!-- 		<div class="log_btn"> -->
<!-- 			<button Onclick="location.href='./UserLoginForm.us'">Login</button> -->
<!-- 			<button Onclick="location.href='user/user_insert_Form.jsp'">Sign up</button> -->
<!-- 		</div> -->
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
				<div class="log_btn"> 
					<button Onclick="location.href='./UserLogout.us'">로그아웃</button>
					<button Onclick="location.href='./UserInfoMypage.me'">마이페이지</button>
				</div>
				<%
			}
			%>
</body>
</html>