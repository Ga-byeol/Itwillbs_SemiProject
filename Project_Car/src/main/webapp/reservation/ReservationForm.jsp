<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation/ReservationMain.jsp</title>
<script>
	document.addEventListener('scroll', function() {
		var currentScrollValue = document.documentElement.scrollTop;
		console.log('currentScrollValue is ' + currentScrollValue);
	});
</script>
<style type="text/css">
.test {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	height: 100%;
}

body {
	height: 100%;
	overflow: auto;
}
</style>
</head>
<%

%>
<body>
	<form action="./PaymentForm.res" method="post">
		<div class="test">
			<h1>예약 페이지</h1>
			<img src="./images/test.jpg" height="200" width="200">
			<table border="1" width="200">
				<tr>
					<th>차 모델</th>
					<th>모델</th>
				</tr>
				<tr>
					<th>차 종류</th>
					<th>종류</th>
				</tr>
				<tr>
					<th>차 브랜드</th>
					<th>브랜드</th>
				</tr>
				<tr>
					<th>차 연료</th>
					<th>연료</th>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th>대여 시간</th>
					<th>반납 시간</th>
					<th>총 시간</th>
				</tr>
				<tr>
					<th><%=1%></th>
					<th><%=2%></th>
					<th><%=3%></th>
				</tr>
			</table>
			</table>
			<table border="1">
				<tr>
					<th>결제가격</th>
					<th><%=1123123123%></th>
				</tr>
			</table>
			<input type="submit" value="예약하기">
			<hr>
			<h3>부가옵션</h3>
			<table border="1">
				<tr>
					<th>베이비시트</th>
					<th>O</th>
				</tr>
				<tr>
					<th>내비게이션</th>
					<th>O</th>
				</tr>
				<tr>
					<th>하이패스</th>
					<th>O</th>
				</tr>
			</table>
			<hr>
			<h3>차량 반납 환불금액</h3>
			<table border="1">
				<tr>
					<th>예약일시 24시간 이전</th>
					<th>예약금의 100%</th>
				</tr>
				<tr>
					<th>예약일시 24시간 이내</th>
					<th>예약금의 90%</th>
				</tr>
				<tr>
					<th>대여 도중 환불</th>
					<th>남은 시간 비용의 90%</th>
				</tr>
			</table>

			<hr>
			<h3>주의 사항</h3>
			- 차량 반납 시, 차량 내 문제 확인되면 실내 클리닝 비용 10만원 청구<br>
			<br> - 반려동물 동반 시 대여 불가능<br>
			<br> 연소자의 근로는 특별한 보호를 받는다.<br> 모든 국민은 종교의 자유를 가진다.<br>
			훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다.<br> 일반사면을 명하려면
			국회의 동의를 얻어야 한다.<br> 공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다.<br>
			이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터
			적용한다.<br> 헌법재판소의 조직과 운영 기타 필요한 사항은 법률로 정한다. 대법원장의 임기는 6년으로 하며,
			중임할 수 없다.<br> 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이
			정하는 바에 의하여 보장한다.<br>
		</div>
	</form>
</body>
</html>