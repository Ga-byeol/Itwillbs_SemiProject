<%@page import="com.reservation.db.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PaymentForm.jsp</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
  $(document).ready(function(){

	  IMP.init("imp51271655"); // 예: imp00000000
	  
	  $('#order').click(function(){ // 성공 시 값 처리해주기 남음
		  IMP.request_pay({
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: "car_" + "현재시간", // 주문번호 car_ + ~
	          name: "CAR", // 상호명
	          amount: ${'.price'}, // 결제금액	
	          buyer_name: "${sessionScope.name}", // 결제자 이름
	      }, function (rsp) {
	          if (rsp.success) {
	              $.ajax{
	            	  url:; // 예약 db처리 할 경로
	            	  data:;// 예약에 들어갈 정보들
	            	  success:function(data){
	            		  location.href=""; // 내 예약 목록
	            	  }
	              };
	          } else {
	        	  alert("결제에 실패하였습니다.");
	          }
	      });
	  }
  )});
 
  </script>
</head>
<%
// 	ReservationDTO res_dto = (ReservationDTO)request.getAttribute("res_dto");
	ReservationDTO res_dto = new ReservationDTO();

%>
<body>
	<table border="1" width="200">
	<img src="./images/test.jpg" height="200" width="200">
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
			<th><%=res_dto.getRes_stime()%></th>
			<th><%=2%></th>
			<th><%=res_dto.getRes_time()%></th>
		</tr>
	</table>
	<table border="1">
	<tr>
	<th>결제가격</th>
	<div class="price"><th><%=res_dto.getRes_time() %></th></div> <!-- * carinfo.price() -->
	</tr>
	</table>
	<input type="button" value="결제하기" id="order">
</body>
</html>