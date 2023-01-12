<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main/mainHome</title>
<link href="./css/mainHome.css" rel="stylesheet">
<script type="text/javascript">
window.addEventListener('scroll', function() {
	   
	   var navElem = document.getElementsByClassName('nav-menu');
	   if(window.scrollY > 100) {
	      navElem[0].classList.add('nav-action');
	   } else {
	      navElem[0].classList.remove('nav-action');
	   }
	});
	
window.addEventListener('scroll', function() {
	   
	   var navElem2 = document.getElementsByClassName('log-bar');
	   if(window.scrollY > 100) {
	      navElem2[0].classList.add('log-action');
	   } else {
	      navElem2[0].classList.remove('log-action');
	   }
	});

//

window.addEventListener('scroll', () => {
	let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	let windowHeight = window.innerHeight; // 스크린 창
	let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x

	if(scrollLocation + windowHeight >= fullHeight){
		console.log('end')
	}
});

</script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

if(id == null){
	%> 
<!-- 	<!-- 로그인됐을때의 home화면 --> -->
     <% 
} 
if(id != null) {
	
 	%>  
<!-- 	<!-- 로그인안된 상태의 home화면 --> -->
	<%
}
 %>

	<div id="wrapper">
		<!-- 대가리 -->
		<header class="nav-menu">
			<div>
				<a href="#"><img class="logo" src="https://www.busan.go.kr/humanframe/theme/busan22/assets/img/main/svg/logo01_w.svg"></a>
				<input type="search" id="searchBar" class="gnb_serch_box" placeholder="원하는 차종, 대여 날짜를 입력하세요.">
				<nav>
<!-- 					<a href="#">차량예약</a> -->
<!-- 					<a href="#">차량소개</a>  -->
<!-- 					<a href="#">이용안내</a> 요금안내, 대여절차 -->
<!-- 					<a href="#">회사소개</a> 회사소개, 찾아오시는 길 -->
<!-- 					<a href="./QnaList.qn">고객지원</a> 공지, 문의 -->
<!-- ------------------------------------------------------------------------ -->
					<div>
						<p>
							<a href="#">차량예약</a>
						</p>
					</div>
					<div>
						<p>
							<a href="#">차량소개</a>
						</p>
					</div>
					<div>
						<p>이용안내</p>
						<p>
							<a href="#">대여요금</a>
							<a href="#">대여절차</a>
						</p>
					</div>
					<div>
						<p>회사소개</p>
						<p>
							<a href="./UserInfoMypage.us">마이페이지</a>
							<a href="./ReviewList.re">리뷰</a>
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
		<div class="log_btn">
			<button Onclick="location.href='first/loginForm.jsp'">Login</button>
			<button Onclick="location.href='first/insertForm.jsp'">Sign up</button>
		</div>
		
		
		<!-- 몸통 -->	
		<main>
			<div class="main_info">
				<section class="sct01">
					<video preload="auto" class="video-bg" loop muted autoplay playsinline>
						<source src="car4.mp4" type="video/mp4">
					</video>
				</section>
				<section class="sct02">
				</section>
				<section class="sct03">
				</section>
				<section class="sct04"></section>
			</div>
		</main> 
		
		<!-- 발 -->		
		<footer>
		</footer> 	
	</div>
</body>
</html>