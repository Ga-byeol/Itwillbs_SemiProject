package com.review.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class ReviewWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		String user_id=request.getParameter("user_id");
		String car_num=request.getParameter("car_num");
		String review_star = request.getParameterValues("review_star").length + "";
		String review_cont=request.getParameter("review_cont");


		ReviewDTO dto=new ReviewDTO();
		//num媛믪� BoardDAO�뿉�꽌 �옉�뾽�븷嫄곗엫
		dto.setUser_id(user_id);
		dto.setCar_num(car_num);
		dto.setReview_star(review_star);
		dto.setReview_cont(review_cont);
		dto.setReview_date(new Timestamp(System.currentTimeMillis())); 


		ReviewDAO dao=new ReviewDAO();
		dao.insertReview(dto);

		//湲�紐⑸줉�씠�룞
		ActionForward forward=new ActionForward();
		forward.setPath("./ReviewList.re");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
