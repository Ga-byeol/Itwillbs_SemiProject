package com.userinfo.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.userinfo.db.UserDAO;
import com.userinfo.db.UserDTO;


public class UserInfoInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		Timestamp date=new Timestamp(System.currentTimeMillis());


		UserDAO dao=new UserDAO();

		UserDTO dto=new UserDTO();
		dto.setUser_id(id);
		dto.setUser_pass(pass);
		dto.setUser_name(name);

		dao.insertUserinfo(dto);

		ActionForward forward=new ActionForward();
		forward.setPath("./UserInfoLoginForm.me");
		forward.setRedirect(true);
		return forward;
	}
}
