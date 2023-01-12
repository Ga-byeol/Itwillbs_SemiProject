package com.user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserFrontController extends HttpServlet {


	   protected void doProcess(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      
	      String strpath = request.getServletPath();
	      System.out.println("野껋럥以�1 strpath: " + strpath);
	      
	      ActionForward forward = null;
	      Action action = null;
	      
	      if (strpath.equals("/UserInsertForm.us")) {
	          forward = new ActionForward();
	          forward.setPath("./user/userInsertForm.jsp");
	          forward.setRedirect(false);
	          
	      } else if (strpath.equals("/UserInsertPro.us")) {
	    	  action = new UserInsertPro();
	          try {
	             forward = action.execute(request, response);
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	       } else if (strpath.equals("/UserLoginForm.us")) {
	    	   System.out.println("dd");
	          forward = new ActionForward();
	          forward.setPath("./user/userLoginForm.jsp");
	          forward.setRedirect(false);
	       } else if (strpath.equals("/UserLoginPro.us")) {
	          action = new UserLoginPro();
	          try {
	             forward = action.execute(request, response);
	          } catch (Exception e) {
	             e.printStackTrace();
	          }

	          
	       }else if (strpath.equals("/UserHome.us")) {
	    	  action = new UserHome();
	          try {
	             forward = action.execute(request, response);
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	      
	      
	       } else if(strpath.equals("/UserLogout.us")) {
	     	  action = new UserLogout();
	     	  try {
	 			forward=action.execute(request,response);
	     	  } catch (Exception e) {
	 			e.printStackTrace();
	     	  }
	       } else if(strpath.equals("/confirmId.us")) {
	    	   forward = new ActionForward();
		          forward.setPath("./user/confirmId.jsp");
		          forward.setRedirect(false);
	       } else if(strpath.equals("/findId.us")) {
	    	   forward = new ActionForward();
		          forward.setPath("./user/findId.jsp");
		          forward.setRedirect(false);
	       } else if(strpath.equals("/findIdResult.us")) {
	    	   forward = new ActionForward();
		          forward.setPath("./user/findIdResult.jsp");
		          forward.setRedirect(false);
	       } else if(strpath.equals("/findPass.us")) {
	    	   forward = new ActionForward();
		          forward.setPath("./user/findPass.jsp");
		          forward.setRedirect(false);
	       } else if(strpath.equals("/findPassResult.us")) {
	    	   		forward = new ActionForward();
		          forward.setPath("./user/findPassResult.jsp");
		          forward.setRedirect(false);
	       }
	      
	      
	      
	       if (forward != null) {
	          if (forward.isRedirect()) {
	             System.out.println("true: " + forward.getPath() + " sendRedirect() �뜝�럩逾졾뜝�럥吏�");
	             response.sendRedirect(forward.getPath());
	          } else {
	             System.out.println("false: " + forward.getPath() + "forward() �뜝�럩逾졾뜝�럥吏�");
	             RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
	             dis.forward(request, response);
	          }
	       }
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
	       System.out.println("UserFrontController doGet()");
//	       doProcess()�뜝�럩源덌옙鍮듿뜝占�
	       doProcess(request, response);
	    } // doProcess()嶺뚮∥�뾼�땻�슪�삕獄�占�

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
	       System.out.println("UserFrontController doPost()");
//	       doProcess()�뜝�럩源덌옙鍮듿뜝占�
	       doProcess(request, response);
	    }

	 }