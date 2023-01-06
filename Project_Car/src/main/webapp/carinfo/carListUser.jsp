<%@page import="com.car.db.CarInfoDAO"%>
<%@page import="com.car.db.CarInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>carList</title>
<link href="../css/basic.css" rel="stylesheet">
<link href="../css/carList.css" rel="stylesheet">
</head>
<%
CarInfoDAO dao = new CarInfoDAO();
List<CarInfoDTO> carinfoList = dao.getCarInfoList();
CarInfoDTO dto=(CarInfoDTO)request.getAttribute("dto");
%>
<body>
	<jsp:include page="../css/basic.jsp"></jsp:include>
	<div id="wrapper">
		<div id="container">
		<% for(int i = 0; i < carinfoList.size(); i++ ) {
			%>
			
			<div><!-- 1 -->
<!-- 				<a href="carInfoUser.jsp"> -->
				<a href="carInfoUser.jsp?car_num=<%= carinfoList.get(i).getCar_num() %>">
					<img src="../car_images/<%= carinfoList.get(i).getCar_image()%>">
				</a>
				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfoUser.jsp?car_num=<%= carinfoList.get(i).getCar_num() %>'">
			</div>
		<%	
		}
		%>
			
<!-- 			<div>2 -->
<!-- 				<a href="carInfoUser.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfoUser.jsp?car_model='쏘나타''"> -->
<!-- 				<input type="checkbox" id="likeBtn2"> -->
<!-- 				<label for="likeBtn2">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>3 -->
<!-- 				<a href="carInfoUser.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn3"> -->
<!-- 				<label for="likeBtn3">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>4 -->
<!-- 				<a href="carInfo.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn4"> -->
<!-- 				<label for="likeBtn4">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>5 -->
<!-- 				<a href="carInfo.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn5"> -->
<!-- 				<label for="likeBtn5">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>6 -->
<!-- 				<a href="carInfo.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn6"> -->
<!-- 				<label for="likeBtn6">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>7 -->
<!-- 				<a href="carInfo.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn7"> -->
<!-- 				<label for="likeBtn7">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>8 -->
<!-- 				<a href="carInfo.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn8"> -->
<!-- 				<label for="likeBtn8">♥</label> -->
<!-- 			</div> -->
<!-- 			<div>9 -->
<!-- 				<a href="carInfo.jsp"> -->
<!-- 					<img src="../img/디 올 뉴 그랜저2.png"> -->
<!-- 				</a> -->
<!-- 				<input type="submit" value="상세 정보" class="dtls-btn" onclick="location.href='carInfo.jsp'"> -->
<!-- 				<input type="checkbox" id="likeBtn9"> -->
<!-- 				<label for="likeBtn9">♥</label> -->
<!-- 			</div> -->
		</div>
	</div>
</body>
</html>