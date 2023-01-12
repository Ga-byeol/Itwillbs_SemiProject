package com.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class ReviewUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		int review_num=Integer.parseInt(request.getParameter("review_num"));

		ReviewDAO dao=new ReviewDAO();

		ReviewDTO dto=dao.getReivew(review_num);
		
		//�뜲�씠�꽣 �떞�븘�꽌 updateForm.jsp �씠�룞
		request.setAttribute("dto", dto);
		
		//�씠�룞
		ActionForward forward=new ActionForward();
		forward.setPath("./review/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
	

}
