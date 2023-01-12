package com.qna_comm.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class QnaCommFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strpath=request.getServletPath();
<<<<<<< HEAD
		System.out.println("strpath : "+strpath);
=======
		System.out.println("뽑은 주소 strpath : "+strpath);
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
		
		ActionForward forward=null;
		Action action=null;
		if(strpath.equals("/QnaCommWritePro.co")) {
			action=new QnaCommWritePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if(strpath.equals("/QnaCommUpdateForm.co")) {
			action=new QnaCommUpdateForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if(strpath.equals("/QnaCommUpdatePro.co")) {
			action=new QnaCommUpdatePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if(strpath.equals("/QnaCommDelete.co")) {
			action=new QnaCommDelete();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
<<<<<<< HEAD
=======
		// 이동
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
<<<<<<< HEAD
=======
				System.out.println("false : ");
>>>>>>> 12ac4a8fdb1c6fe1fd13370bedf3989c0f50b81f
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
