package com.mainPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Action;
import vo.ActionForward;

public class MainPageFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		System.out.println(" Controller : requestURI = "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" Controller : ctxPath = "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" Controller : command = "+command);
		
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/guide.ma")) {
			forward = new ActionForward();
			forward.setPath("./mainHome/guide.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/information.ma")) {
			forward = new ActionForward();
			forward.setPath("./mainHome/information.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/mainHome.ma")) {
			forward = new ActionForward();
			forward.setPath("./mainHome/mainHome.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/map.ma")) {
			forward = new ActionForward();
			forward.setPath("./map/map.jsp");
			forward.setRedirect(false);
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dis
				= request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
