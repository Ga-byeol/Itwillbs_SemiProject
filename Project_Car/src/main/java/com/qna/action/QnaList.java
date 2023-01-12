package com.qna.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qna.db.QnaDAO;
import com.qna.db.QnaDTO;

public class QnaList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
<<<<<<< HEAD
		QnaDAO dao = new QnaDAO();
		int pageSize=10;
=======
		
		QnaDAO dao = new QnaDAO();
		
		int pageSize=5;
		
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
		String pageNum=request.getParameter("pageNum");
		
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
<<<<<<< HEAD
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=startRow+pageSize-1;
		
		List<QnaDTO> qnaList = dao.getQnaList(startRow,pageSize);

		int count=dao.getQnaCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;

=======
		
		int startRow=(currentPage-1)*pageSize+1;
		
		int endRow=startRow+pageSize-1;

		List<QnaDTO> qnaList = dao.getQnaList(startRow,pageSize);

		int count=dao.getQnaCount();
		
		
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
		int pageCount = count/pageSize+(count%pageSize==0? 0 : 1);
		if(endPage > pageCount) {
			endPage=pageCount;
		}
<<<<<<< HEAD
		request.setAttribute("qnaList", qnaList);
=======
		
		request.setAttribute("qnaList", qnaList);
		// startPage pageBlock currentPage endPage pageCount
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./qna/list.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
