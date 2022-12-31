package com.reservation.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Action;
import vo.ActionForward;

public class ReservationFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		System.out.println(" Controller : requestUIR = "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" Controller : ctxPath = "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" Controller : command = "+command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("")) {
			
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
