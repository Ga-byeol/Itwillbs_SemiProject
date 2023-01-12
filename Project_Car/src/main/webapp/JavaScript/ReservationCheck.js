	function checkNull(){
		userId = document.getElementById("sessionId");
		resDateForm = document.getElementById("selectedDate");
		resTimeForm = document.getElementById("selectedTime");
		
		//alert(sessionScope.sessionId);
		
		if(userId.value == ""){
			alert("로그인해주세요.");
			return false;
		}else if(resDateForm.value == ""){
			alert("날짜를 선해주세요.");
			return false;
		} else if(resTimeForm.value == ""){
			alert("시간을 선택해주세요.");
			return false;
		}
		return true;
	}