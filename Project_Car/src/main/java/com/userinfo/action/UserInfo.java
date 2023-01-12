package com.userinfo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.userinfo.db.UserDAO;
import com.userinfo.db.UserDTO;

public class UserInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id =(String)session.getAttribute("user_id");
		
		UserDAO dao = new UserDAO();
		
		UserDTO dto = dao.getUserinfo(user_id);
		
		request.setAttribute("dto",dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./userinfo/info.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
