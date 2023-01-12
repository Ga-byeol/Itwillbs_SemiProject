package com.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.car.db.CarInfoDAO;
import com.car.db.CarInfoDTO;
import com.reservation.db.ReservationDAO;
import com.reservation.db.ReservationDTO;

import vo.Action;
import vo.ActionForward;

public class ReservationPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request car정보 받아오기
		request.setAttribute("carDTO",new CarInfoDAO().getCar(request.getParameter("car_num")));
		
		ActionForward forward = new ActionForward();
		forward.setPath("./reservation/ReservationForm.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
