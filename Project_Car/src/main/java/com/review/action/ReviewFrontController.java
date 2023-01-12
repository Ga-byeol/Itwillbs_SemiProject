package com.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewFrontController extends HttpServlet{
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontControler doProcess()");
		
		//媛��긽二쇱냼 戮묒븘�삤湲�
//		String requestURI=request.getRequestURI();
//		System.out.println("requestURI : " + requestURI);
//		
//		String contextPath=request.getContextPath();
//		System.out.println("contextPath : " + contextPath);
//		System.out.println("contextPath湲몄씠 : " + contextPath.length());
//		
//		String strpath=requestURI.substring(contextPath.length());
		
		String strpath=request.getServletPath();
		System.out.println("戮묒�二쇱냼 path : " +strpath);
		
		
		ActionForward forward=null;
		Action action=null;
		
		
		if(strpath.equals("/ReviewWriteForm.re")) {
			forward=new ActionForward();
			forward.setPath("./review/writeForm.jsp");
			forward.setRedirect(false);

		}else if(strpath.equals("/ReviewWritePro.re")) {
			action=new ReviewWritePro();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(strpath.equals("/ReviewList.re")) {
			action=new ReviewList();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(strpath.equals("/ReviewUpdateForm.re")) {
			action=new ReviewUpdateForm();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(strpath.equals("/ReviewUpdatePro.re")) {
			action=new ReviewUpdatePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(strpath.equals("/ReviewDelete.re")) {
			action=new ReviewDelete();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		// �씠�룞
		if(forward!=null) {
			if(forward.isRedirect()) {
				System.out.println("true:" + forward.getPath() + "sendRedirect() �씠�룞");
				response.sendRedirect(forward.getPath());
			}else {
				System.out.println("false:" + forward.getPath() + "forward() �씠�룞");
				RequestDispatcher dis
				=request.getRequestDispatcher(forward.getPath());
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
