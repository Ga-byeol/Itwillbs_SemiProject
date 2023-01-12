
package com.userinfo.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//?ç†?éÑ?ê£??ç†?èô?òô?Å∫?ñÑÎµ?(Á≠åÔΩåÍº???ç†?èô?òô?ç†?éàÎºñÂç†?éàÎº£Âç†?éå?ÅΩ)
public class UserInfoFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("FirstFrontController doProcess()");

		System.out.println("requestURI : " + request.getRequestURL());
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);

		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		System.out.println("contextPath?ñ´??Ï±???ç†?èô?òô : " + contextPath.length());

		String strpath = requestURI.substring(contextPath.length());
		System.out.println("Á≠åÎ?©Ïµê?ç†Ôø?? ?õÖ?öØ?àò??ç†?èô?òô strpath : " + strpath);

		ActionForward forward = null;
		Action action = null;

		// insert
		
		 if (strpath.equals("/UserInfoMypage.me")) {

//			forward = new ActionForward();
//			forward.setPath("./first/mypage.jsp");
//			forward.setRedirect(false);

			action = new UserInfoMypage();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (strpath.equals("/UserInfo.me")) {

			action = new UserInfo();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (strpath.equals("/UserInfoUpdateForm.me")) {
			action = new UserInfoUpdateForm();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (strpath.equals("/UserInfoUpdatePro.me")) {
			action = new UserInfoUpdatePro();

			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (strpath.equals("/UserInfoDeleteForm.me")) {
			forward = new ActionForward();
			forward.setPath("./userinfo/deleteForm.jsp");
			forward.setRedirect(false);
		} else if (strpath.equals("/UserInfoDeletePro.me")) {

			action = new UserInfoDeletePro();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (forward != null) {
			if (forward.isRedirect()) {
				System.out.println("true:" + forward.getPath());
				response.sendRedirect(forward.getPath());

			} else {
				System.out.println("false:" + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
