package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dao.UserLoginDao;

public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		 response.setContentType("text/html");  
 	        PrintWriter out = response.getWriter();  
 	        
 	        String n=request.getParameter("username");  
 	        String p=request.getParameter("password"); 
// 	        System.out.println(n);
// 	        System.out.println(p);
// 	        HttpSession session = request.getSession(false);
// 	        if(session!=null)
// 	        session.setAttribute("name", n);

// 	        if(LoginDao.validate(n, p)){  
// 	            RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");  
// 	            rd.forward(request,response);  
// 	        }  
// 	        else{  
// 	            out.print("<p style=\"color:red\">Sorry username or password error</p>");  
// 	            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
// 	            rd.include(request,response);  
// 	        }  
 	        try {
				boolean loginCheck = UserLoginDao.loginCheck(n, p);
				if(loginCheck== true){
					out.print("login sucessfully");
					 RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
		 	            rd.forward(request,response);  
				}
				else{
					 request.setAttribute("errormessage", "invalid user or password");
//					 out.print("<p style=\"color:red\">Sorry username or password error</p>");  
		 	            RequestDispatcher rd=request.getRequestDispatcher("invalid.jsp");  
		 	            rd.include(request,response);  
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 	        

 	        out.close();  
 	    }  
  }


