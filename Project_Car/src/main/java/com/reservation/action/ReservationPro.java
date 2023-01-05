package com.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reservation.db.ReservationDTO;

import vo.Action;
import vo.ActionForward;

public class ReservationPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReservationDTO res_dto = new ReservationDTO();
		// request car정보 받아오기
		// 예약정보 받아오기
		// 예약 시간 받아서 반납 일자 계산
		ActionForward forward = new ActionForward();
		forward.setPath("./ReservationForm.res");
		forward.setRedirect(true);
		return forward;
	}
	
}
