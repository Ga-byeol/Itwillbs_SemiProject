package com.userinfo.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.userinfo.db.UserDAO;
import com.userinfo.db.UserDTO;

public class UserInfoLoginPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("넘어왔니");
		request.setCharacterEncoding("utf-8");
		
		String user_id=request.getParameter("user_id");
		String user_pass=request.getParameter("user_pass");
		
		UserDAO dao = new UserDAO();
		
		UserDTO dto = dao.UserCheck(user_id, user_pass);
		
		
		if(dto != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			
			ActionForward forward = new ActionForward();
			forward.setPath("./UserInfoMypage.me");
			forward.setRedirect(false);
			return forward; 
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('불가능합니다');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
	}
}
