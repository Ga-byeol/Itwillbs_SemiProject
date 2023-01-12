package com.userinfo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInfoLogout implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// �꽭��?? ?��?��린�?��
		HttpSession session=request.getSession();
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setPath("./UserInfoMypage.me");
		forward.setRedirect(true);
		return forward;
	}

}
