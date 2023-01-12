<%@page import="com.car.db.CarInfoDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
	  var date = new Date;
	  var now = date.getTime();
	  
	  IMP.init("imp51271655"); // 예: imp00000000
	  
	  $('#order').click(function(){ // 성공 시 값 처리해주기 남음
		  IMP.request_pay({
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: "car_" + now, // 주문번호 car_ + ~
	          name: "CAR", // 상호명
	          amount: $('.price').val(), // 결제금액	
	          buyer_name: "$('sessionId')", // 결제자 이름
	      }, function (rsp) {
	          if (rsp.success) {
	              $.ajax({
	            	  url:"./InsertReservation.res", // 예약 db처리 할 경로
	            	  data:{
	            		  res_num : rsp.merchant_uid,
	            		  car_num : $('.carNum').val(),
	            		  res_stime : $('.stime').val(),
	            		  res_time : $('.time').val(),
	            	  }, // 예약에 들어갈 정보들
	            	  success:function(data){
	            		  location.href="./ReservationMain.res"; // 내 예약 목록
	            	  }
	              });
	          } else {
	        	  alert("결제에 실패하였습니다.");
	        	  alert(rsp.error_msg);
	          }
	      });
	  }
  );
	  });
 
  </script>
</head>
<%
	ReservationDTO res_dto = (ReservationDTO)request.getAttribute("resDTO");
	CarInfoDTO car_dto = res_dto.getCar_dto();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	String startDate = res_dto.getRes_stime().split(" ~ ")[0].split(" ")[0];
	String startTime = res_dto.getRes_stime().split(" ~ ")[0].split(" ")[1];
	if(startTime.length() < 5) startTime = " 0" + startTime;
	
	String userId = (String)session.getAttribute("sessionId");
%>
<body>
	<table border="1" width="200">
	<img src="./images/test.jpg" height="200" width="200">
	<input type="hidden" class="carNum" value="<%=car_dto.getCar_num()%>">
		<tr>
			<th>예약자ID</th>
			<th><%=userId %></th>
		</tr>
		<tr>
			<th>차 모델</th>
			<th><%=car_dto.getCar_model() %></th> <!-- carinfo.getCarModel() -->
		</tr>
		<tr>
			<th>차 종류</th>
			<th><%=car_dto.getCar_type() %></th> <!-- carinfo.getCarType() -->
		</tr>
		<tr>
			<th>차 브랜드</th>
			<th><%=car_dto.getCar_brand() %></th> <!-- carinfo.getCarBrand() -->
		</tr>
		<tr>
			<th>차 연료</th>
			<th><%=car_dto.getCar_fuel() %></th> <!-- carinfo.getCarFuel() -->
		</tr>
	</table>
	<table border="1">
		<tr>
			<th>대여 시간</th>
			<th>총 시간</th>
		</tr>
		<tr>
			<input type="hidden" class="stime" value="<%=res_dto.getRes_stime()%>">
			<input type="hidden" class="time" value="<%=res_dto.getRes_time()%>">
			<th><%=res_dto.getRes_stime()%></th>
			<th><%=res_dto.getRes_time()%></th>
		</tr>
	</table>
	<table border="1">
	<tr>
	<th>결제가격</th>
	<input type="hidden" class="price" value="<%=res_dto.getRes_time() * res_dto.getCar_dto().getPer_hour()%>">
	<div><th><%=res_dto.getRes_time() * res_dto.getCar_dto().getPer_hour()%>원</th></div> <!-- * carinfo.price() -->
	</tr>
	</table>
	<input type="button" value="결제하기" id="order">
</body>
</html>