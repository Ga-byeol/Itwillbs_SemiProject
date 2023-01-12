package com.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;

public class UserHome implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		NoticeDAO dao = new NoticeDAO();
		int pageSize=3;
		int currentPage  = 1;
		int startRow = (currentPage-1)*pageSize+1; 
		List<NoticeDTO> noticeList = dao.MaingetNoticeList(startRow, pageSize);
		int count = dao.MaingetNoticeCount();
		request.setAttribute("noticeList",noticeList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./user/userHome.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
