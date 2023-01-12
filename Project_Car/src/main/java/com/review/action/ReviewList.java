package com.review.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class ReviewList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReviewDAO dao=new ReviewDAO();

		int pageSize=5;
		System.out.println("pageSize=" + pageSize);

		//�쁽 �럹�씠吏� 踰덊샇 �뙆�씪誘명꽣 媛� 媛��졇�삤湲�
		String pageNum=request.getParameter("pageNum");
		//�럹�씠吏� 踰덊샇媛� �뾾�쑝硫� => "1"�꽕�젙
		if(pageNum==null){
			pageNum="1";
		}
		System.out.println("pageNum=" + pageNum);

		int currentPage=Integer.parseInt(pageNum);

		int startRow=(currentPage-1)*pageSize+1;
		System.out.println("starRow="+startRow);

		int endRow=(startRow-1)+pageSize;
		System.out.println("endRow="+endRow);



		List<ReviewDTO> reviewList=dao.getReviewList(startRow, pageSize);

		int count=dao.getReviewCount();
		System.out.println("Count="+count);
		
		// �럹�씠吏�
		// �븳 �솕硫댁뿉 蹂댁뿬以� �럹�씠吏� 媛쒖닔 �꽕�젙
		int pageBlock=5;

		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		System.out.println("startPage="+startPage);

		int endPage=startPage+pageBlock-1;

		int pageCount=count/pageSize+(count%pageSize==0 ? 0 : 1);
		System.out.println("pageCount="+pageCount);
		if(endPage>pageCount){
			endPage=pageCount;
		}
		System.out.println("endPage"+endPage);
		
		
		request.setAttribute("reviewList", reviewList);
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		// �씠�룞
		ActionForward forward=new ActionForward();
		forward.setPath("./review/list.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
	

}
